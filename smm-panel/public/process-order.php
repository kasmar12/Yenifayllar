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
            INSERT INTO orders (order_id, service_id, link, quantity, price, total_price, status, smm_order_id, api_response, user_ip, user_agent) 
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
        
        $message = 'Sipariş başarıyla verildi!';
        $messageType = 'success';
        
        // Log activity
        logActivity('Sipariş Verildi', "Sipariş ID: {$orderId}, Hizmet: {$pendingOrder['service_name']}, Miktar: {$pendingOrder['quantity']}");
        
    } else {
        $message = 'Sipariş verilemedi: ' . $orderResult['error'];
        $messageType = 'danger';
    }
    
} catch (Exception $e) {
    $message = 'Sipariş işlenirken hata: ' . $e->getMessage();
    $messageType = 'danger';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Sipariş İşleniyor</title>
    
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
                <i class="fas fa-shopping-cart me-2"></i>
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
                    <h4 class="alert-heading">Sipariş Başarıyla Verildi!</h4>
                    <p class="mb-0">Siparişiniz gönderildi ve şimdi işleniyor.</p>
                </div>
                    
                    <!-- Order Details -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-receipt me-2"></i>Sipariş Detayları
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Sipariş ID:</strong></p>
                                    <h4 class="text-primary"><?php echo htmlspecialchars($orderId); ?></h4>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Durum:</strong></p>
                                    <span class="badge bg-warning fs-6">Beklemede</span>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Hizmet:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['service_name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Hedef:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['link']); ?></p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Miktar:</strong></p>
                                    <p class="text-muted"><?php echo number_format($pendingOrder['quantity']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Toplam Fiyat:</strong></p>
                                    <p class="text-success fw-bold">AZN <?php echo rtrim(rtrim(number_format($pendingOrder['total_price'], 4), '0'), '.'); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Sonraki Adımlar:</strong> Siparişiniz 24-48 saat içinde işlenecek. 
                        Yukarıdaki Sipariş ID'sini kullanarak sipariş durumunuzu takip edebilirsiniz.
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="order-status.php" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i>Sipariş Durumunu Kontrol Et
                        </a>
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="fas fa-plus me-2"></i>Başka Sipariş Ver
                        </a>
                    </div>
                </div>
                
            <?php else: ?>
                <!-- Error State -->
                <div class="text-center">
                                    <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                    <h4 class="alert-heading">Sipariş Başarısız</h4>
                    <p><?php echo htmlspecialchars($message); ?></p>
                </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-exclamation-triangle me-2"></i>Denenen Sipariş Detayları
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Hizmet:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['service_name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Hedef:</strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['link']); ?></p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Miktar:</strong></p>
                                    <p class="text-muted"><?php echo number_format($pendingOrder['quantity']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Toplam Fiyat:</strong></p>
                                    <p class="text-muted">AZN <?php echo rtrim(rtrim(number_format($pendingOrder['total_price'], 4), '0'), '.'); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="index.php" class="btn btn-primary">
                            <i class="fas fa-arrow-left me-2"></i>Sipariş Formuna Dön
                        </a>
                        <button onclick="location.reload()" class="btn btn-outline-secondary">
                            <i class="fas fa-redo me-2"></i>Tekrar Dene
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
                alert('Sipariş ID panoya kopyalandı!');
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