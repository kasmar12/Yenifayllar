<?php
require_once 'config/portmanat_config.php';
require_once 'config/portmanat_api.php';
require_once 'config/database.php';

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h1>Portmanat API Debug Test</h1>";

try {
    echo "<h2>1. Configuration Check</h2>";
    echo "<p><strong>Merchant ID:</strong> " . (defined('PORTMANAT_MERCHANT_ID') ? PORTMANAT_MERCHANT_ID : 'NOT DEFINED') . "</p>";
    echo "<p><strong>Secret Key:</strong> " . (defined('PORTMANAT_SECRET_KEY') ? substr(PORTMANAT_SECRET_KEY, 0, 4) . '***' : 'NOT DEFINED') . "</p>";
    echo "<p><strong>API URL:</strong> " . (defined('PORTMANAT_API_URL') ? PORTMANAT_API_URL : 'NOT DEFINED') . "</p>";
    echo "<p><strong>Callback URL:</strong> " . (defined('PORTMANAT_CALLBACK_URL') ? PORTMANAT_CALLBACK_URL : 'NOT DEFINED') . "</p>";
    
    echo "<h2>2. Portmanat API Instance</h2>";
    $portmanat = new PortmanatAPI();
    echo "<p><strong>Class:</strong> " . get_class($portmanat) . "</p>";
    
    // Check if credentials are set
    $reflection = new ReflectionClass($portmanat);
    $merchant_id_prop = $reflection->getProperty('merchant_id');
    $merchant_id_prop->setAccessible(true);
    $secret_key_prop = $reflection->getProperty('secret_key');
    $secret_key_prop->setAccessible(true);
    
    echo "<p><strong>Instance Merchant ID:</strong> " . $merchant_id_prop->getValue($portmanat) . "</p>";
    echo "<p><strong>Instance Secret Key:</strong> " . substr($secret_key_prop->getValue($portmanat), 0, 4) . '***' . "</p>";
    
    echo "<h2>3. Connection Test</h2>";
    $connection_test = $portmanat->testConnection();
    echo "<p><strong>Connection Test Result:</strong></p>";
    echo "<pre>" . json_encode($connection_test, JSON_PRETTY_PRINT) . "</pre>";
    
    echo "<h2>4. Create Payment Test</h2>";
    $test_amount = 10.00;
    $test_order_id = 'TEST_' . time();
    $test_callback = PORTMANAT_CALLBACK_URL;
    $test_description = 'Test Payment - SMM Panel';
    
    echo "<p><strong>Test Parameters:</strong></p>";
    echo "<ul>";
    echo "<li>Amount: $test_amount AZN</li>";
    echo "<li>Order ID: $test_order_id</li>";
    echo "<li>Callback URL: $test_callback</li>";
    echo "<li>Description: $test_description</li>";
    echo "</ul>";
    
    $payment = $portmanat->createPayment($test_amount, $test_order_id, $test_callback, $test_description, '1');
    
    echo "<p><strong>Payment Creation Result:</strong></p>";
    echo "<pre>" . json_encode($payment, JSON_PRETTY_PRINT) . "</pre>";
    
    if (isset($payment['error'])) {
        echo "<h3>Error Details:</h3>";
        echo "<p><strong>Error:</strong> " . $payment['error'] . "</p>";
        
        if (isset($payment['response'])) {
            echo "<p><strong>Response:</strong></p>";
            echo "<pre>" . htmlspecialchars($payment['response']) . "</pre>";
        }
    }
    
} catch (Exception $e) {
    echo "<h2>Exception Occurred</h2>";
    echo "<p><strong>Error:</strong> " . $e->getMessage() . "</p>";
    echo "<p><strong>File:</strong> " . $e->getFile() . "</p>";
    echo "<p><strong>Line:</strong> " . $e->getLine() . "</p>";
    echo "<p><strong>Trace:</strong></p>";
    echo "<pre>" . $e->getTraceAsString() . "</pre>";
} catch (Error $e) {
    echo "<h2>Fatal Error Occurred</h2>";
    echo "<p><strong>Error:</strong> " . $e->getMessage() . "</p>";
    echo "<p><strong>File:</strong> " . $e->getFile() . "</p>";
    echo "<p><strong>Line:</strong> " . $e->getLine() . "</p>";
}

echo "<h2>5. Recent Error Logs</h2>";
$log_file = 'logs/orders_log.txt';
if (file_exists($log_file)) {
    $logs = file_get_contents($log_file);
    $lines = explode("\n", $logs);
    $recent_lines = array_slice($lines, -20);
    
    echo "<p><strong>Son 20 log qeydi:</strong></p>";
    echo "<div style='background: #f8f9fa; padding: 15px; border-radius: 5px; max-height: 300px; overflow-y: auto;'>";
    echo "<pre>" . htmlspecialchars(implode("\n", $recent_lines)) . "</pre>";
    echo "</div>";
} else {
    echo "<p>Log faylı tapılmadı: $log_file</p>";
}

echo "<hr>";
echo "<p><a href='index.php'>← Ana səhifəyə qayıt</a></p>";
?>