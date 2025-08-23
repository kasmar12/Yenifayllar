<?php
require_once 'config.php';
require_once 'bot.php';

// Telegram-dan gələn məlumatları al
$update = json_decode(file_get_contents('php://input'), true);

if ($update) {
    $bot = new TelegramBot(BOT_TOKEN);
    $bot->handleUpdate($update);
}
?>