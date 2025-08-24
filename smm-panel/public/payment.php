<?php
session_start();
require_once '../config/database.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$message = '';
$error = '';
$order_data = null;

// Check if order data is provided
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $service_id = $_POST['service_id'] ?? '';
    $link = $_POST['link'] ?? '';
    $amount = $_POST['amount'] ?? '';
    
    if (empty($service_id) || empty($link) || empty($amount)) {
        $error = 'Bütün məlumatları doldurun!';
    } else {
        try {
            $database = new Database();
            $db = $database->getConnection();
            
            if (!$db) {
                throw new Exception("Database connection failed");
            }
            
            // Get service details
            $query = "SELECT * FROM services WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->stmt->execute([$service_id]);
            $service = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$service) {
                throw new Exception("Xidmət tapılmadı!");
            }

            if ($amount < $service['min_amount'] || $amount > $service['max_amount']) {
                throw new Exception("Miqdar yanlışdır!");
            }
            
            // Calculate price (now free)
            $price = 0.00; // Free orders
            
            // Create order in database
            $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
            $stmt = $db->prepare($query);
            $result = $stmt->execute([$service_id, $link, $amount, $price]);
            
            if (!$result) {
                throw new Exception("Sifariş yaradıla bilmədi!");
            }
            
            $order_id = $db->lastInsertId();
            
            if (!$order_id) {
                throw new Exception("Sifariş ID alına bilmədi!");
            }
            
            // Store order data in session for processing
            $_SESSION['current_order'] = [
                'id' => $order_id,
                'service_name' => $service['name'],
                'link' => $link,
                'amount' => $amount,
                'price' => $price
            ];
            
            $message = 'Sifariş uğurla yaradıldı! İndi link qısaltma servisi ilə işləyə bilərsiniz.';
            
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
    }
}

// Get current order from session
if (isset($_SESSION['current_order'])) {
    $order_data = $_SESSION['current_order'];
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Pulsuz Sifariş</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .order-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .order-summary {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            margin-bottom: 30px;
        }
        .link-shortening {
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
        .free-badge {
            background: #28a745;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
        }
        .process-steps {
            background: white;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            margin: 20px 0;
        }
        .step-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .step-number {
            width: 40px;
            height: 40px;
            background: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 15px;
        }
        .step-content {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="order-container">
        <!-- Header -->
        <div class="text-center mb-4">
            <h1><i class="fas fa-gift text-success"></i> SMM Panel - Pulsuz Sifariş</h1>
            <p class="lead">Sifarişinizi təsdiqləyin və link qısaltma servisi ilə işləyin</p>
            <span class="free-badge">
                <i class="fas fa-check-circle"></i> TAMAMILƏ PULSUZ
            </span>
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

        <!-- Order Summary -->
        <?php if ($order_data): ?>
        <div class="order-summary">
            <h4><i class="fas fa-shopping-cart"></i> Sifariş Məlumatları</h4>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_data['service_name']); ?></p>
                    <p><strong>Link:</strong> <?php echo htmlspecialchars($order_data['link']); ?></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Miqdar:</strong> <?php echo number_format($order_data['amount']); ?> ədəd</p>
                    <p><strong>Qiymət:</strong> <span class="text-success fw-bold">PULSUZ! 🎉</span></p>
                </div>
            </div>
            <div class="text-center mt-3">
                <small class="text-muted">
                    <i class="fas fa-info-circle"></i> 
                    Sifariş ID: #<?php echo $order_data['id']; ?>
                </small>
            </div>
        </div>

        <!-- Link Shortening Service -->
        <div class="link-shortening">
            <h3><i class="fas fa-link"></i> Link Qısaltma Servisi</h3>
            <p class="mb-3">Sifarişinizi aktivləşdirmək üçün link qısaltma servisindən keçin</p>
            
            <div class="shortened-link">
                <h5>Qısaldılmış Link:</h5>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="shortenedLink" 
                           value="https://ay.live/api/?api=9556ddb32a7c865f06acf4f8950f64c5045ef2ab&url=<?php echo urlencode($order_data['link']); ?>&alias=order_<?php echo $order_data['id']; ?>" 
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
                <a href="https://ay.live/api/?api=9556ddb32a7c865f06acf4f8950f64c5045ef2ab&url=<?php echo urlencode($order_data['link']); ?>&alias=order_<?php echo $order_data['id']; ?>" 
                   class="btn btn-light btn-lg" target="_blank">
                    <i class="fas fa-external-link-alt"></i> Link Qısaltma Servisinə Get
                </a>
            </div>
        </div>

        <!-- Process Steps -->
        <div class="process-steps">
            <h5><i class="fas fa-list-ol"></i> Sifariş Prosesi</h5>
            
            <div class="step-item">
                <div class="step-number">1</div>
                <div class="step-content">
                    <strong>Sifariş Yaradıldı</strong>
                    <p class="mb-0 text-muted">Sifarişiniz sistemə qəbul edildi</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">2</div>
                <div class="step-content">
                    <strong>Link Qısaltma</strong>
                    <p class="mb-0 text-muted">Yuxarıdakı linki açın və reklamı keçin</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">3</div>
                <div class="step-content">
                    <strong>Sifariş Aktivləşir</strong>
                    <p class="mb-0 text-muted">Reklam keçildikdən sonra sifariş avtomatik başlayır</p>
                </div>
            </div>
            
            <div class="step-item">
                <div class="step-number">4</div>
                <div class="step-content">
                    <strong>Tamamlanır</strong>
                    <p class="mb-0 text-muted">Xidmət tamamlandıqda bildiriş alacaqsınız</p>
                </div>
            </div>
        </div>

        <!-- Order Processing -->
        <div class="text-center mt-4">
            <a href="process_free_order.php?order_id=<?php echo $order_data['id']; ?>" 
               class="btn btn-success btn-lg me-3">
                <i class="fas fa-play"></i> Sifarişi Aktivləşdir
            </a>
            <a href="order_status.php?order_id=<?php echo $order_data['id']; ?>" 
               class="btn btn-primary btn-lg">
                <i class="fas fa-search"></i> Statusu Yoxla
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