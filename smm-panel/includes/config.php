<?php
/**
 * Database Configuration
 * SMM Panel Configuration File
 */

// Database Configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'smm_panel');
define('DB_USER', 'root');
define('DB_PASS', 'root123');
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

// Set error logging
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/../debug.log');

// Database connection function
function getDBConnection() {
    try {
        // Create database if it doesn't exist
        exec('sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS smm_panel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" 2>/dev/null');
        
        // Connect to the specific database
        $dsn = "mysql:host=127.0.0.1;port=3306;dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
        $pdo = new PDO($dsn, DB_USER, DB_PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        
        // Check if tables exist, if not create them
        $pdo->exec("CREATE TABLE IF NOT EXISTS `users` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `username` varchar(50) NOT NULL UNIQUE,
            `password` varchar(255) NOT NULL,
            `role` enum('admin','user') NOT NULL DEFAULT 'user',
            `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
        
        $pdo->exec("CREATE TABLE IF NOT EXISTS `categories` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `name` varchar(100) NOT NULL,
            `description` text,
            `status` enum('active','inactive') NOT NULL DEFAULT 'active',
            `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
        
        $pdo->exec("CREATE TABLE IF NOT EXISTS `services` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `category_id` int(11) NOT NULL,
            `api_service_id` int(11) NOT NULL,
            `name` varchar(200) NOT NULL,
            `description` text,
            `price` decimal(10,4) NOT NULL,
            `min_quantity` int(11) NOT NULL DEFAULT 1,
            `max_quantity` int(11) NOT NULL DEFAULT 10000,
            `status` enum('active','inactive') NOT NULL DEFAULT 'active',
            `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`),
            KEY `category_id` (`category_id`),
            CONSTRAINT `fk_services_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
        
        $pdo->exec("CREATE TABLE IF NOT EXISTS `orders` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `order_id` varchar(50) NOT NULL UNIQUE,
            `service_id` int(11) NOT NULL,
            `link` varchar(500) NOT NULL,
            `quantity` int(11) NOT NULL,
            `price` decimal(10,4) NOT NULL,
            `status` enum('pending','processing','completed','cancelled','error') NOT NULL DEFAULT 'pending',
            `smm_order_id` varchar(100),
            `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`),
            KEY `service_id` (`service_id`),
            CONSTRAINT `fk_orders_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
        
        $pdo->exec("CREATE TABLE IF NOT EXISTS `settings` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `setting_key` varchar(100) NOT NULL UNIQUE,
            `setting_value` text NOT NULL,
            `description` text,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
        
        // Insert default data if tables are empty
        $stmt = $pdo->query("SELECT COUNT(*) FROM users");
        if ($stmt->fetchColumn() == 0) {
            // Insert default admin user
            $adminPassword = password_hash('admin123', PASSWORD_DEFAULT);
            $pdo->exec("INSERT INTO users (username, password, role) VALUES ('admin', '$adminPassword', 'admin')");
            
            // Insert default categories
            $pdo->exec("INSERT INTO categories (name, description) VALUES 
                ('Instagram', 'Instagram services including followers, likes, and views'),
                ('TikTok', 'TikTok services including followers, likes, and views'),
                ('YouTube', 'YouTube services including subscribers, views, and likes')");
            
            // Insert default services
            $pdo->exec("INSERT INTO services (category_id, api_service_id, name, description, price, min_quantity, max_quantity) VALUES 
                (1, 1, 'Instagram Followers', 'Real Instagram followers', 2.0000, 100, 10000),
                (1, 2, 'Instagram Likes', 'Real Instagram likes', 1.0000, 50, 5000),
                (1, 3, 'Instagram Views', 'Real Instagram views', 0.5000, 100, 10000),
                (2, 4, 'TikTok Followers', 'Real TikTok followers', 1.5000, 100, 10000),
                (2, 5, 'TikTok Likes', 'Real TikTok likes', 0.8000, 100, 10000),
                (3, 6, 'YouTube Subscribers', 'Real YouTube subscribers', 5.0000, 100, 1000)");
            
            // Insert default settings
            $pdo->exec("INSERT INTO settings (setting_key, setting_value, description) VALUES 
                ('smm_api_url', 'https://medyabayim.com/api/v2', 'SMM Panel API URL'),
                ('smm_api_key', 'your_api_key_here', 'SMM Panel API Key'),
                ('aylive_api_key', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab', 'AY.Live API Key')");
        }
        
        return $pdo;
    } catch (PDOException $e) {
        error_log("Database connection error: " . $e->getMessage());
        throw new Exception("Database connection failed: " . $e->getMessage());
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

// Initialize database tables if they don't exist
function initializeDatabase() {
    try {
        $pdo = getDBConnection();
        
        // Create tables if they don't exist
        $tables = [
            'users' => "
                CREATE TABLE IF NOT EXISTS users (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(50) UNIQUE NOT NULL,
                    password VARCHAR(255) NOT NULL,
                    email VARCHAR(100) UNIQUE NOT NULL,
                    role ENUM('admin', 'user') DEFAULT 'admin',
                    is_active BOOLEAN DEFAULT TRUE,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                )
            ",
            'categories' => "
                CREATE TABLE IF NOT EXISTS categories (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    slug VARCHAR(100) UNIQUE NOT NULL,
                    description TEXT,
                    is_active BOOLEAN DEFAULT TRUE,
                    sort_order INT DEFAULT 0,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                )
            ",
            'services' => "
                CREATE TABLE IF NOT EXISTS services (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    category_id INT NOT NULL,
                    api_service_id VARCHAR(100) NOT NULL,
                    name VARCHAR(200) NOT NULL,
                    description TEXT,
                    price DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
                    min_quantity INT NOT NULL DEFAULT 1,
                    max_quantity INT NOT NULL DEFAULT 1000000,
                    dripfeed BOOLEAN DEFAULT FALSE,
                    refill BOOLEAN DEFAULT FALSE,
                    is_active BOOLEAN DEFAULT TRUE,
                    sort_order INT DEFAULT 0,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
                )
            ",
            'orders' => "
                CREATE TABLE IF NOT EXISTS orders (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    order_id VARCHAR(50) UNIQUE NOT NULL,
                    service_id INT NOT NULL,
                    link VARCHAR(500) NOT NULL,
                    quantity INT NOT NULL,
                    price DECIMAL(10,4) NOT NULL,
                    total_price DECIMAL(10,4) NOT NULL,
                    status ENUM('pending', 'processing', 'completed', 'canceled', 'refunded') DEFAULT 'pending',
                    api_order_id VARCHAR(100),
                    api_response TEXT,
                    user_ip VARCHAR(45),
                    user_agent TEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
                )
            ",
            'settings' => "
                CREATE TABLE IF NOT EXISTS settings (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    setting_key VARCHAR(100) UNIQUE NOT NULL,
                    setting_value TEXT,
                    description TEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                )
            "
        ];
        
        foreach ($tables as $tableName => $sql) {
            $pdo->exec($sql);
        }
        
        // Create admin user if not exists
        $stmt = $pdo->prepare("SELECT id FROM users WHERE username = 'admin'");
        $stmt->execute();
        
        if (!$stmt->fetch()) {
            $adminPassword = password_hash('admin123', PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, 'admin')");
            $stmt->execute(['admin', $adminPassword, 'admin@smmpanel.com']);
        }
        
        // Insert default categories if not exists
        $defaultCategories = [
            ['Instagram', 'instagram', 'Instagram services including followers, likes, and views', 1],
            ['TikTok', 'tiktok', 'TikTok services including followers, likes, and views', 2],
            ['YouTube', 'youtube', 'YouTube services including subscribers and views', 3],
            ['Twitter', 'twitter', 'Twitter services including followers and likes', 4],
            ['Facebook', 'facebook', 'Facebook services including page likes and post engagement', 5]
        ];
        
        foreach ($defaultCategories as $category) {
            $stmt = $pdo->prepare("INSERT IGNORE INTO categories (name, slug, description, sort_order) VALUES (?, ?, ?, ?)");
            $stmt->execute($category);
        }
        
        // Insert default services if not exists
        $defaultServices = [
            [1, 'instagram_followers', 'Instagram Followers', 'High quality Instagram followers', 0.5000, 100, 100000],
            [1, 'instagram_likes', 'Instagram Likes', 'Real Instagram likes for posts', 0.3000, 50, 50000],
            [1, 'instagram_views', 'Instagram Views', 'Instagram video views', 0.2000, 100, 100000],
            [2, 'tiktok_followers', 'TikTok Followers', 'Real TikTok followers', 0.8000, 100, 50000],
            [2, 'tiktok_likes', 'TikTok Likes', 'TikTok video likes', 0.4000, 100, 100000],
            [3, 'youtube_subscribers', 'YouTube Subscribers', 'Real YouTube subscribers', 2.5000, 100, 10000],
            [3, 'youtube_views', 'YouTube Views', 'YouTube video views', 0.1000, 1000, 1000000]
        ];
        
        foreach ($defaultServices as $service) {
            $stmt = $pdo->prepare("INSERT IGNORE INTO services (category_id, api_service_id, name, description, price, min_quantity, max_quantity) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute($service);
        }
        
        // Insert default settings if not exists
        $defaultSettings = [
            ['smm_api_url', 'https://medyabayim.com/api/v2', 'SMM Provider API URL'],
            ['smm_api_key', 'YOUR_SMM_API_KEY', 'SMM Provider API Key'],
            ['aylive_api_key', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab', 'AY.Live API Key for ad redirects'],
            ['site_name', 'SMM Panel', 'Website name'],
            ['site_description', 'Professional SMM Services', 'Website description'],
            ['currency', 'USD', 'Default currency'],
            ['timezone', 'UTC', 'Default timezone']
        ];
        
        foreach ($defaultSettings as $setting) {
            $stmt = $pdo->prepare("INSERT IGNORE INTO settings (setting_key, setting_value, description) VALUES (?, ?, ?)");
            $stmt->execute($setting);
        }
        
        return true;
    } catch (Exception $e) {
        error_log("Database initialization error: " . $e->getMessage());
        return false;
    }
}

// Initialize database on first run
initializeDatabase();
?>