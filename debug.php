<?php
require_once 'config.php';
require_once 'bot.php';

echo "🔍 Bot Debug Başladılır...\n\n";

try {
    $bot = new TelegramBot(BOT_TOKEN);
    
    echo "1️⃣ Bot obyekti yaradıldı\n";
    
    // Bot məlumatlarını yoxla
    echo "2️⃣ Bot məlumatları alınır...\n";
    $me = $bot->makeRequest('getMe');
    
    if ($me['ok']) {
        echo "✅ Bot məlumatları:\n";
        echo "   ID: " . $me['result']['id'] . "\n";
        echo "   Ad: " . $me['result']['first_name'] . "\n";
        echo "   Username: @" . $me['result']['username'] . "\n\n";
    } else {
        echo "❌ Bot məlumatları alına bilmədi:\n";
        echo "   Xəta: " . ($me['description'] ?? 'Naməlum xəta') . "\n\n";
    }
    
    // Son mesajları yoxla
    echo "3️⃣ Son mesajlar yoxlanılır...\n";
    $updates = $bot->makeRequest('getUpdates');
    
    if ($updates['ok']) {
        echo "✅ Updates alındı:\n";
        echo "   Sayı: " . count($updates['result']) . "\n";
        
        if (!empty($updates['result'])) {
            foreach ($updates['result'] as $i => $update) {
                echo "   Update " . ($i + 1) . ": ";
                if (isset($update['message'])) {
                    echo "Mesaj: " . ($update['message']['text'] ?? 'Mətn yoxdur') . "\n";
                } elseif (isset($update['callback_query'])) {
                    echo "Button click: " . $update['callback_query']['data'] . "\n";
                }
            }
        } else {
            echo "   Yeni mesaj yoxdur\n";
        }
    } else {
        echo "❌ Updates alına bilmədi:\n";
        echo "   Xəta: " . ($me['description'] ?? 'Naməlum xəta') . "\n";
    }
    
    echo "\n4️⃣ Test mesajı göndərilir...\n";
    
    // Test mesajı göndər (əgər chat_id bilinirsə)
    if (isset($updates['result'][0]['message']['chat']['id'])) {
        $chatId = $updates['result'][0]['message']['chat']['id'];
        echo "   Chat ID tapıldı: " . $chatId . "\n";
        
        $testMessage = $bot->makeRequest('sendMessage', [
            'chat_id' => $chatId,
            'text' => '🧪 Test mesajı - Bot işləyir!',
            'parse_mode' => 'HTML'
        ]);
        
        if ($testMessage['ok']) {
            echo "✅ Test mesajı göndərildi!\n";
        } else {
            echo "❌ Test mesajı göndərilə bilmədi: " . $testMessage['description'] . "\n";
        }
    } else {
        echo "   Chat ID tapılmadı - əvvəlcə bot-a mesaj göndərin\n";
    }
    
} catch (Exception $e) {
    echo "❌ Xəta baş verdi: " . $e->getMessage() . "\n";
    echo "   Fayl: " . $e->getFile() . "\n";
    echo "   Sətir: " . $e->getLine() . "\n";
}

echo "\n🔍 Debug tamamlandı!\n";
?>