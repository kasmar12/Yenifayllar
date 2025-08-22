<?php
/**
 * Order creation handler with optional ad verification
 * Processes order data and creates SMM order
 */

require_once '../includes/functions.php';

// Get order parameters from URL
$link = sanitizeInput($_GET['link'] ?? '');
$service = sanitizeInput($_GET['service'] ?? '');
$quantity = intval($_GET['quantity'] ?? 0);

// Validate required parameters
if (empty($link) || empty($service) || $quantity <= 0) {
    header('Location: index.php?error=invalid_params');
    exit;
}

// Check if ad verification is required (you can modify this logic)
$requireAdVerification = true; // Set to false to skip ad verification

if ($requireAdVerification) {
    // Create verification URL
    $verifyUrl = APP_URL . '/public/verify.php?' . http_build_query([
        'link' => $link,
        'service' => $service,
        'quantity' => $quantity
    ]);
    
    // Create shortened ad link via AY.Live
    $adLink = createShortenedLink($verifyUrl);
    
    if ($adLink) {
        // Redirect to ad verification
        header('Location: ' . $adLink);
        exit;
    } else {
        // If AY.Live fails, proceed without ad verification
        $requireAdVerification = false;
    }
}

// If no ad verification required or AY.Live failed, process order directly
if (!$requireAdVerification) {
    // Place order directly
    $orderResult = placeOrder($service, $link, $quantity);
    
    if ($orderResult) {
        // Order successful - redirect to success page
        header('Location: verify.php?' . http_build_query([
            'link' => $link,
            'service' => $service,
            'quantity' => $quantity,
            'order_id' => $orderResult['order'] ?? 'N/A',
            'direct' => '1'
        ]));
        exit;
    } else {
        // Order failed - show error
        $error = 'Failed to create order. Please try again.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Processing Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .processing-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        .spinner {
            width: 80px;
            height: 80px;
            border: 8px solid #f3f3f3;
            border-top: 8px solid #667eea;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 2rem;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 1.5rem;
            margin: 2rem 0;
            text-align: left;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 25px;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .error-container {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 1.5rem;
            border-radius: 15px;
            margin: 1rem 0;
        }
    </style>
</head>
<body>
    <div class="processing-container">
        <?php if (isset($error)): ?>
            <!-- Error State -->
            <div class="error-container">
                <i class="fas fa-exclamation-triangle fa-3x text-danger mb-3"></i>
                <h3 class="text-danger">Order Creation Failed</h3>
                <p class="mb-3"><?php echo htmlspecialchars($error); ?></p>
                <div class="d-grid gap-2">
                    <a href="index.php" class="btn btn-primary">
                        <i class="fas fa-arrow-left me-2"></i>Back to Form
                    </a>
                    <button onclick="location.reload()" class="btn btn-outline-secondary">
                        <i class="fas fa-redo me-2"></i>Try Again
                    </button>
                </div>
            </div>
        <?php else: ?>
            <!-- Processing State -->
            <div class="spinner"></div>
            <h2 class="mb-4">Processing Your Order...</h2>
            <p class="text-muted mb-4">Please wait while we process your order</p>
            
            <div class="order-details">
                <h5 class="mb-3">Order Details:</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Service:</strong> <?php echo htmlspecialchars(formatServiceName($service)); ?></p>
                        <p><strong>Target:</strong> <?php echo htmlspecialchars($link); ?></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Quantity:</strong> <?php echo number_format($quantity); ?></p>
                        <p><strong>Status:</strong> <span class="badge bg-warning">Processing</span></p>
                    </div>
                </div>
            </div>
            
            <div class="alert alert-info" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                <strong>Note:</strong> If you're not automatically redirected, please wait a moment or refresh the page.
            </div>
            
            <div class="d-grid">
                <a href="index.php" class="btn btn-outline-secondary">
                    <i class="fas fa-home me-2"></i>Back to Home
                </a>
            </div>
        <?php endif; ?>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <?php if (!isset($error)): ?>
    <script>
        // Auto-refresh after 5 seconds if no redirect
        setTimeout(function() {
            location.reload();
        }, 5000);
        
        // Show processing animation
        document.addEventListener('DOMContentLoaded', function() {
            const spinner = document.querySelector('.spinner');
            if (spinner) {
                spinner.style.display = 'block';
            }
        });
    </script>
    <?php endif; ?>
</body>
</html>