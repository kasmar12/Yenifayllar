<?php
require_once '../config/database.php';
require_once '../config/portmanat_api.php';
require_once '../config/smm_api.php';

// Get POST data from Portmanat
$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (!$data) {
    error_log("Portmanat callback: Invalid JSON data");
    http_response_code(400);
    echo json_encode(['status' => 'fail', 'message' => 'Invalid data']);
    exit;
}

// Extract callback data
$transaction_id = $data['transaction_id'] ?? '';
$amount = $data['amount'] ?? '';
$status = $data['status'] ?? '';
$sign = $data['sign'] ?? '';
$order_id = $data['order_id'] ?? '';

// Log callback data
$log_data = date('Y-m-d H:i:s') . " - Callback received: " . json_encode($data) . "\n";
file_put_contents('../logs/orders_log.txt', $log_data, FILE_APPEND | LOCK_EX);

// Verify signature
$portmanat = new PortmanatAPI();
if (!$portmanat->verifySignature($data, $sign)) {
    error_log("Portmanat callback: Invalid signature");
    file_put_contents('../logs/orders_log.txt', date('Y-m-d H:i:s') . " - Invalid signature\n", FILE_APPEND | LOCK_EX);
    http_response_code(400);
    echo json_encode(['status' => 'fail', 'message' => 'Invalid signature']);
    exit;
}

// Update payment status
$database = new Database();
$db = $database->getConnection();

$query = "UPDATE payments SET status = ? WHERE transaction_id = ?";
$stmt = $db->prepare($query);
$stmt->execute([$status, $transaction_id]);

if ($status === 'success') {
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
} else {
    // Payment failed
    $query = "UPDATE orders SET status = 'payment_failed' WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$order_id]);

    $log_payment_fail = date('Y-m-d H:i:s') . " - Payment failed for order #$order_id\n";
    file_put_contents('../logs/orders_log.txt', $log_payment_fail, FILE_APPEND | LOCK_EX);
}

// Return success response to Portmanat
echo json_encode(['status' => 'ok']);
?>