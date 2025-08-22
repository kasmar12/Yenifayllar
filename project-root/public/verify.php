<?php
/**
 * Order verification handler
 * Processes callback and shows order status
 */

require_once '../includes/functions.php';

// Get parameters from URL
$link = sanitizeInput($_GET['link'] ?? '');
$service = sanitizeInput($_GET['service'] ?? '');
$quantity = intval($_GET['quantity'] ?? 0);
$orderId = sanitizeInput($_GET['order_id'] ?? '');
$direct = sanitizeInput($_GET['direct'] ?? '');

// Validate required parameters
if (empty($link) || empty($service) || $quantity <= 0) {
    header('Location: index.php?error=invalid_params');
    exit;
}

$isSuccess = false;
$errorMessage = '';
$orderDetails = [];

// If order was created directly (no ad verification)
if ($direct === '1' && !empty($orderId)) {
    $isSuccess = true;
    $orderDetails = [
        'order_id' => $orderId,
        'service' => $service,
        'link' => $link,
        'quantity' => $quantity,
        'status' => 'Created'
    ];
} else {
    // Process order via SMM API
    $orderResult = placeOrder($service, $link, $quantity);
    
    if ($orderResult && isset($orderResult['order'])) {
        $isSuccess = true;
        $orderDetails = [
            'order_id' => $orderResult['order'],
            'service' => $service,
            'link' => $link,
            'quantity' => $quantity,
            'status' => 'Created'
        ];
    } else {
        $isSuccess = false;
        $errorMessage = 'Failed to create order. Please try again.';
        
        if (DEBUG_MODE && $orderResult) {
            $errorMessage .= ' Debug: ' . json_encode($orderResult);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Order Result</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, <?php echo $isSuccess ? '#51cf66' : '#ff6b6b'; ?> 0%, <?php echo $isSuccess ? '#40c057' : '#ee5a24'; ?> 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .result-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            text-align: center;
            max-width: 700px;
            width: 100%;
        }
        .status-icon {
            font-size: 5rem;
            margin-bottom: 1.5rem;
            color: <?php echo $isSuccess ? '#51cf66' : '#ff6b6b'; ?>;
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 2rem;
            margin: 2rem 0;
            text-align: left;
        }
        .btn-home {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 15px 40px;
            font-weight: 600;
            border-radius: 30px;
            font-size: 1.1rem;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }
        .order-id-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-size: 1.1rem;
            font-weight: 600;
            display: inline-block;
            margin: 0.5rem 0;
        }
        .success-animation {
            animation: bounceIn 0.8s ease-out;
        }
        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { transform: scale(1.05); }
            70% { transform: scale(0.9); }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>
    <div class="result-container success-animation">
        <?php if ($isSuccess): ?>
            <!-- Success State -->
            <div class="status-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="text-success mb-4">🎉 Order Created Successfully!</h1>
            <p class="text-muted mb-4 fs-5">Your order has been submitted to our SMM Panel</p>
            
            <div class="order-details">
                <h4 class="mb-4 text-center">
                    <i class="fas fa-receipt me-2"></i>Order Details
                </h4>
                <div class="row">
                    <div class="col-md-6">
                        <p class="mb-3">
                            <strong><i class="fas fa-hashtag me-2"></i>Order ID:</strong><br>
                            <span class="order-id-badge"><?php echo htmlspecialchars($orderDetails['order_id']); ?></span>
                        </p>
                        <p class="mb-3">
                            <strong><i class="fas fa-cogs me-2"></i>Service:</strong><br>
                            <?php echo htmlspecialchars(formatServiceName($orderDetails['service'])); ?>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p class="mb-3">
                            <strong><i class="fas fa-link me-2"></i>Target:</strong><br>
                            <code class="bg-light p-2 rounded"><?php echo htmlspecialchars($orderDetails['link']); ?></code>
                        </p>
                        <p class="mb-3">
                            <strong><i class="fas fa-sort-numeric-up me-2"></i>Quantity:</strong><br>
                            <span class="badge bg-primary fs-6"><?php echo number_format($orderDetails['quantity']); ?></span>
                        </p>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <span class="badge bg-success fs-6">
                        <i class="fas fa-check me-1"></i><?php echo htmlspecialchars($orderDetails['status']); ?>
                    </span>
                </div>
            </div>
            
            <div class="alert alert-success" role="alert">
                <h5 class="alert-heading">
                    <i class="fas fa-info-circle me-2"></i>What's Next?
                </h5>
                <p class="mb-0">
                    Your order will be processed within 24-48 hours. 
                    You can track your order status using the Order ID above.
                </p>
            </div>
            
        <?php else: ?>
            <!-- Error State -->
            <div class="status-icon">
                <i class="fas fa-times-circle"></i>
            </div>
            <h1 class="text-danger mb-4">❌ Order Creation Failed</h1>
            <p class="text-muted mb-4 fs-5">We encountered an error while processing your order</p>
            
            <div class="alert alert-danger" role="alert">
                <h5 class="alert-heading">
                    <i class="fas fa-exclamation-triangle me-2"></i>Error Details
                </h5>
                <p class="mb-0"><?php echo htmlspecialchars($errorMessage); ?></p>
            </div>
            
            <div class="order-details">
                <h5 class="mb-3 text-center">
                    <i class="fas fa-exclamation-triangle me-2"></i>Attempted Order Details
                </h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Service:</strong> <?php echo htmlspecialchars(formatServiceName($service)); ?></p>
                        <p><strong>Target:</strong> <?php echo htmlspecialchars($link); ?></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Quantity:</strong> <?php echo number_format($quantity); ?></p>
                        <p><strong>Status:</strong> <span class="badge bg-danger">Failed</span></p>
                    </div>
                </div>
            </div>
        <?php endif; ?>
        
        <div class="d-grid gap-3 mt-4">
            <a href="index.php" class="btn btn-home btn-lg">
                <i class="fas fa-home me-2"></i>🏠 Back to Home
            </a>
            <?php if (!$isSuccess): ?>
                <button onclick="window.location.reload()" class="btn btn-outline-secondary btn-lg">
                    <i class="fas fa-redo me-2"></i>🔄 Try Again
                </button>
            <?php endif; ?>
        </div>
        
        <div class="mt-4 text-center">
            <small class="text-muted">
                <i class="fas fa-shield-alt me-1"></i>
                Need help? Contact our support team for assistance.
            </small>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Animate success elements
            if (<?php echo $isSuccess ? 'true' : 'false'; ?>) {
                const elements = document.querySelectorAll('.order-details, .alert');
                elements.forEach((el, index) => {
                    setTimeout(() => {
                        el.style.opacity = '0';
                        el.style.transform = 'translateY(20px)';
                        el.style.transition = 'all 0.5s ease';
                        
                        setTimeout(() => {
                            el.style.opacity = '1';
                            el.style.transform = 'translateY(0)';
                        }, 100);
                    }, index * 200);
                });
            }
        });
    </script>
</body>
</html>