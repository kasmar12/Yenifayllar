<?php
session_start();
require_once '../config/database.php';

// Check if admin is logged in
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header('Location: login.php');
    exit;
}

$database = new Database();
$db = $database->getConnection();

$message = '';
$error = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $api_url = $_POST['api_url'] ?? '';
    $api_key = $_POST['api_key'] ?? '';
    $secret_key = $_POST['secret_key'] ?? '';
    
    if ($api_url && $api_key && $secret_key) {
        // Check if settings exist
        $query = "SELECT COUNT(*) as count FROM settings";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $count = $stmt->fetch(PDO::FETCH_ASSOC)['count'];
        
        if ($count > 0) {
            // Update existing settings
            $query = "UPDATE settings SET api_url = ?, api_key = ?, secret_key = ? WHERE id = 1";
            $stmt = $db->prepare($query);
            if ($stmt->execute([$api_url, $api_key, $secret_key])) {
                $message = 'Tənzimləmələr uğurla yeniləndi!';
            } else {
                $error = 'Tənzimləmələr yenilənərkən xəta baş verdi!';
            }
        } else {
            // Insert new settings
            $query = "INSERT INTO settings (api_url, api_key, secret_key) VALUES (?, ?, ?)";
            $stmt = $db->prepare($query);
            if ($stmt->execute([$api_url, $api_key, $secret_key])) {
                $message = 'Tənzimləmələr uğurla əlavə edildi!';
            } else {
                $error = 'Tənzimləmələr əlavə edilərkən xəta baş verdi!';
            }
        }
    } else {
        $error = 'Bütün sahələri doldurun!';
    }
}

// Get current settings
$query = "SELECT * FROM settings LIMIT 1";
$stmt = $db->prepare($query);
$stmt->execute();
$settings = $stmt->fetch(PDO::FETCH_ASSOC);

// Default values if no settings exist
if (!$settings) {
    $settings = [
        'api_url' => 'https://your-smm-api.com/api',
        'api_key' => 'YOUR_SMM_API_KEY',
        'secret_key' => 'YOUR_SECRET_KEY'
    ];
}
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Tənzimləmələr</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-cogs"></i> Admin Panel
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="services.php">
                    <i class="fas fa-list"></i> Xidmətlər
                </a>
                <a class="nav-link" href="orders.php">
                    <i class="fas fa-shopping-cart"></i> Sifarişlər
                </a>
                <a class="nav-link" href="payments.php">
                    <i class="fas fa-credit-card"></i> Ödənişlər
                </a>
                <a class="nav-link active" href="settings.php">
                    <i class="fas fa-cog"></i> Tənzimləmələr
                </a>
                <a class="nav-link" href="logout.php">
                    <i class="fas fa-sign-out-alt"></i> Çıxış
                </a>
            </div>
        </div>
    </nav>

    <div class="container my-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-cog"></i> API Tənzimləmələri
                        </h5>
                    </div>
                    <div class="card-body">
                        <?php if ($message): ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>
                        
                        <?php if ($error): ?>
                            <div class="alert alert-danger"><?php echo $error; ?></div>
                        <?php endif; ?>
                        
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-link"></i> SMM API URL:
                                </label>
                                <input type="url" name="api_url" class="form-control" 
                                       value="<?php echo htmlspecialchars($settings['api_url']); ?>" 
                                       required placeholder="https://your-smm-api.com/api">
                                <small class="text-muted">SMM xidmətinin API endpoint-i</small>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-key"></i> SMM API Key:
                                </label>
                                <input type="text" name="api_key" class="form-control" 
                                       value="<?php echo htmlspecialchars($settings['api_key']); ?>" 
                                       required placeholder="YOUR_SMM_API_KEY">
                                <small class="text-muted">SMM xidmətindən aldığınız API açarı</small>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-shield-alt"></i> Secret Key:
                                </label>
                                <input type="text" name="secret_key" class="form-control" 
                                       value="<?php echo htmlspecialchars($settings['secret_key']); ?>" 
                                       required placeholder="YOUR_SECRET_KEY">
                                <small class="text-muted">Portmanat callback imzalarını yoxlamaq üçün gizli açar</small>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-save"></i> Saxla
                                </button>
                            </div>
                        </form>
                        
                        <hr class="my-4">
                        
                        <!-- Configuration Files Info -->
                        <div class="alert alert-info">
                            <h6><i class="fas fa-info-circle"></i> Konfiqurasiya Faylları</h6>
                            <p class="mb-2">Aşağıdakı fayllarda da API açarlarını yeniləməlisiniz:</p>
                            <ul class="mb-0">
                                <li><code>/config/portmanat_api.php</code> - Portmanat API konfiqurasiyası</li>
                                <li><code>/config/smm_api.php</code> - SMM API konfiqurasiyası</li>
                            </ul>
                        </div>
                        
                        <!-- Test Connection -->
                        <div class="card bg-light">
                            <div class="card-body">
                                <h6><i class="fas fa-plug"></i> API Bağlantısını Yoxla</h6>
                                <p class="text-muted mb-3">SMM API ilə bağlantını yoxlamaq üçün aşağıdakı düyməni basın:</p>
                                <button type="button" class="btn btn-outline-primary" onclick="testConnection()">
                                    <i class="fas fa-play"></i> Bağlantını Yoxla
                                </button>
                                <div id="testResult" class="mt-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function testConnection() {
            const resultDiv = document.getElementById('testResult');
            resultDiv.innerHTML = '<div class="alert alert-info"><i class="fas fa-spinner fa-spin"></i> Bağlantı yoxlanılır...</div>';
            
            // Simulate API test (in real implementation, make AJAX call to test endpoint)
            setTimeout(() => {
                resultDiv.innerHTML = '<div class="alert alert-warning"><i class="fas fa-exclamation-triangle"></i> Bu funksiya hələ tətbiq edilməyib. API konfiqurasiyasını yoxlamaq üçün sifariş yaradın.</div>';
            }, 2000);
        }
    </script>
</body>
</html>