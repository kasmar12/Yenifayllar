<?php
/**
 * Order Status Page
 * Users can check their order status using order ID
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

$order = null;
$message = '';
$messageType = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $orderId = sanitizeInput($_POST['order_id'] ?? '');
    
    if (empty($orderId)) {
        $message = 'Lütfen bir sipariş ID girin.';
        $messageType = 'warning';
    } else {
        try {
            $pdo = getDBConnection();
            
            // Get order from database
            $stmt = $pdo->prepare("
                SELECT o.*, s.name as service_name, c.name as category_name 
                FROM orders o 
                JOIN services s ON o.service_id = s.id 
                JOIN categories c ON s.category_id = c.id 
                WHERE o.order_id = ?
            ");
            $stmt->execute([$orderId]);
            $order = $stmt->fetch();
            
            if ($order) {
                // Update status from SMM API if order is pending/processing
                if (in_array($order['status'], ['pending', 'processing']) && !empty($order['smm_order_id'])) {
                    $statusResult = getSMMOrderStatus($order['smm_order_id']);
                    
                    if ($statusResult['success']) {
                        $newStatus = $statusResult['status'];
                        
                        // Update database if status changed
                        if ($newStatus !== $order['status']) {
                            $updateStmt = $pdo->prepare("UPDATE orders SET status = ? WHERE id = ?");
                            $updateStmt->execute([$newStatus, $order['id']]);
                            $order['status'] = $newStatus;
                        }
                    }
                }
                
                $message = 'Sipariş başarıyla bulundu!';
                $messageType = 'success';
            } else {
                $message = 'Sipariş bulunamadı. Lütfen sipariş ID\'nizi kontrol edin.';
                $messageType = 'danger';
            }
            
        } catch (Exception $e) {
            $message = 'Sipariş kontrol edilirken hata: ' . $e->getMessage();
            $messageType = 'danger';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Sipariş Durumu Kontrolü</title>
    
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
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.php">
                    <i class="fas fa-home me-1"></i>Ana Sayfa
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="main-container fade-in">
            <!-- Header -->
            <div class="text-center mb-4">
                <h1 class="display-5 fw-bold text-primary mb-3">
                    <i class="fas fa-search me-3"></i>
                    Sipariş Durumu Kontrolü
                </h1>
                <p class="lead text-muted">
                    Siparişinizin durumunu takip etmek için sipariş ID'nizi girin
                </p>
            </div>

            <!-- Alert Messages -->
            <?php if ($message): ?>
                <div class="alert alert-<?php echo $messageType; ?> alert-dismissible fade show" role="alert">
                    <i class="fas fa-info-circle me-2"></i>
                    <?php echo htmlspecialchars($message); ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <?php endif; ?>

            <!-- Order Status Form -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-search me-2"></i>
                        Sipariş Durumu Kontrolörü
                    </h5>
                </div>
                <div class="card-body">
                    <form method="POST" id="statusForm">
                        <div class="row">
                            <div class="col-md-8">
                                <label for="order_id" class="form-label">
                                    <strong><i class="fas fa-hashtag me-2"></i>Sipariş ID</strong>
                                </label>
                                <input type="text" 
                                       class="form-control form-control-lg" 
                                       id="order_id" 
                                       name="order_id" 
                                       placeholder="Sipariş ID'nizi girin (örn: ORD20241201ABC12345)"
                                       value="<?php echo htmlspecialchars($_POST['order_id'] ?? ''); ?>"
                                       required>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary btn-lg w-100">
                                    <i class="fas fa-search me-2"></i>Durumu Kontrol Et
                                </button>
                            </div>
                        </div>
                        <div class="form-text mt-2">
                            <i class="fas fa-info-circle me-1"></i>
                            Sipariş ID'nizi onay e-postasında veya sipariş başarı sayfasında bulabilirsiniz.
                        </div>
                    </form>
                </div>
            </div>

            <!-- Order Details -->
            <?php if ($order): ?>
                <div class="card mt-4">
                                    <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-receipt me-2"></i>
                        Sipariş Detayları
                    </h5>
                </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6 class="text-primary">Sipariş Bilgileri</h6>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong>Sipariş ID:</strong></td>
                                        <td><code class="fs-6"><?php echo htmlspecialchars($order['order_id']); ?></code></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Durum:</strong></td>
                                        <td>
                                            <?php 
                                            $statusClass = match($order['status']) {
                                                'completed' => 'status-completed',
                                                'processing' => 'status-processing',
                                                'canceled' => 'status-canceled',
                                                default => 'status-pending'
                                            };
                                            ?>
                                            <span class="badge <?php echo $statusClass; ?>">
                                                <?php 
                                                $statusText = match($order['status']) {
                                                    'completed' => 'Tamamlandı',
                                                    'processing' => 'İşleniyor',
                                                    'canceled' => 'İptal Edildi',
                                                    'pending' => 'Beklemede',
                                                    default => ucfirst($order['status'])
                                                };
                                                echo $statusText;
                                                ?>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Oluşturuldu:</strong></td>
                                        <td><?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Son Güncelleme:</strong></td>
                                        <td><?php echo date('M j, Y H:i', strtotime($order['updated_at'])); ?></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-primary">Hizmet Detayları</h6>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong>Hizmet:</strong></td>
                                        <td><?php echo htmlspecialchars($order['service_name']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Kategori:</strong></td>
                                        <td><?php echo htmlspecialchars($order['category_name']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Hedef:</strong></td>
                                        <td><code><?php echo htmlspecialchars($order['link']); ?></code></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Miktar:</strong></td>
                                        <td><?php echo number_format($order['quantity']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Toplam Fiyat:</strong></td>
                                        <td class="text-success fw-bold">AZN <?php echo rtrim(rtrim(number_format($order['total_price'], 4), '0'), '.'); ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <!-- Status Timeline -->
                        <div class="mt-4">
                            <h6 class="text-primary">Sipariş Zaman Çizelgesi</h6>
                            <div class="timeline">
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-primary"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1">Sipariş Verildi</h6>
                                        <p class="text-muted mb-0"><?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?></p>
                                    </div>
                                </div>
                                
                                <?php if ($order['status'] !== 'pending'): ?>
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-info"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1">İşlem Başladı</h6>
                                        <p class="text-muted mb-0">Sipariş ekibimiz tarafından işleniyor</p>
                                    </div>
                                </div>
                                <?php endif; ?>
                                
                                <?php if ($order['status'] === 'completed'): ?>
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-success"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1">Tamamlandı</h6>
                                        <p class="text-muted mb-0">Sipariş başarıyla tamamlandı</p>
                                    </div>
                                </div>
                                <?php endif; ?>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="d-grid gap-2 d-md-block mt-4">
                            <a href="index.php" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>Yeni Sipariş Ver
                            </a>
                            <button onclick="window.print()" class="btn btn-outline-secondary">
                                <i class="fas fa-print me-2"></i>Detayları Yazdır
                            </button>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Help Section -->
            <div class="card mt-4">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-question-circle me-2"></i>
                        Yardıma mı ihtiyacınız var?
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Sipariş Durumu Anlamları:</h6>
                            <ul class="list-unstyled">
                                <li><span class="badge status-pending me-2">Beklemede</span> - Sipariş işlenmeyi bekliyor</li>
                                <li><span class="badge status-processing me-2">İşleniyor</span> - Sipariş üzerinde çalışılıyor</li>
                                <li><span class="badge status-completed me-2">Tamamlandı</span> - Sipariş başarıyla tamamlandı</li>
                                <li><span class="badge status-canceled me-2">İptal Edildi</span> - Sipariş iptal edildi</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h6>Destek İletişimi:</h6>
                            <p class="mb-2">
                                <i class="fas fa-envelope me-2"></i>
                                E-posta: support@smmpanel.com
                            </p>
                            <p class="mb-0">
                                <i class="fas fa-clock me-2"></i>
                                Yanıt süresi: 24 saat içinde
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        /* Timeline Styles */
        .timeline {
            position: relative;
            padding-left: 30px;
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 20px;
        }
        
        .timeline-marker {
            position: absolute;
            left: -35px;
            top: 5px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: 3px solid white;
            box-shadow: 0 0 0 3px #dee2e6;
        }
        
        .timeline-item:not(:last-child)::after {
            content: '';
            position: absolute;
            left: -29px;
            top: 17px;
            width: 2px;
            height: 30px;
            background: #dee2e6;
        }
        
        .timeline-content {
            padding-left: 15px;
        }
    </style>
    
    <script>
        // Form validation
        document.getElementById('statusForm').addEventListener('submit', function(e) {
            const orderId = document.getElementById('order_id').value.trim();
            
            if (!orderId) {
                e.preventDefault();
                alert('Lütfen bir sipariş ID girin.');
                return false;
            }
            
            // Show loading state
            const submitBtn = this.querySelector('button[type="submit"]');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Kontrol Ediliyor...';
            submitBtn.disabled = true;
        });
        
        // Auto-focus order ID field
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('order_id').focus();
        });
    </script>
</body>
</html>