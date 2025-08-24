<?php
/**
 * Payment Initialization File
 * Creates payment request and redirects to Portmanat API
 */

require_once 'config.php';

// Check if order_id is provided
if (!isset($_GET['order_id']) || empty($_GET['order_id'])) {
    header("Location: index.php?error=invalid_order");
    exit;
}

$order_id = trim($_GET['order_id']);

// Initialize database connection
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
} catch(PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Fetch order details from database
try {
    $stmt = $pdo->prepare("SELECT * FROM orders WHERE order_id = ? AND status = 'pending'");
    $stmt->execute([$order_id]);
    $order = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$order) {
        header("Location: index.php?error=order_not_found");
        exit;
    }
} catch(PDOException $e) {
    die("Failed to fetch order: " . $e->getMessage());
}

// Prepare Portmanat payment parameters
$merchant_id = PORTMANAT_MERCHANT_ID;
$amount = number_format($order['amount'], 2, '.', ''); // Format amount to 2 decimal places
$description = "SMM Service - " . $order['link'] . " (Qty: " . $order['quantity'] . ")";
$success_url = SITE_URL . "/success.php";
$fail_url = SITE_URL . "/fail.php";
$notify_url = SITE_URL . "/callback.php";

// Generate SHA256 signature
// Format: hash(merchant_id + order_id + amount + secret_key)
$signature_string = $merchant_id . $order_id . $amount . PORTMANAT_SECRET_KEY;
$signature = hash('sha256', $signature_string);

// Prepare payment data for Portmanat
$payment_data = [
    'merchant_id' => $merchant_id,
    'order_id' => $order_id,
    'amount' => $amount,
    'description' => $description,
    'success_url' => $success_url,
    'fail_url' => $fail_url,
    'notify_url' => $notify_url,
    'signature' => $signature
];

// Log payment attempt (optional)
try {
    $stmt = $pdo->prepare("UPDATE orders SET updated_at = CURRENT_TIMESTAMP WHERE order_id = ?");
    $stmt->execute([$order_id]);
} catch(PDOException $e) {
    // Log error but continue with payment
    error_log("Failed to update order timestamp: " . $e->getMessage());
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redirecting to Payment - SMM Panel</title>
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
        .spinner-border {
            width: 3rem;
            height: 3rem;
        }
        .payment-details {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-body text-center p-5">
                        <div class="mb-4">
                            <i class="fas fa-credit-card fa-3x text-primary mb-3"></i>
                            <h3>Redirecting to Payment</h3>
                            <p class="text-muted">Please wait while we redirect you to Portmanat.az</p>
                        </div>
                        
                        <div class="spinner-border text-primary mb-4" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                        
                        <div class="payment-details text-start">
                            <h6 class="text-white mb-3">Order Details:</h6>
                            <div class="row">
                                <div class="col-6">
                                    <small class="text-muted">Order ID:</small><br>
                                    <strong><?php echo htmlspecialchars($order_id); ?></strong>
                                </div>
                                <div class="col-6">
                                    <small class="text-muted">Amount:</small><br>
                                    <strong><?php echo htmlspecialchars($amount) . ' ' . CURRENCY; ?></strong>
                                </div>
                            </div>
                            <div class="mt-2">
                                <small class="text-muted">Service:</small><br>
                                <strong><?php echo htmlspecialchars($order['link']); ?></strong>
                            </div>
                        </div>
                        
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>
                            You will be redirected to Portmanat.az to complete your payment securely.
                        </div>
                        
                        <form id="paymentForm" method="POST" action="<?php echo PORTMANAT_API_URL; ?>">
                            <?php foreach ($payment_data as $key => $value): ?>
                                <input type="hidden" name="<?php echo htmlspecialchars($key); ?>" value="<?php echo htmlspecialchars($value); ?>">
                            <?php endforeach; ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-submit form after 3 seconds
        setTimeout(function() {
            document.getElementById('paymentForm').submit();
        }, 3000);
        
        // Manual submit button (fallback)
        document.addEventListener('DOMContentLoaded', function() {
            // Add manual submit button after 5 seconds if auto-submit fails
            setTimeout(function() {
                const form = document.getElementById('paymentForm');
                const submitBtn = document.createElement('button');
                submitBtn.type = 'submit';
                submitBtn.className = 'btn btn-primary';
                submitBtn.innerHTML = '<i class="fas fa-external-link-alt me-2"></i>Continue to Payment';
                form.appendChild(submitBtn);
            }, 5000);
        });
    </script>
</body>
</html>