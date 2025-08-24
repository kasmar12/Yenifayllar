<?php
session_start();
require_once '../config/database.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$order_id = $_GET['order_id'] ?? '';
$message = '';
$error = '';

if (empty($order_id)) {
    $error = 'Sifariş ID təyin edilməyib!';
} else {
    try {
        $database = new Database();
        $db = $database->getConnection();
        
        if (!$db) {
            throw new Exception("Database connection failed");
        }
        
        // Get order details
        $query = "SELECT o.*, s.name as service_name FROM orders o 
                  JOIN services s ON o.service_id = s.id 
                  WHERE o.id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$order_id]);
        $order = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$order) {
            throw new Exception("Sifariş tapılmadı!");
        }

        if ($order['status'] !== 'pending') {
            throw new Exception("Sifariş artıq aktivləşdirilib!");
        }

        // Update order status to processing
        $query = "UPDATE orders SET status = 'processing' WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$order_id]);

        // Log order activation
        $log_activation = date('Y-m-d H:i:s') . " - Order #$order_id activated and set to processing\n";
        file_put_contents('../logs/orders_log.txt', $log_activation, FILE_APPEND | LOCK_EX);

        $message = 'Sifariş uğurla aktivləşdirildi! İndi link qısaltma servisi ilə işləyə bilərsiniz.';

        // Store updated order data in session
        $_SESSION['current_order'] = [
            'id' => $order['id'],
            'service_name' => $order['service_name'],
            'link' => $order['link'],
            'amount' => $order['amount'],
            'price' => $order['price'],
            'status' => 'processing'
        ];

    } catch (Exception $e) {
        $error = $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sifariş Aktivləşdirildi - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .activation-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
        }
        .success-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .success-icon {
            font-size: 5rem;
            color: #28a745;
            margin-bottom: 20px;
        }
        .link-shortening-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin: 30px 0;
            text-align: center;
        }
        .shortened-link {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border: 2px dashed rgba(255,255,255,0.3);
        }
        .instructions {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            margin: 20px 0;
        }
        .step-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background: white;
            border-radius: 8px;
            border: 1px solid #e9ecef;
        }
        .step-number {
            width: 35px;
            height: 35px;
            background: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 15px;
            font-size: 0.9rem;
        }
        .step-content {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="activation-container">
        <!-- Success Header -->
        <div class="success-header">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="text-success">Sifariş Aktivləşdirildi! 🎉</h1>
            <p class="lead">İndi link qısaltma servisi ilə işləyə bilərsiniz</p>
        </div>

        <!-- Messages -->
        <?php if ($message): ?>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <?php echo $message; ?>
            </div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <!-- Link Shortening Service -->
        <?php if (isset($_SESSION['current_order'])): ?>
        <div class="link-shortening-card">
            <h3><i class="fas fa-link"></i> Link Qısaltma Servisi</h3>
            <p class="mb-3">Sifarişinizi tamamlamaq üçün aşağıdakı addımları izləyin</p>
            
            <div class="shortened-link">
                <h5>Qısaldılmış Link:</h5>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="shortenedLink" 
                           value="https://ay.live/api/?api=9556ddb32a7c865f06acf4f8950f64c5045ef2ab&url=<?php echo urlencode($_SESSION['current_order']['link']); ?>&alias=order_<?php echo $_SESSION['current_order']['id']; ?>" 
                           readonly>
                    <button class="btn btn-light" type="button" onclick="copyLink()">
                        <i class="fas fa-copy"></i> Kopyala
                    </button>
                </div>
                <small class="text-light">
                    <i class="fas fa-info-circle"></i> 
                    Bu linki kopyalayın və brauzerinizdə açın
                </small>
            </div>
            
            <div class="mt-4">
                <a href="https://ay.live/api/?api=9556ddb32a7c865f06acf4f8950f64c5045ef2ab&url=<?php echo urlencode($_SESSION['current_order']['link']); ?>&alias=order_<?php echo $_SESSION['current_order']['id']; ?>" 
                   class="btn btn-light btn-lg" target="_blank">
                    <i class="fas fa-external-link-alt"></i> Link Qısaltma Servisinə Get
                </a>
            </div>
        </div>

        <!-- Instructions -->
        <div class="instructions">
            <h5><i class="fas fa-list-ol"></i> Sifariş Tamamlama Addımları</h5>
            
            <div class="step-item">
                <div class="step-number">1</div>
                <div class="step-content">
                    <strong>Linki Açın</strong>
                    <p class="mb-0 text-muted">Yuxarıdakı "Link Qısaltma Servisinə Get" düyməsinə basın</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">2</div>
                <div class="step-content">
                    <strong>Reklamı Keçin</strong>
                    <p class="mb-0 text-muted">Link qısaltma səhifəsində reklamı tamamlayın</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">3</div>
                <div class="step-content">
                    <strong>Hədəf Səhifəyə Çatın</strong>
                    <p class="mb-0 text-muted">Reklam keçildikdən sonra hədəf səhifəyə yönləndiriləcəksiniz</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">4</div>
                <div class="step-content">
                    <strong>Sifariş Tamamlanır</strong>
                    <p class="mb-0 text-muted">Sifariş avtomatik olaraq tamamlanacaq</p>
                </div>
            </div>
        </div>

        <!-- Order Details -->
        <div class="card">
            <div class="card-header">
                <h5><i class="fas fa-shopping-cart"></i> Sifariş Məlumatları</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($_SESSION['current_order']['service_name']); ?></p>
                        <p><strong>Link:</strong> <?php echo htmlspecialchars($_SESSION['current_order']['link']); ?></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Miqdar:</strong> <?php echo number_format($_SESSION['current_order']['amount']); ?> ədəd</p>
                        <p><strong>Status:</strong> <span class="badge bg-primary">İşlənir</span></p>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <small class="text-muted">
                        <i class="fas fa-info-circle"></i> 
                        Sifariş ID: #<?php echo $_SESSION['current_order']['id']; ?>
                    </small>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="text-center mt-4">
            <a href="order_status.php?order_id=<?php echo $_SESSION['current_order']['id']; ?>" 
               class="btn btn-primary btn-lg me-3">
                <i class="fas fa-search"></i> Statusu Yoxla
            </a>
            <a href="index.php" class="btn btn-success btn-lg">
                <i class="fas fa-plus"></i> Yeni Sifariş
            </a>
        </div>

        <?php else: ?>
        <!-- No Order Data -->
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> 
            Sifariş məlumatları tapılmadı. Zəhmət olmasa <a href="index.php">ana səhifəyə qayıdın</a> və sifariş edin.
        </div>
        <?php endif; ?>

        <!-- Back Button -->
        <div class="text-center mt-4">
            <a href="index.php" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left"></i> Ana Səhifəyə Qayıt
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function copyLink() {
            const linkInput = document.getElementById('shortenedLink');
            linkInput.select();
            linkInput.setSelectionRange(0, 99999);
            document.execCommand('copy');
            
            // Show success message
            const button = event.target.closest('button');
            const originalText = button.innerHTML;
            button.innerHTML = '<i class="fas fa-check"></i> Kopyalandı!';
            button.classList.add('btn-success');
            button.classList.remove('btn-light');
            
            setTimeout(() => {
                button.innerHTML = originalText;
                button.classList.remove('btn-success');
                button.classList.add('btn-light');
            }, 2000);
        }
    </script>
</body>
</html>