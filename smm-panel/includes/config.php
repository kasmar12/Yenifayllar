<?php
/**
 * Database Configuration
 * SMM Panel Configuration File
 */

// Database Configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'smm_panel');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHARSET', 'utf8mb4');

// Application Configuration
define('SITE_NAME', 'SMM Panel');
define('SITE_URL', 'http://localhost/smm-panel');
define('ADMIN_EMAIL', 'admin@smmpanel.com');

// Session Configuration
define('SESSION_NAME', 'smm_panel');
define('SESSION_LIFETIME', 3600); // 1 hour

// Security Configuration
define('CSRF_TOKEN_NAME', 'csrf_token');
define('PASSWORD_COST', 12);

// API Configuration
define('AYLIVE_API_KEY', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab');
define('AYLIVE_API_URL', 'https://ay.live/api/');

// Error Reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Start session
if (session_status() === PHP_SESSION_NONE) {
    session_name(SESSION_NAME);
    session_start();
}

// Set timezone
date_default_timezone_set('UTC');

// Database connection function
function getDBConnection() {
    try {
        $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
        $pdo = new PDO($dsn, DB_USER, DB_PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        return $pdo;
    } catch (PDOException $e) {
        die("Connection failed: " . $e->getMessage());
    }
}

// Helper function to get setting value
function getSetting($key, $default = '') {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("SELECT setting_value FROM settings WHERE setting_key = ?");
        $stmt->execute([$key]);
        $result = $stmt->fetch();
        return $result ? $result['setting_value'] : $default;
    } catch (Exception $e) {
        return $default;
    }
}

// Helper function to update setting
function updateSetting($key, $value) {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("UPDATE settings SET setting_value = ? WHERE setting_key = ?");
        return $stmt->execute([$value, $key]);
    } catch (Exception $e) {
        return false;
    }
}

// CSRF token functions
function generateCSRFToken() {
    if (!isset($_SESSION[CSRF_TOKEN_NAME])) {
        $_SESSION[CSRF_TOKEN_NAME] = bin2hex(random_bytes(32));
    }
    return $_SESSION[CSRF_TOKEN_NAME];
}

function validateCSRFToken($token) {
    return isset($_SESSION[CSRF_TOKEN_NAME]) && hash_equals($_SESSION[CSRF_TOKEN_NAME], $token);
}

// Sanitize input function
function sanitizeInput($data) {
    return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
}

// Generate unique order ID
function generateOrderID() {
    return 'ORD' . date('Ymd') . strtoupper(substr(md5(uniqid()), 0, 8));
}

// Format price function
function formatPrice($price, $currency = 'USD') {
    return $currency . ' ' . number_format($price, 4);
}

// Log function
function logActivity($action, $details = '', $user_id = null) {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("INSERT INTO activity_logs (user_id, action, details, ip_address, user_agent) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([
            $user_id,
            $action,
            $details,
            $_SERVER['REMOTE_ADDR'] ?? '',
            $_SERVER['HTTP_USER_AGENT'] ?? ''
        ]);
    } catch (Exception $e) {
        // Log to file if database fails
        error_log("Activity Log Error: " . $e->getMessage());
    }
}
?>