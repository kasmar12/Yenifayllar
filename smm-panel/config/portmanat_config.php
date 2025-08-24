<?php
/**
 * Portmanat API Configuration
 * Bu faylı öz Portmanat API məlumatlarınızla yeniləyin
 */

// Portmanat API Credentials
define('PORTMANAT_MERCHANT_ID', '195'); // Öz merchant ID-nizi yazın
define('PORTMANAT_SECRET_KEY', 'YOUR_SECRET_KEY_HERE'); // Öz secret key-inizi yazın

// API URLs
define('PORTMANAT_API_URL', 'https://partners.portmanat.az/api');
define('PORTMANAT_PAYMENT_URL', 'https://portmanat.az/payment');

// Debug Mode (development üçün true, production üçün false)
define('PORTMANAT_DEBUG_MODE', true);

// Test Mode (test ödənişləri üçün)
define('PORTMANAT_TEST_MODE', false);

// Default Language
define('PORTMANAT_DEFAULT_LANGUAGE', 'az');

// Default Currency
define('PORTMANAT_DEFAULT_CURRENCY', 'AZN');

// Timeout Settings
define('PORTMANAT_TIMEOUT', 30);
define('PORTMANAT_CONNECT_TIMEOUT', 10);

// SSL Settings
define('PORTMANAT_SSL_VERIFY', false); // Development üçün false, production üçün true

// Logging
define('PORTMANAT_LOG_ENABLED', true);
define('PORTMANAT_LOG_FILE', '../logs/portmanat_api.log');

// Callback Settings
define('PORTMANAT_CALLBACK_TIMEOUT', 10); // Callback timeout in seconds

// Error Messages
define('PORTMANAT_ERROR_MESSAGES', [
    'invalid_merchant' => 'Yanlış merchant ID',
    'invalid_signature' => 'Yanlış imza',
    'insufficient_balance' => 'Kifayət qədər balans yoxdur',
    'invalid_amount' => 'Yanlış məbləğ',
    'invalid_currency' => 'Yanlış valyuta',
    'invalid_order_id' => 'Yanlış sifariş ID',
    'duplicate_order' => 'Təkrarlanan sifariş',
    'service_unavailable' => 'Xidmət müvəqqəti əlçatan deyil',
    'network_error' => 'Şəbəkə xətası',
    'timeout_error' => 'Vaxt aşımı xətası'
]);

// Success Messages
define('PORTMANAT_SUCCESS_MESSAGES', [
    'payment_created' => 'Ödəniş uğurla yaradıldı',
    'payment_completed' => 'Ödəniş tamamlandı',
    'payment_verified' => 'Ödəniş təsdiqləndi'
]);

// Status Codes
define('PORTMANAT_STATUS_CODES', [
    'pending' => 'Gözləyir',
    'processing' => 'İşlənir',
    'completed' => 'Tamamlandı',
    'failed' => 'Uğursuz',
    'cancelled' => 'Ləğv edildi',
    'expired' => 'Vaxtı keçdi',
    'refunded' => 'Geri qaytarıldı'
]);

// API Endpoints
define('PORTMANAT_ENDPOINTS', [
    'create_payment' => '/create-payment',
    'check_payment' => '/check-payment',
    'payment_history' => '/payment-history',
    'balance' => '/balance',
    'test_connection' => '/test'
]);

// Validation Rules
define('PORTMANAT_VALIDATION_RULES', [
    'min_amount' => 0.01,
    'max_amount' => 10000.00,
    'min_order_id_length' => 3,
    'max_order_id_length' => 50,
    'max_description_length' => 255,
    'allowed_currencies' => ['AZN', 'USD', 'EUR'],
    'allowed_languages' => ['az', 'en', 'ru']
]);

// Rate Limiting
define('PORTMANAT_RATE_LIMITS', [
    'requests_per_minute' => 60,
    'requests_per_hour' => 1000,
    'max_concurrent_requests' => 10
]);

// Security
define('PORTMANAT_SECURITY', [
    'signature_algorithm' => 'MD5',
    'signature_expiry' => 300, // 5 minutes
    'ip_whitelist_enabled' => false,
    'ip_whitelist' => [],
    'callback_verification' => true
]);

// Notification Settings
define('PORTMANAT_NOTIFICATIONS', [
    'email_enabled' => false,
    'sms_enabled' => false,
    'webhook_enabled' => true,
    'retry_attempts' => 3,
    'retry_delay' => 5 // seconds
]);

// Development Tools
define('PORTMANAT_DEV_TOOLS', [
    'mock_responses' => false,
    'log_requests' => true,
    'log_responses' => true,
    'performance_monitoring' => true,
    'error_reporting' => true
]);

// Include this file in your main application
// require_once 'config/portmanat_config.php';
?>