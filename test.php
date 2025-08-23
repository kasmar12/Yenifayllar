<?php
require_once 'config.php';
require_once 'bot.php';

echo "🧪 Bot Test Edilir...\n\n";

try {
    $bot = new TelegramBot(BOT_TOKEN);
    
    // Bot məlumatlarını al
    $me = $bot->getMe();
    if ($me['ok']) {
        echo "✅ Bot məlumatları:\n";
        echo "ID: " . $me['result']['id'] . "\n";
        echo "Ad: " . $me['result']['first_name'] . "\n";
        echo "Username: @" . $me['result']['username'] . "\n";
        echo "Can join groups: " . ($me['result']['can_join_groups'] ? 'Bəli' : 'Xeyr') . "\n";
        echo "Can read all group messages: " . ($me['result']['can_read_all_group_messages'] ? 'Bəli' : 'Xeyr') . "\n\n";
    } else {
        echo "❌ Bot məlumatları alına bilmədi: " . $me['description'] . "\n";
    }
    
    // Webhook statusunu yoxla
    $webhookInfo = $bot->makeRequest('getWebhookInfo');
    if ($webhookInfo['ok']) {
        echo "🔗 Webhook məlumatları:\n";
        echo "URL: " . ($webhookInfo['result']['url'] ?: 'Quraşdırılmayıb') . "\n";
        echo "Pending updates: " . $webhookInfo['result']['pending_update_count'] . "\n";
        echo "Last error: " . ($webhookInfo['result']['last_error_message'] ?: 'Xəta yoxdur') . "\n\n";
    }
    
    echo "🎯 Test tamamlandı!\n";
    
} catch (Exception $e) {
    echo "❌ Test zamanı xəta baş verdi: " . $e->getMessage() . "\n";
}
?>