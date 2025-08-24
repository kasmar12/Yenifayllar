<?php
require_once '../config/database.php';
require_once '../config/portmanat_api.php';
require_once '../config/smm_api.php';

// Get POST data from Portmanat
$input = file_get_contents('php://input');
$data = json_decode($input, true);

// If JSON parsing fails, try POST data
if (!$data) {
    $data = $_POST;
}

if (!$data) {
    error_log("Portmanat callback: No data received");
    http_response_code(400);
    echo json_encode(['status' => 'fail', 'message' => 'No data received']);
    exit;
}

// Log callback data
$log_data = date('Y-m-d H:i:s') . " - Callback received: " . json_encode($data) . "\n";
file_put_contents('../logs/orders_log.txt', $log_data, FILE_APPEND | LOCK_EX);

// Extract callback data based on Portmanat API documentation
$transaction_id = $data['transaction_id'] ?? $data['payment_id'] ?? $data['id'] ?? '';
$order_id = $data['order_id'] ?? '';
$amount = $data['amount'] ?? '';
$status = $data['status'] ?? '';
$sign = $data['sign'] ?? '';

// Log extracted data
error_log("Portmanat callback extracted data: transaction_id=$transaction_id, order_id=$order_id, amount=$amount, status=$status");

if (empty($transaction_id) || empty($order_id)) {
    error_log("Portmanat callback: Missing required data");
    http_response_code(400);
    echo json_encode(['status' => 'fail', 'message' => 'Missing required data']);
    exit;
}

// Verify signature if provided
if (!empty($sign)) {
    $portmanat = new PortmanatAPI();
    if (!$portmanat->verifySignature($data, $sign)) {
        error_log("Portmanat callback: Invalid signature");
        file_put_contents('../logs/orders_log.txt', date('Y-m-d H:i:s') . " - Invalid signature\n", FILE_APPEND | LOCK_EX);
        http_response_code(400);
        echo json_encode(['status' => 'fail', 'message' => 'Invalid signature']);
        exit;
    }
}

// Update payment status
$database = new Database();
$db = $database->getConnection();

if (!$db) {
    error_log("Portmanat callback: Database connection failed");
    http_response_code(500);
    echo json_encode(['status' => 'fail', 'message' => 'Database connection failed']);
    exit;
}

// Update payment status
$query = "UPDATE payments SET status = ? WHERE transaction_id = ?";
$stmt = $db->prepare($query);
$stmt->execute([$status, $transaction_id]);

// Map Portmanat status to our status
$order_status = 'pending';
switch (strtolower($status)) {
    case 'success':
    case 'completed':
    case 'paid':
    case 'approved':
        $order_status = 'paid';
        break;
    case 'failed':
    case 'cancelled':
    case 'expired':
    case 'rejected':
        $order_status = 'payment_failed';
        break;
    case 'pending':
    case 'processing':
    default:
        $order_status = 'pending';
        break;
}

// Log status mapping
error_log("Portmanat status '$status' mapped to order status '$order_status'");

if ($order_status === 'paid') {
    // Get order details
    $query = "SELECT o.*, s.api_service_id FROM orders o 
              JOIN services s ON o.service_id = s.id 
              WHERE o.id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$order_id]);
    $order = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($order) {
        // Update order status
        $query = "UPDATE orders SET status = 'paid' WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$order_id]);

        // Log successful payment
        $log_success = date('Y-m-d H:i:s') . " - Order #$order_id payment successful. Status: $status\n";
        file_put_contents('../logs/orders_log.txt', $log_success, FILE_APPEND | LOCK_EX);

        // Send order to SMM API
        try {
            $smm_api = new SMMAPI();
            $api_response = $smm_api->createOrder(
                $order['api_service_id'],
                $order['link'],
                $order['amount']
            );

            if ($api_response && isset($api_response['order'])) {
                // Update order with API order ID
                $query = "UPDATE orders SET status = 'processing', api_order_id = ? WHERE id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$api_response['order'], $order_id]);

                $log_success = date('Y-m-d H:i:s') . " - Order #$order_id sent to SMM API successfully. API Order ID: " . $api_response['order'] . "\n";
                file_put_contents('../logs/orders_log.txt', $log_success, FILE_APPEND | LOCK_EX);
            } else {
                // API failed
                $query = "UPDATE orders SET status = 'api_failed' WHERE id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$order_id]);

                $log_api_fail = date('Y-m-d H:i:s') . " - Order #$order_id failed to send to SMM API\n";
                file_put_contents('../logs/orders_log.txt', $log_api_fail, FILE_APPEND | LOCK_EX);
            }
        } catch (Exception $e) {
            $log_error = date('Y-m-d H:i:s') . " - Error sending order #$order_id to SMM API: " . $e->getMessage() . "\n";
            file_put_contents('../logs/orders_log.txt', $log_error, FILE_APPEND | LOCK_EX);
            
            $query = "UPDATE orders SET status = 'api_error' WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$order_id]);
        }
    } else {
        $log_order_not_found = date('Y-m-d H:i:s') . " - Order #$order_id not found in database\n";
        file_put_contents('../logs/orders_log.txt', $log_order_not_found, FILE_APPEND | LOCK_EX);
    }
} else if ($order_status === 'payment_failed') {
    // Payment failed
    $query = "UPDATE orders SET status = 'payment_failed' WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$order_id]);

    $log_payment_fail = date('Y-m-d H:i:s') . " - Payment failed for order #$order_id. Status: $status\n";
    file_put_contents('../logs/orders_log.txt', $log_payment_fail, FILE_APPEND | LOCK_EX);
} else {
    // Payment pending
    $query = "UPDATE orders SET status = 'payment_pending' WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$order_id]);

    $log_pending = date('Y-m-d H:i:s') . " - Payment pending for order #$order_id. Status: $status\n";
    file_put_contents('../logs/orders_log.txt', $log_pending, FILE_APPEND | LOCK_EX);
}

// Return success response to Portmanat
echo json_encode(['status' => 'ok', 'message' => 'Callback processed successfully']);
?>