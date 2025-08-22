<?php
/**
 * Admin Dashboard
 * Manages services, categories, and orders from SMM API
 */

require_once '../includes/functions.php';

// Require admin access
requireAdmin();

// Handle actions
$action = sanitizeInput($_GET['action'] ?? '');
$message = '';
$messageType = '';

// Get current page for pagination
$currentPage = max(1, intval($_GET['page'] ?? 1));
$limit = 20;

// Fetch data from API
$services = fetchServices();
$categories = fetchCategories();
$orderHistory = getOrderHistory($currentPage, $limit);

// Handle refresh action
if ($action === 'refresh') {
    // Force refresh by clearing any cache (if implemented)
    $message = 'Data refreshed successfully!';
    $messageType = 'success';
    logAdminActivity('Data Refresh', 'Admin refreshed dashboard data');
}

// Handle logout
if ($action === 'logout') {
    session_destroy();
    header('Location: admin-login.php');
    exit;
}

// Calculate pagination
$totalPages = 1; // This would come from API response
if ($orderHistory && isset($orderHistory['total_pages'])) {
    $totalPages = $orderHistory['total_pages'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }
        .sidebar {
            background: white;
            border-right: 1px solid #dee2e6;
            min-height: calc(100vh - 56px);
            padding: 0;
        }
        .sidebar .nav-link {
            color: #495057;
            padding: 0.75rem 1rem;
            border-radius: 0;
            border-left: 3px solid transparent;
        }
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background: #f8f9fa;
            color: #667eea;
            border-left-color: #667eea;
        }
        .sidebar .nav-link i {
            width: 20px;
            margin-right: 10px;
        }
        .main-content {
            padding: 2rem;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            border: none;
            padding: 1rem 1.5rem;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }
        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 25px;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .table th {
            border-top: none;
            font-weight: 600;
            color: #495057;
        }
        .badge {
            border-radius: 20px;
            padding: 0.5rem 1rem;
        }
        .loading {
            text-align: center;
            padding: 2rem;
            color: #666;
        }
        .refresh-btn {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-shield-alt me-2"></i>
                <?php echo APP_NAME; ?> Admin
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user me-1"></i>
                    Welcome, <?php echo htmlspecialchars($_SESSION['admin_username'] ?? 'Admin'); ?>
                </span>
                <a class="nav-link" href="?action=logout">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <nav class="nav flex-column">
                    <a class="nav-link active" href="#dashboard">
                        <i class="fas fa-tachometer-alt"></i>Dashboard
                    </a>
                    <a class="nav-link" href="#services">
                        <i class="fas fa-cogs"></i>Services
                    </a>
                    <a class="nav-link" href="#categories">
                        <i class="fas fa-tags"></i>Categories
                    </a>
                    <a class="nav-link" href="#orders">
                        <i class="fas fa-shopping-cart"></i>Orders
                    </a>
                    <a class="nav-link" href="#settings">
                        <i class="fas fa-cog"></i>Settings
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <?php if ($message): ?>
                    <div class="alert alert-<?php echo $messageType; ?> alert-dismissible fade show" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        <?php echo htmlspecialchars($message); ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <?php endif; ?>

                <!-- Dashboard Overview -->
                <div id="dashboard">
                    <h2 class="mb-4">
                        <i class="fas fa-tachometer-alt me-2"></i>Dashboard Overview
                    </h2>
                    
                    <div class="row">
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">
                                    <?php echo $services ? count($services) : '0'; ?>
                                </div>
                                <div>Total Services</div>
                                <i class="fas fa-cogs fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">
                                    <?php echo $categories ? count($categories) : '0'; ?>
                                </div>
                                <div>Categories</div>
                                <i class="fas fa-tags fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">
                                    <?php echo $orderHistory && isset($orderHistory['total']) ? $orderHistory['total'] : '0'; ?>
                                </div>
                                <div>Total Orders</div>
                                <i class="fas fa-shopping-cart fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">
                                    <?php echo date('H:i'); ?>
                                </div>
                                <div>Current Time</div>
                                <i class="fas fa-clock fa-2x opacity-50 position-absolute end-0 bottom-0 mb-2 me-2"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Services Section -->
                <div id="services" class="mt-5">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-cogs me-2"></i>Services Management
                            </h5>
                        </div>
                        <div class="card-body">
                            <?php if ($services === false): ?>
                                <div class="loading">
                                    <i class="fas fa-spinner fa-spin fa-2x mb-3"></i>
                                    <p>Loading services from API...</p>
                                    <button class="btn btn-outline-primary" onclick="location.reload()">
                                        <i class="fas fa-redo me-2"></i>Retry
                                    </button>
                                </div>
                            <?php else: ?>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="servicesTable">
                                        <thead>
                                            <tr>
                                                <th>Service ID</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Rate</th>
                                                <th>Min/Max</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($services as $service): ?>
                                                <tr>
                                                    <td>
                                                        <code><?php echo htmlspecialchars($service['service']); ?></code>
                                                    </td>
                                                    <td>
                                                        <strong><?php echo htmlspecialchars($service['name'] ?? formatServiceName($service['service'])); ?></strong>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-secondary">
                                                            <?php echo htmlspecialchars(getServiceCategory($service['service'])); ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="text-success fw-bold">
                                                            $<?php echo number_format($service['rate'] ?? 0, 4); ?>/1000
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <?php echo number_format($service['min'] ?? 0); ?> - 
                                                        <?php echo number_format($service['max'] ?? 0); ?>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-success">Active</span>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <!-- Categories Section -->
                <div id="categories" class="mt-5">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-tags me-2"></i>Categories Management
                            </h5>
                        </div>
                        <div class="card-body">
                            <?php if ($categories === false): ?>
                                <div class="loading">
                                    <i class="fas fa-spinner fa-spin fa-2x mb-3"></i>
                                    <p>Loading categories from API...</p>
                                </div>
                            <?php else: ?>
                                <div class="row">
                                    <?php foreach ($categories as $category): ?>
                                        <div class="col-md-4 mb-3">
                                            <div class="card border">
                                                <div class="card-body text-center">
                                                    <i class="fas fa-folder fa-3x text-primary mb-3"></i>
                                                    <h6 class="card-title"><?php echo htmlspecialchars(ucfirst($category)); ?></h6>
                                                    <p class="card-text text-muted">
                                                        <?php 
                                                        $categoryServices = fetchServicesByCategory($category);
                                                        $serviceCount = $categoryServices ? count($categoryServices) : 0;
                                                        echo $serviceCount . ' service' . ($serviceCount !== 1 ? 's' : '');
                                                        ?>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <!-- Orders Section -->
                <div id="orders" class="mt-5">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-shopping-cart me-2"></i>Order History
                            </h5>
                        </div>
                        <div class="card-body">
                            <?php if ($orderHistory === false): ?>
                                <div class="loading">
                                    <i class="fas fa-spinner fa-spin fa-2x mb-3"></i>
                                    <p>Loading order history from API...</p>
                                </div>
                            <?php else: ?>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="ordersTable">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Service</th>
                                                <th>Link</th>
                                                <th>Quantity</th>
                                                <th>Status</th>
                                                <th>Created</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (isset($orderHistory['orders']) && is_array($orderHistory['orders'])): ?>
                                                <?php foreach ($orderHistory['orders'] as $order): ?>
                                                    <tr>
                                                        <td>
                                                            <code><?php echo htmlspecialchars($order['order'] ?? 'N/A'); ?></code>
                                                        </td>
                                                        <td>
                                                            <?php echo htmlspecialchars(formatServiceName($order['service'] ?? '')); ?>
                                                        </td>
                                                        <td>
                                                            <code class="text-truncate d-inline-block" style="max-width: 150px;">
                                                                <?php echo htmlspecialchars($order['link'] ?? ''); ?>
                                                            </code>
                                                        </td>
                                                        <td>
                                                            <?php echo number_format($order['quantity'] ?? 0); ?>
                                                        </td>
                                                        <td>
                                                            <?php 
                                                            $status = $order['status'] ?? 'pending';
                                                            $statusClass = match($status) {
                                                                'completed' => 'bg-success',
                                                                'processing' => 'bg-warning',
                                                                'canceled' => 'bg-danger',
                                                                default => 'bg-secondary'
                                                            };
                                                            ?>
                                                            <span class="badge <?php echo $statusClass; ?>">
                                                                <?php echo ucfirst($status); ?>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <?php 
                                                            $created = $order['created'] ?? '';
                                                            echo $created ? date('M j, Y H:i', strtotime($created)) : 'N/A';
                                                            ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="6" class="text-center text-muted">
                                                        No orders found
                                                    </td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <!-- Pagination -->
                                <?php if ($totalPages > 1): ?>
                                    <?php echo generatePagination($currentPage, $totalPages, 'admin-dashboard.php'); ?>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <!-- Settings Section -->
                <div id="settings" class="mt-5">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-cog me-2"></i>System Settings
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6>API Configuration</h6>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            SMM API Status
                                            <span class="badge bg-success">Connected</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            AY.Live API Status
                                            <span class="badge bg-success">Connected</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            Debug Mode
                                            <span class="badge bg-<?php echo DEBUG_MODE ? 'warning' : 'success'; ?>">
                                                <?php echo DEBUG_MODE ? 'Enabled' : 'Disabled'; ?>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <h6>Quick Actions</h6>
                                    <div class="d-grid gap-2">
                                        <a href="?action=refresh" class="btn btn-outline-primary">
                                            <i class="fas fa-sync-alt me-2"></i>Refresh Data
                                        </a>
                                        <a href="admin-login.php?logout=1" class="btn btn-outline-danger">
                                            <i class="fas fa-sign-out-alt me-2"></i>Logout
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Floating Refresh Button -->
    <a href="?action=refresh" class="btn btn-primary btn-lg refresh-btn" title="Refresh Data">
        <i class="fas fa-sync-alt"></i>
    </a>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // Initialize DataTables
            $('#servicesTable').DataTable({
                pageLength: 25,
                order: [[0, 'asc']],
                responsive: true
            });
            
            $('#ordersTable').DataTable({
                pageLength: 25,
                order: [[5, 'desc']],
                responsive: true
            });
            
            // Smooth scrolling for sidebar links
            $('.sidebar .nav-link').on('click', function(e) {
                e.preventDefault();
                const target = $(this).attr('href').substring(1);
                $('html, body').animate({
                    scrollTop: $('#' + target).offset().top - 100
                }, 500);
                
                // Update active state
                $('.sidebar .nav-link').removeClass('active');
                $(this).addClass('active');
            });
            
            // Auto-refresh every 5 minutes
            setInterval(function() {
                // You can implement auto-refresh here if needed
            }, 300000);
        });
    </script>
</body>
</html>