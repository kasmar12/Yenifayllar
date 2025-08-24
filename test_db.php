<?php
/**
 * Database Connection Test File
 * Use this file to test your database connection before running the main application
 */

require_once 'config.php';

echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Database Connection Test - SMM Panel</title>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        .test-result { margin: 10px 0; padding: 15px; border-radius: 5px; }
        .success { background-color: #d4edda; border: 1px solid #c3e6cb; color: #155724; }
        .error { background-color: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; }
        .warning { background-color: #fff3cd; border: 1px solid #ffeaa7; color: #856404; }
        .info { background-color: #d1ecf1; border: 1px solid #bee5eb; color: #0c5460; }
    </style>
</head>
<body>
    <div class='container'>
        <div class='row justify-content-center'>
            <div class='col-md-8'>
                <div class='card'>
                    <div class='card-header'>
                        <h3 class='mb-0'>Database Connection Test</h3>
                    </div>
                    <div class='card-body'>";

// Test 1: Check PHP version
echo "<h5>1. PHP Version Check</h5>";
if (version_compare(PHP_VERSION, '7.4.0', '>=')) {
    echo "<div class='test-result success'>✓ PHP Version: " . PHP_VERSION . " (Compatible)</div>";
} else {
    echo "<div class='test-result error'>✗ PHP Version: " . PHP_VERSION . " (Requires 7.4 or higher)</div>";
}

// Test 2: Check required PHP extensions
echo "<h5>2. PHP Extensions Check</h5>";
$required_extensions = ['pdo', 'pdo_mysql', 'curl', 'json'];
foreach ($required_extensions as $ext) {
    if (extension_loaded($ext)) {
        echo "<div class='test-result success'>✓ {$ext} extension is loaded</div>";
    } else {
        echo "<div class='test-result error'>✗ {$ext} extension is NOT loaded</div>";
    }
}

// Test 3: Check configuration constants
echo "<h5>3. Configuration Check</h5>";
$config_constants = [
    'DB_HOST' => 'Database Host',
    'DB_NAME' => 'Database Name',
    'DB_USER' => 'Database User',
    'PORTMANAT_MERCHANT_ID' => 'Portmanat Merchant ID',
    'PORTMANAT_SECRET_KEY' => 'Portmanat Secret Key',
    'SMM_API_URL' => 'SMM API URL',
    'SMM_API_KEY' => 'SMM API Key',
    'SMM_SERVICE_ID' => 'SMM Service ID',
    'SMM_SERVICES_URL' => 'SMM Services URL',
    'SMM_ADD_ORDER_URL' => 'SMM Add Order URL'
];

foreach ($config_constants as $constant => $description) {
    if (defined($constant)) {
        $value = constant($constant);
        if (empty($value) || $value === 'YOUR_' . str_replace('_', '_', $constant)) {
            echo "<div class='test-result warning'>⚠ {$description}: {$value} (Needs to be configured)</div>";
        } else {
            echo "<div class='test-result success'>✓ {$description}: " . substr($value, 0, 20) . "...</div>";
        }
    } else {
        echo "<div class='test-result error'>✗ {$description}: Constant not defined</div>";
    }
}

// Test 4: Database connection test
echo "<h5>4. Database Connection Test</h5>";
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
    
    echo "<div class='test-result success'>✓ Database connection successful</div>";
    
    // Test 5: Check if orders table exists
    echo "<h5>5. Database Schema Check</h5>";
    $stmt = $pdo->query("SHOW TABLES LIKE 'orders'");
    if ($stmt->rowCount() > 0) {
        echo "<div class='test-result success'>✓ Orders table exists</div>";
        
        // Check table structure
        $stmt = $pdo->query("DESCRIBE orders");
        $columns = $stmt->fetchAll(PDO::FETCH_COLUMN);
        $required_columns = ['id', 'order_id', 'link', 'quantity', 'amount', 'status', 'smm_response', 'created_at'];
        
        foreach ($required_columns as $col) {
            if (in_array($col, $columns)) {
                echo "<div class='test-result success'>✓ Column '{$col}' exists</div>";
            } else {
                echo "<div class='test-result error'>✗ Column '{$col}' missing</div>";
            }
        }
        
        // Check table data
        $stmt = $pdo->query("SELECT COUNT(*) as count FROM orders");
        $count = $stmt->fetch(PDO::FETCH_ASSOC)['count'];
        echo "<div class='test-result info'>ℹ Orders table contains {$count} records</div>";
        
    } else {
        echo "<div class='test-result error'>✗ Orders table does not exist</div>";
        echo "<div class='test-result warning'>⚠ Run db.sql to create the database schema</div>";
    }
    
} catch(PDOException $e) {
    echo "<div class='test-result error'>✗ Database connection failed: " . $e->getMessage() . "</div>";
    echo "<div class='test-result warning'>⚠ Check your database credentials in config.php</div>";
}

// Test 6: File permissions check
echo "<h5>6. File Permissions Check</h5>";
$files_to_check = ['config.php', 'index.php', 'payment.php', 'callback.php', 'success.php', 'fail.php'];
foreach ($files_to_check as $file) {
    if (file_exists($file)) {
        if (is_readable($file)) {
            echo "<div class='test-result success'>✓ {$file} is readable</div>";
        } else {
            echo "<div class='test-result error'>✗ {$file} is not readable</div>";
        }
    } else {
        echo "<div class='test-result error'>✗ {$file} does not exist</div>";
    }
}

// Test 7: URL accessibility check
echo "<h5>7. URL Configuration Check</h5>";
if (defined('SITE_URL') && !empty(SITE_URL)) {
    if (filter_var(SITE_URL, FILTER_VALIDATE_URL)) {
        echo "<div class='test-result success'>✓ SITE_URL is a valid URL: " . SITE_URL . "</div>";
    } else {
        echo "<div class='test-result error'>✗ SITE_URL is not a valid URL: " . SITE_URL . "</div>";
    }
} else {
    echo "<div class='test-result error'>✗ SITE_URL is not defined</div>";
}

echo "<h5>8. SMM API Connection Test</h5>";
if (defined('SMM_API_KEY') && SMM_API_KEY !== 'YOUR_SMM_API_KEY') {
    echo "<div class='test-result info'>ℹ Testing multiple SMM API endpoints...</div>";
    
    // List of endpoints to test
    $endpoints = [
        'Standard' => SMM_SERVICES_URL,
        'Alternative 1' => SMM_SERVICES_URL_ALT1,
        'Alternative 2' => SMM_SERVICES_URL_ALT2,
        'Alternative 3' => SMM_SERVICES_URL_ALT3,
        'Alternative 4' => SMM_SERVICES_URL_ALT4,
        'Alternative 5' => SMM_SERVICES_URL_ALT5,
        'Alternative 6' => SMM_SERVICES_URL_ALT6,
        'Alternative 7' => SMM_SERVICES_URL_ALT7,
        'Alternative 8' => SMM_SERVICES_URL_ALT8
    ];
    
    $working_endpoint = null;
    
    foreach ($endpoints as $name => $endpoint) {
        try {
            echo "<div class='test-result info'>ℹ Testing: $name - $endpoint</div>";
            
            // Test SMM API connection
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $endpoint);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
                'key' => SMM_API_KEY,
                'action' => 'services'
            ]));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/x-www-form-urlencoded',
                'User-Agent: SMM-Panel/1.0'
            ]);
            
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $curl_error = curl_error($ch);
            $total_time = curl_getinfo($ch, CURLINFO_TOTAL_TIME);
            curl_close($ch);
            
            if ($curl_error) {
                echo "<div class='test-result error'>✗ $name: cURL Error - " . $curl_error . "</div>";
            } elseif ($http_code === 404) {
                echo "<div class='test-result warning'>⚠ $name: Not Found (404)</div>";
            } elseif ($http_code === 403) {
                echo "<div class='test-result warning'>⚠ $name: Forbidden (403) - Check API key</div>";
            } elseif ($http_code === 401) {
                echo "<div class='test-result warning'>⚠ $name: Unauthorized (401) - Check API key</div>";
            } elseif ($http_code !== 200) {
                echo "<div class='test-result warning'>⚠ $name: HTTP Error - " . $http_code . "</div>";
            } else {
                $response_data = json_decode($response, true);
                if (json_last_error() === JSON_ERROR_NONE) {
                    echo "<div class='test-result success'>✓ $name: SUCCESS! (HTTP " . $http_code . ", " . round($total_time, 2) . "s)</div>";
                    echo "<div class='test-result info'>ℹ Response contains " . count($response_data) . " items</div>";
                    $working_endpoint = $endpoint;
                    break; // Found working endpoint
                } else {
                    echo "<div class='test-result warning'>⚠ $name: Invalid JSON response</div>";
                }
            }
        } catch (Exception $e) {
            echo "<div class='test-result error'>✗ $name: Exception - " . $e->getMessage() . "</div>";
        }
    }
    
    if ($working_endpoint) {
        echo "<div class='test-result success'>🎉 Working endpoint found: $working_endpoint</div>";
    } else {
        echo "<div class='test-result error'>❌ No working endpoints found. Check your SMM API configuration.</div>";
        echo "<div class='test-result info'>ℹ Common issues:</div>";
        echo "<div class='test-result info'>  - Wrong API URL</div>";
        echo "<div class='test-result info'>  - Invalid API key</div>";
        echo "<div class='test-result info'>  - Wrong endpoint structure</div>";
        echo "<div class='test-result info'>  - Provider's API is down</div>";
    }
} else {
    echo "<div class='test-result warning'>⚠ SMM API Key not configured</div>";
}

echo "<h5>8. Recommendations</h5>";
echo "<div class='test-result info'>ℹ Make sure to update all placeholder values in config.php</div>";
echo "<div class='test-result info'>ℹ Test the payment flow with Portmanat's test environment first</div>";
echo "<div class='test-result info'>ℹ Verify your SMM API credentials and endpoints</div>";

echo "<div class='mt-4 text-center'>
        <a href='index.php' class='btn btn-primary'>Go to SMM Panel</a>
        <a href='db.sql' class='btn btn-outline-secondary'>View Database Schema</a>
      </div>";

echo "</div></div></div></div></body></html>";
?>