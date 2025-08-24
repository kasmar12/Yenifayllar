<?php
session_start();
require_once '../config/database.php';
require_once '../config/portmanat_api.php';

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
$database = new Database();
$db = $database->getConnection();

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

// Calculate price
$price = ($amount / 1000) * $service['price_per_1k'];

// Create order in database
$query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
$stmt = $db->prepare($query);
$stmt->execute([$service_id, $link, $amount, $price]);

$order_id = $db->lastInsertId();

// Create Portmanat payment
$portmanat = new PortmanatAPI();
$callback_url = 'https://' . $_SERVER['HTTP_HOST'] . '/callback_portmanat.php';
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
    header('Location: index.php?error=payment_exception&msg=' . urlencode($e->getMessage()));
    exit;
}
?>