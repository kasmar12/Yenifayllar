<?php
class PortmanatAPI {
    private $merchant_id;
    private $secret_key;
    private $api_url = 'https://partners.portmanat.az/api';
    private $debug_mode = true; // Debug mode aktiv edin

    public function __construct() {
        // Check if constants are defined, otherwise use defaults
        $this->merchant_id = defined('PORTMANAT_MERCHANT_ID') ? PORTMANAT_MERCHANT_ID : '195';
        $this->secret_key = defined('PORTMANAT_SECRET_KEY') ? PORTMANAT_SECRET_KEY : 'YOUR_SECRET_KEY';
        
        if ($this->debug_mode) {
            error_log("Portmanat API initialized with merchant_id: " . $this->merchant_id);
        }
    }
    
    /**
     * Set API credentials manually
     * @param string $merchant_id
     * @param string $secret_key
     */
    public function setCredentials($merchant_id, $secret_key) {
        $this->merchant_id = $merchant_id;
        $this->secret_key = $secret_key;
        
        if ($this->debug_mode) {
            error_log("Portmanat API credentials updated: merchant_id=$merchant_id");
        }
    }

    /**
     * Create payment request
     * @param float $amount Payment amount in AZN
     * @param string $orderId Unique order ID
     * @param string $callbackUrl Callback URL for payment status
     * @param string $description Payment description
     * @return array Response from Portmanat API
     */
    public function createPayment($amount, $orderId, $callbackUrl, $description = '') {
        $data = [
            'merchant_id' => $this->merchant_id,
            'amount' => number_format($amount, 2, '.', ''), // Format amount properly
            'order_id' => $orderId,
            'callback_url' => $callbackUrl,
            'currency' => 'AZN',
            'description' => $description ?: 'SMM Panel Order #' . $orderId,
            'language' => 'az', // Azerbaijani language
            'return_url' => $callbackUrl // Return URL after payment
        ];

        // Generate signature
        $data['sign'] = $this->generateSignature($data);
        
        if ($this->debug_mode) {
            error_log("Portmanat API Request Data: " . json_encode($data));
        }
        
        // Make API request - try different endpoints
        $response = $this->makeRequest('/create-payment', $data);
        
        // If first endpoint fails, try alternative
        if (!$response || (isset($response['success']) && !$response['success'])) {
            error_log("First endpoint failed, trying alternative endpoint");
            $response = $this->makeRequest('/payment/create', $data);
        }
        
        if ($this->debug_mode) {
            error_log("Portmanat API Response: " . json_encode($response));
        }
        
        return $response;
    }

    /**
     * Check payment status
     * @param string $paymentId Payment ID from createPayment response
     * @return array Payment status information
     */
    public function checkPaymentStatus($paymentId) {
        $data = [
            'merchant_id' => $this->merchant_id,
            'payment_id' => $paymentId
        ];

        $data['sign'] = $this->generateSignature($data);
        
        return $this->makeRequest('/check-payment', $data);
    }

    /**
     * Get payment history
     * @param string $startDate Start date (YYYY-MM-DD)
     * @param string $endDate End date (YYYY-MM-DD)
     * @return array Payment history
     */
    public function getPaymentHistory($startDate, $endDate) {
        $data = [
            'merchant_id' => $this->merchant_id,
            'start_date' => $startDate,
            'end_date' => $endDate
        ];

        $data['sign'] = $this->generateSignature($data);
        
        return $this->makeRequest('/payment-history', $data);
    }

    /**
     * Verify callback signature
     * @param array $data Callback data from Portmanat
     * @param string $signature Signature from callback
     * @return bool True if signature is valid
     */
    public function verifySignature($data, $signature) {
        // Remove signature from data for verification
        $dataForSign = $data;
        unset($dataForSign['sign']);
        
        $calculated_sign = $this->generateSignature($dataForSign);
        return hash_equals($calculated_sign, $signature);
    }

    /**
     * Generate signature for API requests
     * @param array $data Data to sign
     * @return string Generated signature
     */
    private function generateSignature($data) {
        // Sort data by keys alphabetically
        ksort($data);
        
        // Create signature string
        $sign_string = '';
        foreach ($data as $key => $value) {
            if ($key !== 'sign' && !empty($value)) {
                $sign_string .= $key . '=' . $value . '&';
            }
        }
        
        // Remove last '&' and add secret key
        $sign_string = rtrim($sign_string, '&') . $this->secret_key;
        
        if ($this->debug_mode) {
            error_log("Portmanat Signature String: " . $sign_string);
        }
        
        // Generate MD5 hash
        return md5($sign_string);
    }

