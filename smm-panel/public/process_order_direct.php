<?php
/**
 * Direct Order Processing Page
 * 
 * This page:
 * 1. Creates the order in database
 * 2. Generates the AY.Live ad link
 * 3. Immediately redirects user to the ad page
 * 4. After ad completion, order is automatically processed
 */

session_start();
require_once '../config/database.php';
require_once '../config/link_shortener_config.php';
require_once '../config/link_shortener.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$service_id = $_POST['service_id'] ?? '';
$link = $_POST['link'] ?? '';
$amount = $_POST['amount'] ?? '';

if (empty($service_id) || empty($link) || empty($amount)) {
    header('Location: index.php?error=missing_data');
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception("Database connection failed");
    }
    
    // Get service details
    $query = "SELECT * FROM services WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$service_id]);
    $service = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$service) {
        throw new Exception("Xidmət tapılmadı!");
    }

    if ($amount < $service['min_amount'] || $amount > $service['max_amount']) {
        throw new Exception("Miqdar yanlışdır!");
    }
    
    // Calculate price (now free)
    $price = 0.00; // Free orders
    
    // Create order in database
    $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
    $stmt = $db->prepare($query);
    $result = $stmt->execute([$service_id, $link, $amount, $price]);
    
    if (!$result) {
        throw new Exception("Sifariş yaradıla bilmədi!");
    }
    
    $order_id = $db->lastInsertId();
    
    if (!$order_id) {
        throw new Exception("Sifariş ID alına bilmədi!");
    }
    
    // Generate AY.Live ad link
    $link_shortener = new LinkShortener();
    $short_link_result = $link_shortener->generateShortLink($link, $order_id);
    
    if (!$short_link_result['success']) {
        throw new Exception("Reklam linki yaradıla bilmədi: " . $short_link_result['error']);
    }
    
    // Store order data in session for later use
    $_SESSION['current_order'] = [
        'id' => $order_id,
        'service_name' => $service['name'],
        'link' => $link,
        'amount' => $amount,
        'price' => $price,
        'short_link' => $short_link_result['short_url'],
        'shortener_service' => $short_link_result['service']
    ];
    
    // Log the order creation
    $log_entry = date('Y-m-d H:i:s') . " - Order #$order_id created and redirecting to ad page\n";
    file_put_contents('../logs/orders_log.txt', $log_entry, FILE_APPEND | LOCK_EX);
    
    // Store callback URL for AY.Live
    $callback_data = [
        'order_id' => $order_id,
        'callback_url' => SHORTENER_CALLBACK_URL,
        'timestamp' => time()
    ];
    
    $callback_file = "../logs/shortener_callbacks.json";
    $callbacks = [];
    
    if (file_exists($callback_file)) {
        $callbacks = json_decode(file_get_contents($callback_file), true) ?: [];
    }
    
    $callbacks[$order_id] = [
        'status' => 'pending',
        'timestamp' => time(),
        'data' => $callback_data
    ];
    
    file_put_contents($callback_file, json_encode($callbacks, JSON_PRETTY_PRINT));
    
    // Redirect to AY.Live ad page
    header('Location: ' . $short_link_result['short_url']);
    exit;
    
} catch (Exception $e) {
    error_log("Direct order processing error: " . $e->getMessage());
    header('Location: index.php?error=order_error&msg=' . urlencode($e->getMessage()));
    exit;
}
?>