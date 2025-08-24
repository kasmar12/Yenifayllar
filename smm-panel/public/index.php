<?php
require_once '../config/database.php';

$database = new Database();
$db = $database->getConnection();

// Get all services
$query = "SELECT * FROM services ORDER BY name";
$stmt = $db->prepare($query);
$stmt->execute();
$services = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
        <!-- Services Grid -->
        <div class="row">
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