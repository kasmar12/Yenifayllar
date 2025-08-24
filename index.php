<?php
require_once 'config.php';

// Initialize database connection
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
} catch(PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

$error = '';
$success = '';
$service_info = null;
$price_per_1000 = 0;
$api_debug_info = '';

// Function to fetch service information from SMM API
function getServiceInfo() {
    global $api_debug_info;
    
    $api_key = SMM_API_KEY;
    $service_id = SMM_SERVICE_ID;
    
    // List of endpoints to try
    $endpoints = [
        SMM_SERVICES_URL,
        SMM_SERVICES_URL_ALT1,
        SMM_SERVICES_URL_ALT2,
        SMM_SERVICES_URL_ALT3,
        SMM_SERVICES_URL_ALT4,
        SMM_SERVICES_URL_ALT5,
        SMM_SERVICES_URL_ALT6,
        SMM_SERVICES_URL_ALT7,
        SMM_SERVICES_URL_ALT8
    ];
    
    $api_debug_info = "Trying endpoints:\n";
    
    foreach ($endpoints as $endpoint) {
        $api_debug_info .= "- " . $endpoint . "\n";
        
        // Prepare API request data
        $api_data = [
            'key' => $api_key,
            'action' => 'services'
        ];
        
        // Initialize cURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $endpoint);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($api_data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/x-www-form-urlencoded',
            'User-Agent: SMM-Panel/1.0'
        ]);
        
        // Execute cURL request
        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curl_error = curl_error($ch);
        $total_time = curl_getinfo($ch, CURLINFO_TOTAL_TIME);
        curl_close($ch);
        
        $api_debug_info .= "  Response: HTTP $http_code, Time: " . round($total_time, 2) . "s\n";
        
        if (DEBUG_MODE) {
            error_log("SMM API Services Call - Endpoint: " . $endpoint);
            error_log("SMM API Services Call - Response: " . $response);
            error_log("SMM API Services Call - HTTP Code: " . $http_code);
            error_log("SMM API Services Call - cURL Error: " . $curl_error);
        }
        
        if ($curl_error) {
            $api_debug_info .= "  cURL Error: " . $curl_error . "\n";
            continue; // Try next endpoint
        }
        
        if ($http_code !== 200) {
            $api_debug_info .= "  HTTP Error: " . $http_code . "\n";
            continue; // Try next endpoint
        }
        
        // Parse response
        $response_data = json_decode($response, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            $api_debug_info .= "  JSON Parse Error: " . json_last_error_msg() . "\n";
            $api_debug_info .= "  Raw Response: " . substr($response, 0, 200) . "...\n";
            continue; // Try next endpoint
        }
        
        // Try different response formats
        $service_found = false;
        
        // Format 1: Standard format
        if (isset($response_data['services']) && is_array($response_data['services'])) {
            foreach ($response_data['services'] as $service) {
                if (isset($service['service']) && $service['service'] == $service_id) {
                    $service_found = true;
                    $api_debug_info .= "  Service found in standard format\n";
                    return [
                        'success' => true,
                        'service' => $service,
                        'name' => $service['name'] ?? 'Unknown Service',
                        'price' => floatval($service['rate'] ?? 0),
                        'min' => intval($service['min'] ?? 100),
                        'max' => intval($service['max'] ?? 100000),
                        'endpoint' => $endpoint
                    ];
                }
            }
        }
        
        // Format 2: Direct service array
        if (isset($response_data[0]) && is_array($response_data[0])) {
            foreach ($response_data as $service) {
                if (isset($service['service']) && $service['service'] == $service_id) {
                    $service_found = true;
                    $api_debug_info .= "  Service found in direct array format\n";
                    return [
                        'success' => true,
                        'service' => $service,
                        'name' => $service['name'] ?? 'Unknown Service',
                        'price' => floatval($service['rate'] ?? 0),
                        'min' => intval($service['min'] ?? 100),
                        'max' => intval($service['max'] ?? 100000),
                        'endpoint' => $endpoint
                    ];
                }
            }
        }
        
        // Format 3: Single service object
        if (isset($response_data['service']) && $response_data['service'] == $service_id) {
            $service_found = true;
            $api_debug_info .= "  Service found in single object format\n";
            return [
                'success' => true,
                'service' => $response_data,
                'name' => $response_data['name'] ?? 'Unknown Service',
                'price' => floatval($response_data['rate'] ?? 0),
                'min' => intval($response_data['min'] ?? 100),
                'max' => intval($response_data['max'] ?? 100000),
                'endpoint' => $endpoint
            ];
        }
        
        if (!$service_found) {
            $api_debug_info .= "  Service ID $service_id not found in response\n";
            $api_debug_info .= "  Available services: " . count($response_data) . "\n";
        }
    }
    
    // If we get here, no endpoint worked
    $api_debug_info .= "All endpoints failed\n";
    return ['error' => 'All API endpoints failed', 'debug' => $api_debug_info];
}

