<?php
// Step-by-step checkout test
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h1>SMM Panel Checkout Step-by-Step Test</h1>";

// Step 1: Check if required files exist
echo "<h2>Step 1: File Existence Check</h2>";
$required_files = [
    '../config/database.php',
    '../config/portmanat_config.php',
    '../config/portmanat_api.php'
];

$files_ok = true;
foreach ($required_files as $file) {
    if (file_exists($file)) {
        echo "✅ $file exists<br>";
    } else {
        echo "❌ $file missing<br>";
        $files_ok = false;
    }
}

if (!$files_ok) {
    echo "<p><strong>❌ Critical: Required files are missing!</strong></p>";
    exit;
}

// Step 2: Check constants
echo "<h2>Step 2: Constants Check</h2>";
try {
    require_once '../config/portmanat_config.php';
    
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
    
    if (defined('PORTMANAT_CALLBACK_URL')) {
        echo "✅ PORTMANAT_CALLBACK_URL: " . PORTMANAT_CALLBACK_URL . "<br>";
    } else {
        echo "❌ PORTMANAT_CALLBACK_URL not defined<br>";
    }
    
} catch (Exception $e) {
    echo "❌ Error loading config: " . $e->getMessage() . "<br>";
    exit;
}

// Step 3: Test database connection
echo "<h2>Step 3: Database Connection Test</h2>";
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
        
        // Show first service
        $query = "SELECT * FROM services LIMIT 1";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $first_service = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($first_service) {
            echo "✅ First service: " . $first_service['name'] . " (ID: " . $first_service['id'] . ")<br>";
        } else {
            echo "❌ No services found in database<br>";
        }
        
    } else {
        echo "❌ Database connection failed<br>";
        exit;
    }
} catch (Exception $e) {
    echo "❌ Database error: " . $e->getMessage() . "<br>";
    exit;
}

// Step 4: Test Portmanat API class instantiation
echo "<h2>Step 4: Portmanat API Class Test</h2>";
try {
    require_once '../config/portmanat_api.php';
    
    $portmanat = new PortmanatAPI();
    echo "✅ PortmanatAPI class instantiated successfully<br>";
    
} catch (Exception $e) {
    echo "❌ Portmanat API instantiation error: " . $e->getMessage() . "<br>";
    exit;
} catch (Error $e) {
    echo "❌ Portmanat API fatal error: " . $e->getMessage() . "<br>";
    exit;
}

// Step 5: Test API connection
echo "<h2>Step 5: Portmanat API Connection Test</h2>";
try {
    $test_result = $portmanat->testConnection();
    echo "Test result: " . json_encode($test_result) . "<br>";
    
    if ($test_result['success']) {
        echo "✅ Portmanat API connection successful<br>";
    } else {
        echo "❌ Portmanat API connection failed: " . $test_result['message'] . "<br>";
    }
    
} catch (Exception $e) {
    echo "❌ API connection test error: " . $e->getMessage() . "<br>";
} catch (Error $e) {
    echo "❌ API connection test fatal error: " . $e->getMessage() . "<br>";
}

// Step 6: Test order creation
echo "<h2>Step 6: Order Creation Test</h2>";
try {
    if (isset($db) && isset($first_service)) {
        // Create a test order
        $test_service_id = $first_service['id'];
        $test_link = 'https://instagram.com/test';
        $test_amount = 100;
        $test_price = ($test_amount / 1000) * $first_service['price_per_1k'];
        
        echo "Creating test order with:<br>";
        echo "- Service ID: $test_service_id<br>";
        echo "- Link: $test_link<br>";
        echo "- Amount: $test_amount<br>";
        echo "- Price: $test_price<br>";
        
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

// Step 7: Test payment creation
echo "<h2>Step 7: Payment Creation Test</h2>";
try {
    if (isset($portmanat)) {
        $test_amount = 0.25; // 25 qəpik
        $test_order_id = 'TEST_' . time();
        $test_callback = PORTMANAT_CALLBACK_URL;
        $test_description = 'Test payment';
        
        echo "Creating test payment with:<br>";
        echo "- Amount: $test_amount AZN<br>";
        echo "- Order ID: $test_order_id<br>";
        echo "- Callback: $test_callback<br>";
        echo "- Description: $test_description<br>";
        
        $payment = $portmanat->createPayment($test_amount, $test_order_id, $test_callback, $test_description, '1');
        
        echo "Payment response: " . json_encode($payment) . "<br>";
        
        if ($payment && isset($payment['success']) && $payment['success']) {
            echo "✅ Test payment created successfully<br>";
        } else {
            echo "❌ Test payment creation failed<br>";
            if (isset($payment['error'])) {
                echo "Error: " . $payment['error'] . "<br>";
            }
        }
    }
} catch (Exception $e) {
    echo "❌ Payment creation test error: " . $e->getMessage() . "<br>";
} catch (Error $e) {
    echo "❌ Payment creation test fatal error: " . $e->getMessage() . "<br>";
}

echo "<hr>";
echo "<p><strong>Step-by-step test completed!</strong></p>";
echo "<p><a href='../public/index.php'>← Ana səhifəyə qayıt</a></p>";
echo "<p><a href='test_checkout_simple.php'>← Sadə Test Səhifəsi</a></p>";
?>