    /**
     * Make HTTP request to Portmanat API
     * @param string $endpoint API endpoint
     * @param array $data Request data
     * @return array Response data
     */
    private function makeRequest($endpoint, $data) {
        $url = $this->api_url . $endpoint;
        
        // Prepare cURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_USERAGENT, 'SMM Panel/1.0');
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/x-www-form-urlencoded',
            'Accept: application/json'
        ]);
        
        // Enhanced debug mode
        if ($this->debug_mode) {
            curl_setopt($ch, CURLOPT_VERBOSE, true);
            curl_setopt($ch, CURLOPT_HEADER, true);
            
            // Capture verbose output
            $verbose = fopen('php://temp', 'w+');
            curl_setopt($ch, CURLOPT_STDERR, $verbose);
        }
        
        // Make request
        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curl_error = curl_error($ch);
        $curl_info = curl_getinfo($ch);
        
        curl_close($ch);
        
        // Enhanced debug logging
        if ($this->debug_mode) {
            // Get verbose output
            if (isset($verbose)) {
                rewind($verbose);
                $verbose_log = stream_get_contents($verbose);
                fclose($verbose);
                
                error_log("Portmanat API Verbose Log: " . $verbose_log);
            }
            
            // Log complete request info
            error_log("Portmanat API Request Info: " . json_encode([
                'url' => $url,
                'data' => $data,
                'http_code' => $http_code,
                'curl_error' => $curl_error,
                'curl_info' => $curl_info
            ]));
            
            // Log complete raw response
            error_log("Portmanat API Raw Response: " . $response);
        }
        
        // Check for cURL errors
        if ($curl_error) {
            error_log("Portmanat API cURL Error: " . $curl_error);
            return [
                'success' => false,
                'error' => 'cURL Error: ' . $curl_error
            ];
        }
        
        // Check HTTP status
        if ($http_code !== 200) {
            error_log("Portmanat API HTTP Error: Status $http_code, Response: $response");
            return [
                'success' => false,
                'error' => "HTTP Error: $http_code",
                'response' => $response
            ];
        }
        
        // Enhanced response parsing for debug mode
        if ($this->debug_mode) {
            // Try to separate headers from body
            $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
            $headers = substr($response, 0, $header_size);
            $body = substr($response, $header_size);
            
            error_log("Portmanat API Response Headers: " . $headers);
            error_log("Portmanat API Response Body: " . $body);
            
            // Try to decode JSON from body
            $json_data = json_decode($body, true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                error_log("Portmanat API JSON Decode Error: " . json_last_error_msg());
                error_log("Portmanat API Response Body (raw): " . bin2hex($body));
                
                return [
                    'success' => false,
                    'error' => 'Invalid JSON response: ' . json_last_error_msg(),
                    'debug_info' => [
                        'raw_response' => $response,
                        'headers' => $headers,
                        'body' => $body,
                        'http_code' => $http_code,
                        'json_error' => json_last_error_msg()
                    ]
                ];
            }
            
            return $json_data;
        }
        
        // Normal response parsing (non-debug mode)
        $json_data = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            error_log("Portmanat API JSON Decode Error: " . json_last_error_msg());
            error_log("Portmanat API Raw Response: " . $response);
            
            // Try to extract useful information from non-JSON response
            $extracted_info = $this->extractInfoFromResponse($response);
            
            return [
                'success' => false,
                'error' => 'Invalid JSON response: ' . json_last_error_msg(),
                'response' => $response,
                'extracted_info' => $extracted_info
            ];
        }
        
        return $json_data;
    }

    /**
     * Get payment URL for redirect
     * @param string $paymentId Payment ID
     * @return string Payment URL
     */
    public function getPaymentUrl($paymentId) {
        return 'https://portmanat.az/payment/' . $paymentId;
    }

    /**
     * Get merchant balance
     * @return array Balance information
     */
    public function getBalance() {
        $data = [
            'merchant_id' => $this->merchant_id
        ];

        $data['sign'] = $this->generateSignature($data);
        
        return $this->makeRequest('/balance', $data);
    }

    /**
     * Test API connection
     * @return array Test result
     */
    public function testConnection() {
        try {
            // Test with a simple balance request
            $balance = $this->getBalance();
            
            if ($balance && isset($balance['success']) && $balance['success']) {
                return [
                    'success' => true,
                    'message' => 'API connection successful',
                    'balance' => $balance
                ];
            } else {
                // Try alternative endpoint
                error_log("First balance endpoint failed, trying alternative");
                $balance = $this->makeRequest('/balance', ['merchant_id' => $this->merchant_id]);
                
                if ($balance && isset($balance['success']) && $balance['success']) {
                    return [
                        'success' => true,
                        'message' => 'API connection successful (alternative endpoint)',
                        'balance' => $balance
                    ];
                } else {
                    return [
                        'success' => false,
                        'message' => 'API connection failed - both endpoints failed',
                        'balance' => $balance
                    ];
                }
            }
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'API connection failed: ' . $e->getMessage()
            ];
        } catch (Error $e) {
            return [
                'success' => false,
                'message' => 'API connection failed (fatal): ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Extract useful information from non-JSON response
     * @param string $response Raw response from API
     * @return array Extracted information
     */
    private function extractInfoFromResponse($response) {
        $info = [
            'response_length' => strlen($response),
            'response_preview' => substr($response, 0, 200),
            'contains_html' => strpos($response, '<html') !== false,
            'contains_error' => false,
            'error_message' => '',
            'suggested_fix' => ''
        ];
        
        // Check for common error patterns
        if (strpos($response, 'error') !== false) {
            $info['contains_error'] = true;
            $info['error_message'] = 'Response contains error keyword';
        }
        
        if (strpos($response, '404') !== false) {
            $info['suggested_fix'] = 'API endpoint not found - check URL';
        } elseif (strpos($response, '500') !== false) {
            $info['suggested_fix'] = 'Server error - try again later';
        } elseif (strpos($response, '403') !== false) {
            $info['suggested_fix'] = 'Access forbidden - check credentials';
        } elseif (strpos($response, '401') !== false) {
            $info['suggested_fix'] = 'Unauthorized - check API key';
        }
        
        return $info;
    }
    
    /**
     * Enable/disable debug mode
     * @param bool $enabled
     */
    public function setDebugMode($enabled) {
        $this->debug_mode = $enabled;
    }
}
?>