<?php
session_start();
require_once '../config/database.php';
require_once '../config/portmanat_config.php';
require_once '../config/portmanat_api.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$payment_method = $_POST['payment_method'] ?? '';
$order_id = $_POST['order_id'] ?? '';

if (empty($payment_method) || empty($order_id)) {
    header('Location: payment.php?error=missing_data');
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception("Database connection failed");
    }
    
    // Get order details
    $query = "SELECT o.*, s.name as service_name FROM orders o 
              JOIN services s ON o.service_id = s.id 
              WHERE o.id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$order_id]);
    $order = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$order) {
        throw new Exception("Sifariş tapılmadı!");
    }

    if ($order['status'] !== 'pending') {
        throw new Exception("Sifariş artıq ödənilib!");
    }

    // Process payment based on method
    switch ($payment_method) {
        case 'portmanat':
            processPortmanatPayment($order, $db);
            break;
        case 'card':
            processCardPayment($order, $db);
            break;
        default:
            throw new Exception("Dəstəklənməyən ödəniş metodu!");
    }

} catch (Exception $e) {
    error_log("Payment processing error: " . $e->getMessage());
    header('Location: payment.php?error=payment_error&msg=' . urlencode($e->getMessage()));
    exit;
}

/**
 * Process Portmanat payment
 */
function processPortmanatPayment($order, $db) {
    try {
        $portmanat = new PortmanatAPI();
        
        // Use predefined callback URLs from config
        $callback_url = PORTMANAT_CALLBACK_URL;
        $return_url = PORTMANAT_RETURN_URL;

        $description = $order['service_name'] . ' - ' . number_format($order['amount']) . ' ədəd';

        // Log payment creation
        error_log("Creating Portmanat payment for order #{$order['id']}: Amount={$order['price']}, Callback=$callback_url");

        $payment = $portmanat->createPayment($order['price'], $order['id'], $callback_url, $description, '1');
        
        // Log payment response
        error_log("Portmanat payment response for order #{$order['id']}: " . json_encode($payment));
        
        if ($payment && isset($payment['success']) && $payment['success']) {
            // Payment token received successfully
            $token = $payment['token'] ?? null;
            
            if ($token) {
                // Save payment info with token
                $query = "INSERT INTO payments (transaction_id, amount, status) VALUES (?, ?, 'pending')";
                $stmt = $db->prepare($query);
                $stmt->execute([$token, $order['price']]);
                
                // Log successful token creation
                error_log("Payment token created successfully for order #{$order['id']}: Token=$token");
                
                // Create Portmanat checkout form
                createPortmanatCheckoutForm($payment['form_data']);
                exit;
            } else {
                throw new Exception("Ödəniş token-i alına bilmədi!");
            }
        } else {
            // Payment creation failed
            $error_msg = 'Portmanat ödənişi yaradıla bilmədi';
            if (isset($payment['error'])) {
                $error_msg .= ': ' . $payment['error'];
            }
            
            throw new Exception($error_msg);
        }
        
    } catch (Exception $e) {
        throw new Exception("Portmanat ödəniş xətası: " . $e->getMessage());
    }
}

/**
 * Process card payment
 */
function processCardPayment($order, $db) {
    // For now, redirect to a card payment page
    // This can be integrated with other payment gateways later
    header('Location: card_payment.php?order_id=' . $order['id']);
    exit;
}

/**
 * Create Portmanat checkout form
 */
function createPortmanatCheckoutForm($formData) {
    ?>
    <!DOCTYPE html>
    <html lang="az">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Portmanat Ödəniş</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .checkout-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
            }
            .portmanat-logo {
                text-align: center;
                margin-bottom: 30px;
            }
            .payment-form {
                background: #f8f9fa;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #dee2e6;
            }
            .form-info {
                background: #e9ecef;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .loading-spinner {
                text-align: center;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <div class="checkout-container">
            <div class="portmanat-logo">
                <h2><i class="fas fa-credit-card text-primary"></i> Portmanat Ödəniş</h2>
                <p class="text-muted">Təhlükəsiz ödəniş üçün Portmanat hesabınızla daxil olun</p>
            </div>
            
            <div class="payment-form">
                <div class="form-info">
                    <h6><i class="fas fa-info-circle"></i> Ödəniş Məlumatları</h6>
                    <p class="mb-1"><strong>Məbləğ:</strong> <?php echo $formData['amount']; ?> AZN</p>
                    <p class="mb-1"><strong>Sifariş ID:</strong> <?php echo $formData['order_id']; ?></p>
                    <p class="mb-0"><strong>Xidmət:</strong> SMM Panel</p>
                </div>
                
                <div class="loading-spinner">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Yüklənir...</span>
                    </div>
                    <p class="mt-2">Portmanat ödəniş səhifəsinə yönləndirilir...</p>
                </div>
                
                <form action="https://checkout.portmanat.az/create" method="POST" id="portmanatForm" style="display: none;">
                    <input type="hidden" name="payment_type" value="<?php echo $formData['payment_type']; ?>" />
                    <input type="hidden" name="service_id" value="<?php echo $formData['service_id']; ?>" />
                    <input type="hidden" name="order_id" value="<?php echo $formData['order_id']; ?>" />
                    <input type="hidden" name="token" value="<?php echo $formData['token']; ?>" />
                    <input type="hidden" name="amount" value="<?php echo $formData['amount']; ?>" />
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-credit-card"></i> Portmanat Hesab ilə ödə
                        </button>
                    </div>
                </form>
                
                <div class="text-center mt-3">
                    <small class="text-muted">
                        <i class="fas fa-shield-alt"></i> 
                        Ödəniş Portmanat tərəfindən təhlükəsiz şəkildə emal edilir
                    </small>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <a href="payment.php" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Geri qayıt
                </a>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Auto-submit form after 3 seconds
            setTimeout(function() {
                document.getElementById('portmanatForm').submit();
            }, 3000);
        </script>
    </body>
    </html>
    <?php
}
?>