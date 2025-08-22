<?php
/**
 * Configuration file for SMM Panel Application
 * Loads environment variables and defines constants
 */

// Load environment variables from .env file
function loadEnv($path) {
    if (!file_exists($path)) {
        return false;
    }
    
    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos($line, '=') !== false && strpos($line, '#') !== 0) {
            list($key, $value) = explode('=', $line, 2);
            $key = trim($key);
            $value = trim($value, '"\'');
            
            if (!array_key_exists($key, $_ENV)) {
                $_ENV[$key] = $value;
            }
        }
    }
    return true;
}

// Load .env file
loadEnv(__DIR__ . '/../.env');

// SMM Panel API Configuration
define('SMM_API_KEY', $_ENV['SMM_API_KEY'] ?? 'your_smm_api_key_here');
define('SMM_API_URL', $_ENV['SMM_API_URL'] ?? 'https://smm-provider.com/api/v2');

// AY.Live API Configuration
define('AYLIVE_API_KEY', $_ENV['AYLIVE_API_KEY'] ?? 'your_aylive_api_key_here');

// Admin Credentials
define('ADMIN_USERNAME', $_ENV['ADMIN_USERNAME'] ?? 'admin');
define('ADMIN_PASSWORD', $_ENV['ADMIN_PASSWORD'] ?? 'admin123');

// Application Settings
define('APP_NAME', $_ENV['APP_NAME'] ?? 'SMM Panel');
define('APP_URL', $_ENV['APP_URL'] ?? 'http://localhost');
define('DEBUG_MODE', ($_ENV['DEBUG_MODE'] ?? 'false') === 'true');

// Session Configuration
ini_set('session.cookie_httponly', 1);
ini_set('session.use_only_cookies', 1);
ini_set('session.cookie_secure', 0); // Set to 1 if using HTTPS

// Error Reporting
if (DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>