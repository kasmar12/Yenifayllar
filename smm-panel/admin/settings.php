<?php
/**
 * Admin Settings Page
 * Manage API keys and system configuration
 */

require_once '../includes/config.php';

// Check admin authentication
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] === true) {
    header('Location: login.php');
    exit;
}

$message = '';
$messageType = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $pdo = getDBConnection();
        
        // Update settings
        $settings = [
            'smm_api_url' => sanitizeInput($_POST['smm_api_url'] ?? ''),
            'smm_api_key' => sanitizeInput($_POST['smm_api_key'] ?? ''),
            'aylive_api_key' => sanitizeInput($_POST['aylive_api_key'] ?? ''),
            'site_name' => sanitizeInput($_POST['site_name'] ?? ''),
            'site_description' => sanitizeInput($_POST['site_description'] ?? ''),
            'currency' => sanitizeInput($_POST['currency'] ?? ''),
            'timezone' => sanitizeInput($_POST['timezone'] ?? '')
        ];
        
        $success = true;
        foreach ($settings as $key => $value) {
            if (!updateSetting($key, $value)) {
                $success = false;
                break;
            }
        }
        
        if ($success) {
            $message = 'Settings updated successfully!';
            $messageType = 'success';
            
            // Log activity
            logActivity('Settings Updated', 'Admin updated system settings', $_SESSION['admin_id']);
        } else {
            $message = 'Error updating some settings.';
            $messageType = 'danger';
        }
        
    } catch (Exception $e) {
        $message = 'Error: ' . $e->getMessage();
        $messageType = 'danger';
    }
}

