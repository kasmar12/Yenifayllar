<?php
/**
 * Common functions for SMM Panel Application
 * Handles API calls, service management, and utility functions
 */

require_once 'config.php';

/**
 * Make API call to SMM Panel
 * @param string $action API action
 * @param array $data Request data
 * @return array|false Response data or false on error
 */
function callSmmApi($action, $data = []) {
    $apiData = array_merge([
        'key' => SMM_API_KEY,
        'action' => $action
    ], $data);
    
    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => SMM_API_URL,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => http_build_query($apiData),
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_USERAGENT => 'SMM-Panel/1.0',
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/x-www-form-urlencoded',
            'Accept: application/json'
        ]
    ]);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $curlError = curl_error($ch);
    curl_close($ch);
    
    if ($curlError) {
        if (DEBUG_MODE) {
            error_log("SMM API cURL Error: " . $curlError);
        }
        return false;
    }
    
    if ($httpCode < 200 || $httpCode >= 400) {
        if (DEBUG_MODE) {
            error_log("SMM API HTTP Error: " . $httpCode . " - " . $response);
        }
        return false;
    }
    
    $data = json_decode($response, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        if (DEBUG_MODE) {
            error_log("SMM API JSON Parse Error: " . json_last_error_msg());
        }
        return false;
    }
    
    return $data;
}

/**
 * Fetch all services from SMM API
 * @return array|false Services array or false on error
 */
function fetchServices() {
    $response = callSmmApi('services');
    if ($response && isset($response['services'])) {
        return $response['services'];
    }
    return false;
}

/**
 * Fetch services by category
 * @param string $category Category name
 * @return array|false Services array or false on error
 */
function fetchServicesByCategory($category) {
    $response = callSmmApi('services', ['category' => $category]);
    if ($response && isset($response['services'])) {
        return $response['services'];
    }
    return false;
}

/**
 * Fetch all categories from SMM API
 * @return array|false Categories array or false on error
 */
function fetchCategories() {
    $response = callSmmApi('categories');
    if ($response && isset($response['categories'])) {
        return $response['categories'];
    }
    return false;
}

/**
 * Place order via SMM API
 * @param string $service Service ID
 * @param string $link Target link/username
 * @param int $quantity Quantity
 * @return array|false Order response or false on error
 */
function placeOrder($service, $link, $quantity) {
    $response = callSmmApi('add', [
        'service' => $service,
        'link' => $link,
        'quantity' => $quantity
    ]);
    
    if ($response && isset($response['order'])) {
        return $response;
    }
    return false;
}

/**
 * Get order status
 * @param string $orderId Order ID
 * @return array|false Order status or false on error
 */
function getOrderStatus($orderId) {
    $response = callSmmApi('status', ['order' => $orderId]);
    if ($response && isset($response['status'])) {
        return $response;
    }
    return false;
}

/**
 * Get order history
 * @param int $page Page number
 * @param int $limit Items per page
 * @return array|false Order history or false on error
 */
function getOrderHistory($page = 1, $limit = 50) {
    $response = callSmmApi('orders', [
        'page' => $page,
        'limit' => $limit
    ]);
    
    if ($response && isset($response['orders'])) {
        return $response;
    }
    return false;
}

/**
 * Create AY.Live shortened link
 * @param string $url URL to shorten
 * @return string|false Shortened URL or false on error
 */
function createShortenedLink($url) {
    $apiUrl = 'https://ay.live/api/?' . http_build_query([
        'api' => AYLIVE_API_KEY,
        'url' => $url
    ]);
    
    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $apiUrl,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_MAXREDIRS => 5,
        CURLOPT_USERAGENT => 'SMM-Panel/1.0'
    ]);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    if ($httpCode >= 200 && $httpCode < 400) {
        $data = json_decode($response, true);
        if (isset($data['shortenedUrl'])) {
            return $data['shortenedUrl'];
        }
    }
    
    return false;
}

/**
 * Check if user is admin
 * @return bool True if admin, false otherwise
 */
function isAdmin() {
    return isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true;
}

/**
 * Require admin access
 * Redirects to login if not admin
 */
function requireAdmin() {
    if (!isAdmin()) {
        header('Location: admin-login.php');
        exit;
    }
}

/**
 * Sanitize input data
 * @param string $data Input data
 * @return string Sanitized data
 */
function sanitizeInput($data) {
    return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
}

/**
 * Validate email address
 * @param string $email Email to validate
 * @return bool True if valid, false otherwise
 */
function isValidEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

/**
 * Generate pagination links
 * @param int $currentPage Current page
 * @param int $totalPages Total pages
 * @param string $baseUrl Base URL for pagination
 * @return string HTML pagination links
 */
function generatePagination($currentPage, $totalPages, $baseUrl) {
    if ($totalPages <= 1) {
        return '';
    }
    
    $html = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
    
    // Previous button
    if ($currentPage > 1) {
        $html .= '<li class="page-item"><a class="page-link" href="' . $baseUrl . '?page=' . ($currentPage - 1) . '">Previous</a></li>';
    }
    
    // Page numbers
    for ($i = max(1, $currentPage - 2); $i <= min($totalPages, $currentPage + 2); $i++) {
        $active = $i === $currentPage ? ' active' : '';
        $html .= '<li class="page-item' . $active . '"><a class="page-link" href="' . $baseUrl . '?page=' . $i . '">' . $i . '</a></li>';
    }
    
    // Next button
    if ($currentPage < $totalPages) {
        $html .= '<li class="page-item"><a class="page-link" href="' . $baseUrl . '?page=' . ($currentPage + 1) . '">Next</a></li>';
    }
    
    $html .= '</ul></nav>';
    return $html;
}

/**
 * Format service name for display
 * @param string $serviceId Service ID
 * @return string Formatted service name
 */
function formatServiceName($serviceId) {
    return ucwords(str_replace(['_', '-'], ' ', $serviceId));
}

/**
 * Get service category from service ID
 * @param string $serviceId Service ID
 * @return string Category name
 */
function getServiceCategory($serviceId) {
    $parts = explode('_', $serviceId);
    return ucfirst($parts[0] ?? 'Unknown');
}

/**
 * Log activity for admin panel
 * @param string $action Action performed
 * @param string $details Additional details
 */
function logAdminActivity($action, $details = '') {
    if (DEBUG_MODE) {
        $log = date('Y-m-d H:i:s') . " - " . $action . " - " . $details . "\n";
        error_log($log, 3, __DIR__ . '/../logs/admin.log');
    }
}
?>