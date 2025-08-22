<?php
/**
 * Orders Management
 * Admin panel for managing SMM orders
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

$action = $_GET['action'] ?? 'list';
$message = '';
$error = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($action === 'update_status') {
        $order_id = (int)($_POST['order_id'] ?? 0);
        $new_status = $_POST['new_status'] ?? '';
        
        if ($order_id > 0 && !empty($new_status)) {
            try {
                $pdo = getDBConnection();
                $stmt = $pdo->prepare("UPDATE orders SET status = ? WHERE id = ?");
                $stmt->execute([$new_status, $order_id]);
                $message = 'Order status updated successfully!';
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
            }
        }
    }
}

// Get orders for listing
$orders = [];
if ($action === 'list') {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->query("
            SELECT o.*, s.name as service_name, c.name as category_name 
            FROM orders o 
            JOIN services s ON o.service_id = s.id 
            JOIN categories c ON s.category_id = c.id 
            ORDER BY o.created_at DESC
        ");
        $orders = $stmt->fetchAll();
    } catch (Exception $e) {
        // Use sample orders if database not available
        $orders = [
            [
                'id' => 1,
                'order_id' => 'ORD2024120112345678',
                'service_name' => 'Instagram Followers',
                'category_name' => 'Instagram',
                'link' => 'https://instagram.com/username',
                'quantity' => 1000,
                'price' => 2.0000,
                'status' => 'pending',
                'created_at' => date('Y-m-d H:i:s')
            ]
        ];
    }
}

// Get order for viewing
$order = null;
if ($action === 'view' && isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("
            SELECT o.*, s.name as service_name, s.description as service_description, c.name as category_name 
            FROM orders o 
            JOIN services s ON o.service_id = s.id 
            JOIN categories c ON s.category_id = c.id 
            WHERE o.id = ?
        ");
        $stmt->execute([$id]);
        $order = $stmt->fetch();
    } catch (Exception $e) {
        $error = 'Could not load order details.';
    }
}

// Get status counts
$statusCounts = [
    'pending' => 0,
    'processing' => 0,
    'completed' => 0,
    'cancelled' => 0,
    'error' => 0
];

try {
    $pdo = getDBConnection();
    $stmt = $pdo->query("SELECT status, COUNT(*) as count FROM orders GROUP BY status");
    $results = $stmt->fetchAll();
    foreach ($results as $result) {
        $statusCounts[$result['status']] = $result['count'];
    }
} catch (Exception $e) {
    // Use sample counts if database not available
    $statusCounts = [
        'pending' => 5,
        'processing' => 3,
        'completed' => 12,
        'cancelled' => 1,
        'error' => 0
    ];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Orders Management</title>
    
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
                        <a href="orders.php" class="list-group-item list-group-item-action active">
                            <i class="fas fa-shopping-cart me-2"></i>Orders
                        </a>
                        <a href="settings.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-cog me-2"></i>Settings
                        </a>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>
                        <i class="fas fa-shopping-cart me-2"></i>
                        Orders Management
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

                <?php if ($action === 'list'): ?>
                    <!-- Status Summary -->
                    <div class="row mb-4">
                        <div class="col-md-2">
                            <div class="card bg-warning text-white">
                                <div class="card-body text-center">
                                    <h4><?php echo $statusCounts['pending']; ?></h4>
                                    <small>Pending</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="card bg-info text-white">
                                <div class="card-body text-center">
                                    <h4><?php echo $statusCounts['processing']; ?></h4>
                                    <small>Processing</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="card bg-success text-white">
                                <div class="card-body text-center">
                                    <h4><?php echo $statusCounts['completed']; ?></h4>
                                    <small>Completed</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="card bg-secondary text-white">
                                <div class="card-body text-center">
                                    <h4><?php echo $statusCounts['cancelled']; ?></h4>
                                    <small>Cancelled</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="card bg-danger text-white">
                                <div class="card-body text-center">
                                    <h4><?php echo $statusCounts['error']; ?></h4>
                                    <small>Error</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Orders List -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">All Orders</h5>
                        </div>
                        <div class="card-body">
                            <?php if (empty($orders)): ?>
                                <p class="text-muted">No orders found.</p>
                            <?php else: ?>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Service</th>
                                                <th>Category</th>
                                                <th>Link</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Created</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($orders as $ord): ?>
                                                <tr>
                                                    <td>
                                                        <code><?php echo htmlspecialchars($ord['order_id']); ?></code>
                                                    </td>
                                                    <td><?php echo htmlspecialchars($ord['service_name']); ?></td>
                                                    <td>
                                                        <span class="badge bg-secondary">
                                                            <?php echo htmlspecialchars($ord['category_name']); ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <small class="text-muted">
                                                            <?php echo htmlspecialchars(substr($ord['link'], 0, 30)) . '...'; ?>
                                                        </small>
                                                    </td>
                                                    <td><?php echo number_format($ord['quantity']); ?></td>
                                                    <td><?php echo formatPrice($ord['price']); ?></td>
                                                    <td>
                                                        <span class="badge bg-<?php 
                                                            echo $ord['status'] === 'pending' ? 'warning' : 
                                                                ($ord['status'] === 'processing' ? 'info' : 
                                                                ($ord['status'] === 'completed' ? 'success' : 
                                                                ($ord['status'] === 'cancelled' ? 'secondary' : 'danger'))); 
                                                        ?>">
                                                            <?php echo ucfirst($ord['status']); ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <small><?php echo date('M j, Y H:i', strtotime($ord['created_at'])); ?></small>
                                                    </td>
                                                    <td>
                                                        <a href="?action=view&id=<?php echo $ord['id']; ?>" 
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
                <?php elseif ($action === 'view' && $order): ?>
                    <!-- Order Details -->
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Order Details</h5>
                                <a href="?action=list" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>Back to Orders
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6>Order Information</h6>
                                    <table class="table table-borderless">
                                        <tr>
                                            <td><strong>Order ID:</strong></td>
                                            <td><code><?php echo htmlspecialchars($order['order_id']); ?></code></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Status:</strong></td>
                                            <td>
                                                <span class="badge bg-<?php 
                                                    echo $order['status'] === 'pending' ? 'warning' : 
                                                        ($order['status'] === 'processing' ? 'info' : 
                                                        ($order['status'] === 'completed' ? 'success' : 
                                                        ($order['status'] === 'cancelled' ? 'secondary' : 'danger'))); 
                                                ?>">
                                                    <?php echo ucfirst($order['status']); ?>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Created:</strong></td>
                                            <td><?php echo date('F j, Y \a\t g:i A', strtotime($order['created_at'])); ?></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <h6>Service Information</h6>
                                    <table class="table table-borderless">
                                        <tr>
                                            <td><strong>Service:</strong></td>
                                            <td><?php echo htmlspecialchars($order['service_name']); ?></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Category:</strong></td>
                                            <td><?php echo htmlspecialchars($order['category_name']); ?></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Quantity:</strong></td>
                                            <td><?php echo number_format($order['quantity']); ?></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Price:</strong></td>
                                            <td><?php echo formatPrice($order['price']); ?></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <hr>

                            <div class="row">
                                <div class="col-12">
                                    <h6>Target Link</h6>
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="<?php echo htmlspecialchars($order['link']); ?>" readonly>
                                        <button class="btn btn-outline-secondary" type="button" onclick="copyToClipboard(this)">
                                            <i class="fas fa-copy"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <?php if ($order['status'] === 'pending' || $order['status'] === 'processing'): ?>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h6>Update Status</h6>
                                        <form method="POST" class="d-flex gap-2">
                                            <input type="hidden" name="action" value="update_status">
                                            <input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
                                            <select name="new_status" class="form-select">
                                                <option value="pending" <?php echo $order['status'] === 'pending' ? 'selected' : ''; ?>>Pending</option>
                                                <option value="processing" <?php echo $order['status'] === 'processing' ? 'selected' : ''; ?>>Processing</option>
                                                <option value="completed">Completed</option>
                                                <option value="cancelled">Cancelled</option>
                                                <option value="error">Error</option>
                                            </select>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-save me-2"></i>Update
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function copyToClipboard(button) {
            const input = button.parentElement.querySelector('input');
            input.select();
            document.execCommand('copy');
            
            const originalText = button.innerHTML;
            button.innerHTML = '<i class="fas fa-check"></i>';
            button.classList.remove('btn-outline-secondary');
            button.classList.add('btn-success');
            
            setTimeout(() => {
                button.innerHTML = originalText;
                button.classList.remove('btn-success');
                button.classList.add('btn-outline-secondary');
            }, 2000);
        }
    </script>
</body>
</html>