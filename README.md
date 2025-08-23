# 🤖 Telegram Bot - Vebsayt Link Bot

Bu Telegram bot /start komandası yazdıqda button göstərir və button-a basanda vebsayt linkini göndərir.

## ✨ Xüsusiyyətlər

- `/start` komandası ilə salam mesajı
- Vebsaytı açmaq üçün button
- PHP ilə yazılıb
- Webhook dəstəyi
- Test üçün https://gogole.cok linki

## 🚀 Quraşdırma

### 1. Bot Token Alın
1. Telegram-da [@BotFather](https://t.me/botfather) ilə danışın
2. `/newbot` komandasını yazın
3. Bot adı və username verin
4. Alınan token-i `config.php` faylında `BOT_TOKEN` dəyişəninə yazın

### 2. Konfiqurasiya
`config.php` faylını redaktə edin:
```php
define('BOT_TOKEN', 'YOUR_BOT_TOKEN_HERE');
define('WEBHOOK_URL', 'https://your-domain.com/webhook.php');
define('WEBSITE_URL', 'https://gogole.cok');
```

### 3. Webhook Quraşdırın
```bash
php setup.php
```

### 4. Local Test (Polling)
```bash
php polling.php
```

### 5. Test Edin
```bash
php test.php
```

## 📁 Fayl Strukturu

- `config.php` - Bot konfiqurasiyası
- `bot.php` - Əsas bot klassi
- `webhook.php` - Telegram webhook endpoint
- `setup.php` - Bot quraşdırma
- `test.php` - Bot test

## 🔧 İstifadə

### Local Test (Polling)
1. Terminal-da `php polling.php` işə salın
2. Telegram-da botunuzu tapın: @azesmm_bot
3. `/start` yazın
4. "🌐 Vebsaytı Aç" buttonuna basın
5. Vebsayt linkini alın

### Webhook (Production)
1. Public HTTPS domain quraşdırın
2. `config.php`-də `TEST_MODE = false` edin
3. `php setup.php` işə salın

## 🌐 Webhook Tələbləri

- HTTPS dəstəyi
- Public domain
- PHP 7.4+

## 📝 Qeydlər

- Bot token-ini heç vaxt public etməyin
- Webhook URL-i HTTPS olmalıdır
- Test üçün https://gogole.cok istifadə olunub

## 🆘 Dəstək

Əgər problem varsa:
1. `test.php` faylını işə salın
2. Log fayllarını yoxlayın
3. Bot token-ini yoxlayın