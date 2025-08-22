<?php
/**
 * Categories Management
 * Admin panel for managing SMM categories
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
        $name = sanitizeInput($_POST['name'] ?? '');
        $description = sanitizeInput($_POST['description'] ?? '');
        $status = $_POST['status'] ?? 'active';
        
        if (empty($name)) {
            $error = 'Please enter category name.';
        } else {
            try {
                $pdo = getDBConnection();
                
                if ($action === 'add') {
                    $stmt = $pdo->prepare("INSERT INTO categories (name, description, status) VALUES (?, ?, ?)");
                    $stmt->execute([$name, $description, $status]);
                    $message = 'Category added successfully!';
                } else {
                    $id = (int)($_POST['id'] ?? 0);
                    $stmt = $pdo->prepare("UPDATE categories SET name = ?, description = ?, status = ? WHERE id = ?");
                    $stmt->execute([$name, $description, $status, $id]);
                    $message = 'Category updated successfully!';
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
                error_log("Attempting to delete category ID: " . $id);
                
                // First, delete all services in this category (due to CASCADE)
                $stmt = $pdo->prepare("DELETE FROM services WHERE category_id = ?");
                $stmt->execute([$id]);
                $deletedServices = $stmt->rowCount();
                
                error_log("Deleted {$deletedServices} services for category ID: " . $id);
                
                // Then delete the category
                $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
                $stmt->execute([$id]);
                
                error_log("Category delete result: " . $stmt->rowCount() . " rows affected");
                
                if ($stmt->rowCount() > 0) {
                    $message = "Category deleted successfully! {$deletedServices} services were also removed.";
                    error_log("Category ID {$id} deleted successfully");
                } else {
                    $error = 'Category not found or already deleted.';
                    error_log("Category ID {$id} not found or already deleted");
                }
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
                error_log("Error deleting category ID {$id}: " . $e->getMessage());
            }
        } else {
            $error = 'Invalid category ID.';
            error_log("Invalid category ID provided: " . var_export($_POST, true));
        }
    }
}

// Get categories for listing
$categories = [];
if ($action === 'list') {
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->query("
            SELECT c.*, COUNT(s.id) as service_count 
            FROM categories c 
            LEFT JOIN services s ON c.id = s.category_id 
            GROUP BY c.id 
            ORDER BY c.name
        ");
        $categories = $stmt->fetchAll();
    } catch (Exception $e) {
        // Use sample categories if database not available
        $categories = [
            [
                'id' => 1,
                'name' => 'Instagram',
                'description' => 'Instagram services',
                'status' => 'active',
                'service_count' => 3
            ],
            [
                'id' => 2,
                'name' => 'TikTok',
                'description' => 'TikTok services',
                'status' => 'active',
                'service_count' => 2
            ],
            [
                'id' => 3,
                'name' => 'YouTube',
                'description' => 'YouTube services',
                'status' => 'active',
                'service_count' => 1
            ]
        ];
    }
}

// Get category for editing
$category = null;
if ($action === 'edit' && isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    try {
        $pdo = getDBConnection();
        $stmt = $pdo->prepare("SELECT * FROM categories WHERE id = ?");
        $stmt->execute([$id]);
        $category = $stmt->fetch();
    } catch (Exception $e) {
        $error = 'Could not load category for editing.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Categories Management</title>
    
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
                        <a href="categories.php" class="list-group-item list-group-item-action active">
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
                        <i class="fas fa-folder me-2"></i>
                        Categories Management
                    </h2>
                    <a href="?action=add" class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i>Add New Category
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
                    <!-- Categories List -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">All Categories</h5>
                        </div>
                        <div class="card-body">
                            <?php if (empty($categories)): ?>
                                <p class="text-muted">No categories found.</p>
                            <?php else: ?>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Services</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($categories as $cat): ?>
                                                <tr>
                                                    <td><?php echo $cat['id']; ?></td>
                                                    <td>
                                                        <strong><?php echo htmlspecialchars($cat['name']); ?></strong>
                                                    </td>
                                                    <td><?php echo htmlspecialchars($cat['description'] ?? ''); ?></td>
                                                    <td>
                                                        <span class="badge bg-info">
                                                            <?php echo $cat['service_count']; ?> services
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <?php 
                                                        $status = $cat['status'] ?? 'inactive';
                                                        $statusClass = $status === 'active' ? 'success' : 'secondary';
                                                        ?>
                                                        <span class="badge bg-<?php echo $statusClass; ?>">
                                                            <?php echo ucfirst($status); ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="?action=edit&id=<?php echo $cat['id']; ?>" 
                                                           class="btn btn-sm btn-outline-primary">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button type="button" 
                                                                class="btn btn-sm btn-outline-danger"
                                                                onclick="deleteCategory(<?php echo $cat['id']; ?>, '<?php echo htmlspecialchars($cat['name']); ?>')">
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
                    <!-- Add/Edit Category Form -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-<?php echo $action === 'add' ? 'plus' : 'edit'; ?> me-2"></i>
                                <?php echo $action === 'add' ? 'Add New Category' : 'Edit Category'; ?>
                            </h5>
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <?php if ($action === 'edit' && $category): ?>
                                    <input type="hidden" name="id" value="<?php echo $category['id']; ?>">
                                <?php endif; ?>
                                
                                <div class="mb-3">
                                    <label for="name" class="form-label">Category Name *</label>
                                    <input type="text" class="form-control" id="name" name="name" 
                                           value="<?php echo $category ? htmlspecialchars($category['name']) : ''; ?>" 
                                           placeholder="Enter category name" required>
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3" 
                                              placeholder="Enter category description"><?php echo $category ? htmlspecialchars($category['description'] ?? '') : ''; ?></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-select" id="status" name="status">
                                        <option value="active" <?php echo ($category && $category['status'] === 'active') ? 'selected' : ''; ?>>Active</option>
                                        <option value="inactive" <?php echo ($category && $category['status'] === 'inactive') ? 'selected' : ''; ?>>Inactive</option>
                                    </select>
                                </div>

                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>
                                        <?php echo $action === 'add' ? 'Add Category' : 'Update Category'; ?>
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
        function deleteCategory(id, name) {
            console.log('deleteCategory called with ID:', id, 'Name:', name);
            
            if (confirm(`Are you sure you want to delete the category "${name}"?\n\nThis will also delete all services in this category!`)) {
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