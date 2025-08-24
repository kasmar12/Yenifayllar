<?php
/**
 * Portmanat Payment Callback Handler
 * Receives payment notifications and processes SMM API orders
 */

require_once 'config.php';

// Set content type to text/plain for Portmanat
header('Content-Type: text/plain');

// Log callback data for debugging
$callback_data = file_get_contents('php://input');
$post_data = $_POST;

// Log callback (optional - remove in production)
if (DEBUG_MODE) {
    error_log("Portmanat Callback - Raw: " . $callback_data);
    error_log("Portmanat Callback - POST: " . print_r($post_data, true));
}

// Check if this is a POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo "Method not allowed";
    exit;
}

// Extract callback parameters
$order_id = trim($post_data['order_id'] ?? '');
$status = trim($post_data['status'] ?? '');
$amount = floatval($post_data['amount'] ?? 0);
$signature = trim($post_data['signature'] ?? '');

// Validate required parameters
if (empty($order_id) || empty($status) || empty($signature)) {
    error_log("Portmanat Callback - Missing required parameters");
    http_response_code(400);
    echo "Missing required parameters";
    exit;
}

// Initialize database connection
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
} catch(PDOException $e) {
    error_log("Portmanat Callback - Database connection failed: " . $e->getMessage());
    http_response_code(500);
    echo "Database connection failed";
    exit;
}

// Fetch order from database
try {
    $stmt = $pdo->prepare("SELECT * FROM orders WHERE order_id = ?");
    $stmt->execute([$order_id]);
    $order = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$order) {
        error_log("Portmanat Callback - Order not found: " . $order_id);
        http_response_code(404);
        echo "Order not found";
        exit;
    }
    
    // Check if order is already processed
    if ($order['status'] !== 'pending') {
        error_log("Portmanat Callback - Order already processed: " . $order_id . " (Status: " . $order['status'] . ")");
        echo "Order already processed";
        exit;
    }
    
} catch(PDOException $e) {
    error_log("Portmanat Callback - Failed to fetch order: " . $e->getMessage());
    http_response_code(500);
    echo "Failed to fetch order";
    exit;
}

// Verify signature
$expected_signature = hash('sha256', PORTMANAT_MERCHANT_ID . $order_id . number_format($amount, 2, '.', '') . PORTMANAT_SECRET_KEY);

if ($signature !== $expected_signature) {
    error_log("Portmanat Callback - Invalid signature for order: " . $order_id);
    error_log("Expected: " . $expected_signature . ", Received: " . $signature);
    
    // Update order status to failed
    try {
        $stmt = $pdo->prepare("UPDATE orders SET status = 'failed', smm_response = 'Invalid signature', updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
        $stmt->execute([$order_id]);
    } catch(PDOException $e) {
        error_log("Portmanat Callback - Failed to update order status: " . $e->getMessage());
    }
    
    http_response_code(400);
    echo "Invalid signature";
    exit;
}

// Check payment status
if ($status !== 'success') {
    error_log("Portmanat Callback - Payment failed for order: " . $order_id . " (Status: " . $status . ")");
    
    // Update order status to failed
    try {
        $stmt = $pdo->prepare("UPDATE orders SET status = 'failed', smm_response = 'Payment failed: " . $status . "', updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
        $stmt->execute([$order_id]);
    } catch(PDOException $e) {
        error_log("Portmanat Callback - Failed to update order status: " . $e->getMessage());
    }
    
    echo "Payment failed";
    exit;
}

// Verify amount matches
if (abs($amount - $order['amount']) > 0.01) { // Allow small difference for floating point precision
    error_log("Portmanat Callback - Amount mismatch for order: " . $order_id . " (Expected: " . $order['amount'] . ", Received: " . $amount . ")");
    
    // Update order status to failed
    try {
        $stmt = $pdo->prepare("UPDATE orders SET status = 'failed', smm_response = 'Amount mismatch', updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
        $stmt->execute([$order_id]);
    } catch(PDOException $e) {
        error_log("Portmanat Callback - Failed to update order status: " . $e->getMessage());
    }
    
    http_response_code(400);
    echo "Amount mismatch";
    exit;
}

// Payment is successful, now call SMM API
$smm_response = callSmmApi($order);

if ($smm_response['success']) {
    // Update order status to completed
    try {
        $stmt = $pdo->prepare("UPDATE orders SET status = 'completed', smm_response = ?, updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
        $stmt->execute([json_encode($smm_response), $order_id]);
        error_log("Portmanat Callback - Order completed successfully: " . $order_id);
    } catch(PDOException $e) {
        error_log("Portmanat Callback - Failed to update order status: " . $e->getMessage());
    }
} else {
    // Update order status to failed
    try {
        $stmt = $pdo->prepare("UPDATE orders SET status = 'failed', smm_response = ?, updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
        $stmt->execute([json_encode($smm_response), $order_id]);
        error_log("Portmanat Callback - SMM API failed for order: " . $order_id);
    } catch(PDOException $e) {
        error_log("Portmanat Callback - Failed to update order status: " . $e->getMessage());
    }
}

// Return success response to Portmanat
echo "OK";

/**
 * Call SMM API to create order
 */
function callSmmApi($order) {
    $api_url = SMM_ADD_ORDER_URL;
    $api_key = SMM_API_KEY;
    $service_id = SMM_SERVICE_ID;
    
    // Prepare SMM API parameters
    $smm_data = [
        'key' => $api_key,
        'action' => 'add',
        'service' => $service_id,
        'link' => $order['link'],
        'quantity' => $order['quantity']
    ];
    
    // Initialize cURL
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $api_url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($smm_data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/x-www-form-urlencoded',
        'User-Agent: SMM-Panel/1.0'
    ]);
    
    // Execute cURL request
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $curl_error = curl_error($ch);
    curl_close($ch);
    
    // Log SMM API call
    if (DEBUG_MODE) {
        error_log("SMM API Call - URL: " . $api_url);
        error_log("SMM API Call - Data: " . print_r($smm_data, true));
        error_log("SMM API Call - Response: " . $response);
        error_log("SMM API Call - HTTP Code: " . $http_code);
        if ($curl_error) {
            error_log("SMM API Call - cURL Error: " . $curl_error);
        }
    }
    
    // Check for cURL errors
    if ($curl_error) {
        return [
            'success' => false,
            'error' => 'cURL Error: ' . $curl_error,
            'http_code' => $http_code
        ];
    }
    
    // Check HTTP response code
    if ($http_code !== 200) {
        return [
            'success' => false,
            'error' => 'HTTP Error: ' . $http_code,
            'response' => $response
        ];
    }
    
    // Parse response (assuming JSON response)
    $response_data = json_decode($response, true);
    
    if (json_last_error() !== JSON_ERROR_NONE) {
        // If not JSON, treat as plain text
        return [
            'success' => false,
            'error' => 'Invalid JSON response',
            'raw_response' => $response
        ];
    }
    
    // Check if SMM API indicates success
    // This depends on your SMM provider's response format
    // Adjust the success condition based on your provider's API documentation
    $is_success = false;
    if (isset($response_data['status']) && $response_data['status'] === 'success') {
        $is_success = true;
    } elseif (isset($response_data['error']) && empty($response_data['error'])) {
        $is_success = true;
    } elseif (isset($response_data['order'])) {
        $is_success = true;
    }
    
    return [
        'success' => $is_success,
        'response' => $response_data,
        'http_code' => $http_code,
        'raw_response' => $response
    ];
}
?>