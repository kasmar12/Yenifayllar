<?php
/**
 * Payment Success Page
 * Shows order completion status after successful payment
 */

require_once 'config.php';

// Check if order_id is provided
if (!isset($_GET['order_id']) || empty($_GET['order_id'])) {
    header("Location: index.php?error=invalid_order");
    exit;
}

$order_id = trim($_GET['order_id']);
$order = null;
$error = '';

// Initialize database connection
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
} catch(PDOException $e) {
    $error = "Database connection failed: " . $e->getMessage();
}

// Fetch order details if database connection successful
if (!$error) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM orders WHERE order_id = ?");
        $stmt->execute([$order_id]);
        $order = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$order) {
            $error = "Order not found";
        }
    } catch(PDOException $e) {
        $error = "Failed to fetch order: " . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
        }
        .success-icon {
            font-size: 4rem;
            color: #28a745;
        }
        .order-details {
            background: rgba(40, 167, 69, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
        .btn-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 8px 16px;
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-8 col-lg-6">
                <?php if ($error): ?>
                    <div class="card">
                        <div class="card-body text-center p-5">
                            <div class="mb-4">
                                <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i>
                                <h3>Error</h3>
                                <p class="text-muted"><?php echo htmlspecialchars($error); ?></p>
                            </div>
                            <a href="index.php" class="btn btn-success">
                                <i class="fas fa-home me-2"></i>
                                Back to Home
                            </a>
                        </div>
                    </div>
                <?php elseif ($order): ?>
                    <div class="card">
                        <div class="card-header text-center">
                            <h2 class="mb-0">
                                <i class="fas fa-check-circle me-2"></i>
                                Payment Successful!
                            </h2>
                            <p class="mb-0 mt-2">Your order has been processed successfully</p>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <i class="fas fa-check-circle success-icon"></i>
                                <h4 class="mt-3 text-success">Thank You!</h4>
                                <p class="text-muted">Your payment has been processed and your order is being prepared.</p>
                            </div>
                            
                            <div class="order-details">
                                <h6 class="text-success mb-3">
                                    <i class="fas fa-receipt me-2"></i>
                                    Order Details
                                </h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <small class="text-muted d-block">Order ID:</small>
                                            <strong class="text-dark"><?php echo htmlspecialchars($order['order_id']); ?></strong>
                                        </div>
                                        <div class="mb-3">
                                            <small class="text-muted d-block">Status:</small>
                                            <?php if ($order['status'] === 'completed'): ?>
                                                <span class="badge bg-success status-badge">
                                                    <i class="fas fa-check me-1"></i>Completed
                                                </span>
                                            <?php elseif ($order['status'] === 'pending'): ?>
                                                <span class="badge bg-warning status-badge">
                                                    <i class="fas fa-clock me-1"></i>Processing
                                                </span>
                                            <?php else: ?>
                                                <span class="badge bg-danger status-badge">
                                                    <i class="fas fa-times me-1"></i>Failed
                                                </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <small class="text-muted d-block">Amount:</small>
                                            <strong class="text-dark"><?php echo htmlspecialchars($order['amount']) . ' ' . CURRENCY; ?></strong>
                                        </div>
                                        <div class="mb-3">
                                            <small class="text-muted d-block">Created:</small>
                                            <strong class="text-dark"><?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?></strong>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mt-3">
                                    <small class="text-muted d-block">Service Details:</small>
                                    <strong class="text-dark"><?php echo htmlspecialchars($order['link']); ?></strong>
                                    <br>
                                    <small class="text-muted">Quantity: <?php echo number_format($order['quantity']); ?></small>
                                </div>
                            </div>
                            
                            <?php if ($order['status'] === 'completed' && !empty($order['smm_response'])): ?>
                                <div class="alert alert-success">
                                    <h6 class="alert-heading">
                                        <i class="fas fa-rocket me-2"></i>
                                        SMM Service Activated
                                    </h6>
                                    <p class="mb-0">Your social media marketing service has been successfully activated and is now running.</p>
                                </div>
                            <?php elseif ($order['status'] === 'pending'): ?>
                                <div class="alert alert-info">
                                    <h6 class="alert-heading">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Processing Your Order
                                    </h6>
                                    <p class="mb-0">Your order is being processed. You will receive a notification once the service is activated.</p>
                                </div>
                            <?php endif; ?>
                            
                            <div class="d-grid gap-2">
                                <a href="index.php" class="btn btn-success btn-lg">
                                    <i class="fas fa-plus me-2"></i>
                                    Order Another Service
                                </a>
                                <a href="#" class="btn btn-outline-success" onclick="window.print()">
                                    <i class="fas fa-print me-2"></i>
                                    Print Receipt
                                </a>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
                
                <div class="text-center mt-3">
                    <small class="text-white-50">
                        <i class="fas fa-shield-alt me-1"></i>
                        Secure payment processed by Portmanat.az
                    </small>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>