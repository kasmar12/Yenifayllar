<?php
/**
 * API Functions for SMM Panel
 * Handles AY.Live and SMM Provider API calls
 */

require_once 'config.php';

/**
 * Create shortened ad link using AY.Live API
 * @param string $url URL to shorten
 * @param string $alias Optional alias for the link
 * @return array Response with success status and shortened URL
 */
function createAYLiveLink($url, $alias = '') {
    $apiKey = getSetting('aylive_api_key', AYLIVE_API_KEY);
    $apiUrl = AYLIVE_API_URL . '?' . http_build_query([
        'api' => $apiKey,
        'url' => $url,
        'alias' => $alias
    ]);
    
    try {
        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $apiUrl,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_MAXREDIRS => 5,
            CURLOPT_USERAGENT => 'SMM-Panel/1.0',
            CURLOPT_HTTPHEADER => [
                'Accept: application/json'
            ]
        ]);
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);
        
        if ($curlError) {
            return [
                'success' => false,
                'error' => 'cURL Error: ' . $curlError
            ];
        }
        
        if ($httpCode < 200 || $httpCode >= 400) {
            return [
                'success' => false,
                'error' => 'HTTP Error: ' . $httpCode
            ];
        }
        
        $data = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            return [
                'success' => false,
                'error' => 'Invalid JSON response'
            ];
        }
        
        if (isset($data['shortenedUrl'])) {
            return [
                'success' => true,
                'shortened_url' => $data['shortenedUrl'],
                'response' => $data
            ];
        } else {
            return [
                'success' => false,
                'error' => $data['message'] ?? 'Unknown error from AY.Live API',
                'response' => $data
            ];
        }
        
    } catch (Exception $e) {
        return [
            'success' => false,
            'error' => 'Exception: ' . $e->getMessage()
        ];
    }
}

/**
 * Call SMM Provider API
 * @param string $action API action
 * @param array $data Request data
 * @return array Response data
 */
function callSMMAPI($action, $data = []) {
    $apiUrl = getSetting('smm_api_url', 'https://medyabayim.com/api/v2');
    $apiKey = getSetting('smm_api_key', '');
    
    if (empty($apiKey)) {
        return [
            'success' => false,
            'error' => 'SMM API key not configured'
        ];
    }
    
    $apiData = array_merge([
        'key' => $apiKey,
        'action' => $action
    ], $data);
    
    try {
        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $apiUrl,
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
            return [
                'success' => false,
                'error' => 'cURL Error: ' . $curlError
            ];
        }
        
        if ($httpCode < 200 || $httpCode >= 400) {
            return [
                'success' => false,
                'error' => 'HTTP Error: ' . $httpCode,
                'response' => $response
            ];
        }
        
        $data = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            return [
                'success' => false,
                'error' => 'Invalid JSON response',
                'raw_response' => $response
            ];
        }
        
        return [
            'success' => true,
            'data' => $data,
            'http_code' => $httpCode
        ];
        
    } catch (Exception $e) {
        return [
            'success' => false,
            'error' => 'Exception: ' . $e->getMessage()
        ];
    }
}

/**
 * Get services from SMM Provider
 * @return array Services array or error
 */
function getSMMServices() {
    $response = callSMMAPI('services');
    
    if (!$response['success']) {
        return [
            'success' => false,
            'error' => $response['error']
        ];
    }
    
    if (isset($response['data']['services'])) {
        return [
            'success' => true,
            'services' => $response['data']['services']
        ];
    } else {
        return [
            'success' => false,
            'error' => 'No services found in response',
            'response' => $response['data']
        ];
    }
}

/**
 * Place order via SMM Provider
 * @param string $service Service ID
 * @param string $link Target link/username
 * @param int $quantity Quantity
 * @return array Order response
 */
function placeSMMOrder($service, $link, $quantity) {
    $response = callSMMAPI('add', [
        'service' => $service,
        'link' => $link,
        'quantity' => $quantity
    ]);
    
    if (!$response['success']) {
        return [
            'success' => false,
            'error' => $response['error']
        ];
    }
    
    if (isset($response['data']['order'])) {
        return [
            'success' => true,
            'order_id' => $response['data']['order'],
            'response' => $response['data']
        ];
    } else {
        return [
            'success' => false,
            'error' => $response['data']['error'] ?? 'Unknown error from SMM API',
            'response' => $response['data']
        ];
    }
}

/**
 * Get order status from SMM Provider
 * @param string $orderId Order ID
 * @return array Status response
 */
function getSMMOrderStatus($orderId) {
    $response = callSMMAPI('status', [
        'order' => $orderId
    ]);
    
    if (!$response['success']) {
        return [
            'success' => false,
            'error' => $response['error']
        ];
    }
    
    return [
        'success' => true,
        'status' => $response['data']['status'] ?? 'unknown',
        'response' => $response['data']
    ];
}

/**
 * Get balance from SMM Provider
 * @return array Balance response
 */
function getSMMBalance() {
    $response = callSMMAPI('balance');
    
    if (!$response['success']) {
        return [
            'success' => false,
            'error' => $response['error']
        ];
    }
    
    if (isset($response['data']['balance'])) {
        return [
            'success' => true,
            'balance' => $response['data']['balance'],
            'currency' => $response['data']['currency'] ?? 'USD'
        ];
    } else {
        return [
            'success' => false,
            'error' => 'Balance not found in response',
            'response' => $response['data']
        ];
    }
}