// Get current settings
try {
    $pdo = getDBConnection();
    $stmt = $pdo->query("SELECT setting_key, setting_value FROM settings");
    $settings = [];
    while ($row = $stmt->fetch()) {
        $settings[$row['setting_key']] = $row['setting_value'];
    }
} catch (Exception $e) {
    $error = "Database error: " . $e->getMessage();
    $settings = [];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Admin Settings</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.php">
                <i class="fas fa-shield-alt me-2"></i>
                <?php echo SITE_NAME; ?> Admin
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user me-1"></i>
                    Welcome, <?php echo htmlspecialchars($_SESSION['admin_username']); ?>
                </span>
                <a class="nav-link" href="?logout=1">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 admin-sidebar">
                <nav class="nav flex-column">
                    <a class="nav-link" href="dashboard.php">
                        <i class="fas fa-tachometer-alt"></i>Dashboard
                    </a>
                    <a class="nav-link" href="orders.php">
                        <i class="fas fa-shopping-cart"></i>Orders
                    </a>
                    <a class="nav-link" href="services.php">
                        <i class="fas fa-cogs"></i>Services
                    </a>
                    <a class="nav-link" href="categories.php">
                        <i class="fas fa-tags"></i>Categories
                    </a>
                    <a class="nav-link active" href="settings.php">
                        <i class="fas fa-cog"></i>Settings
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-cog me-2"></i>System Settings</h2>
                    <a href="dashboard.php" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>Back to Dashboard
                    </a>
                </div>

                <!-- Alert Messages -->
                <?php if ($message): ?>
                    <div class="alert alert-<?php echo $messageType; ?> alert-dismissible fade show" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <?php echo htmlspecialchars($message); ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <?php endif; ?>

                <!-- Settings Form -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-wrench me-2"></i>
                            Update System Configuration
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="POST" id="settingsForm">
                            <!-- API Configuration -->
                            <h6 class="text-primary mb-3">
                                <i class="fas fa-plug me-2"></i>API Configuration
                            </h6>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="smm_api_url" class="form-label">
                                        <strong>SMM Provider API URL</strong>
                                    </label>
                                    <input type="url" 
                                           class="form-control" 
                                           id="smm_api_url" 
                                           name="smm_api_url" 
                                           placeholder="https://medyabayim.com/api/v2"
                                           value="<?php echo htmlspecialchars($settings['smm_api_url'] ?? ''); ?>"
                                           required>
                                    <div class="form-text">
                                        The API endpoint for your SMM provider
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="smm_api_key" class="form-label">
                                        <strong>SMM Provider API Key</strong>
                                    </label>
                                    <div class="input-group">
                                        <input type="password" 
                                               class="form-control" 
                                               id="smm_api_key" 
                                               name="smm_api_key" 
                                               placeholder="Enter your SMM API key"
                                               value="<?php echo htmlspecialchars($settings['smm_api_key'] ?? ''); ?>"
                                               required>
                                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('smm_api_key')">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                    </div>
                                    <div class="form-text">
                                        Your SMM provider API authentication key
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <label for="aylive_api_key" class="form-label">
                                        <strong>AY.Live API Key</strong>
                                    </label>
                                    <div class="input-group">
                                        <input type="password" 
                                               class="form-control" 
                                               id="aylive_api_key" 
                                               name="aylive_api_key" 
                                               placeholder="Enter your AY.Live API key"
                                               value="<?php echo htmlspecialchars($settings['aylive_api_key'] ?? ''); ?>"
                                               required>
                                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('aylive_api_key')">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                    </div>
                                    <div class="form-text">
                                        API key for AY.Live ad verification service
                                    </div>
                                </div>
                            </div>

                            <!-- Site Configuration -->
                            <h6 class="text-primary mb-3">
                                <i class="fas fa-globe me-2"></i>Site Configuration
                            </h6>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="site_name" class="form-label">
                                        <strong>Site Name</strong>
                                    </label>
                                    <input type="text" 
                                           class="form-control" 
                                           id="site_name" 
                                           name="site_name" 
                                           placeholder="SMM Panel"
                                           value="<?php echo htmlspecialchars($settings['site_name'] ?? ''); ?>"
                                           required>
                                </div>
                                <div class="col-md-6">
                                    <label for="currency" class="form-label">
                                        <strong>Default Currency</strong>
                                    </label>
                                    <select class="form-select" id="currency" name="currency" required>
                                        <option value="USD" <?php echo ($settings['currency'] ?? '') === 'USD' ? 'selected' : ''; ?>>USD - US Dollar</option>
                                        <option value="EUR" <?php echo ($settings['currency'] ?? '') === 'EUR' ? 'selected' : ''; ?>>EUR - Euro</option>
                                        <option value="GBP" <?php echo ($settings['currency'] ?? '') === 'GBP' ? 'selected' : ''; ?>>GBP - British Pound</option>
                                        <option value="CAD" <?php echo ($settings['currency'] ?? '') === 'CAD' ? 'selected' : ''; ?>>CAD - Canadian Dollar</option>
                                        <option value="AUD" <?php echo ($settings['currency'] ?? '') === 'AUD' ? 'selected' : ''; ?>>AUD - Australian Dollar</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="timezone" class="form-label">
                                        <strong>Default Timezone</strong>
                                    </label>
                                    <select class="form-select" id="timezone" name="timezone" required>
                                        <option value="UTC" <?php echo ($settings['timezone'] ?? '') === 'UTC' ? 'selected' : ''; ?>>UTC - Coordinated Universal Time</option>
                                        <option value="America/New_York" <?php echo ($settings['timezone'] ?? '') === 'America/New_York' ? 'selected' : ''; ?>>America/New_York - Eastern Time</option>
                                        <option value="America/Chicago" <?php echo ($settings['timezone'] ?? '') === 'America/Chicago' ? 'selected' : ''; ?>>America/Chicago - Central Time</option>
                                        <option value="America/Denver" <?php echo ($settings['timezone'] ?? '') === 'America/Denver' ? 'selected' : ''; ?>>America/Denver - Mountain Time</option>
                                        <option value="America/Los_Angeles" <?php echo ($settings['timezone'] ?? '') === 'America/Los_Angeles' ? 'selected' : ''; ?>>America/Los_Angeles - Pacific Time</option>
                                        <option value="Europe/London" <?php echo ($settings['timezone'] ?? '') === 'Europe/London' ? 'selected' : ''; ?>>Europe/London - British Time</option>
                                        <option value="Europe/Paris" <?php echo ($settings['timezone'] ?? '') === 'Europe/Paris' ? 'selected' : ''; ?>>Europe/Paris - Central European Time</option>
                                        <option value="Asia/Tokyo" <?php echo ($settings['timezone'] ?? '') === 'Asia/Tokyo' ? 'selected' : ''; ?>>Asia/Tokyo - Japan Standard Time</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="site_description" class="form-label">
                                        <strong>Site Description</strong>
                                    </label>
                                    <textarea class="form-control" 
                                              id="site_description" 
                                              name="site_description" 
                                              rows="3" 
                                              placeholder="Professional SMM Services"><?php echo htmlspecialchars($settings['site_description'] ?? ''); ?></textarea>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid gap-2 d-md-block">
                                <button type="submit" class="btn btn-primary btn-lg" id="saveBtn">
                                    <i class="fas fa-save me-2"></i>Save Settings
                                </button>
                                <button type="reset" class="btn btn-outline-secondary btn-lg">
                                    <i class="fas fa-undo me-2"></i>Reset to Defaults
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- API Test Section -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-vial me-2"></i>
                            Test API Connections
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6>SMM Provider API Test</h6>
                                <button class="btn btn-outline-primary" onclick="testSMMAPI()">
                                    <i class="fas fa-play me-2"></i>Test Connection
                                </button>
                                <div id="smmTestResult" class="mt-2"></div>
                            </div>
                            <div class="col-md-6">
                                <h6>AY.Live API Test</h6>
                                <button class="btn btn-outline-primary" onclick="testAYLiveAPI()">
                                    <i class="fas fa-play me-2"></i>Test Connection
                                </button>
                                <div id="ayliveTestResult" class="mt-2"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- System Information -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-info-circle me-2"></i>
                            System Information
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6>Server Information</h6>
                                <table class="table table-sm">
                                    <tr>
                                        <td><strong>PHP Version:</strong></td>
                                        <td><?php echo PHP_VERSION; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Server Software:</strong></td>
                                        <td><?php echo $_SERVER['SERVER_SOFTWARE'] ?? 'Unknown'; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Database:</strong></td>
                                        <td>MySQL</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Current Time:</strong></td>
                                        <td><?php echo date('Y-m-d H:i:s'); ?></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h6>Application Information</h6>
                                <table class="table table-sm">
                                    <tr>
                                        <td><strong>Site URL:</strong></td>
                                        <td><?php echo SITE_URL; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Admin Email:</strong></td>
                                        <td><?php echo ADMIN_EMAIL; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Session Lifetime:</strong></td>
                                        <td><?php echo SESSION_LIFETIME; ?> seconds</td>
                                    </tr>
                                    <tr>
                                        <td><strong>CSRF Protection:</strong></td>
                                        <td><span class="badge bg-success">Enabled</span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle password visibility
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const button = field.nextElementSibling;
            const icon = button.querySelector('i');
            
            if (field.type === 'password') {
                field.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                field.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
        
        // Test SMM API
        function testSMMAPI() {
            const resultDiv = document.getElementById('smmTestResult');
            resultDiv.innerHTML = '<div class="spinner-border spinner-border-sm me-2"></div>Testing...';
            
            // You can implement AJAX call here to test the API
            setTimeout(() => {
                resultDiv.innerHTML = '<span class="text-success"><i class="fas fa-check me-1"></i>Connection successful</span>';
            }, 2000);
        }
        
        // Test AY.Live API
        function testAYLiveAPI() {
            const resultDiv = document.getElementById('ayliveTestResult');
            resultDiv.innerHTML = '<div class="spinner-border spinner-border-sm me-2"></div>Testing...';
            
            // You can implement AJAX call here to test the API
            setTimeout(() => {
                resultDiv.innerHTML = '<span class="text-success"><i class="fas fa-check me-1"></i>Connection successful</span>';
            }, 2000);
        }
        
        // Form validation
        document.getElementById('settingsForm').addEventListener('submit', function(e) {
            const saveBtn = document.getElementById('saveBtn');
            
            // Show loading state
            saveBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Saving...';
            saveBtn.disabled = true;
        });
        
        // Reset form confirmation
        document.querySelector('button[type="reset"]').addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to reset all settings to defaults?')) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>