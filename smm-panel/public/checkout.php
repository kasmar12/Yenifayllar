<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Start output buffering to catch any output before headers
ob_start();

// Simple error handler
function handleError($error_type, $error_message, $file, $line) {
    error_log("Error [$error_type]: $error_message in $file on line $line");
    return true;
}

set_error_handler('handleError');

// Log the start of checkout process
error_log("Checkout process started for IP: " . ($_SERVER['REMOTE_ADDR'] ?? 'unknown'));

try {
    // Start session
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    
    // Include required files one by one to identify which one causes the error
    error_log("Loading database.php...");
    require_once '../config/database.php';
    error_log("Database.php loaded successfully");
    
    error_log("Loading portmanat_config.php...");
    require_once '../config/portmanat_config.php';
    error_log("Portmanat_config.php loaded successfully");
    
    error_log("Loading portmanat_api.php...");
    require_once '../config/portmanat_api.php';
    error_log("Portmanat_api.php loaded successfully");
    
} catch (Exception $e) {
    error_log("Critical error in checkout.php: " . $e->getMessage());
    error_log("Stack trace: " . $e->getTraceAsString());
    
    // Clear any output buffer
    ob_end_clean();
    
    // Redirect with error
    header('Location: index.php?error=system_error&msg=' . urlencode('System error occurred. Please try again.'));
    exit;
} catch (Error $e) {
    error_log("Fatal error in checkout.php: " . $e->getMessage());
    error_log("Stack trace: " . $e->getTraceAsString());
    
    // Clear any output buffer
    ob_end_clean();
    
    // Redirect with error
    header('Location: index.php?error=system_error&msg=' . urlencode('Fatal error occurred. Please try again.'));
    exit;
}

// Check if it's a POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.php');
    exit;
}

// Validate input data
$service_id = $_POST['service_id'] ?? '';
$link = $_POST['link'] ?? '';
$amount = $_POST['amount'] ?? '';

if (empty($service_id) || empty($link) || empty($amount)) {
    header('Location: index.php?error=missing_data');
    exit;
}

error_log("Input validation passed: service_id=$service_id, link=$link, amount=$amount");

// Validate amount
try {
    error_log("Creating database connection...");
    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception("Database connection failed");
    }
    error_log("Database connection successful");
    
    $query = "SELECT * FROM services WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$service_id]);
    $service = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$service) {
        header('Location: index.php?error=invalid_service');
        exit;
    }

    if ($amount < $service['min_amount'] || $amount > $service['max_amount']) {
        header('Location: index.php?error=invalid_amount');
        exit;
    }
    
    error_log("Service validation passed: " . $service['name']);
    
} catch (Exception $e) {
    error_log("Database error in checkout.php: " . $e->getMessage());
    header('Location: index.php?error=database_error&msg=' . urlencode('Database error occurred. Please try again.'));
    exit;
}

// Calculate price
$price = ($amount / 1000) * $service['price_per_1k'];
error_log("Price calculated: $price");

// Create order in database
try {
    error_log("Creating order in database...");
    $query = "INSERT INTO orders (service_id, link, amount, price, status) VALUES (?, ?, ?, ?, 'pending')";
    $stmt = $db->prepare($query);
    $result = $stmt->execute([$service_id, $link, $amount, $price]);
    
    if (!$result) {
        throw new Exception("Failed to create order in database");
    }
    
    $order_id = $db->lastInsertId();
    
    if (!$order_id) {
        throw new Exception("Failed to get order ID from database");
    }
    
    error_log("Order created successfully: ID=$order_id, Service=$service_id, Amount=$amount, Price=$price");
    
} catch (Exception $e) {
    error_log("Order creation error in checkout.php: " . $e->getMessage());
    header('Location: index.php?error=order_creation_failed&msg=' . urlencode('Failed to create order. Please try again.'));
    exit;
}

// Create Portmanat payment
try {
    error_log("Creating Portmanat API instance...");
    $portmanat = new PortmanatAPI();
    error_log("Portmanat API instance created successfully");
    
    // Use predefined callback URLs from config
    $callback_url = PORTMANAT_CALLBACK_URL;
    $return_url = PORTMANAT_RETURN_URL;

    $description = $service['name'] . ' - ' . number_format($amount) . ' ədəd';

    // Log order creation
    error_log("Creating Portmanat payment for order #$order_id: Service=$service_id, Amount=$amount, Price=$price, Callback=$callback_url");

    $payment = $portmanat->createPayment($price, $order_id, $callback_url, $description, '1');
    
    // Log payment response
    error_log("Portmanat payment response for order #$order_id: " . json_encode($payment));
    
    if ($payment && isset($payment['success']) && $payment['success']) {
        // Payment token received successfully
        $token = $payment['token'] ?? null;
        
        if ($token) {
            // Save payment info with token
            $query = "INSERT INTO payments (transaction_id, amount, status) VALUES (?, ?, 'pending')";
            $stmt = $db->prepare($query);
            $stmt->execute([$token, $price]);
            
            // Log successful token creation
            error_log("Payment token created successfully for order #$order_id: Token=$token");
            
            // Create Portmanat checkout form
            $this->createPortmanatCheckoutForm($payment['form_data']);
            exit;
        } else {
            // No token in response
            error_log("No token in response for order #$order_id: " . json_encode($payment));
            header('Location: index.php?error=payment_id_missing&debug=' . urlencode(json_encode($payment)));
            exit;
        }
    } else {
        // Payment creation failed
        $error_msg = 'Payment creation failed';
        if (isset($payment['error'])) {
            $error_msg .= ': ' . $payment['error'];
        }
        
        // Log detailed error
        error_log("Payment creation failed for order #$order_id: " . json_encode($payment));
        
        // Include debug info in error message
        $debug_info = '';
        if (isset($payment['debug_info'])) {
            $debug_info = '&debug=' . urlencode(json_encode($payment['debug_info']));
        } elseif (isset($payment['extracted_info'])) {
            $debug_info = '&debug=' . urlencode(json_encode($payment['extracted_info']));
        }
        
        // Log detailed error for debugging
        error_log("Detailed payment error for order #$order_id: " . json_encode($payment));
        
        header('Location: index.php?error=payment_failed&msg=' . urlencode($error_msg) . $debug_info);
        exit;
    }
    
} catch (Exception $e) {
    // Exception occurred
    error_log("Exception during payment creation for order #$order_id: " . $e->getMessage());
    
    // Clear output buffer before redirect
    ob_end_clean();
    
    header('Location: index.php?error=payment_exception&msg=' . urlencode($e->getMessage()));
    exit;
} catch (Error $e) {
    // Fatal error occurred
    error_log("Fatal error during payment creation for order #$order_id: " . $e->getMessage());
    
    // Clear output buffer before redirect
    ob_end_clean();
    
    header('Location: index.php?error=payment_exception&msg=' . urlencode('Fatal error: ' . $e->getMessage()));
    exit;
}

// Clean up output buffer if we reach here
ob_end_flush();

/**
 * Create Portmanat checkout form
 * @param array $formData Form data for Portmanat
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
                
                <form action="https://checkout.portmanat.az/create" method="POST" id="portmanatForm">
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
                <a href="index.php" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Geri qayıt
                </a>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Auto-submit form after 2 seconds
            setTimeout(function() {
                document.getElementById('portmanatForm').submit();
            }, 2000);
        </script>
    </body>
    </html>
    <?php
}
?>