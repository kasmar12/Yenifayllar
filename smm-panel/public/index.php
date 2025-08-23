<?php
/**
 * SMM Panel - Main User Interface
 * Service selection and order placement
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Get categories and services from database
try {
    $pdo = getDBConnection();
    
    // Get active categories
    $stmt = $pdo->prepare("SELECT * FROM categories WHERE status = 'active' ORDER BY name");
    $stmt->execute();
    $categories = $stmt->fetchAll();
    
    // Get active services with category info
    $stmt = $pdo->prepare("
        SELECT s.*, c.name as category_name 
        FROM services s 
        JOIN categories c ON s.category_id = c.id 
        WHERE s.status = 'active' AND c.status = 'active'
        ORDER BY c.name, s.name
    ");
    $stmt->execute();
    $services = $stmt->fetchAll();
    
} catch (Exception $e) {
    $error = "Database error: " . $e->getMessage();
    $categories = [];
    $services = [];
}

// Handle form submission
$message = '';
$messageType = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $serviceId = intval($_POST['service_id'] ?? 0);
    $link = sanitizeInput($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    // Validate input
    if (empty($serviceId) || empty($link) || $quantity <= 0) {
        $message = 'Please fill in all fields correctly.';
        $messageType = 'danger';
    } else {
        // Get service details
        try {
            $stmt = $pdo->prepare("SELECT * FROM services WHERE id = ? AND status = 'active'");
            $stmt->execute([$serviceId]);
            $service = $stmt->fetch();
            
            if (!$service) {
                $message = 'Selected service not found.';
                $messageType = 'danger';
            } else {
                // Validate quantity
                if ($quantity < $service['min_quantity'] || $quantity > $service['max_quantity']) {
                    $message = "Quantity must be between {$service['min_quantity']} and {$service['max_quantity']}.";
                    $messageType = 'danger';
                } else {
                    // Calculate total price
                    $totalPrice = $service['price'] * $quantity;
                    
                    // Store order data in session for ad verification
                    $_SESSION['pending_order'] = [
                        'service_id' => $serviceId,
                        'service_name' => $service['name'],
                        'link' => $link,
                        'quantity' => $quantity,
                        'price' => $service['price'],
                        'total_price' => $totalPrice,
                        'api_service_id' => $service['api_service_id']
                    ];
                    
                    // Redirect to ad verification
                    header('Location: ad-verification.php');
                    exit;
                }
            }
        } catch (Exception $e) {
            $message = 'Error processing service: ' . $e->getMessage();
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
    <title><?php echo SITE_NAME; ?> - Professional SMM Services</title>
    
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
            <a class="navbar-brand d-flex align-items-center" href="#">
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
                        <a class="nav-link active" href="index.php">
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
        <div class="main-container">
            <!-- Header -->
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold text-primary mb-3">
                    <i class="fas fa-shopping-cart me-2"></i>
                    <span data-tr="Sipariş Verin" data-az="Sifariş Verin" data-en="Place Your Order">Sipariş Verin</span>
                </h1>
                <p class="text-muted">
                    <span data-tr="Sipariş vermek için aşağıdaki bilgileri doldurun" data-az="Sifariş vermək üçün aşağıdakı məlumatları doldurun" data-en="Fill in the details below to place your order">Sipariş vermek için aşağıdaki bilgileri doldurun</span>
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
            


            <!-- Order Form -->
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <form method="POST" id="orderForm" class="needs-validation" novalidate>
                        <!-- Hidden Auto-selected Service -->
                        <?php if (!empty($services)): ?>
                            <?php 
                            // Automatically select the first available service in background
                            $autoSelectedService = $services[0];
                            ?>
                            <input type="hidden" name="service_id" value="<?php echo $autoSelectedService['id']; ?>">
                        <?php endif; ?>

                        <!-- Link/Username Input -->
                        <div class="mb-3">
                            <label for="link" class="form-label">
                                <strong><i class="fas fa-link me-2"></i><span data-tr="Instagram/TikTok Link veya Kullanıcı Adı" data-az="Instagram/TikTok Link və ya İstifadəçi Adı" data-en="Instagram/TikTok Link or Username">Instagram/TikTok Link veya Kullanıcı Adı</span></strong>
                            </label>
                            <input type="text" 
                                   class="form-control" 
                                   id="link" 
                                   name="link" 
                                   placeholder="Instagram kullanıcı adı, TikTok linki veya YouTube URL'si girin"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                <span data-tr="Artırmak istediğiniz link veya kullanıcı adını girin" data-az="Artırmaq istədiyiniz link və ya istifadəçi adını daxil edin" data-en="Enter the link or username you want to boost">Artırmak istediğiniz link veya kullanıcı adını girin</span>
                            </div>
                        </div>

                        <!-- Quantity Input -->
                        <div class="mb-4">
                            <label for="quantity" class="form-label">
                                <strong><i class="fas fa-sort-numeric-up me-2"></i><span data-tr="Miktar" data-az="Miqdar" data-en="Quantity">Miktar</span></strong>
                            </label>
                            <input type="number" 
                                   class="form-control" 
                                   id="quantity" 
                                   name="quantity" 
                                   placeholder="1000"
                                   min="1000" 
                                   max="100000"
                                   value="1000"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                <span data-tr="İstediğiniz takipçi, beğeni veya görüntüleme sayısını girin" data-az="İstədiyiniz izləyici, bəyənmə və ya baxış sayını daxil edin" data-en="Enter the number of followers, likes, or views you want">İstediğiniz takipçi, beğeni veya görüntüleme sayısını girin</span>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="submitBtn">
                                <i class="fas fa-paper-plane me-2"></i>
                                <span data-tr="Sipariş Ver" data-az="Sifariş Ver" data-en="Place Order">Sipariş Ver</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>


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
                
                // Update placeholders
                this.updatePlaceholders(lang);
                
                // Update validation messages
                this.updateValidationMessages(lang);
            }
            
            updatePlaceholders(lang) {
                const placeholders = {
                    tr: "Instagram kullanıcı adı, TikTok linki veya YouTube URL'si girin",
                    az: "Instagram istifadəçi adı, TikTok linki və ya YouTube URL'si daxil edin",
                    en: "Enter Instagram username, TikTok link, or YouTube URL"
                };
                
                const linkInput = document.getElementById('link');
                if (linkInput) {
                    linkInput.placeholder = placeholders[lang];
                }
            }
            
            updateValidationMessages(lang) {
                const messages = {
                    tr: {
                        required: 'Lütfen tüm gerekli alanları doldurun.',
                        processing: 'İşleniyor...'
                    },
                    az: {
                        required: 'Zəhmət olmasa bütün tələb olunan sahələri doldurun.',
                        processing: 'İşlənir...'
                    },
                    en: {
                        required: 'Please fill in all required fields.',
                        processing: 'Processing...'
                    }
                };
                
                // Store messages for later use
                window.languageMessages = messages[lang];
            }
        }
        
        // Initialize language manager
        const languageManager = new LanguageManager();
        
        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const link = document.getElementById('link').value.trim();
            const quantity = document.getElementById('quantity').value;
            
            if (!link || !quantity) {
                e.preventDefault();
                const message = window.languageMessages?.required || 'Lütfen tüm gerekli alanları doldurun.';
                alert(message);
                return false;
            }
            
            // Show loading state
            const processingText = window.languageMessages?.processing || 'İşleniyor...';
            document.getElementById('submitBtn').innerHTML = `<i class="fas fa-spinner fa-spin me-2"></i>${processingText}`;
            document.getElementById('submitBtn').disabled = true;
        });
        
        // Bootstrap form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>

<?php
// Helper function to get category icon
function getCategoryIcon($name) {
    $name = strtolower($name);
    $icons = [
        'instagram' => 'camera',
        'tiktok' => 'music',
        'youtube' => 'play-circle',
        'twitter' => 'twitter',
        'facebook' => 'facebook',
        'default' => 'tag'
    ];
    
    return $icons[$name] ?? $icons['default'];
}
?>