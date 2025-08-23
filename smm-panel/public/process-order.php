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
    <title><?php echo SITE_NAME; ?> - <span data-tr="Sipariş İşleniyor" data-az="Sifariş İşlənir" data-en="Order Processing">Sipariş İşleniyor</span></title>
    
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
                    <i class="fas fa-shopping-cart"></i>
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
                        <a class="nav-link" href="order-status.php">
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
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjIwIiBoZWlnaHQ9IjE1IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0yMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiNmZmZmZmYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjZmZmZmZmIi8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iIzAwMjQ3NiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiNmZmZmZmYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8Y2lyY2xlIGN4PSIxMCIgY3k9IjcuNSIgcj0iMyIgZmlsbD0iIzAwMjQ3NiIvPgo8L3N2Zz4K" class="me-2" alt="EN" width="20" height="15">
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
            <?php if ($messageType === 'success'): ?>
                <!-- Success State -->
                <div class="text-center">
                                    <div class="alert alert-success" role="alert">
                    <i class="fas fa-check-circle fa-3x mb-3"></i>
                    <h4 class="alert-heading"><span data-tr="Sipariş Başarıyla Verildi!" data-az="Sifariş Uğurla Verildi!" data-en="Order Placed Successfully!">Sipariş Başarıyla Verildi!</span></h4>
                    <p class="mb-0"><span data-tr="Siparişiniz gönderildi ve şimdi işleniyor." data-az="Sifarişiniz göndərildi və indi işlənir." data-en="Your order has been submitted and is now being processed.">Siparişiniz gönderildi ve şimdi işleniyor.</span></p>
                </div>
                    
                    <!-- Order Details -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-receipt me-2"></i><span data-tr="Sipariş Detayları" data-az="Sifariş Təfərrüatları" data-en="Order Details">Sipariş Detayları</span>
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Sipariş ID:" data-az="Sifariş ID:" data-en="Order ID:">Sipariş ID:</span></strong></p>
                                    <h4 class="text-primary"><?php echo htmlspecialchars($orderId); ?></h4>
                                </div>
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Durum:" data-az="Vəziyyət:" data-en="Status:">Durum:</span></strong></p>
                                    <span class="badge bg-warning fs-6"><span data-tr="Beklemede" data-az="Gözləyir" data-en="Pending">Beklemede</span></span>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Hizmet:" data-az="Xidmət:" data-en="Service:">Hizmet:</span></strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['service_name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Hedef:" data-az="Hədəf:" data-en="Target:">Hedef:</span></strong></p>
                                    <p class="text-muted"><?php echo htmlspecialchars($pendingOrder['link']); ?></p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Miktar:" data-az="Miqdar:" data-en="Quantity:">Miktar:</span></strong></p>
                                    <p class="text-muted"><?php echo number_format($pendingOrder['quantity']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong><span data-tr="Toplam Fiyat:" data-az="Ümumi Qiymət:" data-en="Total Price:">Toplam Fiyat:</span></strong></p>
                                    <p class="text-success fw-bold">AZN <?php echo rtrim(rtrim(number_format($pendingOrder['total_price'], 4), '0'), '.'); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong><span data-tr="Sonraki Adımlar:" data-az="Növbəti Addımlar:" data-en="Next Steps:">Sonraki Adımlar:</span></strong> <span data-tr="Siparişiniz 24-48 saat içinde işlenecek. Yukarıdaki Sipariş ID'sini kullanarak sipariş durumunuzu takip edebilirsiniz." data-az="Sifarişiniz 24-48 saat ərzində işlənəcək. Yuxarıdakı Sifariş ID-ni istifadə edərək sifariş vəziyyətinizi izləyə bilərsiniz." data-en="Your order will be processed within 24-48 hours. You can track your order status using the Order ID above.">Siparişiniz 24-48 saat içinde işlenecek. Yukarıdaki Sipariş ID'sini kullanarak sipariş durumunuzu takip edebilirsiniz.</span>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="order-status.php" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i><span data-tr="Sipariş Durumunu Kontrol Et" data-az="Sifariş Vəziyyətini Yoxla" data-en="Check Order Status">Sipariş Durumunu Kontrol Et</span>
                        </a>
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="fas fa-plus me-2"></i><span data-tr="Başka Sipariş Ver" data-az="Başqa Sifariş Ver" data-en="Place Another Order">Başka Sipariş Ver</span>
                        </a>
                    </div>
                </div>
                
            <?php else: ?>
                <!-- Error State -->
                <div class="text-center">
                                    <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                    <h4 class="alert-heading"><span data-tr="Sipariş Başarısız" data-az="Sifariş Uğursuz" data-en="Order Failed">Sipariş Başarısız</span></h4>
                    <p><?php echo htmlspecialchars($message); ?></p>
                </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-exclamation-triangle me-2"></i><span data-tr="Denenen Sipariş Detayları" data-az="Cəhd Edilən Sifariş Təfərrüatları" data-en="Attempted Order Details">Denenen Sipariş Detayları</span>
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
                            <i class="fas fa-arrow-left me-2"></i><span data-tr="Sipariş Formuna Dön" data-az="Sifariş Formuna Qayıt" data-en="Back to Order Form">Sipariş Formuna Dön</span>
                        </a>
                        <button onclick="location.reload()" class="btn btn-outline-secondary">
                            <i class="fas fa-redo me-2"></i><span data-tr="Tekrar Dene" data-az="Təkrar Cəhd Et" data-en="Try Again">Tekrar Dene</span>
                        </button>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
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
                
                // Update copy message
                this.updateCopyMessage(lang);
            }
            
            updateCopyMessage(lang) {
                const messages = {
                    tr: {
                        copied: 'Sipariş ID panoya kopyalandı!'
                    },
                    az: {
                        copied: 'Sifariş ID panoya kopyalandı!'
                    },
                    en: {
                        copied: 'Order ID copied to clipboard!'
                    }
                };
                
                // Store messages for later use
                window.languageMessages = messages[lang];
            }
        }
        
        // Initialize language manager
        const languageManager = new LanguageManager();
        
        // Copy order ID to clipboard
        function copyOrderId() {
            const orderId = '<?php echo $orderId; ?>';
            if (orderId) {
                navigator.clipboard.writeText(orderId).then(function() {
                    const message = window.languageMessages?.copied || 'Sipariş ID panoya kopyalandı!';
                    alert(message);
                });
            }
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