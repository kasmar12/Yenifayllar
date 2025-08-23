<?php
/**
 * Settings Management
 * Admin panel for managing system settings
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Check admin authentication
if (!isset($_SESSION['admin_id']) || !isset($_SESSION['admin_username'])) {
    header('Location: login.php');
    exit;
}

// Handle logout
if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: login.php');
    exit;
}

$message = '';
$error = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['update_settings'])) {
        try {
            $pdo = getDBConnection();
            
            // Update SMM API settings
            $smm_api_url = sanitizeInput($_POST['smm_api_url'] ?? '');
            $smm_api_key = sanitizeInput($_POST['smm_api_key'] ?? '');
            
            if (!empty($smm_api_url)) {
                updateSetting('smm_api_url', $smm_api_url);
            }
            if (!empty($smm_api_key)) {
                updateSetting('smm_api_key', $smm_api_key);
            }
            
            // Update AY.Live API settings
            $aylive_api_key = sanitizeInput($_POST['aylive_api_key'] ?? '');
            if (!empty($aylive_api_key)) {
                updateSetting('aylive_api_key', $aylive_api_key);
            }
            
            // Update site settings
            $site_name = sanitizeInput($_POST['site_name'] ?? '');
            $site_description = sanitizeInput($_POST['site_description'] ?? '');
            $currency = sanitizeInput($_POST['currency'] ?? 'USD');
            $timezone = sanitizeInput($_POST['timezone'] ?? 'UTC');
            
            if (!empty($site_name)) {
                updateSetting('site_name', $site_name);
            }
            if (!empty($site_description)) {
                updateSetting('site_description', $site_description);
            }
            if (!empty($currency)) {
                updateSetting('currency', $currency);
            }
            if (!empty($timezone)) {
                updateSetting('timezone', $timezone);
            }
            
            $message = 'Settings updated successfully!';
            
        } catch (Exception $e) {
            $error = 'Database error: ' . $e->getMessage();
        }
    }
}

// Get current settings
$currentSettings = [];
try {
    $pdo = getDBConnection();
    $stmt = $pdo->query("SELECT setting_key, setting_value FROM settings");
    $results = $stmt->fetchAll();
    foreach ($results as $result) {
        $currentSettings[$result['setting_key']] = $result['setting_value'];
    }
} catch (Exception $e) {
    // Use default settings if database not available
    $currentSettings = [
        'smm_api_url' => 'https://medyabayim.com/api/v2',
        'smm_api_key' => 'your_api_key_here',
        'aylive_api_key' => '9556ddb32a7c865f06acf4f8950f64c5045ef2ab',
        'site_name' => 'SMM Panel',
        'site_description' => 'Social Media Marketing Panel',
        'currency' => 'USD',
        'timezone' => 'UTC'
    ];
}

// Test API connections
$smmApiTest = null;
$ayliveApiTest = null;

if (isset($_POST['test_smm_api'])) {
    try {
        $result = getSMMBalance();
        $smmApiTest = $result['success'] ? 'success' : 'error';
        $smmApiTestMessage = $result['success'] ? 'API connection successful!' : 'API connection failed: ' . $result['message'];
    } catch (Exception $e) {
        $smmApiTest = 'error';
        $smmApiTestMessage = 'API test failed: ' . $e->getMessage();
    }
}

if (isset($_POST['test_aylive_api'])) {
    try {
        $result = createAYLiveLink('https://example.com', 'test');
        $ayliveApiTest = $result['success'] ? 'success' : 'error';
        $ayliveApiTestMessage = $result['success'] ? 'API connection successful!' : 'API connection failed: ' . $result['message'];
    } catch (Exception $e) {
        $ayliveApiTest = 'error';
        $ayliveApiTestMessage = 'API test failed: ' . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Settings</title>
    
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

    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2">
                <div class="admin-sidebar">
                    <div class="list-group">
                        <a href="dashboard.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                        </a>
                        <a href="services.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-cogs me-2"></i>Services
                        </a>
                        <a href="categories.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-folder me-2"></i>Categories
                        </a>
                        <a href="orders.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-shopping-cart me-2"></i>Orders
                        </a>
                        <a href="settings.php" class="list-group-item list-group-item-action active">
                            <i class="fas fa-cog me-2"></i>Settings
                        </a>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>
                        <i class="fas fa-cog me-2"></i>
                        System Settings
                    </h2>
                </div>

                <?php if ($message): ?>
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i><?php echo htmlspecialchars($message); ?>
                    </div>
                <?php endif; ?>

                <?php if ($error): ?>
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i><?php echo htmlspecialchars($error); ?>
                    </div>
                <?php endif; ?>

                <form method="POST">
                    <div class="row">
                        <!-- API Settings -->
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-plug me-2"></i>API Settings
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label for="smm_api_url" class="form-label">SMM API URL</label>
                                        <input type="url" class="form-control" id="smm_api_url" name="smm_api_url" 
                                               value="<?php echo htmlspecialchars($currentSettings['smm_api_url'] ?? ''); ?>" 
                                               placeholder="https://medyabayim.com/api/v2">
                                        <div class="form-text">SMM Panel API endpoint URL</div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="smm_api_key" class="form-label">SMM API Key</label>
                                        <input type="text" class="form-control" id="smm_api_key" name="smm_api_key" 
                                               value="<?php echo htmlspecialchars($currentSettings['smm_api_key'] ?? ''); ?>" 
                                               placeholder="Enter your SMM API key">
                                        <div class="form-text">Your SMM Panel API authentication key</div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="aylive_api_key" class="form-label">AY.Live API Key</label>
                                        <input type="text" class="form-control" id="aylive_api_key" name="aylive_api_key" 
                                               value="<?php echo htmlspecialchars($currentSettings['aylive_api_key'] ?? ''); ?>" 
                                               placeholder="Enter your AY.Live API key">
                                        <div class="form-text">AY.Live URL shortener API key</div>
                                    </div>

                                    <div class="d-flex gap-2">
                                        <button type="submit" name="test_smm_api" class="btn btn-outline-info">
                                            <i class="fas fa-test-tube me-2"></i>Test SMM API
                                        </button>
                                        <button type="submit" name="test_aylive_api" class="btn btn-outline-info">
                                            <i class="fas fa-test-tube me-2"></i>Test AY.Live API
                                        </button>
                                    </div>

                                    <?php if ($smmApiTest): ?>
                                        <div class="mt-3">
                                            <div class="alert alert-<?php echo $smmApiTest === 'success' ? 'success' : 'danger'; ?>" role="alert">
                                                <i class="fas fa-<?php echo $smmApiTest === 'success' ? 'check-circle' : 'exclamation-triangle'; ?> me-2"></i>
                                                <?php echo htmlspecialchars($smmApiTestMessage); ?>
                                            </div>
                                        </div>
                                    <?php endif; ?>

                                    <?php if ($ayliveApiTest): ?>
                                        <div class="mt-3">
                                            <div class="alert alert-<?php echo $ayliveApiTest === 'success' ? 'success' : 'danger'; ?>" role="alert">
                                                <i class="fas fa-<?php echo $ayliveApiTest === 'success' ? 'check-circle' : 'exclamation-triangle'; ?> me-2"></i>
                                                <?php echo htmlspecialchars($ayliveApiTestMessage); ?>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>

                        <!-- Site Settings -->
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-globe me-2"></i>Site Settings
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label for="site_name" class="form-label">Site Name</label>
                                        <input type="text" class="form-control" id="site_name" name="site_name" 
                                               value="<?php echo htmlspecialchars($currentSettings['site_name'] ?? ''); ?>" 
                                               placeholder="Enter site name">
                                    </div>

                                    <div class="mb-3">
                                        <label for="site_description" class="form-label">Site Description</label>
                                        <textarea class="form-control" id="site_description" name="site_description" rows="3" 
                                                  placeholder="Enter site description"><?php echo htmlspecialchars($currentSettings['site_description'] ?? ''); ?></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="currency" class="form-label">Currency</label>
                                                <select class="form-select" id="currency" name="currency">
                                                    <option value="USD" <?php echo ($currentSettings['currency'] ?? '') === 'USD' ? 'selected' : ''; ?>>USD ($)</option>
                                                    <option value="EUR" <?php echo ($currentSettings['currency'] ?? '') === 'EUR' ? 'selected' : ''; ?>>EUR (€)</option>
                                                    <option value="GBP" <?php echo ($currentSettings['currency'] ?? '') === 'GBP' ? 'selected' : ''; ?>>GBP (£)</option>
                                                    <option value="TRY" <?php echo ($currentSettings['currency'] ?? '') === 'TRY' ? 'selected' : ''; ?>>TRY (₺)</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="timezone" class="form-label">Timezone</label>
                                                <select class="form-select" id="timezone" name="timezone">
                                                    <option value="UTC" <?php echo ($currentSettings['timezone'] ?? '') === 'UTC' ? 'selected' : ''; ?>>UTC</option>
                                                    <option value="Europe/Istanbul" <?php echo ($currentSettings['timezone'] ?? '') === 'Europe/Istanbul' ? 'selected' : ''; ?>>Europe/Istanbul</option>
                                                    <option value="America/New_York" <?php echo ($currentSettings['timezone'] ?? '') === 'America/New_York' ? 'selected' : ''; ?>>America/New_York</option>
                                                    <option value="Europe/London" <?php echo ($currentSettings['timezone'] ?? '') === 'Europe/London' ? 'selected' : ''; ?>>Europe/London</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- System Information -->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-info-circle me-2"></i>System Information
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <small class="text-muted">PHP Version</small>
                                            <div class="fw-bold"><?php echo PHP_VERSION; ?></div>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Server Time</small>
                                            <div class="fw-bold"><?php echo date('Y-m-d H:i:s'); ?></div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-6">
                                            <small class="text-muted">Database</small>
                                            <div class="fw-bold">MySQL</div>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Framework</small>
                                            <div class="fw-bold">Bootstrap 5.3.0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Save Button -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body text-center">
                                    <button type="submit" name="update_settings" class="btn btn-primary btn-lg">
                                        <i class="fas fa-save me-2"></i>Save All Settings
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>