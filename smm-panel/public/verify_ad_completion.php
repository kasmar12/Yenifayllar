<?php
/**
 * Ad Completion Verification Page
 * 
 * This page:
 * 1. Receives the shortened URL from AY.Live after ad completion
 * 2. Verifies the ad was completed
 * 3. Creates the order in the system
 * 4. Redirects to success page
 */

session_start();
require_once '../config/database.php';
require_once '../config/link_shortener_config.php';
require_once '../config/link_shortener.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);

// Get parameters from URL
$shortened_url = $_GET['url'] ?? '';
$order_data = $_SESSION['pending_order'] ?? null;

if (empty($shortened_url) || !$order_data) {
    header('Location: index.php?error=invalid_verification');
    exit;
}

try {
    // Verify the shortened URL format
    if (!filter_var($shortened_url, FILTER_VALIDATE_URL)) {
        throw new Exception("Invalid shortened URL format");
    }
    
    // Extract order details from session
    $service_id = $order_data['service_id'];
    $link = $order_data['link'];
    $amount = $order_data['amount'];
    $price = $order_data['price'];
    
    // Create order in database
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
    
    // Create order in database
    $query = "INSERT INTO orders (service_id, link, amount, price, status, created_at) VALUES (?, ?, ?, ?, 'ad_completed', NOW())";
    $stmt = $db->prepare($query);
    $result = $stmt->execute([$service_id, $link, $amount, $price]);
    
    if (!$result) {
        throw new Exception("Sifariş yaradıla bilmədi!");
    }
    
    $order_id = $db->lastInsertId();
    
    if (!$order_id) {
        throw new Exception("Sifariş ID alına bilmədi!");
    }
    
    // Log the successful order creation
    try {
        $log_entry = date('Y-m-d H:i:s') . " - Order #$order_id created successfully after ad completion\n";
        file_put_contents('../logs/orders_log.txt', $log_entry, FILE_APPEND);
    } catch (Exception $e) {
        error_log("Failed to write order log: " . $e->getMessage());
    }
    
    // Store order data in session for success page
    $_SESSION['completed_order'] = [
        'id' => $order_id,
        'service_name' => $service['name'],
        'link' => $link,
        'amount' => $amount,
        'price' => $price,
        'shortened_url' => $shortened_url,
        'status' => 'ad_completed'
    ];
    
    // Clear pending order data
    unset($_SESSION['pending_order']);
    
    // Redirect to success page
    header('Location: order_success.php?order_id=' . $order_id);
    exit;
    
} catch (Exception $e) {
    error_log("Ad verification error: " . $e->getMessage());
    
    // Clear session data on error
    unset($_SESSION['pending_order']);
    
    header('Location: index.php?error=verification_failed&msg=' . urlencode($e->getMessage()));
    exit;
}
?>