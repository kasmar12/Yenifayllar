<?php
/**
 * Payment Failure Page
 * Shows error messages when payment fails
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

// Get error message from query string if available
$error_message = $_GET['error'] ?? 'Payment processing failed';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Failed - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
        }
        .error-icon {
            font-size: 4rem;
            color: #dc3545;
        }
        .order-details {
            background: rgba(220, 53, 69, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
        .btn-danger {
            background: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 8px 16px;
            border-radius: 20px;
        }
        .error-message {
            background: rgba(220, 53, 69, 0.1);
            border-left: 4px solid #dc3545;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
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
                            <a href="index.php" class="btn btn-danger">
                                <i class="fas fa-home me-2"></i>
                                Back to Home
                            </a>
                        </div>
                    </div>
                <?php elseif ($order): ?>
                    <div class="card">
                        <div class="card-header text-center">
                            <h2 class="mb-0">
                                <i class="fas fa-times-circle me-2"></i>
                                Payment Failed
                            </h2>
                            <p class="mb-0 mt-2">We couldn't process your payment</p>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <i class="fas fa-times-circle error-icon"></i>
                                <h4 class="mt-3 text-danger">Payment Unsuccessful</h4>
                                <p class="text-muted">There was an issue processing your payment. Please try again.</p>
                            </div>
                            
                            <div class="error-message">
                                <h6 class="text-danger mb-2">
                                    <i class="fas fa-exclamation-triangle me-2"></i>
                                    Error Details
                                </h6>
                                <p class="mb-0"><?php echo htmlspecialchars($error_message); ?></p>
                            </div>
                            
                            <div class="order-details">
                                <h6 class="text-danger mb-3">
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
                                            <?php if ($order['status'] === 'failed'): ?>
                                                <span class="badge bg-danger status-badge">
                                                    <i class="fas fa-times me-1"></i>Failed
                                                </span>
                                            <?php elseif ($order['status'] === 'pending'): ?>
                                                <span class="badge bg-warning status-badge">
                                                    <i class="fas fa-clock me-1"></i>Pending
                                                </span>
                                            <?php else: ?>
                                                <span class="badge bg-success status-badge">
                                                    <i class="fas fa-check me-1"></i>Completed
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
                            
                            <?php if ($order['status'] === 'failed' && !empty($order['smm_response'])): ?>
                                <div class="alert alert-danger">
                                    <h6 class="alert-heading">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Additional Information
                                    </h6>
                                    <p class="mb-0"><?php echo htmlspecialchars($order['smm_response']); ?></p>
                                </div>
                            <?php endif; ?>
                            
                            <div class="alert alert-warning">
                                <h6 class="alert-heading">
                                    <i class="fas fa-lightbulb me-2"></i>
                                    What to do next?
                                </h6>
                                <ul class="mb-0 ps-3">
                                    <li>Check your payment method and try again</li>
                                    <li>Ensure you have sufficient funds</li>
                                    <li>Contact support if the problem persists</li>
                                </ul>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <a href="index.php" class="btn btn-danger btn-lg">
                                    <i class="fas fa-redo me-2"></i>
                                    Try Again
                                </a>
                                <a href="index.php" class="btn btn-outline-danger">
                                    <i class="fas fa-home me-2"></i>
                                    Back to Home
                                </a>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
                
                <div class="text-center mt-3">
                    <small class="text-white-50">
                        <i class="fas fa-shield-alt me-1"></i>
                        Secure payment powered by Portmanat.az
                    </small>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>