/**
 * Validate Instagram link/username
 * @param string $input User input
 * @return bool True if valid
 */
function validateInstagramInput($input) {
    // Remove common prefixes
    $input = str_replace(['https://', 'http://', 'www.', 'instagram.com/', '@'], '', $input);
    
    // Instagram username rules: 1-30 characters, letters, numbers, dots, underscores
    return preg_match('/^[a-zA-Z0-9._]{1,30}$/', $input);
}

/**
 * Validate TikTok link/username
 * @param string $input User input
 * @return bool True if valid
 */
function validateTikTokInput($input) {
    // Remove common prefixes
    $input = str_replace(['https://', 'http://', 'www.', 'tiktok.com/', '@'], '', $input);
    
    // TikTok username rules: 1-24 characters, letters, numbers, dots, underscores
    return preg_match('/^[a-zA-Z0-9._]{1,24}$/', $input);
}

/**
 * Validate YouTube link
 * @param string $input User input
 * @return bool True if valid
 */
function validateYouTubeInput($input) {
    // YouTube URL patterns
    $patterns = [
        '/^https?:\/\/(www\.)?youtube\.com\/channel\/[a-zA-Z0-9_-]+$/',
        '/^https?:\/\/(www\.)?youtube\.com\/c\/[a-zA-Z0-9_-]+$/',
        '/^https?:\/\/(www\.)?youtube\.com\/user\/[a-zA-Z0-9_-]+$/',
        '/^https?:\/\/(www\.)?youtube\.com\/watch\?v=[a-zA-Z0-9_-]+$/'
    ];
    
    foreach ($patterns as $pattern) {
        if (preg_match($pattern, $input)) {
            return true;
        }
    }
    
    return false;
}

/**
 * Get service price for quantity
 * @param int $serviceId Service ID
 * @param int $quantity Quantity
 * @return float Total price
 */
function calculateServicePrice($serviceId, $quantity) {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("SELECT price FROM services WHERE id = ? AND is_active = 1");
        $stmt->execute([$serviceId]);
        $service = $stmt->fetch();
        
        if ($service) {
            return $service['price'] * $quantity;
        }
        
        return 0;
    } catch (Exception $e) {
        return 0;
    }
}

/**
 * Get icon for service based on name
 * @param string $serviceName Service name
 * @return string FontAwesome icon class
 */
function getServiceIcon($serviceName) {
    $serviceName = strtolower($serviceName);
    
    // Instagram services
    if (strpos($serviceName, 'instagram') !== false) {
        if (strpos($serviceName, 'followers') !== false) return 'users';
        if (strpos($serviceName, 'likes') !== false) return 'heart';
        if (strpos($serviceName, 'views') !== false) return 'eye';
        if (strpos($serviceName, 'comments') !== false) return 'comment';
        if (strpos($serviceName, 'video') !== false) return 'video';
        if (strpos($serviceName, 'photo') !== false) return 'image';
        return 'instagram';
    }
    
    // TikTok services
    if (strpos($serviceName, 'tiktok') !== false) {
        if (strpos($serviceName, 'followers') !== false) return 'users';
        if (strpos($serviceName, 'likes') !== false) return 'heart';
        if (strpos($serviceName, 'views') !== false) return 'eye';
        if (strpos($serviceName, 'comments') !== false) return 'comment';
        if (strpos($serviceName, 'video') !== false) return 'video';
        return 'music';
    }
    
    // YouTube services
    if (strpos($serviceName, 'youtube') !== false) {
        if (strpos($serviceName, 'subscribers') !== false) return 'users';
        if (strpos($serviceName, 'likes') !== false) return 'thumbs-up';
        if (strpos($serviceName, 'views') !== false) return 'eye';
        if (strpos($serviceName, 'comments') !== false) return 'comment';
        if (strpos($serviceName, 'video') !== false) return 'video';
        return 'youtube';
    }
    
    // Twitter services
    if (strpos($serviceName, 'twitter') !== false) {
        if (strpos($serviceName, 'followers') !== false) return 'users';
        if (strpos($serviceName, 'likes') !== false) return 'heart';
        if (strpos($serviceName, 'retweets') !== false) return 'retweet';
        return 'twitter';
    }
    
    // Facebook services
    if (strpos($serviceName, 'facebook') !== false) {
        if (strpos($serviceName, 'followers') !== false) return 'users';
        if (strpos($serviceName, 'likes') !== false) return 'thumbs-up';
        if (strpos($serviceName, 'views') !== false) return 'eye';
        return 'facebook';
    }
    
    // Default icons based on service type
    if (strpos($serviceName, 'followers') !== false) return 'users';
    if (strpos($serviceName, 'likes') !== false) return 'heart';
    if (strpos($serviceName, 'views') !== false) return 'eye';
    if (strpos($serviceName, 'comments') !== false) return 'comment';
    if (strpos($serviceName, 'video') !== false) return 'video';
    if (strpos($serviceName, 'photo') !== false) return 'image';
    
    return 'star'; // Default icon
}
?>