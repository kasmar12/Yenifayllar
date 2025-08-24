<?php
require_once 'link_shortener_config.php';

/**
 * Link Shortener Service Class
 * 
 * This class handles the integration with various link shortener services
 * that require users to pass advertisements before accessing the target URL.
 */
class LinkShortener {
    private $api_url;
    private $api_key;
    private $callback_url;
    private $service_type;
    private $debug_mode;
    
    public function __construct() {
        $this->api_url = SHORTENER_API_URL;
        $this->api_key = SHORTENER_API_KEY;
        $this->callback_url = SHORTENER_CALLBACK_URL;
        $this->service_type = LINK_SHORTENER_SERVICE;
        $this->debug_mode = SHORTENER_DEBUG_MODE;
        
        if ($this->debug_mode) {
            error_log("LinkShortener initialized with service: " . $this->service_type);
        }
    }
    
    /**
     * Generate a short link for the given URL
     * 
     * @param string $target_url The URL to shorten
     * @param string $order_id Order ID for tracking
     * @param string $custom_alias Custom alias for the link (optional)
     * @return array Response with short link details
     */
    public function generateShortLink($target_url, $order_id, $custom_alias = '') {
        try {
            // Generate unique alias if not provided
            if (empty($custom_alias)) {
                $custom_alias = 'order_' . $order_id . '_' . time();
            }
            
            // Log the request
            $this->log("Generating short link for order #$order_id", [
                'target_url' => $target_url,
                'alias' => $custom_alias,
                'service' => $this->service_type
            ]);
            
            // Generate link based on service type
            switch ($this->service_type) {
                case 'aylive':
                    return $this->generateAYLiveLink($target_url, $order_id, $custom_alias);
                    
                case 'linkvertise':
                    return $this->generateLinkvertiseLink($target_url, $order_id, $custom_alias);
                    
                case 'ouo':
                    return $this->generateOUOLink($target_url, $order_id, $custom_alias);
                    
                default:
                    return $this->generateAYLiveLink($target_url, $order_id, $custom_alias);
            }
            
        } catch (Exception $e) {
            $this->log("Error generating short link: " . $e->getMessage(), [
                'order_id' => $order_id,
                'target_url' => $target_url
            ]);
            
            return [
                'success' => false,
                'error' => 'Failed to generate short link: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Generate AY.Live short link
     */
    private function generateAYLiveLink($target_url, $order_id, $custom_alias) {
        $short_url = $this->api_url . "?api=" . $this->api_key . "&url=" . urlencode($target_url) . "&alias=" . $custom_alias;
        
        $this->log("AY.Live short link generated", [
            'order_id' => $order_id,
            'short_url' => $short_url
        ]);
        
        return [
            'success' => true,
            'short_url' => $short_url,
            'service' => 'aylive',
            'order_id' => $order_id,
            'alias' => $custom_alias,
            'target_url' => $target_url
        ];
    }
    
    /**
     * Generate Linkvertise short link
     */
    private function generateLinkvertiseLink($target_url, $order_id, $custom_alias) {
        // Linkvertise API implementation would go here
        // For now, return a placeholder
        $this->log("Linkvertise not yet implemented", ['order_id' => $order_id]);
        
        return [
            'success' => false,
            'error' => 'Linkvertise service not yet implemented'
        ];
    }
    
    /**
     * Generate OUO.io short link
     */
    private function generateOUOLink($target_url, $order_id, $custom_alias) {
        // OUO.io API implementation would go here
        // For now, return a placeholder
        $this->log("OUO.io not yet implemented", ['order_id' => $order_id]);
        
        return [
            'success' => false,
            'error' => 'OUO.io service not yet implemented'
        ];
    }
    
    /**
     * Verify if an ad has been completed for a specific order
     * 
     * @param string $order_id Order ID to check
     * @return array Verification result
     */
    public function verifyAdCompletion($order_id) {
        try {
            $this->log("Verifying ad completion for order #$order_id");
            
            // This would typically involve checking with the shortener service
            // For now, we'll implement a basic verification system
            
            // Check if we have a callback record for this order
            $callback_file = "../logs/shortener_callbacks.json";
            if (file_exists($callback_file)) {
                $callbacks = json_decode(file_get_contents($callback_file), true) ?: [];
                
                if (isset($callbacks[$order_id])) {
                    $callback_data = $callbacks[$order_id];
                    
                    if ($callback_data['status'] === 'completed' && 
                        $callback_data['timestamp'] > (time() - AD_VERIFICATION_TIMEOUT)) {
                        
                        $this->log("Ad completion verified for order #$order_id", $callback_data);
                        
                        return [
                            'success' => true,
                            'verified' => true,
                            'timestamp' => $callback_data['timestamp'],
                            'data' => $callback_data
                        ];
                    }
                }
            }
            
            return [
                'success' => true,
                'verified' => false,
                'message' => 'Ad not yet completed or verification expired'
            ];
            
        } catch (Exception $e) {
            $this->log("Error verifying ad completion: " . $e->getMessage(), ['order_id' => $order_id]);
            
            return [
                'success' => false,
                'error' => 'Verification failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Process callback from shortener service
     * 
     * @param array $callback_data Callback data from shortener service
     * @return array Processing result
     */
    public function processCallback($callback_data) {
        try {
            $this->log("Processing callback from shortener service", $callback_data);
            
            // Extract order ID from callback data
            $order_id = $this->extractOrderIdFromCallback($callback_data);
            
            if (!$order_id) {
                throw new Exception("Could not extract order ID from callback data");
            }
            
            // Store callback data for verification
            $this->storeCallbackData($order_id, $callback_data);
            
            // Update order status if ad is completed
            if ($this->isAdCompleted($callback_data)) {
                $this->updateOrderStatus($order_id, 'ad_completed');
                
                // If auto-completion is enabled, process the order
                if (ORDER_AUTO_COMPLETE_AFTER_AD) {
                    $this->processOrderAfterAd($order_id);
                }
            }
            
            return [
                'success' => true,
                'order_id' => $order_id,
                'processed' => true
            ];
            
        } catch (Exception $e) {
            $this->log("Error processing callback: " . $e->getMessage(), $callback_data);
            
            return [
                'success' => false,
                'error' => 'Callback processing failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Extract order ID from callback data
     */
    private function extractOrderIdFromCallback($callback_data) {
        // Try different methods to extract order ID
        if (isset($callback_data['order_id'])) {
            return $callback_data['order_id'];
        }
        
        if (isset($callback_data['alias'])) {
            // Extract from alias like "order_123_timestamp"
            if (preg_match('/order_(\d+)_/', $callback_data['alias'], $matches)) {
                return $matches[1];
            }
        }
        
        if (isset($callback_data['custom_data'])) {
            return $callback_data['custom_data'];
        }
        
        return null;
    }
    
    /**
     * Check if ad is completed based on callback data
     */
    private function isAdCompleted($callback_data) {
        // Check various completion indicators
        if (isset($callback_data['status']) && $callback_data['status'] === 'completed') {
            return true;
        }
        
        if (isset($callback_data['completed']) && $callback_data['completed'] === true) {
            return true;
        }
        
        if (isset($callback_data['ad_passed']) && $callback_data['ad_passed'] === true) {
            return true;
        }
        
        return false;
    }
    
    /**
     * Store callback data for later verification
     */
    private function storeCallbackData($order_id, $callback_data) {
        $callback_file = "../logs/shortener_callbacks.json";
        $callbacks = [];
        
        if (file_exists($callback_file)) {
            $callbacks = json_decode(file_get_contents($callback_file), true) ?: [];
        }
        
        $callbacks[$order_id] = [
            'status' => $this->isAdCompleted($callback_data) ? 'completed' : 'pending',
            'timestamp' => time(),
            'data' => $callback_data
        ];
        
        file_put_contents($callback_file, json_encode($callbacks, JSON_PRETTY_PRINT));
        
        $this->log("Callback data stored for order #$order_id", $callbacks[$order_id]);
    }
    
    /**
     * Update order status in database
     */
    private function updateOrderStatus($order_id, $new_status) {
        try {
            require_once 'database.php';
            $database = new Database();
            $db = $database->getConnection();
            
            if ($db) {
                $query = "UPDATE orders SET status = ? WHERE id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$new_status, $order_id]);
                
                $this->log("Order #$order_id status updated to: $new_status");
            }
        } catch (Exception $e) {
            $this->log("Error updating order status: " . $e->getMessage(), ['order_id' => $order_id]);
        }
    }
    
    /**
     * Process order after ad completion
     */
    private function processOrderAfterAd($order_id) {
        try {
            $this->log("Processing order #$order_id after ad completion");
            
            // Get order details
            require_once 'database.php';
            $database = new Database();
            $db = $database->getConnection();
            
            if (!$db) {
                throw new Exception("Database connection failed");
            }
            
            $query = "SELECT o.*, s.api_service_id FROM orders o 
                      JOIN services s ON o.service_id = s.id 
                      WHERE o.id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$order_id]);
            $order = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if (!$order) {
                throw new Exception("Order not found");
            }
            
            // Send to SMM API
            require_once 'smm_api.php';
            $smm_api = new SMMAPI();
            
            $api_response = $smm_api->createOrder(
                $order['api_service_id'],
                $order['link'],
                $order['amount']
            );
            
            if ($api_response && isset($api_response['order'])) {
                // Update order with API order ID and status
                $query = "UPDATE orders SET status = 'processing', api_order_id = ? WHERE id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$api_response['order'], $order_id]);
                
                $this->log("Order #$order_id sent to SMM API successfully", [
                    'api_order_id' => $api_response['order']
                ]);
                
                // Send notification if enabled
                if (SEND_NOTIFICATION_ON_ORDER_COMPLETE) {
                    $this->sendOrderNotification($order_id, 'processing');
                }
                
            } else {
                // Update order status to failed
                $query = "UPDATE orders SET status = 'api_failed' WHERE id = ?";
                $stmt = $db->prepare($query);
                $stmt->execute([$order_id]);
                
                $this->log("Order #$order_id failed to send to SMM API");
            }
            
        } catch (Exception $e) {
            $this->log("Error processing order after ad: " . $e->getMessage(), ['order_id' => $order_id]);
        }
    }
    
    /**
     * Send notification about order status
     */
    private function sendOrderNotification($order_id, $status) {
        // Implementation for sending notifications
        // This could be email, SMS, webhook, etc.
        $this->log("Notification sent for order #$order_id", ['status' => $status]);
    }
    
    /**
     * Log messages and data
     */
    private function log($message, $data = []) {
        if (!SHORTENER_LOG_ENABLED) {
            return;
        }
        
        $log_entry = [
            'timestamp' => date('Y-m-d H:i:s'),
            'message' => $message,
            'data' => $data
        ];
        
        $log_file = SHORTENER_LOG_FILE;
        $log_dir = dirname($log_file);
        
        if (!is_dir($log_dir)) {
            mkdir($log_dir, 0755, true);
        }
        
        file_put_contents($log_file, json_encode($log_entry) . "\n", FILE_APPEND | LOCK_EX);
        
        if ($this->debug_mode) {
            error_log("LinkShortener: " . $message . " - " . json_encode($data));
        }
    }
}
?>