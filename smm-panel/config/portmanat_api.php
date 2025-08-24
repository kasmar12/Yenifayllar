<?php
class PortmanatAPI {
    private $merchant_id;
    private $secret_key;
    private $api_url = 'https://partners.portmanat.az/api';
    private $debug_mode = true; // Debug mode aktiv edin

    public function __construct() {
        $this->merchant_id = 'YOUR_MERCHANT_ID'; // Portmanat-dan aldığınız merchant ID
        $this->secret_key = 'YOUR_SECRET_KEY';   // Portmanat-dan aldığınız secret key
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
        
        // Make API request
        $response = $this->makeRequest('/create-payment', $data);
        
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
            'merchant_id' => 'YOUR_MERCHANT_ID',
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
        $full_url = $this->api_url . $endpoint;
        
        if ($this->debug_mode) {
            error_log("Portmanat API URL: " . $full_url);
            error_log("Portmanat API Request: " . http_build_query($data));
        }
        
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $full_url,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query($data),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/x-www-form-urlencoded',
                'User-Agent: SMM-Panel/1.0'
            ],
            CURLOPT_TIMEOUT => 30,
            CURLOPT_CONNECTTIMEOUT => 10,
            CURLOPT_SSL_VERIFYPEER => true,
            CURLOPT_SSL_VERIFYHOST => 2,
            CURLOPT_VERBOSE => $this->debug_mode,
            CURLOPT_HEADER => true
        ]);
        
        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        $info = curl_getinfo($ch);
        
        curl_close($ch);
        
        if ($this->debug_mode) {
            error_log("Portmanat API HTTP Code: " . $http_code);
            error_log("Portmanat API CURL Info: " . json_encode($info));
            error_log("Portmanat API Raw Response: " . $response);
        }
        
        if ($error) {
            return [
                'success' => false,
                'error' => 'CURL Error: ' . $error
            ];
        }
        
        if ($http_code !== 200) {
            return [
                'success' => false,
                'error' => 'HTTP Error: ' . $http_code,
                'response' => $response,
                'debug_info' => [
                    'url' => $full_url,
                    'request_data' => $data,
                    'http_code' => $http_code,
                    'raw_response' => $response
                ]
            ];
        }
        
        // Extract body from response (remove headers)
        $body_start = strpos($response, "\r\n\r\n");
        if ($body_start !== false) {
            $response = substr($response, $body_start + 4);
        }
        
        // Parse response
        $response_data = json_decode($response, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            return [
                'success' => false,
                'error' => 'Invalid JSON response: ' . json_last_error_msg(),
                'raw_response' => $response,
                'debug_info' => [
                    'url' => $full_url,
                    'request_data' => $data,
                    'http_code' => $http_code,
                    'json_error' => json_last_error_msg()
                ]
            ];
        }
        
        return $response_data;
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
            $balance = $this->getBalance();
            return [
                'success' => true,
                'message' => 'API connection successful',
                'balance' => $balance
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'API connection failed: ' . $e->getMessage()
            ];
        }
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