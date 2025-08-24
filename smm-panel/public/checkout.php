<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Start output buffering to catch any output before headers
ob_start();

try {
    session_start();
    require_once '../config/database.php';
    require_once '../config/portmanat_config.php'; // Portmanat konfiqurasiyası
    require_once '../config/portmanat_api.php';
    
    // Log the start of checkout process
    error_log("Checkout process started for IP: " . ($_SERVER['REMOTE_ADDR'] ?? 'unknown'));
    
} catch (Exception $e) {
    error_log("Critical error in checkout.php: " . $e->getMessage());
    error_log("Stack trace: " . $e->getTraceAsString());
    
    // Clear any output buffer
    ob_end_clean();
    
    // Redirect with error
    header('Location: index.php?error=system_error&msg=' . urlencode('System error occurred. Please try again.'));
    exit;
}


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.php');
    exit;
}

$service_id = $_POST['service_id'] ?? '';
$link = $_POST['link'] ?? '';
$amount = $_POST['amount'] ?? '';

if (empty($service_id) || empty($link) || empty($amount)) {
    header('Location: index.php?error=missing_data');
    exit;
}

// Validate amount
try {
    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception("Database connection failed");
    }
    
    $query = "SELECT * FROM services WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$service_id]);
    $service = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$service) {
        header('Location: index.php?error=invalid_service');
        exit;
    }

    if ($amount < $service['min_amount'] || $amount > $service['max_amount']) {
        header('Location: index.php?error=invalid_amount');
        exit;
    }
    
} catch (Exception $e) {
    error_log("Database error in checkout.php: " . $e->getMessage());
    header('Location: index.php?error=database_error&msg=' . urlencode('Database error occurred. Please try again.'));
    exit;
}

// Calculate price
$price = ($amount / 1000) * $service['price_per_1k'];

// Create order in database
try {
    $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
    $stmt = $db->prepare($query);
    $result = $stmt->execute([$service_id, $link, $amount, $price]);
    
    if (!$result) {
        throw new Exception("Failed to create order in database");
    }
    
    $order_id = $db->lastInsertId();
    
    if (!$order_id) {
        throw new Exception("Failed to get order ID from database");
    }
    
} catch (Exception $e) {
    error_log("Order creation error in checkout.php: " . $e->getMessage());
    header('Location: index.php?error=order_creation_failed&msg=' . urlencode('Failed to create order. Please try again.'));
    exit;
}

// Create Portmanat payment
$portmanat = new PortmanatAPI();

// Fix callback URL generation
$protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http';
$host = $_SERVER['HTTP_HOST'] ?? $_SERVER['SERVER_NAME'] ?? 'localhost';
$callback_url = $protocol . '://' . $host . '/callback_portmanat.php';
$return_url = $protocol . '://' . $host . '/payment_success.php';

$description = $service['name'] . ' - ' . number_format($amount) . ' ədəd';

// Log order creation
error_log("Creating order #$order_id: Service=$service_id, Amount=$amount, Price=$price, Callback=$callback_url");

try {
    $payment = $portmanat->createPayment($price, $order_id, $callback_url, $description);
    
    // Log payment response
    error_log("Portmanat payment response for order #$order_id: " . json_encode($payment));
    
    if ($payment && isset($payment['success']) && $payment['success']) {
        // Payment created successfully
        $payment_id = $payment['payment_id'] ?? $payment['id'] ?? null;
        
        if ($payment_id) {
            // Save payment info
            $query = "INSERT INTO payments (transaction_id, amount, status) VALUES (?, ?, 'pending')";
            $stmt = $db->prepare($query);
            $stmt->execute([$payment_id, $price]);
            
            // Log successful payment creation
            error_log("Payment created successfully for order #$order_id: Payment ID=$payment_id");
            
            // Redirect to Portmanat
            $payment_url = $portmanat->getPaymentUrl($payment_id);
            header('Location: ' . $payment_url);
            exit;
        } else {
            // No payment ID in response
            error_log("No payment ID in response for order #$order_id: " . json_encode($payment));
            header('Location: index.php?error=payment_id_missing&debug=' . urlencode(json_encode($payment)));
            exit;
        }
    } else {
        // Payment creation failed
        $error_msg = 'Payment creation failed';
        if (isset($payment['error'])) {
            $error_msg .= ': ' . $payment['error'];
        }
        
        // Log detailed error
        error_log("Payment creation failed for order #$order_id: " . json_encode($payment));
        
        // Include debug info in error message
        $debug_info = '';
        if (isset($payment['debug_info'])) {
            $debug_info = '&debug=' . urlencode(json_encode($payment['debug_info']));
        }
        
        header('Location: index.php?error=payment_failed&msg=' . urlencode($error_msg) . $debug_info);
        exit;
    }
    
} catch (Exception $e) {
    // Exception occurred
    error_log("Exception during payment creation for order #$order_id: " . $e->getMessage());
    
    // Clear output buffer before redirect
    ob_end_clean();
    
    header('Location: index.php?error=payment_exception&msg=' . urlencode($e->getMessage()));
    exit;
}

// Clean up output buffer if we reach here
ob_end_flush();
?>