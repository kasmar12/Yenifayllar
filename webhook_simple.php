<?php
// Telegram Bot Webhook - Sadə versiya

// Bot token - öz token-inizi yazın
$bot_token = "6006598727:AAG8f3xW8FAIDF21lZUMI_Ajd5paYK8nAWE";

// Telegram-dan gələn məlumatları al
$update = json_decode(file_get_contents('php://input'), true);

if ($update) {
    // Mesaj varsa
    if (isset($update['message'])) {
        $message = $update['message'];
        $chat_id = $message['chat']['id'];
        $text = $message['text'] ?? '';
        
        // /start komandası
        if ($text === '/start') {
            $keyboard = [
                'inline_keyboard' => [
                    [
                        [
                            'text' => '🌐 Google Aç',
                            'web_app' => [
                                'url' => 'https://google.com'
                            ]
                        ]
                    ]
                ]
            ];
            
            $message_text = "👋 Salam! Mən sizin Telegram botunuzam.\n\n";
            $message_text .= "Aşağıdakı button-a basaraq Google-ı Telegram daxilində aça bilərsiniz:";
            
            sendMessage($chat_id, $message_text, $keyboard);
        }
    }
    
    // Web App açıldığında
    if (isset($update['web_app_data'])) {
        $web_app_data = $update['web_app_data'];
        $chat_id = $web_app_data['message']['chat']['id'];
        $data = $web_app_data['data'];
        
        $message_text = "✅ Vebsayt Telegram daxilində açıldı!\n\n";
        $message_text .= "İndi vebsaytı istifadə edə bilərsiniz.";
        
        sendMessage($chat_id, $message_text);
    }
}

// Telegram API vasitəsilə mesaj göndər
function sendMessage($chat_id, $text, $reply_markup = null) {
    global $bot_token;
    
    $data = [
        'chat_id' => $chat_id,
        'text' => $text,
        'parse_mode' => 'HTML'
    ];
    
    if ($reply_markup) {
        $data['reply_markup'] = json_encode($reply_markup);
    }
    
    $url = "https://api.telegram.org/bot{$bot_token}/sendMessage";
    
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

// Webhook status yoxlama
if (isset($_GET['status'])) {
    echo "✅ Webhook işləyir!";
}
?>