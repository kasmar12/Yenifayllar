<?php
// Simple checkout test page
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h1>SMM Panel Checkout Test</h1>";

// Test 1: Check if required files exist
echo "<h2>Test 1: File Existence</h2>";
$required_files = [
    '../config/database.php',
    '../config/portmanat_config.php',
    '../config/portmanat_api.php'
];

foreach ($required_files as $file) {
    if (file_exists($file)) {
        echo "✅ $file exists<br>";
    } else {
        echo "❌ $file missing<br>";
    }
}

// Test 2: Check if constants are defined
echo "<h2>Test 2: Constants</h2>";
if (defined('PORTMANAT_MERCHANT_ID')) {
    echo "✅ PORTMANAT_MERCHANT_ID: " . PORTMANAT_MERCHANT_ID . "<br>";
} else {
    echo "❌ PORTMANAT_MERCHANT_ID not defined<br>";
}

if (defined('PORTMANAT_SECRET_KEY')) {
    echo "✅ PORTMANAT_SECRET_KEY: " . substr(PORTMANAT_SECRET_KEY, 0, 8) . "...<br>";
} else {
    echo "❌ PORTMANAT_SECRET_KEY not defined<br>";
}

// Test 3: Test database connection
echo "<h2>Test 3: Database Connection</h2>";
try {
    require_once '../config/database.php';
    $database = new Database();
    $db = $database->getConnection();
    
    if ($db) {
        echo "✅ Database connection successful<br>";
        
        // Test services table
        $query = "SELECT COUNT(*) as count FROM services";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $count = $stmt->fetch(PDO::FETCH_ASSOC)['count'];
        echo "✅ Services table has $count records<br>";
        
    } else {
        echo "❌ Database connection failed<br>";
    }
} catch (Exception $e) {
    echo "❌ Database error: " . $e->getMessage() . "<br>";
}

// Test 4: Test Portmanat API class
echo "<h2>Test 4: Portmanat API Class</h2>";
try {
    require_once '../config/portmanat_config.php';
    require_once '../config/portmanat_api.php';
    
    $portmanat = new PortmanatAPI();
    echo "✅ PortmanatAPI class instantiated successfully<br>";
    
    // Test API connection
    $test_result = $portmanat->testConnection();
    if ($test_result['success']) {
        echo "✅ Portmanat API connection successful<br>";
    } else {
        echo "❌ Portmanat API connection failed: " . $test_result['message'] . "<br>";
    }
    
} catch (Exception $e) {
    echo "❌ Portmanat API error: " . $e->getMessage() . "<br>";
} catch (Error $e) {
    echo "❌ Portmanat API fatal error: " . $e->getMessage() . "<br>";
}

// Test 5: Test order creation
echo "<h2>Test 5: Order Creation</h2>";
try {
    if (isset($db)) {
        // Create a test order
        $test_service_id = 1;
        $test_link = 'https://instagram.com/test';
        $test_amount = 100;
        $test_price = 0.25; // 100/1000 * 2.50
        
        $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'test')";
        $stmt = $db->prepare($query);
        $result = $stmt->execute([$test_service_id, $test_link, $test_amount, $test_price]);
        
        if ($result) {
            $test_order_id = $db->lastInsertId();
            echo "✅ Test order created with ID: $test_order_id<br>";
            
            // Clean up test order
            $query = "DELETE FROM orders WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$test_order_id]);
            echo "✅ Test order cleaned up<br>";
            
        } else {
            echo "❌ Test order creation failed<br>";
        }
    }
} catch (Exception $e) {
    echo "❌ Order creation test error: " . $e->getMessage() . "<br>";
}

echo "<hr>";
echo "<p><strong>Test completed!</strong></p>";
echo "<p><a href='../public/index.php'>← Ana səhifəyə qayıt</a></p>";
?>