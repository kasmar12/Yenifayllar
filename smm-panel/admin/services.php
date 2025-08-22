<?php
/**
 * Services Management
 * Admin panel for managing SMM services
 */

require_once '../includes/config.php';

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

$action = $_POST['action'] ?? $_GET['action'] ?? 'list';
$message = '';
$error = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($action === 'add' || $action === 'edit') {
        $category_id = (int)($_POST['category_id'] ?? 0);
        $api_service_id = (int)($_POST['api_service_id'] ?? 0);
        $name = sanitizeDBInput($_POST['name'] ?? '');
        $description = sanitizeDBInput($_POST['description'] ?? '');
        $price = (float)($_POST['price'] ?? 0);
        $min_quantity = (int)($_POST['min_quantity'] ?? 1);
        $max_quantity = (int)($_POST['max_quantity'] ?? 10000);
        $status = $_POST['status'] ?? 'active';
        
        if (empty($name) || $price <= 0) {
            $error = 'Please fill all required fields correctly.';
        } else {
            try {
                $pdo = getDBConnection();
                
                if ($action === 'add') {
                    $stmt = $pdo->prepare("INSERT INTO services (category_id, api_service_id, name, description, price, min_quantity, max_quantity, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                    $stmt->execute([$category_id, $api_service_id, $name, $description, $price, $min_quantity, $max_quantity, $status]);
                    $message = 'Service added successfully!';
                } else {
                    $id = (int)($_POST['id'] ?? 0);
                    $stmt = $pdo->prepare("UPDATE services SET category_id = ?, api_service_id = ?, name = ?, description = ?, price = ?, min_quantity = ?, max_quantity = ?, status = ? WHERE id = ?");
                    $stmt->execute([$category_id, $api_service_id, $name, $description, $price, $min_quantity, $max_quantity, $status, $id]);
                    $message = 'Service updated successfully!';
                }
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
            }
        }
    } elseif ($action === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        if ($id > 0) {
            try {
                $pdo = getDBConnection();
                
                // Debug logging
                error_log("Attempting to delete service ID: " . $id);
                
                // Check if service has orders
                $stmt = $pdo->prepare("SELECT COUNT(*) FROM orders WHERE service_id = ?");
                $stmt->execute([$id]);
                $orderCount = $stmt->fetchColumn();
                
                error_log("Service ID {$id} has {$orderCount} orders");
                
                if ($orderCount > 0) {
                    $error = "Cannot delete service - it has {$orderCount} orders.";
                    error_log("Cannot delete service ID {$id} - has {$orderCount} orders");
                } else {
                    $stmt = $pdo->prepare("DELETE FROM services WHERE id = ?");
                    $stmt->execute([$id]);
                    
                    error_log("Service delete result: " . $stmt->rowCount() . " rows affected");
                    
                    if ($stmt->rowCount() > 0) {
                        $message = 'Service deleted successfully!';
                        error_log("Service ID {$id} deleted successfully");
                    } else {
                        $error = 'Service not found or already deleted.';
                        error_log("Service ID {$id} not found or already deleted");
                    }
                }
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
                error_log("Error deleting service ID {$id}: " . $e->getMessage());
            }
        } else {
            $error = 'Invalid service ID.';
            error_log("Invalid service ID provided: " . var_export($_POST, true));
        }
    }
}

// Get categories for dropdown
$categories = [];
try {
    $pdo = getDBConnection();
    $stmt = $pdo->query("SELECT id, name FROM categories WHERE status = 'active' ORDER BY name");
    $categories = $stmt->fetchAll();
} catch (Exception $e) {
    // Use sample categories if database not available
    $categories = [
        ['id' => 1, 'name' => 'Instagram'],
        ['id' => 2, 'name' => 'TikTok'],
        ['id' => 3, 'name' => 'YouTube']
    ];
}

// Get services for listing
$services = [];
if ($action === 'list') {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->query("
            SELECT s.*, c.name as category_name 
            FROM services s 
            JOIN categories c ON s.category_id = c.id 
            ORDER BY c.name, s.name
        ");
        $services = $stmt->fetchAll();
    } catch (Exception $e) {
        // Use sample services if database not available
        $services = [
            [
                'id' => 1,
                'name' => 'Instagram Followers',
                'category_name' => 'Instagram',
                'price' => 2.0000,
                'status' => 'active'
            ]
        ];
    }
}

