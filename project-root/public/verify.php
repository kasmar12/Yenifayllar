<?php
/**
 * Verification Handler
 * Processes order after ad skip and sends to SMM Panel API
 */

// Include configuration
require_once '../includes/config.php';

// Get query parameters
$link = $_GET['link'] ?? '';
$service = $_GET['service'] ?? '';
$quantity = intval($_GET['quantity'] ?? 0);

// Validate required parameters
if (empty($link) || empty($service) || $quantity <= 0) {
    die('Error: Missing or invalid parameters');
}

// Prepare SMM Panel API request data
$smmApiData = [
    'key' => SMM_API_KEY,
    'action' => 'add',
    'service' => $service,
    'link' => $link,
    'quantity' => $quantity
];

// Initialize cURL session for SMM Panel API
$ch = curl_init();

// Set cURL options
curl_setopt_array($ch, [
    CURLOPT_URL => SMM_API_URL,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => http_build_query($smmApiData),
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_USERAGENT => 'SMM-Order-System/1.0',
    CURLOPT_HTTPHEADER => [
        'Content-Type: application/x-www-form-urlencoded',
        'Accept: application/json'
    ]
]);

// Execute cURL request
$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);

// Close cURL session
curl_close($ch);

// Check for cURL errors
if ($curlError) {
    $errorMessage = 'Failed to connect to SMM Panel API: ' . $curlError;
    $isSuccess = false;
} else {
    // Parse JSON response
    $data = json_decode($response, true);
    
    // Check if JSON parsing failed
    if (json_last_error() !== JSON_ERROR_NONE) {
        $errorMessage = 'Invalid response from SMM Panel API';
        $isSuccess = false;
    } else {
        // Check API response
        if (isset($data['status']) && $data['status'] === 'success') {
            $isSuccess = true;
            $orderId = $data['order'] ?? 'N/A';
            $message = 'Order created successfully!';
        } else {
            $isSuccess = false;
            $errorMessage = $data['error'] ?? 'Unknown error occurred';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Verification Result</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, <?php echo $isSuccess ? '#51cf66' : '#ff6b6b'; ?> 0%, <?php echo $isSuccess ? '#40c057' : '#ee5a24'; ?> 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .result-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        .status-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            text-align: left;
        }
        .btn-home {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 25px;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
</head>
<body>
    <div class="result-container">
        <?php if ($isSuccess): ?>
            <!-- Success State -->
            <div class="status-icon">✅</div>
            <h2 class="text-success mb-4">Order Created Successfully!</h2>
            <p class="text-muted mb-4">Your order has been submitted to our SMM Panel</p>
            
            <div class="order-details">
                <h5 class="mb-3">Order Details:</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Order ID:</strong> <span class="badge bg-primary"><?php echo htmlspecialchars($orderId); ?></span></p>
                        <p><strong>Service:</strong> <?php echo htmlspecialchars(ucwords(str_replace('_', ' ', $service))); ?></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Target:</strong> <?php echo htmlspecialchars($link); ?></p>
                        <p><strong>Quantity:</strong> <?php echo number_format($quantity); ?></p>
                    </div>
                </div>
            </div>
            
            <div class="alert alert-success" role="alert">
                <strong>Next Steps:</strong> Your order will be processed within 24-48 hours. 
                You can track your order status using the Order ID above.
            </div>
            
        <?php else: ?>
            <!-- Error State -->
            <div class="status-icon">❌</div>
            <h2 class="text-danger mb-4">Order Creation Failed</h2>
            <p class="text-muted mb-4">We encountered an error while processing your order</p>
            
            <div class="alert alert-danger" role="alert">
                <strong>Error:</strong> <?php echo htmlspecialchars($errorMessage); ?>
            </div>
            
            <div class="order-details">
                <h5 class="mb-3">Attempted Order Details:</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Service:</strong> <?php echo htmlspecialchars(ucwords(str_replace('_', ' ', $service))); ?></p>
                        <p><strong>Target:</strong> <?php echo htmlspecialchars($link); ?></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Quantity:</strong> <?php echo number_format($quantity); ?></p>
                        <p><strong>Status:</strong> <span class="badge bg-danger">Failed</span></p>
                    </div>
                </div>
            </div>
        <?php endif; ?>
        
        <div class="d-grid gap-2 mt-4">
            <a href="index.php" class="btn btn-home btn-lg">🏠 Back to Home</a>
            <?php if (!$isSuccess): ?>
                <button onclick="window.location.reload()" class="btn btn-outline-secondary">🔄 Try Again</button>
            <?php endif; ?>
        </div>
        
        <div class="mt-4 text-center">
            <small class="text-muted">
                Need help? Contact our support team for assistance.
            </small>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>