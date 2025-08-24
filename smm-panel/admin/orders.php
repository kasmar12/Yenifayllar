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

// Get all orders with service details
$query = "SELECT o.*, s.name as service_name, s.description as service_description 
          FROM orders o 
          JOIN services s ON o.service_id = s.id 
          ORDER BY o.created_at DESC";
$stmt = $db->prepare($query);
$stmt->execute();
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Get status counts
$query = "SELECT status, COUNT(*) as count FROM orders GROUP BY status";
$stmt = $db->prepare($query);
$stmt->execute();
$status_counts = $stmt->fetchAll(PDO::FETCH_ASSOC);

$status_colors = [
    'pending' => 'warning',
    'paid' => 'info',
    'processing' => 'primary',
    'completed' => 'success',
    'cancelled' => 'danger',
    'payment_failed' => 'danger',
    'api_failed' => 'danger',
    'api_error' => 'danger'
];
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Sifarişlər</title>
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
                <a class="nav-link active" href="orders.php">
                    <i class="fas fa-shopping-cart"></i> Sifarişlər
                </a>
                <a class="nav-link" href="payments.php">
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
        <!-- Status Summary -->
        <div class="row mb-4">
            <?php foreach ($status_counts as $status): ?>
            <div class="col-md-2 col-sm-4 col-6 mb-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h4 class="text-<?php echo $status_colors[$status['status']] ?? 'secondary'; ?>">
                            <?php echo $status['count']; ?>
                        </h4>
                        <small class="text-muted">
                            <?php 
                            switch($status['status']) {
                                case 'pending': echo 'Gözləyir'; break;
                                case 'paid': echo 'Ödənildi'; break;
                                case 'processing': echo 'İşlənir'; break;
                                case 'completed': echo 'Tamamlandı'; break;
                                case 'cancelled': echo 'Ləğv edildi'; break;
                                case 'payment_failed': echo 'Ödəniş uğursuz'; break;
                                case 'api_failed': echo 'API uğursuz'; break;
                                case 'api_error': echo 'API xətası'; break;
                                default: echo $status['status'];
                            }
                            ?>
                        </small>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>

        <!-- Orders Table -->
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">
                    <i class="fas fa-shopping-cart"></i> Bütün Sifarişlər
                </h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Xidmət</th>
                                <th>Link</th>
                                <th>Miqdar</th>
                                <th>Qiymət</th>
                                <th>Status</th>
                                <th>Tarix</th>
                                <th>API Order ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($orders as $order): ?>
                            <tr>
                                <td>
                                    <strong>#<?php echo $order['id']; ?></strong>
                                </td>
                                <td>
                                    <div>
                                        <strong><?php echo htmlspecialchars($order['service_name']); ?></strong>
                                        <br>
                                        <small class="text-muted">
                                            <?php echo htmlspecialchars($order['service_description']); ?>
                                        </small>
                                    </div>
                                </td>
                                <td>
                                    <a href="<?php echo htmlspecialchars($order['link']); ?>" target="_blank" class="text-decoration-none">
                                        <?php echo htmlspecialchars(substr($order['link'], 0, 50)) . (strlen($order['link']) > 50 ? '...' : ''); ?>
                                    </a>
                                </td>
                                <td>
                                    <span class="badge bg-info">
                                        <?php echo number_format($order['amount']); ?>
                                    </span>
                                </td>
                                <td>
                                    <strong><?php echo number_format($order['price'], 2); ?> ₼</strong>
                                </td>
                                <td>
                                    <span class="badge bg-<?php echo $status_colors[$order['status']] ?? 'secondary'; ?>">
                                        <?php 
                                        switch($order['status']) {
                                            case 'pending': echo 'Gözləyir'; break;
                                            case 'paid': echo 'Ödənildi'; break;
                                            case 'processing': echo 'İşlənir'; break;
                                            case 'completed': echo 'Tamamlandı'; break;
                                            case 'cancelled': echo 'Ləğv edildi'; break;
                                            case 'payment_failed': echo 'Ödəniş uğursuz'; break;
                                            case 'api_failed': echo 'API uğursuz'; break;
                                            case 'api_error': echo 'API xətası'; break;
                                            default: echo $order['status'];
                                        }
                                        ?>
                                    </span>
                                </td>
                                <td>
                                    <small>
                                        <?php echo date('d.m.Y H:i', strtotime($order['created_at'])); ?>
                                    </small>
                                </td>
                                <td>
                                    <?php if (!empty($order['api_order_id'])): ?>
                                        <span class="badge bg-success">
                                            <?php echo $order['api_order_id']; ?>
                                        </span>
                                    <?php else: ?>
                                        <span class="text-muted">-</span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                
                <?php if (empty($orders)): ?>
                <div class="text-center py-4">
                    <i class="fas fa-inbox fa-3x text-muted mb-3"></i>
                    <p class="text-muted">Hələ heç bir sifariş yoxdur.</p>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>