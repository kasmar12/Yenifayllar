<?php
/**
 * Order Success Page
 * 
 * This page displays the successful order creation after ad completion
 */

session_start();
require_once '../config/database.php';

$order_id = $_GET['order_id'] ?? '';
$order_data = $_SESSION['completed_order'] ?? null;

if (empty($order_id) || !$order_data) {
    header('Location: index.php?error=invalid_order');
    exit;
}

// Get order details from database
try {
    $database = new Database();
    $db = $database->getConnection();
    
    if ($db) {
        $query = "SELECT o.*, s.name as service_name FROM orders o 
                  JOIN services s ON o.service_id = s.id 
                  WHERE o.id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$order_id]);
        $order = $stmt->fetch(PDO::FETCH_ASSOC);
    }
} catch (Exception $e) {
    error_log("Error fetching order: " . $e->getMessage());
    $order = null;
}
?>
<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Sifariş Uğurla Yaradıldı</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .success-icon {
            font-size: 4rem;
            color: #28a745;
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
        .status-badge {
            font-size: 1.1rem;
            padding: 8px 16px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <!-- Success Header -->
                <div class="text-center mb-5">
                    <div class="success-icon mb-3">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h1 class="text-success mb-3">Sifariş Uğurla Yaradıldı! 🎉</h1>
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
                                <p><strong>Sifariş ID:</strong> #<?php echo htmlspecialchars($order_id); ?></p>
                                <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_data['service_name'] ?? 'N/A'); ?></p>
                                <p><strong>Link:</strong> <?php echo htmlspecialchars($order_data['link']); ?></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Miqdar:</strong> <?php echo number_format($order_data['amount']); ?></p>
                                <p><strong>Qiymət:</strong> <span class="text-success">PULSUZ! 🎉</span></p>
                                <p><strong>Status:</strong> 
                                    <span class="badge bg-warning status-badge">Reklam Tamamlandı</span>
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
                        <div class="alert alert-info">
                            <i class="fas fa-clock"></i>
                            <strong>Sifarişiniz hazırlanır!</strong> Sistem avtomatik olaraq sifarişinizi SMM API-yə göndərəcək.
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <h6><i class="fas fa-list-check"></i> Status Tarixçəsi:</h6>
                                <ul class="list-unstyled">
                                    <li><i class="fas fa-check text-success"></i> Sifariş yaradıldı</li>
                                    <li><i class="fas fa-check text-success"></i> Reklam keçildi</li>
                                    <li><i class="fas fa-clock text-warning"></i> SMM API-yə göndərilir</li>
                                    <li><i class="fas fa-hourglass text-info"></i> Xidmət hazırlanır</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-info-circle"></i> Məlumat:</h6>
                                <ul class="list-unstyled">
                                    <li><i class="fas fa-calendar"></i> Tarix: <?php echo date('d.m.Y H:i'); ?></li>
                                    <li><i class="fas fa-link"></i> Qısa Link: <?php echo htmlspecialchars($order_data['shortened_url'] ?? 'N/A'); ?></li>
                                    <li><i class="fas fa-tag"></i> Tip: Pulsuz Sifariş</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="text-center mt-4">
                    <a href="index.php" class="btn btn-primary btn-lg me-3">
                        <i class="fas fa-home"></i> Ana Səhifəyə Qayıt
                    </a>
                    <a href="order_status.php?order_id=<?php echo $order_id; ?>" class="btn btn-outline-info btn-lg">
                        <i class="fas fa-eye"></i> Sifariş Statusunu Yoxla
                    </a>
                </div>

                <!-- Order Processing Info -->
                <div class="alert alert-success mt-4">
                    <h6><i class="fas fa-lightbulb"></i> Əlavə Məlumat:</h6>
                    <ul class="mb-0">
                        <li>Sifarişiniz avtomatik olaraq SMM API-yə göndəriləcək</li>
                        <li>Xidmət hazırlanma müddəti seçdiyiniz xidmətə görə dəyişə bilər</li>
                        <li>Status yeniləmələri real-time olaraq göstəriləcək</li>
                        <li>Hər hansı sualınız varsa, dəstək komandası ilə əlaqə saxlayın</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>