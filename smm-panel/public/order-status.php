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
            <!-- Brand -->
            <a class="navbar-brand d-flex align-items-center" href="index.php">
                <div class="brand-icon me-3">
                    <i class="fas fa-rocket"></i>
                </div>
                <div class="brand-text">
                    <span class="brand-name"><?php echo SITE_NAME; ?></span>
                    <small class="brand-tagline d-block">Professional SMM Services</small>
                </div>
            </a>

            <!-- Mobile Toggle -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Items -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">
                            <i class="fas fa-home me-2"></i>
                            <span data-tr="Ana Sayfa" data-az="Ana Səhifə" data-en="Home">Ana Sayfa</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="order-status.php">
                            <i class="fas fa-search me-2"></i>
                            <span data-tr="Sipariş Durumu" data-az="Sifariş Vəziyyəti" data-en="Order Status">Sipariş Durumu</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">
                            <i class="fas fa-cogs me-2"></i>
                            <span data-tr="Hizmetler" data-az="Xidmətlər" data-en="Services">Hizmetler</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">
                            <i class="fas fa-envelope me-2"></i>
                            <span data-tr="İletişim" data-az="Əlaqə" data-en="Contact">İletişim</span>
                        </a>
                    </li>
                </ul>
                
                <!-- Language Selector -->
                <div class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-globe me-2"></i>
                            <span class="current-lang" data-tr="TR" data-az="AZ" data-en="EN">TR</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a class="dropdown-item" href="#" data-lang="tr">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjIwIiBoZWlnaHQ9IjE1IiBmaWxsPSIjRkYwMDAwIi8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI0ZGRkZGRiIvPgo8Y2lyY2xlIGN4PSI4IiBjeT0iNy41IiByPSIzIiBmaWxsPSIjRkYwMDAwIi8+Cjwvc3ZnPgo=" class="me-2" alt="TR" width="20" height="15">
                                    <span data-tr="Türkçe" data-az="Türk dili" data-en="Turkish">Türkçe</span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#" data-lang="az">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjIwIiBoZWlnaHQ9IjE1IiBmaWxsPSIjMDA5OWMzIi8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiNmZmZmZmYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjMDA5OWMzIi8+CjxjaXJjbGUgY3g9IjEwIiBjeT0iNy41IiByPSIzIiBmaWxsPSIjZmZmZmZmIi8+CjxwYXRoIGQ9Ik0xMCAxMGwzIDJoLTZsMy0yeiIgZmlsbD0iI2ZmZmZmZiIvPgo8L3N2Zz4K" class="me-2" alt="AZ" width="20" height="15">
                                    <span data-tr="Azerbaycan" data-az="Azərbaycan" data-en="Azerbaijani">Azerbaycan</span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#" data-lang="en">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjIwIiBoZWlnaHQ9IjE1IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiNmZmZmZmYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiMwMDI0NzYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjZmZmZmZmIi8+CjxjaXJjbGUgY3g9IjEwIiBjeT0iNy41IiByPSIzIiBmaWxsPSIjMDAyNDc2Ii8+Cjwvc3ZnPgo=" class="me-2" alt="EN" width="20" height="15">
                                    <span data-tr="İngilizce" data-az="İngilis dili" data-en="English">İngilizce</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="main-container fade-in">
            <!-- Header -->
            <div class="text-center mb-4">
                <h1 class="display-5 fw-bold text-primary mb-3">
                    <i class="fas fa-search me-3"></i>
                    <span data-tr="Sipariş Durumu Kontrolü" data-az="Sifariş Vəziyyəti Yoxlaması" data-en="Check Order Status">Sipariş Durumu Kontrolü</span>
                </h1>
                <p class="lead text-muted">
                    <span data-tr="Siparişinizin durumunu takip etmek için sipariş ID'nizi girin" data-az="Sifarişinizin vəziyyətini izləmək üçün sifariş ID-nizi daxil edin" data-en="Enter your order ID to track the status of your order">Siparişinizin durumunu takip etmek için sipariş ID'nizi girin</span>
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
                        <span data-tr="Sipariş Durumu Kontrolörü" data-az="Sifariş Vəziyyəti Yoxlayıcısı" data-en="Order Status Checker">Sipariş Durumu Kontrolörü</span>
                    </h5>
                </div>
                <div class="card-body">
                    <form method="POST" id="statusForm">
                        <div class="row">
                            <div class="col-md-8">
                                <label for="order_id" class="form-label">
                                    <strong><i class="fas fa-hashtag me-2"></i><span data-tr="Sipariş ID" data-az="Sifariş ID" data-en="Order ID">Sipariş ID</span></strong>
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
                                    <i class="fas fa-search me-2"></i><span data-tr="Durumu Kontrol Et" data-az="Vəziyyəti Yoxla" data-en="Check Status">Durumu Kontrol Et</span>
                                </button>
                            </div>
                        </div>
                        <div class="form-text mt-2">
                            <i class="fas fa-info-circle me-1"></i>
                            <span data-tr="Sipariş ID'nizi onay e-postasında veya sipariş başarı sayfasında bulabilirsiniz." data-az="Sifariş ID-nizi təsdiq e-poçtunda və ya sifariş uğur səhifəsində tapa bilərsiniz." data-en="You can find your order ID in the confirmation email or on the order success page.">Sipariş ID'nizi onay e-postasında veya sipariş başarı sayfasında bulabilirsiniz.</span>
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
                        <span data-tr="Sipariş Detayları" data-az="Sifariş Təfərrüatları" data-en="Order Details">Sipariş Detayları</span>
                    </h5>
                </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6 class="text-primary"><span data-tr="Sipariş Bilgileri" data-az="Sifariş Məlumatları" data-en="Order Information">Sipariş Bilgileri</span></h6>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong><span data-tr="Sipariş ID:" data-az="Sifariş ID:" data-en="Order ID:">Sipariş ID:</span></strong></td>
                                        <td><code class="fs-6"><?php echo htmlspecialchars($order['order_id']); ?></code></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Durum:" data-az="Vəziyyət:" data-en="Status:">Durum:</span></strong></td>
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
                                        <td><strong><span data-tr="Oluşturuldu:" data-az="Yaradıldı:" data-en="Created:">Oluşturuldu:</span></strong></td>
                                        <td><?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Son Güncelleme:" data-az="Son Yeniləmə:" data-en="Last Updated:">Son Güncelleme:</span></strong></td>
                                        <td><?php echo date('M j, Y H:i', strtotime($order['updated_at'])); ?></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-primary"><span data-tr="Hizmet Detayları" data-az="Xidmət Təfərrüatları" data-en="Service Details">Hizmet Detayları</span></h6>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong><span data-tr="Hizmet:" data-az="Xidmət:" data-en="Service:">Hizmet:</span></strong></td>
                                        <td><?php echo htmlspecialchars($order['service_name']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Kategori:" data-az="Kateqoriya:" data-en="Category:">Kategori:</span></strong></td>
                                        <td><?php echo htmlspecialchars($order['category_name']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Hedef:" data-az="Hədəf:" data-en="Target:">Hedef:</span></strong></td>
                                        <td><code><?php echo htmlspecialchars($order['link']); ?></code></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Miktar:" data-az="Miqdar:" data-en="Quantity:">Miktar:</span></strong></td>
                                        <td><?php echo number_format($order['quantity']); ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><span data-tr="Toplam Fiyat:" data-az="Ümumi Qiymət:" data-en="Total Price:">Toplam Fiyat:</span></strong></td>
                                        <td class="text-success fw-bold">AZN <?php echo rtrim(rtrim(number_format($order['total_price'], 4), '0'), '.'); ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <!-- Status Timeline -->
                        <div class="mt-4">
                            <h6 class="text-primary"><span data-tr="Sipariş Zaman Çizelgesi" data-az="Sifariş Zaman Cədvəli" data-en="Order Timeline">Sipariş Zaman Çizelgesi</span></h6>
                            <div class="timeline">
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-primary"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1"><span data-tr="Sipariş Verildi" data-az="Sifariş Verildi" data-en="Order Placed">Sipariş Verildi</span></h6>
                                        <p class="text-muted mb-0"><?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?></p>
                                    </div>
                                </div>
                                
                                <?php if ($order['status'] !== 'pending'): ?>
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-info"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1"><span data-tr="İşlem Başladı" data-az="İşlənir" data-en="Processing Started">İşlem Başladı</span></h6>
                                        <p class="text-muted mb-0"><span data-tr="Sipariş ekibimiz tarafından işleniyor" data-az="Sifariş komandamız tərəfindən işlənir" data-en="Order is being processed by our team">Sipariş ekibimiz tarafından işleniyor</span></p>
                                    </div>
                                </div>
                                <?php endif; ?>
                                
                                <?php if ($order['status'] === 'completed'): ?>
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-success"></div>
                                    <div class="timeline-content">
                                        <h6 class="mb-1"><span data-tr="Tamamlandı" data-az="Tamamlandı" data-en="Completed">Tamamlandı</span></h6>
                                        <p class="text-muted mb-0"><span data-tr="Sipariş başarıyla tamamlandı" data-az="Sifariş uğurla tamamlandı" data-en="Order has been completed successfully">Sipariş başarıyla tamamlandı</span></p>
                                    </div>
                                </div>
                                <?php endif; ?>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="d-grid gap-2 d-md-block mt-4">
                            <a href="index.php" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i><span data-tr="Yeni Sipariş Ver" data-az="Yeni Sifariş Ver" data-en="Place New Order">Yeni Sipariş Ver</span>
                            </a>
                            <button onclick="window.print()" class="btn btn-outline-secondary">
                                <i class="fas fa-print me-2"></i><span data-tr="Detayları Yazdır" data-az="Təfərrüatları Çap Et" data-en="Print Details">Detayları Yazdır</span>
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
                        <span data-tr="Yardıma mı ihtiyacınız var?" data-az="Köməyə ehtiyacınız var?" data-en="Need Help?">Yardıma mı ihtiyacınız var?</span>
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h6><span data-tr="Sipariş Durumu Anlamları:" data-az="Sifariş Vəziyyəti Mənaları:" data-en="Order Status Meanings:">Sipariş Durumu Anlamları:</span></h6>
                            <ul class="list-unstyled">
                                <li><span class="badge status-pending me-2"><span data-tr="Beklemede" data-az="Gözləyir" data-en="Pending">Beklemede</span></span> - <span data-tr="Sipariş işlenmeyi bekliyor" data-az="Sifariş işlənməyi gözləyir" data-en="Order is waiting to be processed">Sipariş işlenmeyi bekliyor</span></li>
                                <li><span class="badge status-processing me-2"><span data-tr="İşleniyor" data-az="İşlənir" data-en="Processing">İşleniyor</span></span> - <span data-tr="Sipariş üzerinde çalışılıyor" data-az="Sifariş üzərində işlənir" data-en="Order is being worked on">Sipariş üzerinde çalışılıyor</span></li>
                                <li><span class="badge status-completed me-2"><span data-tr="Tamamlandı" data-az="Tamamlandı" data-en="Completed">Tamamlandı</span></span> - <span data-tr="Sipariş başarıyla tamamlandı" data-az="Sifariş uğurla tamamlandı" data-en="Order finished successfully">Sipariş başarıyla tamamlandı</span></li>
                                <li><span class="badge status-canceled me-2"><span data-tr="İptal Edildi" data-az="Ləğv Edildi" data-en="Canceled">İptal Edildi</span></span> - <span data-tr="Sipariş iptal edildi" data-az="Sifariş ləğv edildi" data-en="Order was canceled">Sipariş iptal edildi</span></li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h6><span data-tr="Destek İletişimi:" data-az="Dəstək Əlaqəsi:" data-en="Contact Support:">Destek İletişimi:</span></h6>
                            <p class="mb-2">
                                <i class="fas fa-envelope me-2"></i>
                                <span data-tr="E-posta:" data-az="E-poçt:" data-en="Email:">E-posta:</span> support@smmpanel.com
                            </p>
                            <p class="mb-0">
                                <i class="fas fa-clock me-2"></i>
                                <span data-tr="Yanıt süresi: 24 saat içinde" data-az="Cavab müddəti: 24 saat ərzində" data-en="Response time: Within 24 hours">Yanıt süresi: 24 saat içinde</span>
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
        // Language Management
        class LanguageManager {
            constructor() {
                this.currentLang = localStorage.getItem('selectedLanguage') || 'tr';
                this.init();
            }
            
            init() {
                this.updateLanguage(this.currentLang);
                this.bindEvents();
            }
            
            bindEvents() {
                // Language selector clicks
                document.querySelectorAll('[data-lang]').forEach(item => {
                    item.addEventListener('click', (e) => {
                        e.preventDefault();
                        const lang = e.currentTarget.getAttribute('data-lang');
                        this.changeLanguage(lang);
                    });
                });
            }
            
            changeLanguage(lang) {
                this.currentLang = lang;
                localStorage.setItem('selectedLanguage', lang);
                this.updateLanguage(lang);
            }
            
            updateLanguage(lang) {
                // Update all elements with data attributes
                document.querySelectorAll('[data-tr], [data-az], [data-en]').forEach(element => {
                    const text = element.getAttribute(`data-${lang}`);
                    if (text) {
                        element.textContent = text;
                    }
                });
                
                // Update current language indicator
                const currentLangElement = document.querySelector('.current-lang');
                if (currentLangElement) {
                    const langText = currentLangElement.getAttribute(`data-${lang}`);
                    if (langText) {
                        currentLangElement.textContent = langText;
                    }
                }
                
                // Update validation messages
                this.updateValidationMessages(lang);
            }
            
            updateValidationMessages(lang) {
                const messages = {
                    tr: {
                        required: 'Lütfen bir sipariş ID girin.',
                        checking: 'Kontrol Ediliyor...'
                    },
                    az: {
                        required: 'Zəhmət olmasa bir sifariş ID daxil edin.',
                        checking: 'Yoxlanılır...'
                    },
                    en: {
                        required: 'Please enter an order ID.',
                        checking: 'Checking...'
                    }
                };
                
                // Store messages for later use
                window.languageMessages = messages[lang];
            }
        }
        
        // Initialize language manager
        const languageManager = new LanguageManager();
        
        // Form validation
        document.getElementById('statusForm').addEventListener('submit', function(e) {
            const orderId = document.getElementById('order_id').value.trim();
            
            if (!orderId) {
                e.preventDefault();
                const message = window.languageMessages?.required || 'Lütfen bir sipariş ID girin.';
                alert(message);
                return false;
            }
            
            // Show loading state
            const checkingText = window.languageMessages?.checking || 'Kontrol Ediliyor...';
            const submitBtn = this.querySelector('button[type="submit"]');
            submitBtn.innerHTML = `<i class="fas fa-spinner fa-spin me-2"></i>${checkingText}`;
            submitBtn.disabled = true;
        });
        
        // Auto-focus order ID field
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('order_id').focus();
        });
    </script>
</body>
</html>