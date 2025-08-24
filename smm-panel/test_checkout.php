<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h1>Checkout.php Debug Test</h1>";
echo "<hr>";

// Test 1: Basic PHP
echo "<h3>1. Basic PHP Test</h3>";
echo "<p>✅ PHP is working</p>";

// Test 2: Session
echo "<h3>2. Session Test</h3>";
try {
    session_start();
    echo "<p>✅ Session started successfully</p>";
} catch (Exception $e) {
    echo "<p>❌ Session error: " . $e->getMessage() . "</p>";
}

// Test 3: Database Connection
echo "<h3>3. Database Connection Test</h3>";
try {
    require_once 'config/database.php';
    echo "<p>✅ Database.php loaded</p>";
    
    $database = new Database();
    echo "<p>✅ Database class instantiated</p>";
    
    $db = $database->getConnection();
    if ($db) {
        echo "<p>✅ Database connection successful</p>";
    } else {
        echo "<p>❌ Database connection failed</p>";
    }
} catch (Exception $e) {
    echo "<p>❌ Database error: " . $e->getMessage() . "</p>";
}

// Test 4: Portmanat Config
echo "<h3>4. Portmanat Config Test</h3>";
try {
    require_once 'config/portmanat_config.php';
    echo "<p>✅ Portmanat config loaded</p>";
    
    if (defined('PORTMANAT_MERCHANT_ID')) {
        echo "<p>✅ Merchant ID: " . PORTMANAT_MERCHANT_ID . "</p>";
    } else {
        echo "<p>❌ Merchant ID not defined</p>";
    }
    
    if (defined('PORTMANAT_SECRET_KEY')) {
        echo "<p>✅ Secret Key: " . substr(PORTMANAT_SECRET_KEY, 0, 10) . "...</p>";
    } else {
        echo "<p>❌ Secret Key not defined</p>";
    }
} catch (Exception $e) {
    echo "<p>❌ Portmanat config error: " . $e->getMessage() . "</p>";
}

// Test 5: Portmanat API Class
echo "<h3>5. Portmanat API Class Test</h3>";
try {
    require_once 'config/portmanat_api.php';
    echo "<p>✅ Portmanat API class loaded</p>";
    
    $portmanat = new PortmanatAPI();
    echo "<p>✅ Portmanat API class instantiated</p>";
    
    // Test basic methods
    if (method_exists($portmanat, 'createPayment')) {
        echo "<p>✅ createPayment method exists</p>";
    } else {
        echo "<p>❌ createPayment method missing</p>";
    }
    
} catch (Exception $e) {
    echo "<p>❌ Portmanat API error: " . $e->getMessage() . "</p>";
}

// Test 6: POST Data Simulation
echo "<h3>6. POST Data Test</h3>";
echo "<p>Simulating POST data:</p>";
echo "<ul>";
echo "<li>service_id: 1</li>";
echo "<li>link: https://example.com</li>";
echo "<li>amount: 100</li>";
echo "</ul>";

// Test 7: Service Validation
echo "<h3>7. Service Validation Test</h3>";
try {
    if (isset($db)) {
        $query = "SELECT * FROM services WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([1]);
        $service = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($service) {
            echo "<p>✅ Service found: " . $service['name'] . "</p>";
            echo "<p>Min amount: " . $service['min_amount'] . "</p>";
            echo "<p>Max amount: " . $service['max_amount'] . "</p>";
            echo "<p>Price per 1k: " . $service['price_per_1k'] . "</p>";
        } else {
            echo "<p>❌ Service not found</p>";
        }
    } else {
        echo "<p>❌ Database not available for service test</p>";
    }
} catch (Exception $e) {
    echo "<p>❌ Service validation error: " . $e->getMessage() . "</p>";
}

// Test 8: Order Creation
echo "<h3>8. Order Creation Test</h3>";
try {
    if (isset($db) && isset($service)) {
        $amount = 100;
        $price = ($amount / 1000) * $service['price_per_1k'];
        
        echo "<p>Calculated price: $price AZN</p>";
        
        $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
        $stmt = $db->prepare($query);
        $result = $stmt->execute([1, 'https://example.com', $amount, $price]);
        
        if ($result) {
            $order_id = $db->lastInsertId();
            echo "<p>✅ Order created successfully with ID: $order_id</p>";
            
            // Clean up test order
            $delete_query = "DELETE FROM orders WHERE id = ?";
            $delete_stmt = $db->prepare($delete_query);
            $delete_stmt->execute([$order_id]);
            echo "<p>✅ Test order cleaned up</p>";
        } else {
            echo "<p>❌ Order creation failed</p>";
        }
    } else {
        echo "<p>❌ Database or service not available for order test</p>";
    }
} catch (Exception $e) {
    echo "<p>❌ Order creation error: " . $e->getMessage() . "</p>";
}

echo "<hr>";
echo "<p><a href='public/index.php'>← Ana səhifəyə qayıt</a></p>";
echo "<p><a href='test_portmanat.php'>← Portmanat API Test</a></p>";
?>