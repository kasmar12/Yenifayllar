<?php
session_start();
require_once '../config/database.php';
require_once '../config/portmanat_config.php';
require_once '../config/portmanat_api.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$message = '';
$error = '';
$order_data = null;

// Check if order data is provided
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $service_id = $_POST['service_id'] ?? '';
    $link = $_POST['link'] ?? '';
    $amount = $_POST['amount'] ?? '';
    
    if (empty($service_id) || empty($link) || empty($amount)) {
        $error = 'Bütün məlumatları doldurun!';
    } else {
        try {
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
            
            // Calculate price
            $price = ($amount / 1000) * $service['price_per_1k'];
            
            // Create order in database
            $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
            $stmt = $db->prepare($query);
            $result = $stmt->execute([$service_id, $link, $amount, $price]);
            
            if (!$result) {
                throw new Exception("Sifariş yaradıla bilmədi!");
            }
            
            $order_id = $db->lastInsertId();
            
            if (!$order_id) {
                throw new Exception("Sifariş ID alına bilmədi!");
            }
            
            // Store order data in session for payment
            $_SESSION['current_order'] = [
                'id' => $order_id,
                'service_name' => $service['name'],
                'link' => $link,
                'amount' => $amount,
                'price' => $price
            ];
            
            $message = 'Sifariş uğurla yaradıldı! İndi ödəniş edə bilərsiniz.';
            
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
    }
}

// Get current order from session
if (isset($_SESSION['current_order'])) {
    $order_data = $_SESSION['current_order'];
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Ödəniş</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .payment-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .order-summary {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            margin-bottom: 30px;
        }
        .payment-methods {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .payment-method {
            background: white;
            padding: 25px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .payment-method:hover {
            border-color: #007bff;
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .payment-method.selected {
            border-color: #28a745;
            background: #f8fff9;
        }
        .payment-icon {
            font-size: 3rem;
            margin-bottom: 15px;
        }
        .portmanat-icon {
            color: #f15b5c;
        }
        .card-icon {
            color: #007bff;
        }
        .crypto-icon {
            color: #ffc107;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <!-- Header -->
        <div class="text-center mb-4">
            <h1><i class="fas fa-credit-card text-primary"></i> SMM Panel Ödəniş</h1>
            <p class="lead">Sifarişinizi təsdiqləyin və ödəniş metodunu seçin</p>
        </div>

        <!-- Messages -->
        <?php if ($message): ?>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <?php echo $message; ?>
            </div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <!-- Order Summary -->
        <?php if ($order_data): ?>
        <div class="order-summary">
            <h4><i class="fas fa-shopping-cart"></i> Sifariş Məlumatları</h4>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order_data['service_name']); ?></p>
                    <p><strong>Link:</strong> <?php echo htmlspecialchars($order_data['link']); ?></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Miqdar:</strong> <?php echo number_format($order_data['amount']); ?> ədəd</p>
                    <p><strong>Qiymət:</strong> <span class="text-primary fw-bold"><?php echo number_format($order_data['price'], 2); ?> ₼</span></p>
                </div>
            </div>
            <div class="text-center mt-3">
                <small class="text-muted">
                    <i class="fas fa-info-circle"></i> 
                    Sifariş ID: #<?php echo $order_data['id']; ?>
                </small>
            </div>
        </div>

        <!-- Payment Methods -->
        <div class="payment-methods">
            <!-- Portmanat -->
            <div class="payment-method" onclick="selectPaymentMethod('portmanat')" id="portmanat-method">
                <div class="payment-icon portmanat-icon">
                    <i class="fas fa-mobile-alt"></i>
                </div>
                <h5>Portmanat</h5>
                <p class="text-muted">Mobil ödəniş</p>
                <small class="text-success">
                    <i class="fas fa-check"></i> Təhlükəsiz
                </small>
            </div>

            <!-- Bank Card -->
            <div class="payment-method" onclick="selectPaymentMethod('card')" id="card-method">
                <div class="payment-icon card-icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <h5>Bank Kartı</h5>
                <p class="text-muted">Visa, MasterCard</p>
                <small class="text-success">
                    <i class="fas fa-check"></i> Təhlükəsiz
                </small>
            </div>

            <!-- Crypto -->
            <div class="payment-method" onclick="selectPaymentMethod('crypto')" id="crypto-method">
                <div class="payment-icon crypto-icon">
                    <i class="fab fa-bitcoin"></i>
                </div>
                <h5>Kripto Valyuta</h5>
                <p class="text-muted">Bitcoin, Ethereum</p>
                <small class="text-warning">
                    <i class="fas fa-clock"></i> Tezliklə
                </small>
            </div>
        </div>

        <!-- Payment Form -->
        <div class="mt-4" id="payment-form" style="display: none;">
            <div class="card">
                <div class="card-header">
                    <h5 id="payment-form-title">Ödəniş</h5>
                </div>
                <div class="card-body">
                    <div id="portmanat-form" style="display: none;">
                        <p>Portmanat ilə ödəniş üçün aşağıdakı düyməni basın:</p>
                        <form action="process_payment.php" method="POST">
                            <input type="hidden" name="payment_method" value="portmanat">
                            <input type="hidden" name="order_id" value="<?php echo $order_data['id']; ?>">
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-mobile-alt"></i> Portmanat ilə Ödə
                                </button>
                            </div>
                        </form>
                    </div>
                    
                    <div id="card-form" style="display: none;">
                        <p>Bank kartı ilə ödəniş üçün aşağıdakı düyməni basın:</p>
                        <form action="process_payment.php" method="POST">
                            <input type="hidden" name="payment_method" value="card">
                            <input type="hidden" name="order_id" value="<?php echo $order_data['id']; ?>">
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-credit-card"></i> Bank Kartı ilə Ödə
                                </button>
                            </div>
                        </form>
                    </div>
                    
                    <div id="crypto-form" style="display: none;">
                        <div class="alert alert-warning">
                            <i class="fas fa-exclamation-triangle"></i>
                            Kripto valyuta ilə ödəniş tezliklə əlçatan olacaq.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php else: ?>
        <!-- No Order Data -->
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> 
            Sifariş məlumatları tapılmadı. Zəhmət olmasa <a href="index.php">ana səhifəyə qayıdın</a> və sifariş edin.
        </div>
        <?php endif; ?>

        <!-- Back Button -->
        <div class="text-center mt-4">
            <a href="index.php" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left"></i> Ana Səhifəyə Qayıt
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let selectedMethod = '';

        function selectPaymentMethod(method) {
            // Remove previous selection
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('selected');
            });
            
            // Add selection to clicked method
            document.getElementById(method + '-method').classList.add('selected');
            
            // Show payment form
            document.getElementById('payment-form').style.display = 'block';
            
            // Hide all form types
            document.getElementById('portmanat-form').style.display = 'none';
            document.getElementById('card-form').style.display = 'none';
            document.getElementById('crypto-form').style.display = 'none';
            
            // Show selected form type
            if (method === 'portmanat') {
                document.getElementById('portmanat-form').style.display = 'block';
                document.getElementById('payment-form-title').textContent = 'Portmanat Ödəniş';
            } else if (method === 'card') {
                document.getElementById('card-form').style.display = 'block';
                document.getElementById('payment-form-title').textContent = 'Bank Kartı Ödəniş';
            } else if (method === 'crypto') {
                document.getElementById('crypto-form').style.display = 'block';
                document.getElementById('payment-form-title').textContent = 'Kripto Valyuta Ödəniş';
            }
            
            selectedMethod = method;
        }
    </script>
</body>
</html>