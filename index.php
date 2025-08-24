<?php
// Include configuration
require_once 'config.php';

$message = '';
$message_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate and sanitize inputs
    $username = trim($_POST['username'] ?? '');
    $link = trim($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    $errors = [];
    
    // Validation
    if (empty($username)) {
        $errors[] = "Kullanıcı adı gereklidir";
    }
    
    if (empty($link)) {
        $errors[] = "Link gereklidir";
    } elseif (!filter_var($link, FILTER_VALIDATE_URL)) {
        $errors[] = "Geçerli bir link giriniz";
    }
    
    if ($quantity <= 0) {
        $errors[] = "Miktar 0'dan büyük olmalıdır";
    }
    
    if (empty($errors)) {
        // Prepare API request data
        $postData = [
            'service_id' => $SERVICE_ID,
            'username' => $username,
            'link' => $link,
            'quantity' => $quantity
        ];
        
        // Send request to API
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $API_ENDPOINT);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $API_KEY
        ]);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        
        if ($httpCode === 200) {
            $result = json_decode($response, true);
            if ($result && isset($result['success']) && $result['success']) {
                $message = "Sipariş başarıyla oluşturuldu! Sipariş ID: " . ($result['order_id'] ?? 'N/A');
                $message_type = 'success';
            } else {
                $message = "API hatası: " . ($result['message'] ?? 'Bilinmeyen hata');
                $message_type = 'error';
            }
        } else {
            $message = "API bağlantı hatası. HTTP Kodu: " . $httpCode;
            $message_type = 'error';
        }
    } else {
        $message = implode(', ', $errors);
        $message_type = 'error';
    }
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Sipariş Formu</title>
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
                font-size: 16px; /* Prevents zoom on iOS */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>SMM Sipariş Formu</h1>
            <p>Hızlı ve güvenli sipariş verin</p>
        </div>
        
        <div class="form-container">
            <?php if ($message): ?>
                <div class="message <?php echo $message_type; ?>">
                    <?php echo htmlspecialchars($message); ?>
                </div>
            <?php endif; ?>
            
            <div class="service-info">
                <strong>Mevcut Servis:</strong> <?php echo $CURRENT_SERVICE_NAME; ?>
                <div class="service-id">Servis ID: <?php echo $SERVICE_ID; ?></div>
            </div>
            
            <form method="POST" action="">
                <div class="form-group">
                    <label for="username">Kullanıcı Adı:</label>
                    <input type="text" id="username" name="username" 
                           value="<?php echo htmlspecialchars($_POST['username'] ?? ''); ?>"
                           placeholder="Kullanıcı adınızı giriniz" required>
                </div>
                
                <div class="form-group">
                    <label for="link">Link:</label>
                    <input type="text" id="link" name="link" 
                           value="<?php echo htmlspecialchars($_POST['link'] ?? ''); ?>"
                           placeholder="https://instagram.com/p/..." required>
                </div>
                
                <div class="form-group">
                    <label for="quantity">Miktar:</label>
                    <input type="number" id="quantity" name="quantity" 
                           value="<?php echo htmlspecialchars($_POST['quantity'] ?? ''); ?>"
                           min="1" placeholder="100" required>
                </div>
                
                <button type="submit" class="submit-btn">
                    Sipariş Ver
                </button>
            </form>
        </div>
    </div>
</body>
</html>