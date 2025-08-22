<?php
/**
 * Test Delete Functionality
 * Debug page for testing delete operations
 */

require_once '../includes/config.php';

// Check admin authentication
if (!isset($_SESSION['admin_id']) || !isset($_SESSION['admin_username'])) {
    header('Location: login.php');
    exit;
}

$message = '';
$error = '';

// Handle delete action
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'delete') {
    $id = (int)($_POST['id'] ?? 0);
    $type = $_POST['type'] ?? '';
    
    if ($id > 0 && !empty($type)) {
        try {
            $pdo = getDBConnection();
            
            if ($type === 'service') {
                $stmt = $pdo->prepare("DELETE FROM services WHERE id = ?");
                $stmt->execute([$id]);
                $message = "Service ID {$id} deleted successfully!";
            } elseif ($type === 'category') {
                // Check if category has services
                $stmt = $pdo->prepare("SELECT COUNT(*) FROM services WHERE category_id = ?");
                $stmt->execute([$id]);
                $serviceCount = $stmt->fetchColumn();
                
                if ($serviceCount > 0) {
                    $error = "Cannot delete category ID {$id} - it has {$serviceCount} services.";
                } else {
                    $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
                    $stmt->execute([$id]);
                    $message = "Category ID {$id} deleted successfully!";
                }
            }
        } catch (Exception $e) {
            $error = 'Database error: ' . $e->getMessage();
        }
    }
}

// Get current data
try {
    $pdo = getDBConnection();
    
    $stmt = $pdo->query("SELECT id, name, status FROM categories ORDER BY name");
    $categories = $stmt->fetchAll();
    
    $stmt = $pdo->query("SELECT id, name, category_id, status FROM services ORDER BY name");
    $services = $stmt->fetchAll();
    
} catch (Exception $e) {
    $error = 'Database error: ' . $e->getMessage();
    $categories = [];
    $services = [];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Delete - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Test Delete Functionality</h1>
        
        <?php if ($message): ?>
            <div class="alert alert-success"><?php echo htmlspecialchars($message); ?></div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        
        <div class="row">
            <div class="col-md-6">
                <h3>Categories</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($categories as $cat): ?>
                            <tr>
                                <td><?php echo $cat['id']; ?></td>
                                <td><?php echo htmlspecialchars($cat['name']); ?></td>
                                <td>
                                    <span class="badge bg-<?php echo $cat['status'] === 'active' ? 'success' : 'secondary'; ?>">
                                        <?php echo ucfirst($cat['status']); ?>
                                    </span>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-danger" 
                                            onclick="deleteItem(<?php echo $cat['id']; ?>, 'category')">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            
            <div class="col-md-6">
                <h3>Services</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category ID</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($services as $srv): ?>
                            <tr>
                                <td><?php echo $srv['id']; ?></td>
                                <td><?php echo htmlspecialchars($srv['name']); ?></td>
                                <td><?php echo $srv['category_id']; ?></td>
                                <td>
                                    <span class="badge bg-<?php echo $srv['status'] === 'active' ? 'success' : 'secondary'; ?>">
                                        <?php echo ucfirst($srv['status']); ?>
                                    </span>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-danger" 
                                            onclick="deleteItem(<?php echo $srv['id']; ?>, 'service')">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="dashboard.php" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
    
    <script>
        function deleteItem(id, type) {
            if (confirm(`Are you sure you want to delete this ${type}?`)) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.innerHTML = `
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${id}">
                    <input type="hidden" name="type" value="${type}">
                `;
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>