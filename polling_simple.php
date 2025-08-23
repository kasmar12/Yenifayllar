<?php
// Bot token
$bot_token = "6006598727:AAG8f3xW8FAIDF21lZUMI_Ajd5paYK8nAWE";

// Telegram API URL
$api_url = "https://api.telegram.org/bot{$bot_token}";

echo "🔄 Bot Polling rejimində işləyir...\n";
echo "Bot: @azesmm_bot\n";
echo "Test üçün: https://gogole.cok\n";
echo "Durdurmaq üçün Ctrl+C basın\n\n";

$offset = 0;

while (true) {
    try {
        // Telegram-dan yeni mesajları al
        $updates = file_get_contents("{$api_url}/getUpdates?offset={$offset}&timeout=30");
        $updates_data = json_decode($updates, true);
        
        if ($updates_data['ok'] && !empty($updates_data['result'])) {
            foreach ($updates_data['result'] as $update) {
                $offset = $update['update_id'] + 1;
                
                // Mesaj varsa
                if (isset($update['message'])) {
                    $message = $update['message'];
                    $chat_id = $message['chat']['id'];
                    $text = $message['text'] ?? '';
                    
                    echo "📨 Mesaj alındı: {$text}\n";
                    
                    // /start komandası
                    if ($text === '/start') {
                        $keyboard = [
                            'inline_keyboard' => [
                                [
                                    [
                                        'text' => '🌐 Vebsaytı Aç',
                                        'callback_data' => 'open_website'
                                    ]
                                ]
                            ]
                        ];
                        
                        $message_text = "👋 Salam! Mən sizin Telegram botunuzam.\n\n";
                        $message_text .= "Aşağıdakı button-a basaraq vebsaytı aça bilərsiniz:";
                        
                        sendMessage($chat_id, $message_text, $keyboard);
                        echo "✅ /start mesajı göndərildi\n";
                    }
                }
                
                // Button click varsa
                if (isset($update['callback_query'])) {
                    $callback_query = $update['callback_query'];
                    $chat_id = $callback_query['message']['chat']['id'];
                    $data = $callback_query['data'];
                    
                    echo "🔘 Button click: {$data}\n";
                    
                    if ($data === 'open_website') {
                        $message_text = "🔗 Vebsayt linki:\n\n";
                        $message_text .= "https://gogole.cok\n\n";
                        $message_text .= "Bu linkə daxil olaraq vebsaytı görə bilərsiniz.";
                        
                        sendMessage($chat_id, $message_text);
                        echo "✅ Vebsayt linki göndərildi\n";
                    }
                }
            }
        }
        
        // CPU-nu az yüklə
        sleep(1);
        
    } catch (Exception $e) {
        echo "❌ Xəta: " . $e->getMessage() . "\n";
        sleep(5);
    }
}

// Telegram API vasitəsilə mesaj göndər
function sendMessage($chat_id, $text, $reply_markup = null) {
    global $api_url;
    
    $data = [
        'chat_id' => $chat_id,
        'text' => $text,
        'parse_mode' => 'HTML'
    ];
    
    if ($reply_markup) {
        $data['reply_markup'] = json_encode($reply_markup);
    }
    
    $url = "{$api_url}/sendMessage";
    
    $options = [
        'http' => [
            'header' => "Content-type: application/x-www-form-urlencoded\r\n",
            'method' => 'POST',
            'content' => http_build_query($data)
        ]
    ];
    
    $context = stream_context_create($options);
    file_get_contents($url, false, $context);
}
?>