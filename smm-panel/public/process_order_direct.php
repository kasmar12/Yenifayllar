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
    
    // Store order data in session for ad completion
    $_SESSION['pending_order'] = [
        'service_id' => $service_id,
        'link' => $link,
        'amount' => $amount,
        'price' => 0.00 // Free orders
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