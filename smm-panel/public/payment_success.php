<?php
session_start();
require_once '../config/database.php';
require_once '../config/smm_api.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$order_data = null;
$message = '';
$error = '';

// Get order data from session or URL parameters
if (isset($_SESSION['current_order'])) {
    $order_data = $_SESSION['current_order'];
    // Clear session data
    unset($_SESSION['current_order']);
} else {
    // Try to get from URL parameters
    $order_id = $_GET['order_id'] ?? '';
    $transaction_id = $_GET['transaction_id'] ?? '';
    
    if ($order_id) {
        try {
            $database = new Database();
            $db = $database->getConnection();
            
            if ($db) {
                $query = "SELECT o.*, s.name as service_name FROM orders o 
                          JOIN services s ON o.service_id = s.id 
                          WHERE o.id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$order_id]);
                $order_data = $stmt->fetch(PDO::FETCH_ASSOC);
            }
        } catch (Exception $e) {
            $error = 'Sifariş məlumatları alına bilmədi: ' . $e->getMessage();
        }
    }
}

// If we have order data, process it
if ($order_data && $order_data['status'] === 'pending') {
    try {
        $database = new Database();
        $db = $database->getConnection();
        
        if ($db) {
            // Update order status to paid
            $query = "UPDATE orders SET status = 'paid' WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$order_data['id']]);
            
            // Update payment status
            if (isset($transaction_id)) {
                $query = "UPDATE payments SET status = 'success' WHERE transaction_id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$transaction_id]);
            }
            
            // Send order to SMM API
            try {
                $smm_api = new SMMAPI();
                $api_response = $smm_api->createOrder(
                    '1', // Default service ID
                    $order_data['link'],
                    $order_data['amount']
                );

                if ($api_response && isset($api_response['order'])) {
                    // Update order with API order ID
                    $query = "UPDATE orders SET status = 'processing', api_order_id = ? WHERE id = ?";
                    $stmt = $db->prepare($query);
                    $stmt->execute([$api_response['order'], $order_data['id']]);
                    
                    $message = 'Sifariş uğurla SMM API-yə göndərildi!';
                    
                    // Log success
                    $log_success = date('Y-m-d H:i:s') . " - Order #{$order_data['id']} sent to SMM API successfully. API Order ID: " . $api_response['order'] . "\n";
                    file_put_contents('../logs/orders_log.txt', $log_success, FILE_APPEND | LOCK_EX);
                    
                } else {
                    $error = 'Sifariş SMM API-yə göndərilə bilmədi!';
                    
                    // Log failure
                    $log_fail = date('Y-m-d H:i:s') . " - Order #{$order_data['id']} failed to send to SMM API\n";
                    file_put_contents('../logs/orders_log.txt', $log_fail, FILE_APPEND | LOCK_EX);
                }
            } catch (Exception $e) {
                $error = 'SMM API xətası: ' . $e->getMessage();
                
                // Log error
                $log_error = date('Y-m-d H:i:s') . " - Error sending order #{$order_data['id']} to SMM API: " . $e->getMessage() . "\n";
                file_put_contents('../logs/orders_log.txt', $log_error, FILE_APPEND | LOCK_EX);
            }
        }
    } catch (Exception $e) {
        $error = 'Sifariş yenilənə bilmədi: ' . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ödəniş Uğurlu - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .success-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
        }
        .success-icon {
            font-size: 5rem;
            color: #28a745;
            margin-bottom: 20px;
        }
        .order-details {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            margin: 30px 0;
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 8px 16px;
        }
        .next-steps {
            background: #e7f3ff;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #007bff;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <!-- Success Header -->
        <div class="text-center mb-4">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="text-success">Ödəniş Uğurlu!</h1>
            <p class="lead">Sifarişiniz uğurla yaradıldı və ödənildi</p>
        </div>

        <!-- Messages -->
        <?php if ($message): ?>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <?php echo $message; ?>
            </div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-warning">
                <i class="fas fa-exclamation-triangle"></i> <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <!-- Order Details -->
        <?php if ($order_data): ?>
        <div class="order-details">
            <h4><i class="fas fa-shopping-cart"></i> Sifariş Məlumatları</h4>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_data['service_name']); ?></p>
                    <p><strong>Link:</strong> <?php echo htmlspecialchars($order_data['link']); ?></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Miqdar:</strong> <?php echo number_format($order_data['amount']); ?> ədəd</p>
                    <p><strong>Qiymət:</strong> <span class="text-primary fw-bold"><?php echo number_format($order_data['price'], 2); ?> ₼</span></p>
                </div>
            </div>
            <div class="text-center mt-3">
                <small class="text-muted">
                    <i class="fas fa-info-circle"></i> 
                    Sifariş ID: #<?php echo $order_data['id']; ?>
                </small>
                <br>
                <span class="badge bg-success status-badge">
                    <i class="fas fa-check"></i> Ödənildi
                </span>
            </div>
        </div>

        <!-- Next Steps -->
        <div class="next-steps">
            <h6><i class="fas fa-info-circle"></i> Növbəti Addımlar</h6>
            <ol class="mb-0">
                <li>Sifarişiniz SMM API-yə göndərildi</li>
                <li>Xidmət təminatçısı sifarişi emal edəcək</li>
                <li>Proses başladıqda sifariş statusu yenilənəcək</li>
                <li>Tamamlandıqda bildiriş alacaqsınız</li>
            </ol>
        </div>

        <!-- Order Tracking -->
        <div class="text-center mt-4">
            <a href="order_status.php?order_id=<?php echo $order_data['id']; ?>" class="btn btn-primary">
                <i class="fas fa-search"></i> Sifariş Statusunu Yoxla
            </a>
        </div>

        <?php else: ?>
        <!-- No Order Data -->
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> 
            Sifariş məlumatları tapılmadı. Zəhmət olmasa administrator ilə əlaqə saxlayın.
        </div>
        <?php endif; ?>

        <!-- Action Buttons -->
        <div class="text-center mt-4">
            <a href="index.php" class="btn btn-success me-2">
                <i class="fas fa-plus"></i> Yeni Sifariş
            </a>
            <a href="orders.php" class="btn btn-outline-primary">
                <i class="fas fa-list"></i> Sifarişlərim
            </a>
        </div>

        <!-- Support Info -->
        <div class="text-center mt-4">
            <small class="text-muted">
                <i class="fas fa-headset"></i> 
                Hər hansı sualınız varsa, dəstək komandası ilə əlaqə saxlayın
            </small>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>