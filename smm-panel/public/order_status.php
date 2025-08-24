<?php
session_start();
require_once '../config/database.php';

$order_id = $_GET['order_id'] ?? '';
$order = null;
$error = '';

if (empty($order_id)) {
    $error = 'Sifariş ID təyin edilməyib!';
} else {
    try {
        $database = new Database();
        $db = $database->getConnection();
        
        if ($db) {
            $query = "SELECT o.*, s.name as service_name, s.description as service_description 
                      FROM orders o 
                      JOIN services s ON o.service_id = s.id 
                      WHERE o.id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$order_id]);
            $order = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if (!$order) {
                $error = 'Sifariş tapılmadı!';
            }
        } else {
            $error = 'Database bağlantısı uğursuz!';
        }
    } catch (Exception $e) {
        $error = 'Xəta baş verdi: ' . $e->getMessage();
    }
}

// Get status information
function getStatusInfo($status) {
    switch ($status) {
        case 'pending':
            return [
                'text' => 'Gözləyir',
                'class' => 'warning',
                'icon' => 'clock',
                'description' => 'Sifarişiniz gözləyir və ödəniş gözlənir'
            ];
        case 'paid':
            return [
                'text' => 'Ödənildi',
                'class' => 'info',
                'icon' => 'credit-card',
                'description' => 'Ödəniş uğurla tamamlandı, sifariş emal edilir'
            ];
        case 'processing':
            return [
                'text' => 'İşlənir',
                'class' => 'primary',
                'icon' => 'cog',
                'description' => 'Sifarişiniz SMM xidmətində işlənir'
            ];
        case 'completed':
            return [
                'text' => 'Tamamlandı',
                'class' => 'success',
                'icon' => 'check-circle',
                'description' => 'Sifarişiniz uğurla tamamlandı!'
            ];
        case 'cancelled':
            return [
                'text' => 'Ləğv edildi',
                'class' => 'danger',
                'icon' => 'times-circle',
                'description' => 'Sifariş ləğv edildi'
            ];
        case 'refunded':
            return [
                'text' => 'Geri qaytarıldı',
                'class' => 'secondary',
                'icon' => 'undo',
                'description' => 'Ödəniş geri qaytarıldı'
            ];
        default:
            return [
                'text' => 'Naməlum',
                'class' => 'secondary',
                'icon' => 'question-circle',
                'description' => 'Status məlum deyil'
            ];
    }
}

$status_info = $order ? getStatusInfo($order['status']) : null;
?>

