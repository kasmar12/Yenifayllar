<?php
/**
 * Link Shortener Service Configuration
 * 
 * This file contains configuration for the ad-based link shortener service
 * that will be used to verify user engagement before processing orders.
 */

// Link Shortener Service Configuration
define('LINK_SHORTENER_ENABLED', true);

// Service Type: 'linkvertise', 'ouo', 'aylive', 'custom'
define('LINK_SHORTENER_SERVICE', 'aylive');

// API Configuration for different services
switch (LINK_SHORTENER_SERVICE) {
    case 'aylive':
        // AY.Live API Configuration
        define('SHORTENER_API_URL', 'https://ay.live/st/');
        define('SHORTENER_API_KEY', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab');
        define('SHORTENER_CALLBACK_URL', 'http://192.168.100.184:8080/public/shortener_callback.php');
        
        // AY.Live specific settings
        define('AYLIVE_CALLBACK_PARAM', 'callback');
        define('AYLIVE_ORDER_ID_PARAM', 'order_id');
        break;
        
    case 'linkvertise':
        // Linkvertise API Configuration
        define('SHORTENER_API_URL', 'https://api.linkvertise.com/');
        define('SHORTENER_API_KEY', 'YOUR_LINKVERTISE_API_KEY');
        define('SHORTENER_CALLBACK_URL', 'http://192.168.100.184:8080/public/shortener_callback.php');
        break;
        
    case 'ouo':
        // OUO.io API Configuration
        define('SHORTENER_API_URL', 'https://ouo.io/api/');
        define('SHORTENER_API_KEY', 'YOUR_OUO_API_KEY');
        define('SHORTENER_CALLBACK_URL', 'http://192.168.100.184:8080/public/shortener_callback.php');
        break;
        
    default:
        // Custom/Default Configuration
        define('SHORTENER_API_URL', 'https://ay.live/api/');
        define('SHORTENER_API_KEY', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab');
        define('SHORTENER_CALLBACK_URL', 'http://192.168.100.184:8080/public/shortener_callback.php');
        break;
}

// Order Processing Configuration
define('ORDER_AUTO_COMPLETE_AFTER_AD', true); // Automatically complete order after ad verification
define('ORDER_PENDING_TIMEOUT', 3600); // 1 hour timeout for pending orders

// Logging Configuration
define('SHORTENER_LOG_ENABLED', true);
define('SHORTENER_LOG_FILE', '../logs/shortener_log.txt');

// Debug Mode
define('SHORTENER_DEBUG_MODE', true);

// Ad Verification Settings
define('AD_VERIFICATION_REQUIRED', true);
define('AD_VERIFICATION_TIMEOUT', 300); // 5 minutes timeout for ad verification

// Notification Settings
define('SEND_NOTIFICATION_ON_AD_COMPLETE', true);
define('SEND_NOTIFICATION_ON_ORDER_COMPLETE', true);
?>