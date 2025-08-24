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

$payment = $portmanat->createPayment($price, $order_id, $callback_url);

if ($payment && isset($payment['payment_id'])) {
    // Save payment info
    $query = "INSERT INTO payments (transaction_id, amount, status) VALUES (?, ?, 'pending')";
    $stmt = $db->prepare($query);
    $stmt->execute([$payment['payment_id'], $price]);
    
    // Redirect to Portmanat
    $payment_url = $portmanat->getPaymentUrl($payment['payment_id']);
    header('Location: ' . $payment_url);
    exit;
} else {
    // Payment creation failed
    header('Location: index.php?error=payment_failed');
    exit;
}
?>