<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sifariş Statusu - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .status-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .status-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .status-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        .order-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 30px;
        }
        .order-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }
        .order-body {
            padding: 30px;
        }
        .status-badge {
            font-size: 1.1rem;
            padding: 10px 20px;
            border-radius: 25px;
        }
        .progress-section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .progress-step {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            background: white;
            border: 1px solid #e9ecef;
        }
        .progress-step.completed {
            border-color: #28a745;
            background: #f8fff9;
        }
        .progress-step.current {
            border-color: #007bff;
            background: #f0f8ff;
        }
        .step-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 1.2rem;
        }
        .step-icon.completed {
            background: #28a745;
            color: white;
        }
        .step-icon.current {
            background: #007bff;
            color: white;
        }
        .step-icon.pending {
            background: #6c757d;
            color: white;
        }
        .step-content {
            flex: 1;
        }
        .step-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        .step-description {
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="status-container">
        <!-- Header -->
        <div class="status-header">
            <h1><i class="fas fa-search text-primary"></i> Sifariş Statusu</h1>
            <p class="lead">Sifarişinizin cari vəziyyətini izləyin</p>
        </div>

        <!-- Error Message -->
        <?php if ($error): ?>
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> <?php echo $error; ?>
                <div class="mt-3">
                    <a href="index.php" class="btn btn-outline-danger">
                        <i class="fas fa-arrow-left"></i> Ana Səhifəyə Qayıt
                    </a>
                </div>
            </div>
        <?php endif; ?>

        <!-- Order Information -->
        <?php if ($order && $status_info): ?>
        <div class="order-card">
            <div class="order-header">
                <h3><i class="fas fa-shopping-cart"></i> Sifariş #<?php echo $order['id']; ?></h3>
                <p class="mb-0">Status: <span class="badge bg-<?php echo $status_info['class']; ?> status-badge">
                    <i class="fas fa-<?php echo $status_info['icon']; ?>"></i> <?php echo $status_info['text']; ?>
                </span></p>
            </div>
            
            <div class="order-body">
                <!-- Order Details -->
                <div class="row">
                    <div class="col-md-6">
                        <h5><i class="fas fa-info-circle"></i> Sifariş Məlumatları</h5>
                        <p><strong>Xidmət:</strong> <?php echo htmlspecialchars($order['service_name']); ?></p>
                        <p><strong>Link:</strong> <?php echo htmlspecialchars($order['link']); ?></p>
                        <p><strong>Miqdar:</strong> <?php echo number_format($order['amount']); ?> ədəd</p>
                    </div>
                    <div class="col-md-6">
                        <h5><i class="fas fa-credit-card"></i> Ödəniş Məlumatları</h5>
                        <p><strong>Qiymət:</strong> <span class="text-primary fw-bold"><?php echo number_format($order['price'], 2); ?> ₼</span></p>
                        <p><strong>Tarix:</strong> <?php echo date('d.m.Y H:i', strtotime($order['created_at'])); ?></p>
                        <?php if ($order['api_order_id']): ?>
                            <p><strong>API Sifariş ID:</strong> <?php echo $order['api_order_id']; ?></p>
                        <?php endif; ?>
                    </div>
                </div>

                <!-- Progress Section -->
                <div class="progress-section">
                    <h5><i class="fas fa-tasks"></i> Sifariş Prosesi</h5>
                    
                    <!-- Step 1: Order Created -->
                    <div class="progress-step completed">
                        <div class="step-icon completed">
                            <i class="fas fa-check"></i>
                        </div>
                        <div class="step-content">
                            <div class="step-title">Sifariş Yaradıldı</div>
                            <div class="step-description">Sifarişiniz sistemə qəbul edildi</div>
                        </div>
                    </div>

                    <!-- Step 2: Payment -->
                    <div class="progress-step <?php echo in_array($order['status'], ['paid', 'processing', 'completed']) ? 'completed' : ($order['status'] === 'pending' ? 'current' : 'pending'); ?>">
                        <div class="step-icon <?php echo in_array($order['status'], ['paid', 'processing', 'completed']) ? 'completed' : ($order['status'] === 'pending' ? 'current' : 'pending'); ?>">
                            <i class="fas fa-<?php echo in_array($order['status'], ['paid', 'processing', 'completed']) ? 'check' : ($order['status'] === 'pending' ? 'clock' : 'times'); ?>"></i>
                        </div>
                        <div class="step-content">
                            <div class="step-title">Ödəniş</div>
                            <div class="step-description">
                                <?php if (in_array($order['status'], ['paid', 'processing', 'completed'])): ?>
                                    Ödəniş uğurla tamamlandı
                                <?php elseif ($order['status'] === 'pending'): ?>
                                    Ödəniş gözlənir
                                <?php else: ?>
                                    Ödəniş edilmədi
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <!-- Step 3: Processing -->
                    <div class="progress-step <?php echo $order['status'] === 'completed' ? 'completed' : ($order['status'] === 'processing' ? 'current' : 'pending'); ?>">
                        <div class="step-icon <?php echo $order['status'] === 'completed' ? 'completed' : ($order['status'] === 'processing' ? 'current' : 'pending'); ?>">
                            <i class="fas fa-<?php echo $order['status'] === 'completed' ? 'check' : ($order['status'] === 'processing' ? 'cog' : 'clock'); ?>"></i>
                        </div>
                        <div class="step-content">
                            <div class="step-title">İşlənir</div>
                            <div class="step-description">
                                <?php if ($order['status'] === 'completed'): ?>
                                    Sifariş tamamlandı
                                <?php elseif ($order['status'] === 'processing'): ?>
                                    Sifariş SMM xidmətində işlənir
                                <?php else: ?>
                                    Sifariş işlənməyə başlamayıb
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <!-- Step 4: Completed -->
                    <div class="progress-step <?php echo $order['status'] === 'completed' ? 'completed' : 'pending'; ?>">
                        <div class="step-icon <?php echo $order['status'] === 'completed' ? 'completed' : 'pending'; ?>">
                            <i class="fas fa-<?php echo $order['status'] === 'completed' ? 'check' : 'clock'; ?>"></i>
                        </div>
                        <div class="step-content">
                            <div class="step-title">Tamamlandı</div>
                            <div class="step-description">
                                <?php if ($order['status'] === 'completed'): ?>
                                    Sifariş uğurla tamamlandı!
                                <?php else: ?>
                                    Sifariş tamamlanmayıb
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Status Description -->
                <div class="alert alert-<?php echo $status_info['class']; ?>">
                    <i class="fas fa-<?php echo $status_info['icon']; ?>"></i>
                    <strong><?php echo $status_info['text']; ?></strong> - <?php echo $status_info['description']; ?>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="text-center">
            <a href="index.php" class="btn btn-success me-2">
                <i class="fas fa-plus"></i> Yeni Sifariş
            </a>
            <a href="orders.php" class="btn btn-outline-primary me-2">
                <i class="fas fa-list"></i> Bütün Sifarişlər
            </a>
            <button onclick="location.reload()" class="btn btn-outline-secondary">
                <i class="fas fa-sync-alt"></i> Yenilə
            </button>
        </div>

        <?php endif; ?>

        <!-- Back Button -->
        <div class="text-center mt-4">
            <a href="index.php" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left"></i> Ana Səhifəyə Qayıt
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-refresh every 30 seconds if order is processing
        <?php if ($order && in_array($order['status'], ['pending', 'paid', 'processing'])): ?>
        setTimeout(function() {
            location.reload();
        }, 30000);
        <?php endif; ?>
    </script>
</body>
</html>