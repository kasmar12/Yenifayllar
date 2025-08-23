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

// Create shortened ad link using AY.Live API
$adLinkResult = createAYLiveLink($verificationUrl);

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
    <title><?php echo SITE_NAME; ?> - Reklam Doğrulaması</title>
    
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
            <?php if ($error): ?>
                <!-- Error State -->
                <div class="text-center">
                                    <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                    <h4 class="alert-heading">Reklam Doğrulama Hatası</h4>
                    <p><?php echo htmlspecialchars($error); ?></p>
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
            <?php else: ?>
                <!-- Loading State -->
                <div class="text-center">
                    <div class="loading-spinner"></div>
                    <h3 class="mb-3">Reklam Doğrulaması Hazırlanıyor...</h3>
                    <p class="text-muted mb-4">
                        Reklam doğrulamanız hazırlanırken lütfen bekleyin.
                        Kısa süre sonra yönlendirileceksiniz.
                    </p>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Not:</strong> Siparişinize devam etmek için reklamı tamamlamanız gerekir.
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-2"></i>Siparişi İptal Et
                        </a>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Auto-refresh after 10 seconds if no redirect
        setTimeout(function() {
            location.reload();
        }, 10000);
        
        // Show countdown
        let countdown = 10;
        const countdownElement = document.createElement('p');
        countdownElement.className = 'text-muted mt-3';
        countdownElement.innerHTML = `Redirecting in <strong>${countdown}</strong> seconds...`;
        
        if (!document.querySelector('.alert-danger')) {
            document.querySelector('.text-center').appendChild(countdownElement);
            
            const countdownInterval = setInterval(function() {
                countdown--;
                countdownElement.innerHTML = `Redirecting in <strong>${countdown}</strong> seconds...`;
                
                if (countdown <= 0) {
                    clearInterval(countdownInterval);
                    countdownElement.innerHTML = 'Redirecting now...';
                }
            }, 1000);
        }
    </script>
</body>
</html>