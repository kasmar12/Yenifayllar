<?php
require_once 'config.php';

// Initialize database connection
try {
    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES utf8mb4");
} catch(PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

$error = '';
$success = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $link = trim($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    $amount = floatval($_POST['amount'] ?? 0);
    
    // Basic validation
    if (empty($link)) {
        $error = 'Link/Username is required';
    } elseif ($quantity <= 0) {
        $error = 'Quantity must be greater than 0';
    } elseif ($amount <= 0) {
        $error = 'Amount must be greater than 0';
    } else {
        try {
            // Generate unique order ID
            $order_id = 'ORD_' . time() . '_' . rand(1000, 9999);
            
            // Save order to database
            $stmt = $pdo->prepare("INSERT INTO orders (order_id, link, quantity, amount, status) VALUES (?, ?, ?, ?, 'pending')");
            $stmt->execute([$order_id, $link, $quantity, $amount]);
            
            // Redirect to payment page
            header("Location: payment.php?order_id=" . $order_id);
            exit;
            
        } catch(PDOException $e) {
            $error = 'Failed to create order: ' . $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Order Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
        }
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .alert {
            border-radius: 10px;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-header text-center">
                        <h2 class="mb-0">
                            <i class="fas fa-chart-line me-2"></i>
                            SMM Panel
                        </h2>
                        <p class="mb-0 mt-2">Order Social Media Marketing Services</p>
                    </div>
                    <div class="card-body p-4">
                        <?php if ($error): ?>
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <?php echo htmlspecialchars($error); ?>
                            </div>
                        <?php endif; ?>
                        
                        <?php if ($success): ?>
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle me-2"></i>
                                <?php echo htmlspecialchars($success); ?>
                            </div>
                        <?php endif; ?>
                        
                        <form method="POST" action="">
                            <div class="mb-3">
                                <label for="link" class="form-label">
                                    <i class="fas fa-link me-2"></i>
                                    Link / Username
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="link" 
                                       name="link" 
                                       placeholder="https://instagram.com/username or @username"
                                       value="<?php echo htmlspecialchars($_POST['link'] ?? ''); ?>"
                                       required>
                                <div class="form-text">Enter the profile link or username for the service</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="quantity" class="form-label">
                                    <i class="fas fa-hashtag me-2"></i>
                                    Quantity
                                </label>
                                <input type="number" 
                                       class="form-control" 
                                       id="quantity" 
                                       name="quantity" 
                                       placeholder="1000"
                                       value="<?php echo htmlspecialchars($_POST['quantity'] ?? ''); ?>"
                                       min="1" 
                                       required>
                                <div class="form-text">Number of followers, likes, or views to order</div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="amount" class="form-label">
                                    <i class="fas fa-money-bill-wave me-2"></i>
                                    Amount (<?php echo CURRENCY; ?>)
                                </label>
                                <input type="number" 
                                       class="form-control" 
                                       id="amount" 
                                       name="amount" 
                                       placeholder="25.00"
                                       value="<?php echo htmlspecialchars($_POST['amount'] ?? ''); ?>"
                                       min="0.01" 
                                       step="0.01" 
                                       required>
                                <div class="form-text">Total amount to pay for the service</div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-shopping-cart me-2"></i>
                                    Order Now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="text-center mt-3">
                    <small class="text-white-50">
                        Secure payment powered by 
                        <i class="fas fa-shield-alt me-1"></i>
                        Portmanat.az
                    </small>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>