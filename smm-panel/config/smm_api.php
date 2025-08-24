<?php
class SMMAPI {
    private $api_url;
    private $api_key;
    private $log_file;

    public function __construct() {
        $this->api_url = 'https://your-smm-api.com/api'; // Change this
        $this->api_key = 'YOUR_SMM_API_KEY'; // Change this
        $this->log_file = '../logs/smm_api_log.txt';
    }

    /**
     * Create a new order in SMM API
     */
    public function createOrder($serviceId, $link, $amount) {
        $data = [
            'key' => $this->api_key,
            'action' => 'add',
            'service' => $serviceId,
            'link' => $link,
            'quantity' => $amount
        ];

        $this->log("Creating order: " . json_encode($data));
        
        $response = $this->makeRequest($data);
        $this->log("Order creation response: " . json_encode($response));
        
        return $response;
    }

    /**
     * Get order status from SMM API
     */
    public function getOrderStatus($orderId) {
        $data = [
            'key' => $this->api_key,
            'action' => 'status',
            'order' => $orderId
        ];

        $this->log("Checking order status: " . json_encode($data));
        
        $response = $this->makeRequest($data);
        $this->log("Order status response: " . json_encode($response));
        
        return $response;
    }

    /**
     * Get available services from SMM API
     */
    public function getServices() {
        $data = [
            'key' => $this->api_key,
            'action' => 'services'
        ];

        $this->log("Getting services: " . json_encode($data));
        
        $response = $this->makeRequest($data);
        $this->log("Services response: " . json_encode($response));
        
        return $response;
    }

    /**
     * Get account balance from SMM API
     */
    public function getBalance() {
        $data = [
            'key' => $this->api_key,
            'action' => 'balance'
        ];

        $this->log("Getting balance: " . json_encode($data));
        
        $response = $this->makeRequest($data);
        $this->log("Balance response: " . json_encode($response));
        
        return $response;
    }

    /**
     * Test API connection
     */
    public function testConnection() {
        try {
            $balance = $this->getBalance();
            if ($balance && isset($balance['balance'])) {
                return [
                    'success' => true,
                    'message' => 'API connection successful',
                    'balance' => $balance['balance'] ?? 'N/A'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'API response invalid',
                    'response' => $balance
                ];
            }
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'API connection failed: ' . $e->getMessage()
            ];
        }
    }

    /**
     * Make HTTP request to SMM API
     */
    private function makeRequest($data) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->api_url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        
        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curl_error = curl_error($ch);
        curl_close($ch);
        
        if ($curl_error) {
            $this->log("CURL Error: " . $curl_error);
            throw new Exception("CURL Error: " . $curl_error);
        }
        
        if ($http_code !== 200) {
            $this->log("HTTP Error: " . $http_code);
            throw new Exception("HTTP Error: " . $http_code);
        }
        
        $decoded = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            $this->log("JSON Decode Error: " . json_last_error_msg());
            throw new Exception("JSON Decode Error: " . json_last_error_msg());
        }
        
        return $decoded;
    }

    /**
     * Log API operations
     */
    private function log($message) {
        $timestamp = date('Y-m-d H:i:s');
        $log_entry = "[$timestamp] $message\n";
        file_put_contents($this->log_file, $log_entry, FILE_APPEND | LOCK_EX);
    }

    /**
     * Update API configuration
     */
    public function updateConfig($api_url, $api_key) {
        $this->api_url = $api_url;
        $this->api_key = $api_key;
        
        $this->log("API configuration updated: URL=$api_url, Key=" . substr($api_key, 0, 10) . "...");
    }

    /**
     * Get current configuration (without exposing full API key)
     */
    public function getConfig() {
        return [
            'api_url' => $this->api_url,
            'api_key' => substr($this->api_key, 0, 10) . '...',
            'log_file' => $this->log_file
        ];
    }
}
?>