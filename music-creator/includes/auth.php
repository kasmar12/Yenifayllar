<?php
require_once 'database.php';

class Auth {
    private $db;
    
    public function __construct() {
        $this->db = db();
    }
    
    // User registration
    public function register($username, $email, $password, $fullName = '') {
        try {
            // Check if username or email already exists
            $existingUser = $this->db->fetch(
                "SELECT id FROM users WHERE username = ? OR email = ?",
                [$username, $email]
            );
            
            if ($existingUser) {
                return ['success' => false, 'message' => 'Username or email already exists'];
            }
            
            // Validate password
            if (strlen($password) < PASSWORD_MIN_LENGTH) {
                return ['success' => false, 'message' => 'Password must be at least ' . PASSWORD_MIN_LENGTH . ' characters'];
            }
            
            // Hash password
            $passwordHash = password_hash($password, PASSWORD_DEFAULT);
            
            // Insert user
            $userId = $this->db->insert('users', [
                'username' => $username,
                'email' => $email,
                'password_hash' => $passwordHash,
                'full_name' => $fullName,
                'subscription_type' => 'free',
                'credits' => MAX_CREDITS_FREE
            ]);
            
            // Create user settings
            $this->db->insert('user_settings', [
                'user_id' => $userId,
                'theme' => 'dark',
                'language' => 'en'
            ]);
            
            return ['success' => true, 'user_id' => $userId];
            
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Registration failed: ' . $e->getMessage()];
        }
    }
    
    // User login
    public function login($username, $password) {
        try {
            // Get user by username or email
            $user = $this->db->fetch(
                "SELECT * FROM users WHERE username = ? OR email = ?",
                [$username, $username]
            );
            
            if (!$user) {
                return ['success' => false, 'message' => 'Invalid credentials'];
            }
            
            // Check password
            if (!password_verify($password, $user['password_hash'])) {
                return ['success' => false, 'message' => 'Invalid credentials'];
            }
            
            // Check if account is locked
            if (isset($_SESSION['login_attempts'][$user['id']]) && 
                $_SESSION['login_attempts'][$user['id']]['count'] >= LOGIN_ATTEMPTS_LIMIT &&
                time() - $_SESSION['login_attempts'][$user['id']]['time'] < LOGIN_TIMEOUT) {
                return ['success' => false, 'message' => 'Account temporarily locked. Try again later.'];
            }
            
            // Reset login attempts
            unset($_SESSION['login_attempts'][$user['id']]);
            
            // Set session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['email'] = $user['email'];
            $_SESSION['subscription_type'] = $user['subscription_type'];
            $_SESSION['credits'] = $user['credits'];
            $_SESSION['login_time'] = time();
            
            // Update last login
            $this->db->update('users', 
                ['updated_at' => date('Y-m-d H:i:s')], 
                'id = ?', 
                [$user['id']]
            );
            
            return ['success' => true, 'user' => $user];
            
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Login failed: ' . $e->getMessage()];
        }
    }
    
    // Check if user is logged in
    public function isLoggedIn() {
        if (!isset($_SESSION['user_id'])) {
            return false;
        }
        
        // Check session timeout
        if (time() - $_SESSION['login_time'] > SESSION_TIMEOUT) {
            $this->logout();
            return false;
        }
        
        return true;
    }
    
    // Get current user data
    public function getCurrentUser() {
        if (!$this->isLoggedIn()) {
            return null;
        }
        
        return [
            'id' => $_SESSION['user_id'],
            'username' => $_SESSION['username'],
            'email' => $_SESSION['email'],
            'subscription_type' => $_SESSION['subscription_type'],
            'credits' => $_SESSION['credits']
        ];
    }
    
    // Logout user
    public function logout() {
        session_destroy();
        return true;
    }
    
    // Check if user has required credits
    public function hasCredits($required = 1) {
        if (!$this->isLoggedIn()) {
            return false;
        }
        
        return $_SESSION['credits'] >= $required;
    }
    
    // Deduct credits from user
    public function deductCredits($amount = 1) {
        if (!$this->isLoggedIn()) {
            return false;
        }
        
        try {
            $this->db->update('users', 
                ['credits' => $_SESSION['credits'] - $amount], 
                'id = ?', 
                [$_SESSION['user_id']]
            );
            
            $_SESSION['credits'] -= $amount;
            return true;
            
        } catch (Exception $e) {
            return false;
        }
    }
    
    // Check subscription type
    public function hasSubscription($type) {
        if (!$this->isLoggedIn()) {
            return false;
        }
        
        $subscriptionLevels = [
            'free' => 0,
            'premium' => 1,
            'pro' => 2
        ];
        
        $userLevel = $subscriptionLevels[$_SESSION['subscription_type']] ?? 0;
        $requiredLevel = $subscriptionLevels[$type] ?? 0;
        
        return $userLevel >= $requiredLevel;
    }
}

// Helper function to get auth instance
function auth() {
    return new Auth();
}
?>