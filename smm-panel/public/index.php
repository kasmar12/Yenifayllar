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
    <nav class="navbar navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-shopping-cart me-2"></i>
                <?php echo SITE_NAME; ?>
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="order-status.php">
                    <i class="fas fa-search me-1"></i>Durum Kontrolü
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="main-container">
            <!-- Header -->
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold text-primary mb-3">
                    <i class="fas fa-shopping-cart me-2"></i>
                    Sipariş Verin
                </h1>
                <p class="text-muted">
                    Sipariş vermek için aşağıdaki bilgileri doldurun
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
                                <strong><i class="fas fa-link me-2"></i>Instagram/TikTok Link veya Kullanıcı Adı</strong>
                            </label>
                            <input type="text" 
                                   class="form-control" 
                                   id="link" 
                                   name="link" 
                                   placeholder="Instagram kullanıcı adı, TikTok linki veya YouTube URL'si girin"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                Artırmak istediğiniz link veya kullanıcı adını girin
                            </div>
                        </div>

                        <!-- Quantity Input -->
                        <div class="mb-4">
                            <label for="quantity" class="form-label">
                                <strong><i class="fas fa-sort-numeric-up me-2"></i>Miktar</strong>
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
                                İstediğiniz takipçi, beğeni veya görüntüleme sayısını girin
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="submitBtn">
                                <i class="fas fa-paper-plane me-2"></i>
                                Sipariş Ver
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
        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const link = document.getElementById('link').value.trim();
            const quantity = document.getElementById('quantity').value;
            
            if (!link || !quantity) {
                e.preventDefault();
                alert('Lütfen tüm gerekli alanları doldurun.');
                return false;
            }
            
            // Show loading state
            document.getElementById('submitBtn').innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>İşleniyor...';
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