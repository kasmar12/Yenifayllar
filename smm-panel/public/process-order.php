<?php
/**
 * Order Processing Page
 * Handles order creation after ad verification
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Check if user has pending order
if (!isset($_SESSION['pending_order'])) {
    header('Location: index.php');
    exit;
}

$pendingOrder = $_SESSION['pending_order'];
$message = '';
$messageType = '';
$orderId = '';

try {
    // Place order via SMM API
    $orderResult = placeSMMOrder(
        $pendingOrder['api_service_id'],
        $pendingOrder['link'],
        $pendingOrder['quantity']
    );
    
    if ($orderResult['success']) {
        // Order successful - save to database
        $pdo = getDBConnection();
        
        // Generate unique order ID
        $orderId = generateOrderID();
        
        // Insert order into database
        $stmt = $pdo->prepare("
            INSERT INTO orders (order_id, service_id, link, quantity, price, total_price, status, api_order_id, api_response, user_ip, user_agent) 
            VALUES (?, ?, ?, ?, ?, ?, 'pending', ?, ?, ?, ?)
        ");
        
        $stmt->execute([
            $orderId,
            $pendingOrder['service_id'],
            $pendingOrder['link'],
            $pendingOrder['quantity'],
            $pendingOrder['price'],
            $pendingOrder['total_price'],
            $orderResult['order_id'],
            json_encode($orderResult['response']),
            $_SERVER['REMOTE_ADDR'] ?? '',
            $_SERVER['HTTP_USER_AGENT'] ?? ''
        ]);
        
        // Clear pending order from session
        unset($_SESSION['pending_order']);
        
        $message = 'Order placed successfully!';
        $messageType = 'success';
        
        // Log activity
        logActivity('Order Placed', "Order ID: {$orderId}, Service: {$pendingOrder['service_name']}, Quantity: {$pendingOrder['quantity']}");
        
    } else {
        $message = 'Failed to place order: ' . $orderResult['error'];
        $messageType = 'danger';
    }
    
} catch (Exception $e) {
    $message = 'Error processing order: ' . $e->getMessage();
    $messageType = 'danger';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Order Processing</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.php">
                <i class="fas fa-rocket me-2"></i>
                <?php echo SITE_NAME; ?>
            </a>
        </div>
    </nav>

    <div class="container">
        <div class="main-container fade-in">
            <?php if ($messageType === 'success'): ?>
                <!-- Success State -->
                <div class="text-center">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle fa-3x mb-3"></i>
                        <h4 class="alert-heading">Order Placed Successfully!</h4>
                        <p class="mb-0">Your order has been submitted and is now being processed.</p>
                    </div>
                    
                    <!-- Order Details -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-receipt me-2"></i>Order Details
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Order ID:</strong></p>
                                    <h4 class="text-primary"><?php echo htmlspecialchars($orderId); ?></h4>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Status:</strong></p>
                                    <span class="badge bg-warning fs-6">Pending</span>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Service:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['service_name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Target:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['link']); ?></p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Quantity:</strong></p>
                                    <p class="text-muted"><?php echo number_format($pendingOrder['quantity']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Total Price:</strong></p>
                                    <p class="text-success fw-bold">$<?php echo number_format($pendingOrder['total_price'], 4); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Next Steps:</strong> Your order will be processed within 24-48 hours. 
                        You can track your order status using the Order ID above.
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="order-status.php" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i>Check Order Status
                        </a>
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="fas fa-plus me-2"></i>Place Another Order
                        </a>
                    </div>
                </div>
                
            <?php else: ?>
                <!-- Error State -->
                <div class="text-center">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                        <h4 class="alert-heading">Order Failed</h4>
                        <p><?php echo htmlspecialchars($message); ?></p>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-exclamation-triangle me-2"></i>Attempted Order Details
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Service:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['service_name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Target:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['link']); ?></p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Quantity:</strong></p>
                                    <p class="text-muted"><?php echo number_format($pendingOrder['quantity']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Total Price:</strong></p>
                                    <p class="text-muted">$<?php echo number_format($pendingOrder['total_price'], 4); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="index.php" class="btn btn-primary">
                            <i class="fas fa-arrow-left me-2"></i>Back to Order Form
                        </a>
                        <button onclick="location.reload()" class="btn btn-outline-secondary">
                            <i class="fas fa-redo me-2"></i>Try Again
                        </button>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Copy order ID to clipboard
        function copyOrderId() {
            const orderId = '<?php echo $orderId; ?>';
            navigator.clipboard.writeText(orderId).then(function() {
                alert('Order ID copied to clipboard!');
            });
        }
        
        // Auto-redirect after 30 seconds for success
        <?php if ($messageType === 'success'): ?>
        setTimeout(function() {
            window.location.href = 'order-status.php';
        }, 30000);
        <?php endif; ?>
    </script>
</body>
</html>