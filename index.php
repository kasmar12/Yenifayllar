<?php
// Include configuration
require_once 'config.php';

session_start();

$message = '';
$message_type = '';
$order_data = null;

// Handle payment success callback
if (isset($_GET['payment_status']) && $_GET['payment_status'] === 'success') {
    if (isset($_SESSION['pending_order']) && isset($_SESSION['transaction_id'])) {
        $order_data = $_SESSION['pending_order'];
        $transaction_id = $_SESSION['transaction_id'];
        
        // Check payment status via Portmanat.az checkout API
        $status_url = $PAYMENT_STATUS_ENDPOINT . $transaction_id;
        
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => $status_url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'User-agent: Mozilla',
            ),
            CURLOPT_SSL_VERIFYPEER => false,
        ));
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);
        
        if ($error) {
            $message = "Ödəniş statusu yoxlanarkən cURL xətası: " . $error;
            $message_type = 'error';
        } elseif ($httpCode === 200) {
            $result = json_decode($response, true);
            
            // Debug: Log payment status response
            error_log("Payment Status Response: " . $response);
            
            if ($result && isset($result['status'])) {
                $payment_status = $result['status'];
                
                if ($payment_status === 'completed' || $payment_status === 'success' || $payment_status === 'paid') {
                    // Payment successful, now complete the SMM order
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $API_ENDPOINT . '/order');
                    curl_setopt($ch, CURLOPT_POST, true);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($order_data));
                    curl_setopt($ch, CURLOPT_HTTPHEADER, [
                        'Content-Type: application/json',
                        'Authorization: Bearer ' . $API_KEY,
                        'Accept: application/json'
                    ]);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    
                    $order_response = curl_exec($ch);
                    $order_http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                    curl_close($ch);
                    
                    if ($order_http_code === 200 || $order_http_code === 201) {
                        $order_result = json_decode($order_response, true);
                        if ($order_result && isset($order_result['success']) && $order_result['success']) {
                            $message = "Ödəniş uğurlu! SMM sifarişi tamamlandı. Sifariş ID: " . ($order_result['order_id'] ?? $order_result['id'] ?? 'N/A');
                            $message_type = 'success';
                            unset($_SESSION['pending_order'], $_SESSION['transaction_id']); // Clear session data
                        } else {
                            $message = "Ödəniş uğurlu amma SMM sifarişi xətası: " . ($order_result['message'] ?? 'Bilinməyən xəta');
                            $message_type = 'error';
                        }
                    } else {
                        $message = "Ödəniş uğurlu amma SMM API xətası. HTTP Kodu: " . $order_http_code;
                        $message_type = 'error';
                    }
                } else {
                    $message = "Ödəniş statusu: " . $payment_status . " - Sifariş tamamlanmadı";
                    $message_type = 'error';
                }
            } else {
                $message = "Ödəniş statusu dəqiqləşdirilə bilmədi. API cavabı: " . htmlspecialchars($response);
                $message_type = 'error';
            }
        } else {
            $message = "Ödəniş statusu yoxlanarkən xəta. HTTP Kodu: " . $httpCode;
            $message_type = 'error';
        }
    } else {
        $message = "Gözlənilən sifariş və ya transaction ID tapılmadı";
        $message_type = 'error';
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate and sanitize inputs
    $link = trim($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    $errors = [];
    
    // Validation
    if (empty($link)) {
        $errors[] = "Link tələb olunur";
    } elseif (!filter_var($link, FILTER_VALIDATE_URL)) {
        $errors[] = "Düzgün link daxil edin";
    }
    
    if ($quantity <= 0) {
        $errors[] = "Miqdar 0-dan böyük olmalıdır";
    }
    
    if (empty($errors)) {
        // Calculate price from configuration
        $total_price = $quantity * $PRICE_PER_UNIT;
        
        // Store order data in session for later use
        $_SESSION['pending_order'] = [
            'service_id' => $SERVICE_ID,
            'link' => $link,
            'quantity' => $quantity,
            'total_price' => $total_price
        ];
        
        // Create payment via Portmanat.az checkout API
        $payment_data = [
            'amount' => $total_price,
            'currency' => $CURRENCY,
            'description' => $CURRENT_SERVICE_NAME . ' - ' . $quantity . ' ədəd',
            'return_url' => $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . '?payment_status=success',
            'cancel_url' => $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'],
            'order_id' => uniqid('smm_'),
            'service_id' => $SERVICE_ID,
            'link' => $link,
            'quantity' => $quantity
        ];
        
        // Send payment request to Portmanat.az checkout API
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => $PAYMENT_ENDPOINT,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($payment_data),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                'Accept: application/json',
                'User-agent: Mozilla',
            ),
            CURLOPT_SSL_VERIFYPEER => false,
        ));
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);
        
        if ($error) {
            $message = "Ödəniş yaradılarkən xəta: " . $error;
            $message_type = 'error';
        } elseif ($httpCode === 200 || $httpCode === 201) {
            $result = json_decode($response, true);
            
            // Debug: Show API response for troubleshooting
            error_log("Portmanat.az Checkout API Response: " . $response);
            
            if ($result && isset($result['payment_url'])) {
                // Store transaction ID if available
                if (isset($result['transaction_id'])) {
                    $_SESSION['transaction_id'] = $result['transaction_id'];
                }
                // Redirect to payment page
                header('Location: ' . $result['payment_url']);
                exit;
            } elseif ($result && isset($result['redirect_url'])) {
                // Alternative redirect field
                if (isset($result['transaction_id'])) {
                    $_SESSION['transaction_id'] = $result['transaction_id'];
                }
                header('Location: ' . $result['redirect_url']);
                exit;
            } elseif ($result && isset($result['url'])) {
                // Another possible redirect field
                if (isset($result['transaction_id'])) {
                    $_SESSION['transaction_id'] = $result['transaction_id'];
                }
                header('Location: ' . $result['url']);
                exit;
            } elseif ($result && isset($result['checkout_url'])) {
                // Checkout URL field
                if (isset($result['transaction_id'])) {
                    $_SESSION['transaction_id'] = $result['transaction_id'];
                }
                header('Location: ' . $result['checkout_url']);
                exit;
            } elseif ($result && isset($result['payment_page'])) {
                // Payment page field
                if (isset($result['transaction_id'])) {
                    $_SESSION['transaction_id'] = $result['transaction_id'];
                }
                header('Location: ' . $result['payment_page']);
                exit;
            } else {
                // Show detailed error with API response
                $message = "Ödəniş yaradıldı amma yönləndirmə URL-i tapılmadı. ";
                $message .= "API cavabı: " . htmlspecialchars($response);
                $message_type = 'error';
                
                // Also show the result structure for debugging
                if ($result) {
                    $message .= "<br><br>API cavab strukturu:<br>";
                    $message .= "<pre>" . htmlspecialchars(json_encode($result, JSON_PRETTY_PRINT)) . "</pre>";
                }
            }
        } else {
            $message = "Ödəniş yaradılarkən API xətası. HTTP Kodu: " . $httpCode;
            if ($response) {
                $result = json_decode($response, true);
                if ($result && isset($result['message'])) {
                    $message .= " - " . $result['message'];
                }
                // Show full response for debugging
                $message .= "<br><br>Tam API cavabı:<br>";
                $message .= "<pre>" . htmlspecialchars($response) . "</pre>";
            }
            $message_type = 'error';
        }
    } else {
        $message = implode(', ', $errors);
        $message_type = 'error';
    }
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Sifariş və Ödəniş Sistemi - Portmanat.az</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 20px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 14px;
        }
        
        .form-container {
            padding: 30px 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
            font-size: 14px;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            background: #f8f9fa;
        }
        
        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            background: white;
        }
        
        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease;
        }
        
        .submit-btn:hover {
            transform: translateY(-2px);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .message {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .service-info {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
        
        .service-id {
            background: #667eea;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: 600;
            display: inline-block;
            margin-top: 5px;
        }
        
        .price-info {
            background: #e8f5e8;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #c3e6cb;
        }
        
        .price-info h3 {
            color: #155724;
            margin-bottom: 10px;
            font-size: 16px;
        }
        
        .price-calculator {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            background: white;
            border-radius: 8px;
        }
        
        .total-price {
            font-size: 18px;
            font-weight: 600;
            color: #667eea;
        }
        
        .payment-notice {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }
        
        .api-info {
            background: #e3f2fd;
            border: 1px solid #bbdefb;
            color: #1976d2;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 12px;
        }
        
        @media (max-width: 480px) {
            body {
                padding: 10px;
            }
            
            .container {
                border-radius: 15px;
            }
            
            .header {
                padding: 25px 15px;
            }
            
            .header h1 {
                font-size: 22px;
            }
            
            .form-container {
                padding: 25px 15px;
            }
            
            input[type="text"],
            input[type="number"] {
                padding: 12px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>SMM Sifariş və Ödəniş</h1>
            <p>Portmanat.az Checkout API ilə təhlükəsiz ödəniş</p>
        </div>
        
        <div class="form-container">
            <?php if ($message): ?>
                <div class="message <?php echo $message_type; ?>">
                    <?php echo $message; ?>
                </div>
            <?php endif; ?>
            
            <div class="service-info">
                <strong>Mövcud Xidmət:</strong> <?php echo $CURRENT_SERVICE_NAME; ?>
                <div class="service-id">Xidmət ID: <?php echo $SERVICE_ID; ?></div>
            </div>
            
            <div class="api-info">
                <strong>🔗 API:</strong> Portmanat.az Checkout API istifadə edilir
                <br><small>Debug: API cavabları error log-da saxlanılır</small>
            </div>
            
            <div class="payment-notice">
                <strong>💳 Ödəniş:</strong> Sifarişiniz Portmanat.az Checkout sistemi tərəfindən təhlükəsiz şəkildə emal ediləcək
            </div>
            
            <form method="POST" action="" id="orderForm">
                <div class="form-group">
                    <label for="link">Link:</label>
                    <input type="text" id="link" name="link" 
                           value="<?php echo htmlspecialchars($_POST['link'] ?? ''); ?>"
                           placeholder="https://instagram.com/p/..." required>
                </div>
                
                <div class="form-group">
                    <label for="quantity">Miqdar:</label>
                    <input type="number" id="quantity" name="quantity" 
                           value="<?php echo htmlspecialchars($_POST['quantity'] ?? '100'); ?>"
                           min="1" placeholder="100" required>
                </div>
                
                <div class="price-info">
                    <h3>💰 Qiymət Hesablaması</h3>
                    <div class="price-calculator">
                        <span>Vahid qiyməti:</span>
                        <span><?php echo $PRICE_PER_UNIT; ?> <?php echo $CURRENCY; ?></span>
                    </div>
                    <div class="price-calculator">
                        <span>Ümumi qiymət:</span>
                        <span class="total-price" id="totalPrice">1.00 <?php echo $CURRENCY; ?></span>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">
                    💳 Ödəniş Et və Sifariş Ver
                </button>
            </form>
        </div>
    </div>

    <script>
        // Real-time price calculation
        document.getElementById('quantity').addEventListener('input', function() {
            const quantity = parseInt(this.value) || 0;
            const pricePerUnit = <?php echo $PRICE_PER_UNIT; ?>;
            const totalPrice = (quantity * pricePerUnit).toFixed(2);
            document.getElementById('totalPrice').textContent = totalPrice + ' <?php echo $CURRENCY; ?>';
        });
        
        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const quantity = parseInt(document.getElementById('quantity').value);
            if (quantity <= 0) {
                e.preventDefault();
                alert('Miqdar 0-dan böyük olmalıdır');
                return false;
            }
        });
    </script>
</body>
</html>