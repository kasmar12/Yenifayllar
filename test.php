<?php
// Test file to verify system configuration
require_once 'config.php';

echo "<h1>SMM Sipariş Sistemi - Test Sayfası</h1>";
echo "<h2>Konfigürasyon Bilgileri</h2>";

echo "<p><strong>API Endpoint:</strong> " . $API_ENDPOINT . "</p>";
echo "<p><strong>API Key:</strong> " . (empty($API_KEY) ? "AYARLANMAMIŞ" : "AYARLANDI") . "</p>";
echo "<p><strong>Servis ID:</strong> " . $SERVICE_ID . "</p>";
echo "<p><strong>Servis Adı:</strong> " . $CURRENT_SERVICE_NAME . "</p>";

echo "<h2>Sistem Kontrolleri</h2>";

// Check PHP version
echo "<p><strong>PHP Sürümü:</strong> " . PHP_VERSION . " ";
if (version_compare(PHP_VERSION, '7.0.0') >= 0) {
    echo "✅ Uygun";
} else {
    echo "❌ PHP 7.0+ gerekli";
}
echo "</p>";

// Check cURL extension
echo "<p><strong>cURL Extension:</strong> ";
if (extension_loaded('curl')) {
    echo "✅ Yüklü";
} else {
    echo "❌ Yüklü değil";
}
echo "</p>";

// Check if config file is readable
echo "<p><strong>Config Dosyası:</strong> ";
if (is_readable('config.php')) {
    echo "✅ Okunabilir";
} else {
    echo "❌ Okunamıyor";
}
echo "</p>";

// Test API connectivity (if API key is set)
if (!empty($API_KEY) && $API_KEY !== "your_api_key_here") {
    echo "<h2>API Bağlantı Testi</h2>";
    
    $testData = [
        'service_id' => $SERVICE_ID,
        'username' => 'test_user',
        'link' => 'https://example.com/test',
        'quantity' => 1
    ];
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $API_ENDPOINT);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($testData));
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Authorization: Bearer ' . $API_KEY
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    
    if ($error) {
        echo "<p><strong>cURL Hatası:</strong> " . $error . "</p>";
    } else {
        echo "<p><strong>HTTP Kodu:</strong> " . $httpCode . "</p>";
        echo "<p><strong>API Yanıtı:</strong> " . htmlspecialchars($response) . "</p>";
    }
} else {
    echo "<h2>API Testi</h2>";
    echo "<p>⚠️ API anahtarı ayarlanmadığı için test yapılamıyor.</p>";
    echo "<p>Test yapmak için <code>config.php</code> dosyasında API anahtarınızı ayarlayın.</p>";
}

echo "<h2>Sonraki Adımlar</h2>";
echo "<ol>";
echo "<li>Ana sayfayı açmak için <a href='index.php'>buraya tıklayın</a></li>";
echo "<li>API anahtarınızı <code>config.php</code> dosyasında ayarlayın</li>";
echo "<li>Farklı servisler için <code>SERVICE_ID</code> değerini değiştirin</li>";
echo "<li>Formu test edin</li>";
echo "</ol>";

echo "<p><em>Bu test dosyası sadece geliştirme amaçlıdır. Canlı ortamda kaldırın.</em></p>";
?>