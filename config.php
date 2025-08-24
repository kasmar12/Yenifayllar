<?php
/**
 * SMM Panel Configuration File
 * Contains all necessary configuration for database, Portmanat API, and SMM API
 */

// Database Configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'smm_panel');
define('DB_USER', 'root');
define('DB_PASS', '');

// Portmanat.az API Configuration
define('PORTMANAT_MERCHANT_ID', 'YOUR_MERCHANT_ID'); // Replace with your actual merchant ID
define('PORTMANAT_SECRET_KEY', 'YOUR_SECRET_KEY');   // Replace with your actual secret key
define('PORTMANAT_API_URL', 'https://portmanat.az/api/payment'); // Portmanat payment API URL

// SMM API Configuration
// Common SMM API endpoints - adjust these based on your provider
define('SMM_API_URL', 'https://your-smm-provider.com/api/v2'); // Replace with your SMM provider API URL
define('SMM_API_KEY', 'YOUR_SMM_API_KEY');                    // Replace with your SMM provider API key
define('SMM_SERVICE_ID', '123');                              // Replace with your actual service ID

// SMM API Endpoints - Common variations used by different providers
// Try these endpoints one by one until one works

// Standard API endpoints
define('SMM_SERVICES_URL', SMM_API_URL . '/services');         // Standard services endpoint
define('SMM_ADD_ORDER_URL', SMM_API_URL . '/add');            // Standard add order endpoint

// Alternative endpoints (common variations)
define('SMM_SERVICES_URL_ALT1', SMM_API_URL . '/services.php');
define('SMM_SERVICES_URL_ALT2', SMM_API_URL . '/api/services');
define('SMM_SERVICES_URL_ALT3', SMM_API_URL . '/v2/services');
define('SMM_SERVICES_URL_ALT4', SMM_API_URL . '/getServices');
define('SMM_SERVICES_URL_ALT5', SMM_API_URL . '/list');
define('SMM_SERVICES_URL_ALT6', SMM_API_URL . '/services.json');
define('SMM_SERVICES_URL_ALT7', SMM_API_URL . '/api.php');
define('SMM_SERVICES_URL_ALT8', SMM_API_URL . '/index.php');

// Alternative add order endpoints
define('SMM_ADD_ORDER_URL_ALT1', SMM_API_URL . '/add.php');
define('SMM_ADD_ORDER_URL_ALT2', SMM_API_URL . '/api/add');
define('SMM_ADD_ORDER_URL_ALT3', SMM_API_URL . '/v2/add');
define('SMM_ADD_ORDER_URL_ALT4', SMM_API_URL . '/create');
define('SMM_ADD_ORDER_URL_ALT5', SMM_API_URL . '/order');

// Application Configuration
define('SITE_URL', 'http://localhost/smm-panel'); // Replace with your actual site URL
define('CURRENCY', 'AZN');

// Error Reporting (set to false in production)
define('DEBUG_MODE', true);

if (DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}
?>