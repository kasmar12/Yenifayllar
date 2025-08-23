<?php
require_once 'config.php';
require_once 'bot.php';

echo "🤖 Telegram Bot Quraşdırılır...\n\n";

try {
    $bot = new TelegramBot(BOT_TOKEN);
    
    // Bot məlumatlarını yoxla
    $me = $bot->getMe();
    if ($me['ok']) {
        echo "✅ Bot uğurla qoşuldu!\n";
        echo "Bot adı: " . $me['result']['first_name'] . "\n";
        echo "Bot username: @" . $me['result']['username'] . "\n\n";
    } else {
        echo "❌ Bot token yanlışdır!\n";
        exit;
    }
    
    // Webhook quraşdır (əgər public domain varsa)
    if (defined('TEST_MODE') && TEST_MODE) {
        echo "🔄 Test rejimində webhook quraşdırılmayacaq\n";
        echo "Local test üçün polling istifadə edin: php polling.php\n\n";
    } else {
        $webhook = $bot->setWebhook(WEBHOOK_URL);
        if ($webhook['ok']) {
            echo "✅ Webhook uğurla quraşdırıldı!\n";
            echo "Webhook URL: " . WEBHOOK_URL . "\n\n";
        } else {
            echo "❌ Webhook quraşdırıla bilmədi: " . $webhook['description'] . "\n";
            echo "Local test üçün polling istifadə edin: php polling.php\n\n";
        }
    }
    
    echo "🎉 Bot hazırdır! İndi Telegram-da /start yazaraq test edə bilərsiniz.\n";
    
} catch (Exception $e) {
    echo "❌ Xəta baş verdi: " . $e->getMessage() . "\n";
}
?>