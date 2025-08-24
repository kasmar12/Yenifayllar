<?php
// Development mode aktiv edin
define('DEVELOPMENT_MODE', true);

// Portmanat konfiqurasiyasını daxil edin
require_once 'config/portmanat_config.php';

echo "<h1>Portmanat API Test</h1>";
echo "<hr>";

// Test Portmanat API
require_once 'config/portmanat_api.php';

$portmanat = new PortmanatAPI();

echo "<h3>Testing Portmanat API Connection...</h3>";

try {
    // Test 1: Basic connection test
    echo "<h4>1. Basic Connection Test</h4>";
    $result = $portmanat->testConnection();
    
    if ($result['success']) {
        echo "<div style='background: #d4edda; border: 1px solid #c3e6cb; color: #155724; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h5>✅ Connection Test Successful!</h5>";
        echo "<p><strong>Message:</strong> " . $result['message'] . "</p>";
        if (isset($result['balance'])) {
            echo "<p><strong>Balance Response:</strong> " . json_encode($result['balance']) . "</p>";
        }
        echo "</div>";
    } else {
        echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h5>❌ Connection Test Failed!</h5>";
        echo "<p><strong>Error:</strong> " . $result['message'] . "</p>";
        echo "</div>";
    }
    
    echo "<hr>";
    
    // Test 2: Create payment test
    echo "<h4>2. Create Payment Test</h4>";
    $test_amount = 10.00;
    $test_order_id = 'TEST_' . time();
    
    // Fix callback URL generation (same as in checkout.php)
    $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http';
    $host = $_SERVER['HTTP_HOST'] ?? $_SERVER['SERVER_NAME'] ?? 'localhost';
    $test_callback = $protocol . '://' . $host . '/callback_portmanat.php';
    $test_return = $protocol . '://' . $host . '/payment_success.php';
    
    $test_description = 'Test Payment - SMM Panel';
    
    echo "<p><strong>Test Parameters:</strong></p>";
    echo "<ul>";
    echo "<li><strong>Amount:</strong> $test_amount AZN</li>";
    echo "<li><strong>Order ID:</strong> $test_order_id</li>";
    echo "<li><strong>Callback URL:</strong> $test_callback</li>";
    echo "<li><strong>Return URL:</strong> $test_return</li>";
    echo "<li><strong>Description:</strong> $test_description</li>";
    echo "</ul>";
    
    $payment_result = $portmanat->createPayment($test_amount, $test_order_id, $test_callback, $test_description);
    
    if ($payment_result && isset($payment_result['success']) && $payment_result['success']) {
        echo "<div style='background: #d4edda; border: 1px solid #c3e6cb; color: #155724; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h5>✅ Payment Creation Successful!</h5>";
        echo "<p><strong>Response:</strong> " . json_encode($payment_result, JSON_PRETTY_PRINT) . "</p>";
        
        $payment_id = $payment_result['payment_id'] ?? $payment_result['id'] ?? null;
        if ($payment_id) {
            echo "<p><strong>Payment ID:</strong> $payment_id</p>";
            echo "<p><strong>Payment URL:</strong> <a href='https://portmanat.az/payment/$payment_id' target='_blank'>https://portmanat.az/payment/$payment_id</a></p>";
        }
        echo "</div>";
    } else {
        echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h5>❌ Payment Creation Failed!</h5>";
        echo "<p><strong>Response:</strong> " . json_encode($payment_result, JSON_PRETTY_PRINT) . "</p>";
        
        if (isset($payment_result['debug_info'])) {
            echo "<details>";
            echo "<summary><strong>🔍 Detailed Debug Information</strong></summary>";
            echo "<div style='background: #f8f9fa; padding: 15px; margin: 15px 0; border-radius: 5px;'>";
            
            $debug = $payment_result['debug_info'];
            
            if (isset($debug['headers'])) {
                echo "<h6>📋 Response Headers:</h6>";
                echo "<pre style='background: #e9ecef; padding: 10px; border-radius: 3px; font-size: 11px;'>" . htmlspecialchars($debug['headers']) . "</pre>";
            }
            
            if (isset($debug['body'])) {
                echo "<h6>📄 Response Body:</h6>";
                echo "<pre style='background: #e9ecef; padding: 10px; border-radius: 3px; font-size: 11px;'>" . htmlspecialchars($debug['body']) . "</pre>";
                
                // Try to detect if it's HTML
                if (strpos($debug['body'], '<!DOCTYPE') !== false || strpos($debug['body'], '<html') !== false) {
                    echo "<div style='background: #fff3cd; border: 1px solid #ffeaa7; color: #856404; padding: 10px; margin: 10px 0; border-radius: 3px;'>";
                    echo "<strong>⚠️ HTML Response Detected!</strong> The API is returning HTML instead of JSON.";
                    echo "</div>";
                }
            }
            
            if (isset($debug['raw_response'])) {
                echo "<h6>🔍 Complete Raw Response:</h6>";
                echo "<pre style='background: #e9ecef; padding: 10px; border-radius: 3px; font-size: 11px; max-height: 200px; overflow-y: auto;'>" . htmlspecialchars($debug['raw_response']) . "</pre>";
            }
            
            if (isset($debug['http_code'])) {
                echo "<h6>📊 HTTP Status:</h6>";
                echo "<p><strong>Code:</strong> " . $debug['http_code'] . "</p>";
            }
            
            if (isset($debug['json_error'])) {
                echo "<h6>❌ JSON Error:</h6>";
                echo "<p><strong>Error:</strong> " . $debug['json_error'] . "</p>";
            }
            
            echo "</div>";
            echo "</details>";
        }
        
        // Show recent error logs
        echo "<details>";
        echo "<summary><strong>📝 Recent Error Logs</strong></summary>";
        echo "<div style='background: #f8f9fa; padding: 15px; margin: 15px 0; border-radius: 5px;'>";
        
        $log_file = 'logs/orders_log.txt';
        if (file_exists($log_file)) {
            $logs = file_get_contents($log_file);
            $recent_logs = array_slice(explode("\n", $logs), -10); // Son 10 sətir
            
            echo "<h6>Son 10 error log:</h6>";
            echo "<div style='max-height: 200px; overflow-y: auto; font-family: monospace; font-size: 11px;'>";
            foreach ($recent_logs as $log) {
                if (trim($log) && (strpos($log, 'ERROR') !== false || strpos($log, 'Portmanat') !== false)) {
                    echo htmlspecialchars($log) . "<br>";
                }
            }
            echo "</div>";
        } else {
            echo "<p>Log faylı tapılmadı: $log_file</p>";
        }
        
        echo "</div>";
        echo "</details>";
    }
    
    echo "<hr>";
    
    // Test 3: Check current configuration
    echo "<h4>3. Current Configuration</h4>";
    echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";
    echo "<h5>Portmanat API Configuration:</h5>";
    echo "<ul>";
    echo "<li><strong>API URL:</strong> https://partners.portmanat.az/api</li>";
    echo "<li><strong>Merchant ID:</strong> " . (defined('PORTMANAT_MERCHANT_ID') ? PORTMANAT_MERCHANT_ID : 'Not defined') . "</li>";
    echo "<li><strong>Secret Key:</strong> " . (defined('PORTMANAT_SECRET_KEY') ? '***' . substr(PORTMANAT_SECRET_KEY, -4) : 'Not defined') . "</li>";
    echo "<li><strong>Debug Mode:</strong> Enabled</li>";
    echo "</ul>";
    echo "</div>";
    
} catch (Exception $e) {
    echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
    echo "<h4>❌ Exception Occurred</h4>";
    echo "<p><strong>Error:</strong> " . $e->getMessage() . "</p>";
    echo "<p><strong>File:</strong> " . $e->getFile() . "</p>";
    echo "<p><strong>Line:</strong> " . $e->getLine() . "</p>";
    echo "</div>";
}