// Get service for editing
$service = null;
if ($action === 'edit' && isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("SELECT * FROM services WHERE id = ?");
        $stmt->execute([$id]);
        $service = $stmt->fetch();
    } catch (Exception $e) {
        $error = 'Could not load service for editing.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Services Management</title>
    
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
                        <a href="services.php" class="list-group-item list-group-item-action active">
                            <i class="fas fa-cogs me-2"></i>Services
                        </a>
                        <a href="categories.php" class="list-group-item list-group-item-action">
                            <i class="fas fa-folder me-2"></i>Categories
                        </a>
                        <a href="orders.php" class="list-group-item list-group-item-action">
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
                        <i class="fas fa-cogs me-2"></i>
                        Services Management
                    </h2>
                    <a href="?action=add" class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i>Add New Service
                    </a>
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
                    <!-- Services List -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">All Services</h5>
                        </div>
                        <div class="card-body">
                            <?php if (empty($services)): ?>
                                <p class="text-muted">No services found.</p>
                            <?php else: ?>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($services as $srv): ?>
                                                <tr>
                                                    <td><?php echo $srv['id']; ?></td>
                                                    <td><?php echo htmlspecialchars($srv['name']); ?></td>
                                                    <td>
                                                        <span class="badge bg-secondary">
                                                            <?php echo htmlspecialchars($srv['category_name']); ?>
                                                        </span>
                                                    </td>
                                                    <td><?php echo formatPrice($srv['price']); ?></td>
                                                    <td>
                                                        <?php 
                                                        $status = $srv['status'] ?? 'inactive';
                                                        $statusClass = $status === 'active' ? 'success' : 'secondary';
                                                        ?>
                                                        <span class="badge bg-<?php echo $statusClass; ?>">
                                                            <?php echo ucfirst($status); ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="?action=edit&id=<?php echo $srv['id']; ?>" 
                                                           class="btn btn-sm btn-outline-primary">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button type="button" 
                                                                class="btn btn-sm btn-outline-danger"
                                                                onclick="deleteService(<?php echo $srv['id']; ?>, '<?php echo htmlspecialchars($srv['name']); ?>')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php elseif ($action === 'add' || $action === 'edit'): ?>
                    <!-- Add/Edit Service Form -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-<?php echo $action === 'add' ? 'plus' : 'edit'; ?> me-2"></i>
                                <?php echo $action === 'add' ? 'Add New Service' : 'Edit Service'; ?>
                            </h5>
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <?php if ($action === 'edit' && $service): ?>
                                    <input type="hidden" name="id" value="<?php echo $service['id']; ?>">
                                <?php endif; ?>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="category_id" class="form-label">Category *</label>
                                            <select class="form-select" id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
                                                <?php foreach ($categories as $cat): ?>
                                                    <option value="<?php echo $cat['id']; ?>" 
                                                            <?php echo ($service && $service['category_id'] == $cat['id']) ? 'selected' : ''; ?>>
                                                        <?php echo htmlspecialchars($cat['name']); ?>
                                                    </option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="api_service_id" class="form-label">API Service ID</label>
                                            <input type="number" class="form-control" id="api_service_id" name="api_service_id" 
                                                   value="<?php echo $service ? $service['api_service_id'] : ''; ?>" 
                                                   placeholder="Enter API service ID">
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="name" class="form-label">Service Name *</label>
                                    <input type="text" class="form-control" id="name" name="name" 
                                           value="<?php echo $service ? htmlspecialchars($service['name']) : ''; ?>" 
                                           placeholder="Enter service name" required>
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3" 
                                              placeholder="Enter service description"><?php echo $service ? htmlspecialchars($service['description']) : ''; ?></textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Price *</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" id="price" name="price" 
                                                       value="<?php echo $service ? $service['price'] : ''; ?>" 
                                                       step="0.0001" min="0" placeholder="0.0000" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="min_quantity" class="form-label">Min Quantity</label>
                                            <input type="number" class="form-control" id="min_quantity" name="min_quantity" 
                                                   value="<?php echo $service ? $service['min_quantity'] : 1; ?>" 
                                                   min="1" placeholder="1">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="max_quantity" class="form-label">Max Quantity</label>
                                            <input type="number" class="form-control" id="max_quantity" name="max_quantity" 
                                                   value="<?php echo $service ? $service['max_quantity'] : 10000; ?>" 
                                                   min="1" placeholder="10000">
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-select" id="status" name="status">
                                        <option value="active" <?php echo ($service && $service['status'] === 'active') ? 'selected' : ''; ?>>Active</option>
                                        <option value="inactive" <?php echo ($service && $service['status'] === 'inactive') ? 'selected' : ''; ?>>Inactive</option>
                                    </select>
                                </div>

                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>
                                        <?php echo $action === 'add' ? 'Add Service' : 'Update Service'; ?>
                                    </button>
                                    <a href="?action=list" class="btn btn-secondary">
                                        <i class="fas fa-times me-2"></i>Cancel
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function deleteService(id, name) {
            console.log('deleteService called with ID:', id, 'Name:', name);
            
            if (confirm(`Are you sure you want to delete the service "${name}"?`)) {
                console.log('User confirmed deletion');
                
                const form = document.createElement('form');
                form.method = 'POST';
                form.innerHTML = `
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${id}">
                `;
                
                console.log('Form created:', form.outerHTML);
                document.body.appendChild(form);
                console.log('Form appended to body, submitting...');
                form.submit();
            } else {
                console.log('User cancelled deletion');
            }
        }
    </script>
</body>
</html>