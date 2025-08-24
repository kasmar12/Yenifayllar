<?php
require_once '../config/database.php';

$database = new Database();
$db = $database->getConnection();

// Get all services
if ($db) {
    try {
        $query = "SELECT * FROM services ORDER BY name";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $services = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        $services = [];
        echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h4>Database Query Error</h4>";
        echo "<p><strong>Error:</strong> " . $e->getMessage() . "</p>";
        echo "<p><a href='../test_db.php'>Test Database Connection</a></p>";
        echo "</div>";
    }
} else {
    $services = [];
}

// Handle error messages
$error_message = '';
$debug_info = '';

if (isset($_GET['error'])) {
    switch ($_GET['error']) {
        case 'missing_data':
            $error_message = 'Bütün məlumatları doldurun!';
            break;
        case 'invalid_service':
            $error_message = 'Yanlış xidmət seçildi!';
            break;
        case 'invalid_amount':
            $error_message = 'Yanlış miqdar daxil edildi!';
            break;
        case 'payment_failed':
            $error_message = 'Ödəniş yaradılarkən xəta baş verdi!';
            if (isset($_GET['msg'])) {
                $error_message .= ' ' . htmlspecialchars($_GET['msg']);
            }
            if (isset($_GET['debug'])) {
                $debug_info = htmlspecialchars($_GET['debug']);
            }
            break;
        case 'payment_id_missing':
            $error_message = 'Ödəniş ID-si alınmadı!';
            if (isset($_GET['debug'])) {
                $debug_info = htmlspecialchars($_GET['debug']);
            }
            break;
        case 'payment_exception':
            $error_message = 'Ödəniş zamanı xəta baş verdi!';
            if (isset($_GET['msg'])) {
                $error_message .= ' ' . htmlspecialchars($_GET['msg']);
            }
            break;
        case 'system_error':
            $error_message = 'Sistem xətası baş verdi!';
            if (isset($_GET['msg'])) {
                $error_message .= ' ' . htmlspecialchars($_GET['msg']);
            }
            break;
        case 'database_error':
            $error_message = 'Database xətası baş verdi!';
            if (isset($_GET['msg'])) {
                $error_message .= ' ' . htmlspecialchars($_GET['msg']);
            }
            break;
        case 'order_creation_failed':
            $error_message = 'Sifariş yaradıla bilmədi!';
            if (isset($_GET['msg'])) {
                $error_message .= ' ' . htmlspecialchars($_GET['msg']);
            }
            break;
        default:
            $error_message = 'Naməlum xəta baş verdi!';
    }
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Social Media Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .service-card {
            transition: transform 0.2s;
            border: 1px solid #e9ecef;
        }
        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 80px 0;
        }
        .price-calc {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
        }
        .error-banner {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }
        .debug-info {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            font-family: monospace;
            font-size: 12px;
            max-height: 200px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 mb-4">
                <i class="fas fa-rocket"></i> SMM Panel
            </h1>
            <p class="lead">Instagram, TikTok, Telegram və digər sosial media xidmətləri</p>
        </div>
    </div>

    <div class="container my-5">
        <!-- Error Messages -->
        <?php if ($error_message): ?>
        <div class="error-banner">
            <h4><i class="fas fa-exclamation-triangle"></i> Xəta!</h4>
            <p><?php echo $error_message; ?></p>
            
            <?php if ($debug_info): ?>
            <details>
                <summary><strong>Debug Məlumatı (Texniki personal üçün)</strong></summary>
                <div class="debug-info">
                    <pre><?php echo $debug_info; ?></pre>
                </div>
                <div class="mt-2">
                    <small class="text-muted">
                        <i class="fas fa-info-circle"></i> 
                        Bu məlumatı administrator ilə paylaşın
                    </small>
                </div>
            </details>
            <?php endif; ?>
            
            <p class="mt-3">
                <a href="index.php" class="btn btn-outline-danger btn-sm">
                    <i class="fas fa-refresh"></i> Səhifəni Yenilə
                </a>
                <a href="../admin/settings.php" class="btn btn-outline-warning btn-sm">
                    <i class="fas fa-cog"></i> Admin Tənzimləmələri
                </a>
                <a href="../test_portmanat.php" class="btn btn-outline-info btn-sm">
                    <i class="fas fa-bug"></i> Portmanat API Test
                </a>
                <a href="../test_checkout_simple.php" class="btn btn-outline-success btn-sm">
                    <i class="fas fa-vial"></i> Checkout Test
                </a>
                <a href="../test_checkout_step_by_step.php" class="btn btn-outline-warning btn-sm">
                    <i class="fas fa-search"></i> Step-by-Step Test
                </a>
                <a href="../test_checkout_debug.php" class="btn btn-outline-danger btn-sm">
                    <i class="fas fa-bug"></i> Debug Test
                </a>
            </p>
        </div>
        <?php endif; ?>

        <!-- Database Error Banner -->
        <?php if (!$db): ?>
        <div class="error-banner">
            <h4><i class="fas fa-exclamation-triangle"></i> Database Connection Error</h4>
            <p>Database bağlantısı uğursuz oldu. Zəhmət olmasa administrator ilə əlaqə saxlayın.</p>
            <p><a href="../test_db.php" class="btn btn-outline-danger btn-sm">Database Test Et</a></p>
        </div>
        <?php endif; ?>

        <!-- Services Grid -->
        <div class="row">
            <?php if (!empty($services)): ?>
                <?php foreach ($services as $service): ?>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card service-card h-100">
                        <div class="card-body">
                            <h5 class="card-title">
                                <i class="fab fa-<?php echo strtolower($service['name']); ?>"></i>
                                <?php echo htmlspecialchars($service['name']); ?>
                            </h5>
                            <p class="card-text"><?php echo htmlspecialchars($service['description']); ?></p>
                            <div class="mb-3">
                                <small class="text-muted">
                                    Min: <?php echo number_format($service['min_amount']); ?> | 
                                    Max: <?php echo number_format($service['max_amount']); ?>
                                </small>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary" onclick="selectService(<?php echo $service['id']; ?>, '<?php echo htmlspecialchars($service['name']); ?>', <?php echo $service['price_per_1k']; ?>, <?php echo $service['min_amount']; ?>, <?php echo $service['max_amount']; ?>)">
                                    Seç <i class="fas fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="col-12 text-center">
                    <div class="alert alert-warning">
                        <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                        <h4>Xidmətlər tapılmadı</h4>
                        <p>Hələ heç bir xidmət əlavə edilməyib və ya database problemi var.</p>
                        <p><a href="../test_db.php" class="btn btn-outline-warning">Database Test Et</a></p>
                    </div>
                </div>
            <?php endif; ?>
        </div>

        <!-- Order Form -->
        <div class="row mt-5" id="orderForm" style="display: none;">
            <div class="col-lg-8 mx-auto">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">
                            <i class="fas fa-shopping-cart"></i> Sifariş Formu
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="checkout.php" method="POST" id="orderFormElement">
                            <input type="hidden" name="service_id" id="serviceId">
                            
                            <div class="mb-3">
                                <label class="form-label">Xidmət:</label>
                                <input type="text" class="form-control" id="serviceName" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Link:</label>
                                <input type="url" name="link" class="form-control" required placeholder="https://instagram.com/p/...">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Miqdar:</label>
                                <input type="number" name="amount" class="form-control" id="amount" required min="1" step="1">
                                <small class="text-muted">
                                    Min: <span id="minAmount">0</span> | Max: <span id="maxAmount">0</span>
                                </small>
                            </div>

                            <div class="price-calc">
                                <h6>Qiymət Hesablaması:</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong>Miqdar:</strong> <span id="calcAmount">0</span></p>
                                        <p><strong>Qiymət/1000:</strong> <span id="calcPrice">0</span> ₼</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>Ümumi Qiymət:</strong></p>
                                        <h4 class="text-primary" id="totalPrice">0.00 ₼</h4>
                                    </div>
                                </div>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg">
                                    <i class="fas fa-credit-card"></i> Ödəniş Et
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentPrice = 0;
        let minAmount = 0;
        let maxAmount = 0;

        function selectService(serviceId, serviceName, pricePer1k, min, max) {
            document.getElementById('serviceId').value = serviceId;
            document.getElementById('serviceName').value = serviceName;
            document.getElementById('minAmount').textContent = min.toLocaleString();
            document.getElementById('maxAmount').textContent = max.toLocaleString();
            document.getElementById('amount').min = min;
            document.getElementById('amount').max = max;
            document.getElementById('amount').value = min;
            
            currentPrice = pricePer1k;
            minAmount = min;
            maxAmount = max;
            
            calculatePrice();
            document.getElementById('orderForm').style.display = 'block';
            
            // Scroll to form
            document.getElementById('orderForm').scrollIntoView({ behavior: 'smooth' });
        }

        function calculatePrice() {
            const amount = parseInt(document.getElementById('amount').value) || 0;
            if (amount >= minAmount && amount <= maxAmount) {
                const total = (amount / 1000) * currentPrice;
                document.getElementById('calcAmount').textContent = amount.toLocaleString();
                document.getElementById('calcPrice').textContent = currentPrice.toFixed(2);
                document.getElementById('totalPrice').textContent = total.toFixed(2) + ' ₼';
            }
        }

        document.getElementById('amount').addEventListener('input', calculatePrice);
    </script>
</body>
</html>