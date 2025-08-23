<?php
class TelegramBot {
    private $token;
    private $apiUrl = 'https://api.telegram.org/bot';

    public function __construct($token) {
        $this->token = $token;
    }

    // Telegram-dan gələn məlumatları emal et
    public function handleUpdate($update) {
        if (isset($update['message'])) {
            $this->handleMessage($update['message']);
        } elseif (isset($update['callback_query'])) {
            $this->handleCallbackQuery($update['callback_query']);
        }
    }

    // Mesajları emal et
    private function handleMessage($message) {
        $chatId = $message['chat']['id'];
        $text = $message['text'] ?? '';

        if ($text === '/start') {
            $this->sendStartMessage($chatId);
        }
    }

    // Callback query-ləri emal et (button click)
    private function handleCallbackQuery($callbackQuery) {
        $chatId = $callbackQuery['message']['chat']['id'];
        $data = $callbackQuery['data'];

        if ($data === 'open_website') {
            $this->sendWebsiteMessage($chatId);
        }
    }

    // /start komandası üçün mesaj göndər
    private function sendStartMessage($chatId) {
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

        $message = "👋 Salam! Mən sizin Telegram botunuzam.\n\n";
        $message .= "Aşağıdakı button-a basaraq vebsaytı aça bilərsiniz:";

        $this->sendMessage($chatId, $message, $keyboard);
    }

    // Vebsayt mesajını göndər
    private function sendWebsiteMessage($chatId) {
        $message = "🔗 Vebsayt linki:\n\n";
        $message .= WEBSITE_URL . "\n\n";
        $message .= "Bu linkə daxil olaraq vebsaytı görə bilərsiniz.";

        $this->sendMessage($chatId, $message);
    }

    // Telegram API vasitəsilə mesaj göndər
    private function sendMessage($chatId, $text, $replyMarkup = null) {
        $data = [
            'chat_id' => $chatId,
            'text' => $text,
            'parse_mode' => 'HTML'
        ];

        if ($replyMarkup) {
            $data['reply_markup'] = json_encode($replyMarkup);
        }

        $this->makeRequest('sendMessage', $data);
    }

    // Telegram API-yə sorğu göndər
    private function makeRequest($method, $data = []) {
        $url = $this->apiUrl . $this->token . '/' . $method;
        
        // GET sorğuları üçün
        if (empty($data)) {
            $result = file_get_contents($url);
            return json_decode($result, true);
        }
        
        // POST sorğuları üçün
        $options = [
            'http' => [
                'header' => "Content-type: application/x-www-form-urlencoded\r\n",
                'method' => 'POST',
                'content' => http_build_query($data),
                'timeout' => 30
            ]
        ];

        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        if ($result === false) {
            return ['ok' => false, 'description' => 'Network error'];
        }

        return json_decode($result, true);
    }

    // Webhook quraşdır
    public function setWebhook($url) {
        return $this->makeRequest('setWebhook', ['url' => $url]);
    }

    // Webhook sil
    public function deleteWebhook() {
        return $this->makeRequest('deleteWebhook');
    }

    // Bot məlumatlarını al
    public function getMe() {
        return $this->makeRequest('getMe');
    }
}
?>