// Fetch service information on page load
$service_info = getServiceInfo();

if ($service_info && isset($service_info['success'])) {
    $price_per_1000 = $service_info['price'];
    if (DEBUG_MODE) {
        error_log("Successfully fetched service info: " . print_r($service_info, true));
    }
} else {
    if (DEBUG_MODE) {
        error_log("Failed to fetch service info: " . print_r($service_info, true));
        error_log("API Debug Info: " . $api_debug_info);
    }
    // Fallback price if API fails
    $price_per_1000 = 25.00;
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $link = trim($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    // Basic validation
    if (empty($link)) {
        $error = 'Link/Username is required';
    } elseif ($quantity <= 0) {
        $error = 'Quantity must be greater than 0';
    } elseif ($service_info && isset($service_info['min']) && $quantity < $service_info['min']) {
        $error = 'Minimum quantity is ' . $service_info['min'];
    } elseif ($service_info && isset($service_info['max']) && $quantity > $service_info['max']) {
        $error = 'Maximum quantity is ' . $service_info['max'];
    } else {
        try {
            // Calculate amount based on SMM API price
            $amount = ($quantity / 1000) * $price_per_1000;
            
            // Generate unique order ID
            $order_id = 'ORD_' . time() . '_' . rand(1000, 9999);
            
            // Save order to database
            $stmt = $pdo->prepare("INSERT INTO orders (order_id, link, quantity, amount, status) VALUES (?, ?, ?, ?, 'pending')");
            $stmt->execute([$order_id, $link, $quantity, $amount]);
            
            // Redirect to payment page
            header("Location: payment.php?order_id=" . $order_id);
            exit;
            
        } catch(PDOException $e) {
            $error = 'Failed to create order: ' . $e->getMessage();
        }
    }
}

// Calculate preview amount for display
$preview_quantity = 1000;
$preview_amount = ($preview_quantity / 1000) * $price_per_1000;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Order Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
        }
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .alert {
            border-radius: 10px;
            border: none;
        }
        .price-info {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            color: white;
        }
        .price-calculator {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .service-info {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .debug-info {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            border: 1px solid rgba(255, 255, 255, 0.1);
            font-family: monospace;
            font-size: 12px;
            max-height: 200px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-header text-center">
                        <h2 class="mb-0">
                            <i class="fas fa-chart-line me-2"></i>
                            SMM Panel
                        </h2>
                        <p class="mb-0 mt-2">Order Social Media Marketing Services</p>
                    </div>
                    <div class="card-body p-4">
                        <?php if ($error): ?>
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <?php echo htmlspecialchars($error); ?>
                            </div>
                        <?php endif; ?>
                        
                        <?php if ($success): ?>
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle me-2"></i>
                                <?php echo htmlspecialchars($success); ?>
                            </div>
                        <?php endif; ?>
                        
                        <?php if ($service_info && isset($service_info['success'])): ?>
                            <div class="service-info text-center">
                                <h6 class="text-white mb-2">
                                    <i class="fas fa-info-circle me-2"></i>
                                    Service Information
                                </h6>
                                <p class="text-white-50 mb-1">
                                    <strong><?php echo htmlspecialchars($service_info['name']); ?></strong>
                                </p>
                                <p class="text-white-50 mb-0">
                                    Min: <?php echo number_format($service_info['min']); ?> | 
                                    Max: <?php echo number_format($service_info['max']); ?>
                                </p>
                                <?php if (isset($service_info['endpoint'])): ?>
                                    <small class="text-white-50">
                                        API: <?php echo htmlspecialchars($service_info['endpoint']); ?>
                                    </small>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
                        
                        <div class="price-info text-center">
                            <h5 class="mb-2">
                                <i class="fas fa-tags me-2"></i>
                                Live Pricing from SMM API
                            </h5>
                            <p class="mb-0">
                                <strong><?php echo number_format($price_per_1000, 2) . ' ' . CURRENCY; ?></strong> per 1000 followers/likes/views
                            </p>
                            <?php if (!$service_info || !isset($service_info['success'])): ?>
                                <small class="text-warning">
                                    <i class="fas fa-exclamation-triangle me-1"></i>
                                    Using fallback price (API connection issue)
                                </small>
                                <?php if (DEBUG_MODE): ?>
                                    <br>
                                    <button class="btn btn-sm btn-outline-warning mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#debugInfo">
                                        <i class="fas fa-bug me-1"></i>Show Debug Info
                                    </button>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                        
                        <?php if (DEBUG_MODE && (!$service_info || !isset($service_info['success']))): ?>
                            <div class="collapse" id="debugInfo">
                                <div class="debug-info">
                                    <h6 class="text-white mb-2">API Debug Information:</h6>
                                    <pre class="text-white-50"><?php echo htmlspecialchars($api_debug_info); ?></pre>
                                </div>
                            </div>
                        <?php endif; ?>
                        
                        <form method="POST" action="" id="orderForm">
                            <div class="mb-3">
                                <label for="link" class="form-label">
                                    <i class="fas fa-link me-2"></i>
                                    Link / Username
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="link" 
                                       name="link" 
                                       placeholder="https://instagram.com/username or @username"
                                       value="<?php echo htmlspecialchars($_POST['link'] ?? ''); ?>"
                                       required>
                                <div class="form-text">Enter the profile link or username for the service</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="quantity" class="form-label">
                                    <i class="fas fa-hashtag me-2"></i>
                                    Quantity
                                </label>
                                <input type="number" 
                                       class="form-control" 
                                       id="quantity" 
                                       name="quantity" 
                                       placeholder="1000"
                                       value="<?php echo htmlspecialchars($_POST['quantity'] ?? '1000'); ?>"
                                       min="<?php echo $service_info && isset($service_info['min']) ? $service_info['min'] : 100; ?>" 
                                       max="<?php echo $service_info && isset($service_info['max']) ? $service_info['max'] : 100000; ?>"
                                       step="100"
                                       required>
                                <div class="form-text">
                                    Number of followers, likes, or views to order 
                                    (<?php echo $service_info && isset($service_info['min']) ? 'min: ' . number_format($service_info['min']) : 'min: 100'; ?>, 
                                    <?php echo $service_info && isset($service_info['max']) ? 'max: ' . number_format($service_info['max']) : 'max: 100,000'; ?>)
                                </div>
                            </div>
                            
                            <div class="price-calculator text-center">
                                <h6 class="text-white mb-2">
                                    <i class="fas fa-calculator me-2"></i>
                                    Real-time Price Calculation
                                </h6>
                                <div class="row">
                                    <div class="col-6">
                                        <small class="text-white-50 d-block">Quantity:</small>
                                        <strong class="text-white" id="calcQuantity">1000</strong>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-white-50 d-block">Total Price:</small>
                                        <strong class="text-white" id="calcPrice"><?php echo number_format($preview_amount, 2); ?> <?php echo CURRENCY; ?></strong>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-shopping-cart me-2"></i>
                                    Order Now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="text-center mt-3">
                    <small class="text-white-50">
                        Secure payment powered by 
                        <i class="fas fa-shield-alt me-1"></i>
                        Portmanat.az
                    </small>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Real-time price calculation using SMM API price
        const pricePer1000 = <?php echo $price_per_1000; ?>;
        const minQuantity = <?php echo $service_info && isset($service_info['min']) ? $service_info['min'] : 100; ?>;
        const maxQuantity = <?php echo $service_info && isset($service_info['max']) ? $service_info['max'] : 100000; ?>;
        
        document.getElementById('quantity').addEventListener('input', function() {
            const quantity = parseInt(this.value) || 0;
            const totalPrice = (quantity / 1000) * pricePer1000;
            
            document.getElementById('calcQuantity').textContent = quantity.toLocaleString();
            document.getElementById('calcPrice').textContent = totalPrice.toFixed(2) + ' <?php echo CURRENCY; ?>';
        });
        
        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const quantity = parseInt(document.getElementById('quantity').value);
            if (quantity < minQuantity) {
                e.preventDefault();
                alert('Minimum quantity is ' + minQuantity.toLocaleString());
                return false;
            }
            if (quantity > maxQuantity) {
                e.preventDefault();
                alert('Maximum quantity is ' + maxQuantity.toLocaleString());
                return false;
            }
        });
    </script>
</body>
</html>