echo "<hr>";

// System information
echo "<h3>System Information</h3>";
echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";
echo "<ul>";
echo "<li><strong>PHP Version:</strong> " . phpversion() . "</li>";
echo "<li><strong>cURL Extension:</strong> " . (extension_loaded('curl') ? '✅ Loaded' : '❌ Not Loaded') . "</li>";
echo "<li><strong>JSON Extension:</strong> " . (extension_loaded('json') ? '✅ Loaded' : '❌ Not Loaded') . "</li>";
echo "<li><strong>Current Time:</strong> " . date('Y-m-d H:i:s') . "</li>";
echo "<li><strong>Server:</strong> " . ($_SERVER['HTTP_HOST'] ?? 'Unknown') . "</li>";
echo "<li><strong>Protocol:</strong> " . (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'HTTPS' : 'HTTP') . "</li>";
echo "<li><strong>Document Root:</strong> " . ($_SERVER['DOCUMENT_ROOT'] ?? 'Unknown') . "</li>";
echo "</ul>";
echo "</div>";

// Check error logs
echo "<h3>Recent Error Logs</h3>";
$log_file = 'logs/orders_log.txt';
if (file_exists($log_file)) {
    $logs = file_get_contents($log_file);
    $recent_logs = array_slice(explode("\n", $logs), -20); // Son 20 sətir
    
    echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";
    echo "<h5>Son 20 log qeydi:</h5>";
    echo "<div style='max-height: 300px; overflow-y: auto; font-family: monospace; font-size: 12px;'>";
    foreach ($recent_logs as $log) {
        if (trim($log)) {
            echo htmlspecialchars($log) . "<br>";
        }
    }
    echo "</div>";
    echo "</div>";
} else {
    echo "<div style='background: #fff3cd; border: 1px solid #ffeaa7; color: #856404; padding: 15px; margin: 20px; border-radius: 5px;'>";
    echo "<p>Log faylı tapılmadı: $log_file</p>";
    echo "</div>";
}

echo "<hr>";
echo "<p><a href='public/index.php'>← Ana səhifəyə qayıt</a> | <a href='admin/settings.php'>← Admin Tənzimləmələri</a></p>";
?>