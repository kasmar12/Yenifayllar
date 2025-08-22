<?php
/**
 * Admin login page
 * Handles authentication and session management
 */

require_once '../includes/functions.php';

// Redirect if already logged in
if (isAdmin()) {
    header('Location: admin-dashboard.php');
    exit;
}

$error = '';
$success = '';

// Handle login form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = sanitizeInput($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';
    
    // Validate credentials
    if (empty($username) || empty($password)) {
        $error = 'Please enter both username and password.';
    } elseif ($username === ADMIN_USERNAME && $password === ADMIN_PASSWORD) {
        // Login successful
        $_SESSION['admin_logged_in'] = true;
        $_SESSION['admin_username'] = $username;
        $_SESSION['admin_login_time'] = time();
        
        // Log successful login
        logAdminActivity('Admin Login', 'Successful login from ' . $_SERVER['REMOTE_ADDR']);
        
        // Redirect to dashboard
        header('Location: admin-dashboard.php');
        exit;
    } else {
        // Login failed
        $error = 'Invalid username or password.';
        
        // Log failed login attempt
        logAdminActivity('Admin Login Failed', 'Failed login attempt from ' . $_SERVER['REMOTE_ADDR']);
    }
}

// Handle logout
if (isset($_GET['logout'])) {
    session_destroy();
    $success = 'You have been successfully logged out.';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Admin Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            max-width: 450px;
            width: 100%;
        }
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .login-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 2rem;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 25px;
            width: 100%;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .input-group-text {
            background: #f8f9fa;
            border-right: none;
        }
        .form-control {
            border-left: none;
        }
        .form-control:focus + .input-group-text {
            border-color: #667eea;
        }
        .alert {
            border-radius: 15px;
            border: none;
        }
        .back-link {
            text-align: center;
            margin-top: 1.5rem;
        }
        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="login-icon">
                <i class="fas fa-user-shield"></i>
            </div>
            <h2 class="text-dark mb-2">Admin Login</h2>
            <p class="text-muted">Access your SMM Panel dashboard</p>
        </div>
        
        <?php if ($error): ?>
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>
        
        <?php if ($success): ?>
            <div class="alert alert-success" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                <?php echo htmlspecialchars($success); ?>
            </div>
        <?php endif; ?>
        
        <form method="POST" id="loginForm">
            <div class="mb-3">
                <label for="username" class="form-label">
                    <strong><i class="fas fa-user me-2"></i>Username</strong>
                </label>
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-user"></i>
                    </span>
                    <input type="text" 
                           class="form-control" 
                           id="username" 
                           name="username" 
                           placeholder="Enter admin username"
                           value="<?php echo htmlspecialchars($_POST['username'] ?? ''); ?>"
                           required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">
                    <strong><i class="fas fa-lock me-2"></i>Password</strong>
                </label>
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                    </span>
                    <input type="password" 
                           class="form-control" 
                           id="password" 
                           name="password" 
                           placeholder="Enter admin password"
                           required>
                </div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-login btn-lg" id="loginBtn">
                    <i class="fas fa-sign-in-alt me-2"></i>
                    Login to Dashboard
                </button>
            </div>
        </form>

        <div class="back-link">
            <a href="index.php">
                <i class="fas fa-arrow-left me-1"></i>
                Back to Main Site
            </a>
        </div>

        <div class="mt-4 text-center">
            <small class="text-muted">
                <i class="fas fa-shield-alt me-1"></i>
                Secure admin access only
            </small>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form enhancement
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const loginBtn = document.getElementById('loginBtn');
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value;
            
            if (!username || !password) {
                e.preventDefault();
                alert('Please fill in all fields');
                return false;
            }
            
            // Show loading state
            loginBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Logging in...';
            loginBtn.disabled = true;
        });
        
        // Auto-focus username field
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('username').focus();
        });
        
        // Enter key navigation
        document.getElementById('username').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('password').focus();
            }
        });
        
        document.getElementById('password').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('loginForm').submit();
            }
        });
    </script>
</body>
</html>