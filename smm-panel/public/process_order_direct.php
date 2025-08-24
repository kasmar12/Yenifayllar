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

// Disable output buffering to prevent headers already sent error
ob_start();

session_start();
require_once '../config/database.php';
require_once '../config/link_shortener_config.php';
require_once '../config/link_shortener.php';

// Enable error reporting for debugging but don't display
error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);

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
    
    // Store order data in session for ad completion
    $_SESSION['pending_order'] = [
        'service_id' => $service_id,
        'service_name' => $service['name'],
        'link' => $link,
        'amount' => $amount,
        'price' => $price
    ];
    
    // Generate AY.Live ad link
    $link_shortener = new LinkShortener();
    $short_link_result = $link_shortener->generateShortLink($link, 'temp_' . time());
    
    if (!$short_link_result['success']) {
        throw new Exception("Reklam linki yaradıla bilmədi: " . $short_link_result['error']);
    }
    
    // Log the pending order
    try {
        $log_entry = date('Y-m-d H:i:s') . " - Pending order created, redirecting to AY.Live ad page\n";
        file_put_contents('../logs/orders_log.txt', $log_entry, FILE_APPEND);
    } catch (Exception $e) {
        error_log("Failed to write order log: " . $e->getMessage());
    }
    
    // Redirect to AY.Live ad page
    header('Location: ' . $short_link_result['short_url']);
    exit;
    
} catch (Exception $e) {
    error_log("Direct order processing error: " . $e->getMessage());
    header('Location: index.php?error=order_error&msg=' . urlencode($e->getMessage()));
    exit;
}
?>