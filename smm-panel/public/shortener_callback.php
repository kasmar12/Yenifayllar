<?php
/**
 * Link Shortener Callback Handler
 * 
 * This page receives callbacks from the link shortener service
 * when users complete advertisements and access the target URL.
 * 
 * Flow:
 * 1. User clicks short link
 * 2. User passes advertisement on shortener service
 * 3. Shortener service calls this page with completion data
 * 4. We verify the completion and process the order
 * 5. Order is sent to SMM API only after ad verification
 */

require_once '../config/link_shortener_config.php';
require_once '../config/link_shortener.php';

// Enable error reporting for debugging
if (SHORTENER_DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}

// Set content type to JSON
header('Content-Type: application/json');

// Log incoming callback
$callback_log = [
    'timestamp' => date('Y-m-d H:i:s'),
    'method' => $_SERVER['REQUEST_METHOD'],
    'headers' => getallheaders(),
    'get_params' => $_GET,
    'post_params' => $_POST,
    'raw_input' => file_get_contents('php://input'),
    'ip' => $_SERVER['REMOTE_ADDR'] ?? 'unknown',
    'user_agent' => $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
];

// Log the callback
if (SHORTENER_LOG_ENABLED) {
    $log_file = SHORTENER_LOG_FILE;
    $log_dir = dirname($log_file);
    
    if (!is_dir($log_dir)) {
        mkdir($log_dir, 0755, true);
    }
    
    file_put_contents($log_file, json_encode($callback_log) . "\n", FILE_APPEND | LOCK_EX);
}

try {
    // Initialize link shortener service
    $link_shortener = new LinkShortener();
    
    // Get callback data from different sources
    $callback_data = [];
    
    // Try to get data from POST first
    if (!empty($_POST)) {
        $callback_data = $_POST;
    }
    // Try to get data from GET parameters
    elseif (!empty($_GET)) {
        $callback_data = $_GET;
    }
    // Try to get data from raw input (JSON)
    else {
        $raw_input = file_get_contents('php://input');
        if (!empty($raw_input)) {
            $json_data = json_decode($raw_input, true);
            if (json_last_error() === JSON_ERROR_NONE) {
                $callback_data = $json_data;
            }
        }
    }
    
    // If no callback data found, return error
    if (empty($callback_data)) {
        throw new Exception("No callback data received");
    }
    
    // Log the extracted callback data
    if (SHORTENER_DEBUG_MODE) {
        error_log("Shortener callback data extracted: " . json_encode($callback_data));
    }
    
    // Process the callback
    $result = $link_shortener->processCallback($callback_data);
    
    // Log the processing result
    if (SHORTENER_LOG_ENABLED) {
        $result_log = [
            'timestamp' => date('Y-m-d H:i:s'),
            'callback_data' => $callback_data,
            'processing_result' => $result
        ];
        
        file_put_contents($log_file, json_encode($result_log) . "\n", FILE_APPEND | LOCK_EX);
    }
    
    // Return success response
    if ($result['success']) {
        http_response_code(200);
        echo json_encode([
            'status' => 'success',
            'message' => 'Callback processed successfully',
            'order_id' => $result['order_id'] ?? 'unknown',
            'processed' => $result['processed'] ?? false,
            'timestamp' => date('Y-m-d H:i:s')
        ]);
    } else {
        // Return error response
        http_response_code(400);
        echo json_encode([
            'status' => 'error',
            'message' => $result['error'] ?? 'Unknown error occurred',
            'timestamp' => date('Y-m-d H:i:s')
        ]);
    }
    
} catch (Exception $e) {
    // Log the exception
    $error_log = [
        'timestamp' => date('Y-m-d H:i:s'),
        'error' => $e->getMessage(),
        'file' => $e->getFile(),
        'line' => $e->getLine(),
        'trace' => $e->getTraceAsString(),
        'callback_data' => $callback_log
    ];
    
    if (SHORTENER_LOG_ENABLED) {
        $log_file = SHORTENER_LOG_FILE;
        file_put_contents($log_file, json_encode($error_log) . "\n", FILE_APPEND | LOCK_EX);
    }
    
    if (SHORTENER_DEBUG_MODE) {
        error_log("Shortener callback error: " . $e->getMessage());
    }
    
    // Return error response
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Internal server error: ' . $e->getMessage(),
        'timestamp' => date('Y-m-d H:i:s')
    ]);
}

/**
 * Helper function to get all headers
 */
function getallheaders() {
    $headers = [];
    foreach ($_SERVER as $name => $value) {
        if (substr($name, 0, 5) == 'HTTP_') {
            $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
        }
    }
    return $headers;
}
?>