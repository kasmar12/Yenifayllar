<?php
/**
 * Ad Verification Page
 * 
 * This page:
 * 1. Receives the shortened URL from AY.Live after ad completion
 * 2. Verifies the ad was completed
 * 3. Creates the order in the system
 * 4. Shows success message
 */

session_start();
require_once '../config/database.php';
require_once '../config/link_shortener_config.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);

// Get parameters from URL
$shortened_url = $_GET['url'] ?? '';
$order_data = $_SESSION['pending_order'] ?? null;

if (empty($shortened_url) || !$order_data) {
    header('Location: index.php?error=invalid_verification');
    exit;
}

try {
    // Verify the shortened URL format
    if (!filter_var($shortened_url, FILTER_VALIDATE_URL)) {
        throw new Exception("Invalid shortened URL format");
    }
    
    // Extract order details from session
    $service_id = $order_data['service_id'];
    $link = $order_data['link'];
    $amount = $order_data['quantity'];
    $price = $order_data['total_price'];
    
    // Create order in database
    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception("Database connection failed");
    }
    
    // Get service details
    $query = "SELECT * FROM services WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$service_id]);
    $service = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$service) {
        throw new Exception("Xidmət tapılmadı!");
    }

    if ($amount < $service['min_amount'] || $amount > $service['max_amount']) {
        throw new Exception("Miqdar yanlışdır!");
    }
    
    // Create order in database
    $query = "INSERT INTO orders (service_id, link, amount, price, status, created_at) VALUES (?, ?, ?, ?, 'ad_completed', NOW())";
    $stmt = $db->prepare($query);
    $result = $stmt->execute([$service_id, $link, $amount, $price]);
    
    if (!$result) {
        throw new Exception("Sifariş yaradıla bilmədi!");
    }
    
    $order_id = $db->lastInsertId();
    
    if (!$order_id) {
        throw new Exception("Sifariş ID alına bilmədi!");
    }
    
    // Log the successful order creation
    try {
        $log_entry = date('Y-m-d H:i:s') . " - Order #$order_id created successfully after ad completion\n";
        file_put_contents('../logs/orders_log.txt', $log_entry, FILE_APPEND);
    } catch (Exception $e) {
        error_log("Failed to write order log: " . $e->getMessage());
    }
    
    // Store order data in session for success page
    $_SESSION['completed_order'] = [
        'id' => $order_id,
        'service_name' => $service['name'],
        'link' => $link,
        'amount' => $amount,
        'price' => $price,
        'shortened_url' => $shortened_url,
        'status' => 'ad_completed'
    ];
    
    // Clear pending order data
    unset($_SESSION['pending_order']);
    
    // Show success message
    $success = true;
    $order_info = [
        'id' => $order_id,
        'service_name' => $service['name'],
        'link' => $link,
        'amount' => $amount,
        'price' => $price
    ];
    
} catch (Exception $e) {
    error_log("Ad verification error: " . $e->getMessage());
    
    // Clear session data on error
    unset($_SESSION['pending_order']);
    
    $success = false;
    $error_message = $e->getMessage();
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
        .success-icon {
            font-size: 4rem;
            color: #28a745;
        }
        .error-icon {
            font-size: 4rem;
            color: #dc3545;
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <?php if ($success): ?>
                    <!-- Success Message -->
                    <div class="text-center mb-5">
                        <div class="success-icon mb-3">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h1 class="text-success mb-3">Sifariş Uğurla Göndərildi! 🎉</h1>
                        <p class="lead text-muted">Reklam keçildi və sifarişiniz sistemə əlavə edildi.</p>
                    </div>

                    <!-- Order Details -->
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">
                                <i class="fas fa-info-circle"></i> Sifariş Məlumatları
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Sifariş ID:</strong> #<?php echo htmlspecialchars($order_info['id']); ?></p>
                                    <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_info['service_name']); ?></p>
                                    <p><strong>Link:</strong> <?php echo htmlspecialchars($order_info['link']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Miqdar:</strong> <?php echo number_format($order_info['amount']); ?></p>
                                    <p><strong>Qiymət:</strong> <span class="text-success">PULSUZ! 🎉</span></p>
                                    <p><strong>Status:</strong> 
                                        <span class="badge bg-success">Göndərildi</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Next Steps -->
                    <div class="card mt-4">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0">
                                <i class="fas fa-arrow-right"></i> Növbəti Addımlar
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle"></i>
                                <strong>Təbriklər!</strong> Sifarişiniz uğurla sistemə əlavə edildi.
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <h6><i class="fas fa-list-check"></i> Status:</h6>
                                    <ul class="list-unstyled">
                                        <li><i class="fas fa-check text-success"></i> Sifariş yaradıldı</li>
                                        <li><i class="fas fa-check text-success"></i> Reklam keçildi</li>
                                        <li><i class="fas fa-check text-success"></i> Sifariş göndərildi</li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <h6><i class="fas fa-info-circle"></i> Məlumat:</h6>
                                    <ul class="list-unstyled">
                                        <li><i class="fas fa-calendar"></i> Tarix: <?php echo date('d.m.Y H:i'); ?></li>
                                        <li><i class="fas fa-tag"></i> Tip: Pulsuz Sifariş</li>
                                        <li><i class="fas fa-clock"></i> Vaxt: <?php echo date('H:i:s'); ?></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php else: ?>
                    <!-- Error Message -->
                    <div class="text-center mb-5">
                        <div class="error-icon mb-3">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <h1 class="text-danger mb-3">Xəta Baş Verdi! ❌</h1>
                        <p class="lead text-muted">Sifariş yaradıla bilmədi.</p>
                    </div>

                    <div class="alert alert-danger">
                        <h5><i class="fas fa-exclamation-circle"></i> Xəta Məlumatı:</h5>
                        <p class="mb-0"><?php echo htmlspecialchars($error_message); ?></p>
                    </div>
                <?php endif; ?>

                <!-- Action Buttons -->
                <div class="text-center mt-4">
                    <a href="index.php" class="btn btn-primary btn-lg">
                        <i class="fas fa-home"></i> Ana Səhifəyə Qayıt
                    </a>
                    
                    <?php if ($success): ?>
                        <a href="order_status.php?order_id=<?php echo $order_info['id']; ?>" class="btn btn-outline-info btn-lg ms-3">
                            <i class="fas fa-eye"></i> Sifariş Statusunu Yoxla
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>