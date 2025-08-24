<?php
// Test file to verify Portmanat.az API configuration
require_once 'config.php';

echo "<h1>SMM Sifariş və Ödəniş Sistemi - Test Səhifəsi</h1>";
echo "<h2>Portmanat.az API Konfiqurasiyası</h2>";

echo "<p><strong>API Base URL:</strong> " . $API_ENDPOINT . "</p>";
echo "<p><strong>Ödəniş Endpoint:</strong> " . $PAYMENT_ENDPOINT . "</p>";
echo "<p><strong>API Key:</strong> " . (empty($API_KEY) ? "AYARLANMAMIŞ" : "AYARLANDI") . "</p>";
echo "<p><strong>Valyuta:</strong> " . $CURRENCY . "</p>";
echo "<p><strong>Vahid Qiyməti:</strong> " . $PRICE_PER_UNIT . " " . $CURRENCY . "</p>";
echo "<p><strong>Xidmət ID:</strong> " . $SERVICE_ID . "</p>";
echo "<p><strong>Xidmət Adı:</strong> " . $CURRENT_SERVICE_NAME . "</p>";

echo "<h2>Sistem Yoxlamaları</h2>";

// Check PHP version
echo "<p><strong>PHP Versiyası:</strong> " . PHP_VERSION . " ";
if (version_compare(PHP_VERSION, '7.0.0') >= 0) {
    echo "✅ Uyğun";
} else {
    echo "❌ PHP 7.0+ tələb olunur";
}
echo "</p>";

// Check cURL extension
echo "<p><strong>cURL Extension:</strong> ";
if (extension_loaded('curl')) {
    echo "✅ Yüklü";
} else {
    echo "❌ Yüklü deyil";
}
echo "</p>";

// Check if config file is readable
echo "<p><strong>Config Faylı:</strong> ";
if (is_readable('config.php')) {
    echo "✅ Oxuna bilər";
} else {
    echo "❌ Oxuna bilmir";
}
echo "</p>";

// Check session support
echo "<p><strong>Session Dəstəyi:</strong> ";
if (function_exists('session_start')) {
    echo "✅ Mövcud";
} else {
    echo "❌ Mövcud deyil";
}
echo "</p>";

// Test API connectivity (if API key is set)
if (!empty($API_KEY) && $API_KEY !== "your_api_key_here") {
    echo "<h2>Portmanat.az API Bağlantı Testi</h2>";
    
    // Test services endpoint
    echo "<h3>1. Xidmətlər Endpoint Testi</h3>";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $API_ENDPOINT . '/services');
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $API_KEY,
        'Accept: application/json'
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    
    if ($error) {
        echo "<p><strong>cURL Xətası:</strong> " . $error . "</p>";
    } else {
        echo "<p><strong>HTTP Kodu:</strong> " . $httpCode . "</p>";
        echo "<p><strong>API Cavabı:</strong> " . htmlspecialchars($response) . "</p>";
    }
    
    // Test balance endpoint
    echo "<h3>2. Balans Endpoint Testi</h3>";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $API_ENDPOINT . '/balance');
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $API_KEY,
        'Accept: application/json'
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    
    if ($error) {
        echo "<p><strong>cURL Xətası:</strong> " . $error . "</p>";
    } else {
        echo "<p><strong>HTTP Kodu:</strong> " . $httpCode . "</p>";
        echo "<p><strong>API Cavabı:</strong> " . htmlspecialchars($response) . "</p>";
    }
    
    // Test payment endpoint (without creating actual payment)
    echo "<h3>3. Ödəniş Endpoint Testi (Bağlantı)</h3>";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $PAYMENT_ENDPOINT);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $API_KEY,
        'Accept: application/json'
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    
    if ($error) {
        echo "<p><strong>cURL Xətası:</strong> " . $error . "</p>";
    } else {
        echo "<p><strong>HTTP Kodu:</strong> " . $httpCode . "</p>";
        echo "<p><strong>Endpoint Cavabı:</strong> " . htmlspecialchars($response) . "</p>";
        
        // Parse and analyze the response
        if ($response) {
            $result = json_decode($response, true);
            if ($result) {
                echo "<h4>API Cavab Analizi:</h4>";
                echo "<p><strong>Mövcud sahələr:</strong></p>";
                echo "<ul>";
                foreach ($result as $key => $value) {
                    echo "<li><strong>$key:</strong> " . (is_string($value) ? htmlspecialchars($value) : json_encode($value)) . "</li>";
                }
                echo "</ul>";
                
                // Check for redirect URLs
                $redirectFields = ['payment_url', 'redirect_url', 'url', 'checkout_url', 'payment_page'];
                $foundRedirects = [];
                foreach ($redirectFields as $field) {
                    if (isset($result[$field])) {
                        $foundRedirects[] = $field . ': ' . $result[$field];
                    }
                }
                
                if (!empty($foundRedirects)) {
                    echo "<p><strong>✅ Yönləndirmə sahələri tapıldı:</strong></p>";
                    echo "<ul>";
                    foreach ($foundRedirects as $redirect) {
                        echo "<li>" . htmlspecialchars($redirect) . "</li>";
                    }
                    echo "</ul>";
                } else {
                    echo "<p><strong>❌ Heç bir yönləndirmə sahəsi tapılmadı</strong></p>";
                }
            }
        }
    }
    
    // Test order endpoint structure
    echo "<h3>4. Sifariş Endpoint Strukturu Testi</h3>";
    $testOrderData = [
        'service_id' => $SERVICE_ID,
        'link' => 'https://instagram.com/p/test',
        'quantity' => 100,
        'total_price' => 1.00
    ];
    echo "<p><strong>Test Sifariş Məlumatları:</strong></p>";
    echo "<pre>" . json_encode($testOrderData, JSON_PRETTY_PRINT) . "</pre>";
    
} else {
    echo "<h2>API Testi</h2>";
    echo "<p>⚠️ API açarı ayarlanmadığı üçün test edilə bilmir.</p>";
    echo "<p>Test etmək üçün <code>config.php</code> faylında API açarınızı təyin edin.</p>";
}

echo "<h2>Portmanat.az API Endpoint-ləri</h2>";
echo "<ul>";
echo "<li><strong>POST /api/order</strong> - Yeni sifariş yaratmaq</li>";
echo "<li><strong>GET /api/order/{id}</strong> - Sifariş statusunu almaq</li>";
echo "<li><strong>POST /api/payment</strong> - Ödəniş yaratmaq</li>";
echo "<li><strong>GET /api/services</strong> - Mövcud xidmətləri almaq</li>";
echo "<li><strong>GET /api/balance</strong> - Hesab balansını almaq</li>";
echo "</ul>";

echo "<h2>Sonrakı Addımlar</h2>";
echo "<ol>";
echo "<li>Ana səhifəni açmaq üçün <a href='index.php'>buraya klikləyin</a></li>";
echo "<li>API açarınızı <code>config.php</code> faylında təyin edin</li>";
echo "<li>Fərqli xidmətlər üçün <code>SERVICE_ID</code> dəyərini dəyişdirin</li>";
echo "<li>Formu test edin</li>";
echo "</ol>";

echo "<p><em>Bu test faylı yalnız inkişaf məqsədləri üçündür. Canlı mühitdə silin.</em></p>";
?>