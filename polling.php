<?php
require_once 'config.php';
require_once 'bot.php';

echo "🔄 Bot Polling rejimində işləyir...\n";
echo "Bot: @" . BOT_USERNAME . "\n";
echo "Test üçün: https://gogole.cok\n";
echo "Durdurmaq üçün Ctrl+C basın\n\n";

$bot = new TelegramBot(BOT_TOKEN);
$offset = 0;

while (true) {
    try {
        // Telegram-dan yeni mesajları al
        $updates = $bot->makeRequest('getUpdates', [
            'offset' => $offset,
            'timeout' => 30
        ]);
        
        if ($updates['ok'] && !empty($updates['result'])) {
            foreach ($updates['result'] as $update) {
                $offset = $update['update_id'] + 1;
                $bot->handleUpdate($update);
                
                echo "📨 Mesaj emal edildi: " . date('H:i:s') . "\n";
            }
        }
        
        // CPU-nu az yüklə
        sleep(1);
        
    } catch (Exception $e) {
        echo "❌ Xəta: " . $e->getMessage() . "\n";
        sleep(5);
    }
}
?>