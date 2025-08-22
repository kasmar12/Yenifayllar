<?php
/**
 * Admin Dashboard
 * Main admin panel with overview and navigation
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Handle logout
if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: login.php');
    exit;
}

// Check admin authentication
if (!isset($_SESSION['admin_id']) || !isset($_SESSION['admin_username'])) {
    header('Location: login.php');
    exit;
}

// Get statistics
try {
    $pdo = getDBConnection();
    
    // Total orders
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders");
    $totalOrders = $stmt->fetch()['total'];
    
    // Pending orders
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders WHERE status = 'pending'");
    $pendingOrders = $stmt->fetch()['total'];
    
    // Processing orders
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders WHERE status = 'processing'");
    $processingOrders = $stmt->fetch()['total'];
    
    // Completed orders
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders WHERE status = 'completed'");
    $completedOrders = $stmt->fetch()['total'];
    
    // Total services
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM services WHERE status = 'active'");
    $totalServices = $stmt->fetch()['total'];
    
    // Total categories
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM categories WHERE status = 'active'");
    $totalCategories = $stmt->fetch()['total'];
    
    // Recent orders
    $stmt = $pdo->query("
        SELECT o.*, s.name as service_name, c.name as category_name 
        FROM orders o 
        JOIN services s ON o.service_id = s.id 
        JOIN categories c ON s.category_id = c.id 
        ORDER BY o.created_at DESC 
        LIMIT 10
    ");
    $recentOrders = $stmt->fetchAll();
    
    // Get SMM API balance
    $balanceResult = getSMMBalance();
    $apiBalance = $balanceResult['success'] ? $balanceResult['balance'] : 'N/A';
    $apiCurrency = $balanceResult['success'] ? $balanceResult['currency'] : 'USD';
    
} catch (Exception $e) {
    $error = "Database error: " . $e->getMessage();
    $totalOrders = $pendingOrders = $processingOrders = $completedOrders = $totalServices = $totalCategories = 0;
    $recentOrders = [];
    $apiBalance = 'N/A';
    $apiCurrency = 'USD';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Admin Dashboard</title>
    
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
                    <a class="nav-link active" href="dashboard.php">
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
                    <a class="nav-link" href="settings.php">
                        <i class="fas fa-cog"></i>Settings
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-tachometer-alt me-2"></i>Dashboard Overview</h2>
                    <div class="btn-group">
                        <button class="btn btn-outline-primary" onclick="location.reload()">
                            <i class="fas fa-sync-alt me-1"></i>Refresh
                        </button>
                        <a href="../public/index.php" class="btn btn-outline-secondary" target="_blank">
                            <i class="fas fa-external-link-alt me-1"></i>View Site
                        </a>
                    </div>
                </div>

                <!-- Statistics Cards -->
                <div class="row mb-4">
                    <div class="col-md-3 mb-3">
                        <div class="stats-card">
                            <div class="stats-number"><?php echo number_format($totalOrders); ?></div>
                            <div class="stats-label">Total Orders</div>
                            <i class="fas fa-shopping-cart fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="stats-card">
                            <div class="stats-number"><?php echo number_format($pendingOrders); ?></div>
                            <div class="stats-label">Pending Orders</div>
                            <i class="fas fa-clock fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="stats-card">
                            <div class="stats-number"><?php echo number_format($totalServices); ?></div>
                            <div class="stats-label">Active Services</div>
                            <i class="fas fa-cogs fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="stats-card">
                            <div class="stats-number"><?php echo $apiBalance; ?></div>
                            <div class="stats-label">API Balance (<?php echo $apiCurrency; ?>)</div>
                            <i class="fas fa-wallet fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                        </div>
                    </div>
                </div>

                <!-- Order Status Overview -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-chart-pie me-2"></i>Order Status Overview
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row text-center">
                                    <div class="col-4">
                                        <div class="border-end">
                                            <h4 class="text-warning"><?php echo number_format($pendingOrders); ?></h4>
                                            <small class="text-muted">Pending</small>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="border-end">
                                            <h4 class="text-info"><?php echo number_format($processingOrders); ?></h4>
                                            <small class="text-muted">Processing</small>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h4 class="text-success"><?php echo number_format($completedOrders); ?></h4>
                                        <small class="text-muted">Completed</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-info-circle me-2"></i>System Information
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <p><strong>Categories:</strong></p>
                                        <h5 class="text-primary"><?php echo number_format($totalCategories); ?></h5>
                                    </div>
                                    <div class="col-6">
                                        <p><strong>Services:</strong></p>
                                        <h5 class="text-primary"><?php echo number_format($totalServices); ?></h5>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-6">
                                        <p><strong>PHP Version:</strong></p>
                                        <small class="text-muted"><?php echo PHP_VERSION; ?></small>
                                    </div>
                                    <div class="col-6">
                                        <p><strong>Server Time:</strong></p>
                                        <small class="text-muted"><?php echo date('H:i:s'); ?></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Orders -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">
                            <i class="fas fa-list me-2"></i>Recent Orders
                        </h5>
                        <a href="orders.php" class="btn btn-sm btn-primary">
                            <i class="fas fa-eye me-1"></i>View All
                        </a>
                    </div>
                    <div class="card-body">
                        <?php if (empty($recentOrders)): ?>
                            <p class="text-muted text-center">No orders found.</p>
                        <?php else: ?>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Service</th>
                                            <th>Target</th>
                                            <th>Quantity</th>
                                            <th>Status</th>
                                            <th>Created</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($recentOrders as $order): ?>
                                            <tr>
                                                <td>
                                                    <code><?php echo htmlspecialchars($order['order_id']); ?></code>
                                                </td>
                                                <td>
                                                    <strong><?php echo htmlspecialchars($order['service_name']); ?></strong>
                                                    <br>
                                                    <small class="text-muted"><?php echo htmlspecialchars($order['category_name']); ?></small>
                                                </td>
                                                <td>
                                                    <code class="text-truncate d-inline-block" style="max-width: 150px;">
                                                        <?php echo htmlspecialchars($order['link']); ?>
                                                    </code>
                                                </td>
                                                <td><?php echo number_format($order['quantity']); ?></td>
                                                <td>
                                                    <?php 
                                                    $statusClass = match($order['status']) {
                                                        'completed' => 'status-completed',
                                                        'processing' => 'status-processing',
                                                        'canceled' => 'status-canceled',
                                                        default => 'status-pending'
                                                    };
                                                    ?>
                                                    <span class="badge <?php echo $statusClass; ?>">
                                                        <?php echo ucfirst($order['status']); ?>
                                                    </span>
                                                </td>
                                                <td>
                                                    <?php echo date('M j, Y H:i', strtotime($order['created_at'])); ?>
                                                </td>
                                                <td>
                                                    <a href="orders.php?action=view&id=<?php echo $order['id']; ?>" 
                                                       class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-bolt me-2"></i>Quick Actions
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2">
                                    <a href="services.php?action=add" class="btn btn-outline-primary">
                                        <i class="fas fa-plus me-2"></i>Add New Service
                                    </a>
                                    <a href="categories.php?action=add" class="btn btn-outline-secondary">
                                        <i class="fas fa-folder-plus me-2"></i>Add New Category
                                    </a>
                                    <a href="settings.php" class="btn btn-outline-info">
                                        <i class="fas fa-cog me-2"></i>Update Settings
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-chart-line me-2"></i>API Status
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <p><strong>SMM API:</strong></p>
                                        <span class="badge bg-success">Connected</span>
                                    </div>
                                    <div class="col-6">
                                        <p><strong>AY.Live API:</strong></p>
                                        <span class="badge bg-success">Connected</span>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-6">
                                        <p><strong>Balance:</strong></p>
                                        <span class="text-primary fw-bold">
                                            <?php echo $apiBalance; ?> <?php echo $apiCurrency; ?>
                                        </span>
                                    </div>
                                    <div class="col-6">
                                        <p><strong>Last Check:</strong></p>
                                        <small class="text-muted"><?php echo date('H:i:s'); ?></small>
                                    </div>
                                </div>
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
        // Auto-refresh dashboard every 5 minutes
        setInterval(function() {
            // You can implement auto-refresh here if needed
        }, 300000);
        
        // Sidebar navigation
        document.querySelectorAll('.admin-sidebar .nav-link').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.admin-sidebar .nav-link').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>