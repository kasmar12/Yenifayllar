<?php
/**
 * Ad Verification Page
 * 
 * This page:
 * 1. Shows pending order details from session
 * 2. Generates AY.Live ad link
 * 3. Redirects user to ad page
 * 4. After ad completion, order is created
 */

session_start();
require_once '../config/link_shortener_config.php';
require_once '../config/link_shortener.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);

// Check if pending order exists
$order_data = $_SESSION['pending_order'] ?? null;

if (!$order_data) {
    header('Location: index.php?error=no_pending_order');
    exit;
}

// Generate AY.Live ad link
try {
    $link_shortener = new LinkShortener();
    $short_link_result = $link_shortener->generateShortLink($order_data['link'], 'temp_' . time());
    
    if (!$short_link_result['success']) {
        throw new Exception("Reklam linki yaradıla bilmədi: " . $short_link_result['error']);
    }
    
    $ad_url = $short_link_result['short_url'];
    
} catch (Exception $e) {
    error_log("Ad link generation error: " . $e->getMessage());
    header('Location: index.php?error=ad_link_error&msg=' . urlencode($e->getMessage()));
    exit;
}
?>
<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Reklam Təsdiqi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .order-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin: 20px 0;
        }
        .ad-info {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
        .countdown {
            font-size: 2rem;
            font-weight: bold;
            color: #dc3545;
        }
        .btn-ad {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            border: none;
            color: white;
            font-size: 1.2rem;
            padding: 15px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        .btn-ad:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            color: white;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <!-- Header -->
                <div class="text-center mb-5">
                    <h1 class="text-primary mb-3">
                        <i class="fas fa-ad"></i> Reklam Təsdiqi
                    </h1>
                    <p class="lead text-muted">Sifarişinizi tamamlamaq üçün reklamı keçməlisiniz</p>
                </div>

                <!-- Order Details Card -->
                <div class="order-card shadow">
                    <div class="text-center mb-4">
                        <h3><i class="fas fa-shopping-cart"></i> Sifariş Məlumatları</h3>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_data['service_name']); ?></p>
                            <p><strong>Link:</strong> <?php echo htmlspecialchars($order_data['link']); ?></p>
                            <p><strong>Miqdar:</strong> <?php echo number_format($order_data['quantity']); ?></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Qiymət/1000:</strong> <?php echo number_format($order_data['price'], 2); ?> ₼</p>
                            <p><strong>Ümumi Qiymət:</strong> <span class="text-success">PULSUZ! 🎉</span></p>
                            <p><strong>Status:</strong> <span class="badge bg-warning">Reklam Gözlənir</span></p>
                        </div>
                    </div>
                </div>

                <!-- Ad Information -->
                <div class="ad-info">
                    <div class="text-center mb-4">
                        <h4><i class="fas fa-info-circle"></i> Reklam Haqqında</h4>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <h6><i class="fas fa-clock"></i> Təxmini Vaxt:</h6>
                            <p>Reklam keçmək üçün təxmini 30 saniyə vaxt lazımdır</p>
                            
                            <h6><i class="fas fa-shield-alt"></i> Təhlükəsizlik:</h6>
                            <p>Reklamlar təhlükəsizdir və spam yoxdur</p>
                        </div>
                        <div class="col-md-6">
                            <h6><i class="fas fa-gift"></i> Nəticə:</h6>
                            <p>Reklam keçildikdən sonra sifarişiniz avtomatik olaraq yaradılacaq</p>
                            
                            <h6><i class="fas fa-check-circle"></i> Təsdiq:</h6>
                            <p>Reklam tamamlandıqdan sonra təsdiq mesajı alacaqsınız</p>
                        </div>
                    </div>
                </div>

                <!-- Ad Redirect Section -->
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-play-circle"></i> Reklamı Başlat
                        </h5>
                    </div>
                    <div class="card-body text-center">
                        <div class="alert alert-info">
                            <i class="fas fa-lightbulb"></i>
                            <strong>Məcburi Reklam:</strong> Sifariş etmək üçün reklam keçməlisiniz. 
                            Düyməyə basdıqdan sonra avtomatik olaraq reklam səhifəsinə yönləndiriləcəksiniz.
                        </div>
                        
                        <div class="mb-4">
                            <a href="<?php echo htmlspecialchars($ad_url); ?>" class="btn btn-ad btn-lg">
                                <i class="fas fa-play"></i> Reklamı Başlat və Sifariş Et
                            </a>
                        </div>
                        
                        <small class="text-muted">
                            <i class="fas fa-exclamation-triangle"></i>
                            Reklam səhifəsindən çıxmayın və tamamlayın
                        </small>
                    </div>
                </div>

                <!-- Instructions -->
                <div class="card mt-4">
                    <div class="card-header bg-primary text-white">
                        <h6 class="mb-0">
                            <i class="fas fa-list-ol"></i> Təlimatlar
                        </h6>
                    </div>
                    <div class="card-body">
                        <ol>
                            <li><strong>Reklamı Başlat</strong> düyməsinə basın</li>
                            <li>Reklam səhifəsində reklamı tamamlayın</li>
                            <li>Reklam tamamlandıqdan sonra avtomatik yönləndirmə</li>
                            <li>Sifarişiniz sistemə əlavə ediləcək</li>
                            <li>Uğurlu mesaj alacaqsınız</li>
                        </ol>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="text-center mt-4">
                    <a href="index.php" class="btn btn-outline-secondary btn-lg me-3">
                        <i class="fas fa-arrow-left"></i> Geri Qayıt
                    </a>
                    
                    <a href="<?php echo htmlspecialchars($ad_url); ?>" class="btn btn-success btn-lg">
                        <i class="fas fa-play"></i> Reklamı Başlat
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>