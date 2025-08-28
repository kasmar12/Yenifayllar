<?php
// Music Creator Configuration File
// Database and Application Settings

// Database Configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'music_creator');
define('DB_USER', 'root');
define('DB_PASS', '');

// Application Configuration
define('APP_NAME', 'Music Creator AI');
define('APP_URL', 'http://localhost/music-creator');
define('APP_VERSION', '1.0.0');

// File Upload Configuration
define('UPLOAD_DIR', '../assets/uploads/');
define('MAX_FILE_SIZE', 50 * 1024 * 1024); // 50MB
define('ALLOWED_AUDIO_TYPES', ['mp3', 'wav', 'flac', 'ogg', 'm4a']);

// AI Generation Configuration
define('AI_API_KEY', 'your_ai_api_key_here');
define('AI_ENDPOINT', 'https://api.openai.com/v1/audio/generations');
define('MAX_CREDITS_FREE', 10);
define('MAX_CREDITS_PREMIUM', 100);
define('MAX_CREDITS_PRO', 1000);

// Security Configuration
define('SESSION_TIMEOUT', 3600); // 1 hour
define('PASSWORD_MIN_LENGTH', 8);
define('LOGIN_ATTEMPTS_LIMIT', 5);
define('LOGIN_TIMEOUT', 900); // 15 minutes

// Error Reporting (set to false in production)
define('DEBUG_MODE', true);

if (DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

// Timezone
date_default_timezone_set('UTC');

// Session Configuration
ini_set('session.cookie_httponly', 1);
ini_set('session.use_only_cookies', 1);
ini_set('session.cookie_secure', 0); // Set to 1 if using HTTPS

// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>