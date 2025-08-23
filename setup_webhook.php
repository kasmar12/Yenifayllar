<?php
// Webhook quraşdırma faylı
// Bu faylı bir dəfə işə salın

$bot_token = "6006598727:AAG8f3xW8FAIDF21lZUMI_Ajd5paYK8nAWE";
$webhook_url = "http://localhost/webhook.php"; // Local test üçün

echo "🤖 Telegram Bot Webhook Quraşdırılır...\n\n";

if ($bot_token === "YOUR_BOT_TOKEN_HERE") {
    echo "❌ Xəta: Əvvəlcə bot token-ini dəyişdirin!\n";
    echo "webhook.php faylında BOT_TOKEN dəyişənini yeniləyin.\n";
    exit;
}

// Bot məlumatlarını yoxla
echo "1️⃣ Bot məlumatları yoxlanılır...\n";
$url = "https://api.telegram.org/bot{$bot_token}/getMe";
$result = file_get_contents($url);
$response = json_decode($result, true);

if ($response['ok']) {
    echo "✅ Bot məlumatları:\n";
    echo "   ID: " . $response['result']['id'] . "\n";
    echo "   Ad: " . $response['result']['first_name'] . "\n";
    echo "   Username: @" . $response['result']['username'] . "\n\n";
} else {
    echo "❌ Bot məlumatları alına bilmədi: " . $response['description'] . "\n";
    exit;
}

// Webhook quraşdır
echo "2️⃣ Webhook quraşdırılır...\n";
$url = "https://api.telegram.org/bot{$bot_token}/setWebhook";
$data = ['url' => $webhook_url];

$options = [
    'http' => [
        'header' => "Content-type: application/x-www-form-urlencoded\r\n",
        'method' => 'POST',
        'content' => http_build_query($data)
    ]
];

$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

$response = json_decode($result, true);

if ($response['ok']) {
    echo "✅ Webhook uğurla quraşdırıldı!\n";
    echo "   URL: " . $webhook_url . "\n\n";
} else {
    echo "❌ Webhook quraşdırıla bilmədi: " . $response['description'] . "\n";
    echo "   Səbəb: Localhost üçün HTTPS tələb olunur\n\n";
}

echo "3️⃣ Test edin:\n";
echo "   - Telegram-da botunuzu tapın\n";
echo "   - /start yazın\n";
echo "   - Button-a basın\n\n";

echo "🎉 Quraşdırma tamamlandı!\n";
?>