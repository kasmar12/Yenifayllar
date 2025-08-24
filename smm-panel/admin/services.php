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

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case 'add':
                $name = $_POST['name'] ?? '';
                $description = $_POST['description'] ?? '';
                $min_amount = $_POST['min_amount'] ?? '';
                $max_amount = $_POST['max_amount'] ?? '';
                $price_per_1k = $_POST['price_per_1k'] ?? '';
                $api_service_id = $_POST['api_service_id'] ?? '';
                
                if ($name && $min_amount && $max_amount && $price_per_1k) {
                    $query = "INSERT INTO services (name, description, min_amount, max_amount, price_per_1k, api_service_id) VALUES (?, ?, ?, ?, ?, ?)";
                    $stmt = $db->prepare($query);
                    if ($stmt->execute([$name, $description, $min_amount, $max_amount, $price_per_1k, $api_service_id])) {
                        $message = 'Xidmət uğurla əlavə edildi!';
                    } else {
                        $error = 'Xidmət əlavə edilərkən xəta baş verdi!';
                    }
                } else {
                    $error = 'Bütün məcburi sahələri doldurun!';
                }
                break;
                
            case 'edit':
                $id = $_POST['id'] ?? '';
                $name = $_POST['name'] ?? '';
                $description = $_POST['description'] ?? '';
                $min_amount = $_POST['min_amount'] ?? '';
                $max_amount = $_POST['max_amount'] ?? '';
                $price_per_1k = $_POST['price_per_1k'] ?? '';
                $api_service_id = $_POST['api_service_id'] ?? '';
                
                if ($id && $name && $min_amount && $max_amount && $price_per_1k) {
                    $query = "UPDATE services SET name = ?, description = ?, min_amount = ?, max_amount = ?, price_per_1k = ?, api_service_id = ? WHERE id = ?";
                    $stmt = $db->prepare($query);
                    if ($stmt->execute([$name, $description, $min_amount, $max_amount, $price_per_1k, $api_service_id, $id])) {
                        $message = 'Xidmət uğurla yeniləndi!';
                    } else {
                        $error = 'Xidmət yenilənərkən xəta baş verdi!';
                    }
                } else {
                    $error = 'Bütün məcburi sahələri doldurun!';
                }
                break;
                
            case 'delete':
                $id = $_POST['id'] ?? '';
                if ($id) {
                    $query = "DELETE FROM services WHERE id = ?";
                    $stmt = $db->prepare($query);
                    if ($stmt->execute([$id])) {
                        $message = 'Xidmət uğurla silindi!';
                    } else {
                        $error = 'Xidmət silinərkən xəta baş verdi!';
                    }
                }
                break;
        }
    }
}

// Get all services
$query = "SELECT * FROM services ORDER BY name";
$stmt = $db->prepare($query);
$stmt->execute();
$services = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Xidmətlər</title>
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
        <div class="row">
            <div class="col-md-4">
                <!-- Add/Edit Service Form -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-plus"></i> Yeni Xidmət
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="POST" id="serviceForm">
                            <input type="hidden" name="action" value="add" id="formAction">
                            <input type="hidden" name="id" id="editId">
                            
                            <div class="mb-3">
                                <label class="form-label">Xidmət adı:</label>
                                <input type="text" name="name" class="form-control" required id="editName">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Təsvir:</label>
                                <textarea name="description" class="form-control" rows="3" id="editDescription"></textarea>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Min miqdar:</label>
                                        <input type="number" name="min_amount" class="form-control" required min="1" id="editMinAmount">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Max miqdar:</label>
                                        <input type="number" name="max_amount" class="form-control" required min="1" id="editMaxAmount">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Qiymət/1000:</label>
                                <input type="number" name="price_per_1k" class="form-control" required min="0.01" step="0.01" id="editPrice">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">API Service ID:</label>
                                <input type="text" name="api_service_id" class="form-control" id="editApiServiceId">
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary" id="submitBtn">
                                    <i class="fas fa-plus"></i> Əlavə Et
                                </button>
                                <button type="button" class="btn btn-secondary" onclick="resetForm()" id="resetBtn" style="display: none;">
                                    <i class="fas fa-times"></i> Ləğv Et
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-md-8">
                <!-- Services List -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-list"></i> Mövcud Xidmətlər
                        </h5>
                    </div>
                    <div class="card-body">
                        <?php if ($message): ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>
                        
                        <?php if ($error): ?>
                            <div class="alert alert-danger"><?php echo $error; ?></div>
                        <?php endif; ?>
                        
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ad</th>
                                        <th>Min</th>
                                        <th>Max</th>
                                        <th>Qiymət/1K</th>
                                        <th>Əməliyyatlar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($services as $service): ?>
                                    <tr>
                                        <td><?php echo $service['id']; ?></td>
                                        <td><?php echo htmlspecialchars($service['name']); ?></td>
                                        <td><?php echo number_format($service['min_amount']); ?></td>
                                        <td><?php echo number_format($service['max_amount']); ?></td>
                                        <td><?php echo $service['price_per_1k']; ?> ₼</td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="editService(<?php echo htmlspecialchars(json_encode($service)); ?>)">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger" onclick="deleteService(<?php echo $service['id']; ?>)">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function editService(service) {
            document.getElementById('formAction').value = 'edit';
            document.getElementById('editId').value = service.id;
            document.getElementById('editName').value = service.name;
            document.getElementById('editDescription').value = service.description;
            document.getElementById('editMinAmount').value = service.min_amount;
            document.getElementById('editMaxAmount').value = service.max_amount;
            document.getElementById('editPrice').value = service.price_per_1k;
            document.getElementById('editApiServiceId').value = service.api_service_id;
            
            document.getElementById('submitBtn').innerHTML = '<i class="fas fa-save"></i> Yenilə';
            document.getElementById('resetBtn').style.display = 'block';
        }
        
        function resetForm() {
            document.getElementById('serviceForm').reset();
            document.getElementById('formAction').value = 'add';
            document.getElementById('editId').value = '';
            document.getElementById('submitBtn').innerHTML = '<i class="fas fa-plus"></i> Əlavə Et';
            document.getElementById('resetBtn').style.display = 'none';
        }
        
        function deleteService(id) {
            if (confirm('Bu xidməti silmək istədiyinizə əminsiniz?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.innerHTML = `
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${id}">
                `;
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>