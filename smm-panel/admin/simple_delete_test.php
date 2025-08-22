<?php
/**
 * Simple Delete Test
 * Direct test of delete functionality
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
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_log("POST request received: " . print_r($_POST, true));
    
    if (isset($_POST['action']) && $_POST['action'] === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        $type = $_POST['type'] ?? '';
        
        error_log("Delete request - ID: {$id}, Type: {$type}");
        
        if ($id > 0 && !empty($type)) {
            try {
                $pdo = getDBConnection();
                
                if ($type === 'service') {
                    // Check for orders first
                    $stmt = $pdo->prepare("SELECT COUNT(*) FROM orders WHERE service_id = ?");
                    $stmt->execute([$id]);
                    $orderCount = $stmt->fetchColumn();
                    
                    if ($orderCount > 0) {
                        $error = "Cannot delete service - it has {$orderCount} orders.";
                    } else {
                        $stmt = $pdo->prepare("DELETE FROM services WHERE id = ?");
                        $stmt->execute([$id]);
                        
                        if ($stmt->rowCount() > 0) {
                            $message = "Service ID {$id} deleted successfully!";
                        } else {
                            $error = "Service ID {$id} not found.";
                        }
                    }
                } elseif ($type === 'category') {
                    // Delete services first, then category
                    $stmt = $pdo->prepare("DELETE FROM services WHERE category_id = ?");
                    $stmt->execute([$id]);
                    $deletedServices = $stmt->rowCount();
                    
                    $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
                    $stmt->execute([$id]);
                    
                    if ($stmt->rowCount() > 0) {
                        $message = "Category ID {$id} deleted successfully! {$deletedServices} services removed.";
                    } else {
                        $error = "Category ID {$id} not found.";
                    }
                }
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
                error_log("Database error: " . $e->getMessage());
            }
        } else {
            $error = 'Invalid ID or type.';
        }
    }
}

// Get current data
try {
    $pdo = getDBConnection();
    
    $stmt = $pdo->query("SELECT id, name FROM categories ORDER BY name");
    $categories = $stmt->fetchAll();
    
    $stmt = $pdo->query("SELECT id, name, category_id FROM services ORDER BY name");
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
    <title>Simple Delete Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Simple Delete Test</h1>
        
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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($categories as $cat): ?>
                            <tr>
                                <td><?php echo $cat['id']; ?></td>
                                <td><?php echo htmlspecialchars($cat['name']); ?></td>
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
            <a href="categories.php" class="btn btn-primary">Categories Page</a>
            <a href="services.php" class="btn btn-primary">Services Page</a>
        </div>
    </div>
    
    <script>
        function deleteItem(id, type) {
            console.log('deleteItem called:', id, type);
            
            if (confirm(`Are you sure you want to delete this ${type}?`)) {
                console.log('User confirmed deletion');
                
                const form = document.createElement('form');
                form.method = 'POST';
                form.innerHTML = `
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${id}">
                    <input type="hidden" name="type" value="${type}">
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