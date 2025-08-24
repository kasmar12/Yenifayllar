<?php
/**
 * Direct Order Processing Page
 * 
 * This page:
 * 1. Stores order data in session (doesn't create order yet)
 * 2. Generates the AY.Live ad link
 * 3. Redirects user to the ad page
 * 4. After ad completion, order is created in ad_verification.php
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
    // Validate service details (without database connection)
    if (!is_numeric($service_id) || !is_numeric($amount)) {
        throw new Exception("Yanlış məlumat formatı!");
    }
    
    if ($amount < 1) {
        throw new Exception("Miqdar 1-dən az ola bilməz!");
    }
    
    // Get service details from database for session storage
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
    
    // Calculate total price (now free)
    $totalPrice = 0.00; // Free orders
    
    // Store order data in session for ad verification
    $_SESSION['pending_order'] = [
        'service_id' => $service_id,
        'service_name' => $service['name'],
        'link' => $link,
        'quantity' => $amount,
        'price' => $service['price'],
        'total_price' => $totalPrice,
        'api_service_id' => $service['api_service_id'] ?? null
    ];
    
    // Log the pending order
    try {
        $log_entry = date('Y-m-d H:i:s') . " - Pending order created, redirecting to ad verification\n";
        file_put_contents('../logs/orders_log.txt', $log_entry, FILE_APPEND);
    } catch (Exception $e) {
        error_log("Failed to write order log: " . $e->getMessage());
    }
    
    // Redirect to ad verification
    header('Location: ad-verification.php');
    exit;
    
} catch (Exception $e) {
    error_log("Direct order processing error: " . $e->getMessage());
    header('Location: index.php?error=order_error&msg=' . urlencode($e->getMessage()));
    exit;
}
?>