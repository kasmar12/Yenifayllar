<?php
/**
 * Ad Verification Page
 * Users must pass through advertisement before placing order
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Check if user has pending order
if (!isset($_SESSION['pending_order'])) {
    header('Location: index.php');
    exit;
}

$pendingOrder = $_SESSION['pending_order'];
$error = '';

// Create verification URL for after ad completion
$verificationUrl = SITE_URL . '/public/process-order.php';

// Create shortened ad link using ShrinkMe.io API
$adLinkResult = createShrinkMeLink($verificationUrl);

if (!$adLinkResult['success']) {
    $error = 'Reklam doğrulama linki oluşturulamadı: ' . $adLinkResult['error'];
} else {
    // Redirect user to ad
    header('Location: ' . $adLinkResult['shortened_url']);
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - <span data-tr="Reklam Doğrulaması" data-az="Reklam Təsdiqi" data-en="Ad Verification">Reklam Doğrulaması</span></title>
    
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
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0h0aD0iMjAiIGhlaWdodD0iMTUiIHZpZXdCb3g9IjAgMCAyMCAxNSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjIwIiBoZWlnaHQ9IjE1IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiNmZmZmZmYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjMDAyNDc2Ii8+CjxwYXRoIGQ9Ik0wIDBoMjB2MTVIMFYweiIgZmlsbD0iI2ZmZmZmZiIvPgo8cGF0aCBkPSJNMCAwaDIwdjE1SDBWMHoiIGZpbGw9IiMwMDI0NzYiLz4KPHBhdGggZD0iTTAgMGgyMHYxNUgwVjB6IiBmaWxsPSIjZmZmZmZmIi8+CjxjaXJjbGUgY3g9IjEwIiBjeT0iNy41IiByPSIzIiBmaWxsPSIjMDAyNDc2Ii8+Cjwvc3ZnPgo=" class="me-2" alt="EN" width="20" height="15">
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
            <?php if ($error): ?>
                <!-- Error State -->
                <div class="text-center">
                                    <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                    <h4 class="alert-heading"><span data-tr="Reklam Doğrulama Hatası" data-az="Reklam Təsdiq Xətası" data-en="Ad Verification Error">Reklam Doğrulama Hatası</span></h4>
                    <p><?php echo htmlspecialchars($error); ?></p>
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
            <?php else: ?>
                <!-- Loading State -->
                <div class="text-center">
                    <div class="loading-spinner"></div>
                    <h3 class="mb-3"><span data-tr="Reklam Doğrulaması Hazırlanıyor..." data-az="Reklam Təsdiqi Hazırlanır..." data-en="Preparing Ad Verification...">Reklam Doğrulaması Hazırlanıyor...</span></h3>
                    <p class="text-muted mb-4">
                        <span data-tr="Reklam doğrulamanız hazırlanırken lütfen bekleyin. Kısa süre sonra yönlendirileceksiniz." data-az="Reklam təsdiqiniz hazırlanarkən zəhmət olmasa gözləyin. Tezliklə yönləndiriləcəksiniz." data-en="Please wait while we prepare your advertisement verification. You will be redirected shortly.">Reklam doğrulamanız hazırlanırken lütfen bekleyin. Kısa süre sonra yönlendirileceksiniz.</span>
                    </p>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong><span data-tr="Not:" data-az="Qeyd:" data-en="Note:">Not:</span></strong> <span data-tr="Siparişinize devam etmek için reklamı tamamlamanız gerekir." data-az="Sifarişinizə davam etmək üçün reklamı tamamlamalısınız." data-en="You must complete the advertisement to proceed with your order.">Siparişinize devam etmek için reklamı tamamlamanız gerekir.</span>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-2"></i><span data-tr="Siparişi İptal Et" data-az="Sifarişi Ləğv Et" data-en="Cancel Order">Siparişi İptal Et</span>
                        </a>
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
                
                // Update countdown messages
                this.updateCountdownMessages(lang);
            }
            
            updateCountdownMessages(lang) {
                const messages = {
                    tr: {
                        redirecting: 'Yönlendiriliyor',
                        seconds: 'saniye',
                        now: 'Şimdi yönlendiriliyor...'
                    },
                    az: {
                        redirecting: 'Yönləndirilir',
                        seconds: 'saniyə',
                        now: 'İndi yönləndirilir...'
                    },
                    en: {
                        redirecting: 'Redirecting',
                        seconds: 'seconds',
                        now: 'Redirecting now...'
                    }
                };
                
                // Store messages for later use
                window.languageMessages = messages[lang];
            }
        }
        
        // Initialize language manager
        const languageManager = new LanguageManager();
        
        // Auto-refresh after 10 seconds if no redirect
        setTimeout(function() {
            location.reload();
        }, 10000);
        
        // Show countdown
        let countdown = 10;
        const countdownElement = document.createElement('p');
        countdownElement.className = 'text-muted mt-3';
        
        if (!document.querySelector('.alert-danger')) {
            document.querySelector('.text-center').appendChild(countdownElement);
            
            const countdownInterval = setInterval(function() {
                countdown--;
                const redirectingText = window.languageMessages?.redirecting || 'Redirecting';
                const secondsText = window.languageMessages?.seconds || 'seconds';
                countdownElement.innerHTML = `${redirectingText} in <strong>${countdown}</strong> ${secondsText}...`;
                
                if (countdown <= 0) {
                    clearInterval(countdownInterval);
                    const nowText = window.languageMessages?.now || 'Redirecting now...';
                    countdownElement.innerHTML = nowText;
                }
            }, 1000);
        }
    </script>
</body>
</html>