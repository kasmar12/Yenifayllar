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

// Get all payments
$query = "SELECT * FROM payments ORDER BY created_at DESC";
$stmt = $db->prepare($query);
$stmt->execute();
$payments = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Get payment statistics
$query = "SELECT 
            COUNT(*) as total_payments,
            SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END) as total_success_amount,
            SUM(CASE WHEN status = 'pending' THEN amount ELSE 0 END) as total_pending_amount,
            SUM(CASE WHEN status = 'failed' THEN amount ELSE 0 END) as total_failed_amount
          FROM payments";
$stmt = $db->prepare($query);
$stmt->execute();
$stats = $stmt->fetch(PDO::FETCH_ASSOC);

$status_colors = [
    'pending' => 'warning',
    'success' => 'success',
    'failed' => 'danger',
    'cancelled' => 'secondary'
];
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Ödənişlər</title>
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
                <a class="nav-link active" href="payments.php">
                    <i class="fas fa-credit-card"></i> Ödənişlər
                </a>
                <a class="nav-link" href="settings.php">
                    <i class="fas fa-cog"></i> Tənzimləmələr
                </a>
                <a class="nav-link" href="logout.php">
                    <i class="fas fa-sign-out-alt"></i> Çıxış
                </a>
            </div>
        </div>
    </nav>

    <div class="container my-4">
        <!-- Payment Statistics -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="card text-center bg-primary text-white">
                    <div class="card-body">
                        <i class="fas fa-credit-card fa-2x mb-2"></i>
                        <h4><?php echo $stats['total_payments']; ?></h4>
                        <small>Ümumi Ödənişlər</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center bg-success text-white">
                    <div class="card-body">
                        <i class="fas fa-check-circle fa-2x mb-2"></i>
                        <h4><?php echo number_format($stats['total_success_amount'], 2); ?> ₼</h4>
                        <small>Uğurlu Ödənişlər</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center bg-warning text-white">
                    <div class="card-body">
                        <i class="fas fa-clock fa-2x mb-2"></i>
                        <h4><?php echo number_format($stats['total_pending_amount'], 2); ?> ₼</h4>
                        <small>Gözləyən Ödənişlər</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center bg-danger text-white">
                    <div class="card-body">
                        <i class="fas fa-times-circle fa-2x mb-2"></i>
                        <h4><?php echo number_format($stats['total_failed_amount'], 2); ?> ₼</h4>
                        <small>Uğursuz Ödənişlər</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Payments Table -->
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">
                    <i class="fas fa-credit-card"></i> Ödəniş Tarixçəsi
                </h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Transaction ID</th>
                                <th>Məbləğ</th>
                                <th>Status</th>
                                <th>Tarix</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($payments as $payment): ?>
                            <tr>
                                <td>
                                    <strong>#<?php echo $payment['id']; ?></strong>
                                </td>
                                <td>
                                    <code><?php echo htmlspecialchars($payment['transaction_id']); ?></code>
                                </td>
                                <td>
                                    <strong><?php echo number_format($payment['amount'], 2); ?> ₼</strong>
                                </td>
                                <td>
                                    <span class="badge bg-<?php echo $status_colors[$payment['status']] ?? 'secondary'; ?>">
                                        <?php 
                                        switch($payment['status']) {
                                            case 'pending': echo 'Gözləyir'; break;
                                            case 'success': echo 'Uğurlu'; break;
                                            case 'failed': echo 'Uğursuz'; break;
                                            case 'cancelled': echo 'Ləğv edildi'; break;
                                            default: echo $payment['status'];
                                        }
                                        ?>
                                    </span>
                                </td>
                                <td>
                                    <small>
                                        <?php echo date('d.m.Y H:i:s', strtotime($payment['created_at'])); ?>
                                    </small>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                
                <?php if (empty($payments)): ?>
                <div class="text-center py-4">
                    <i class="fas fa-credit-card fa-3x text-muted mb-3"></i>
                    <p class="text-muted">Hələ heç bir ödəniş yoxdur.</p>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>