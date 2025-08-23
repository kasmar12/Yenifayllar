<?php
/**
 * SMM Panel - Main User Interface
 * Service selection and order placement
 */

require_once '../includes/config.php';
require_once '../includes/api_functions.php';

// Get categories and services from database
try {
    $pdo = getDBConnection();
    
    // Get active categories
    $stmt = $pdo->prepare("SELECT * FROM categories WHERE status = 'active' ORDER BY name");
    $stmt->execute();
    $categories = $stmt->fetchAll();
    
    // Get active services with category info
    $stmt = $pdo->prepare("
        SELECT s.*, c.name as category_name 
        FROM services s 
        JOIN categories c ON s.category_id = c.id 
        WHERE s.status = 'active' AND c.status = 'active'
        ORDER BY c.name, s.name
    ");
    $stmt->execute();
    $services = $stmt->fetchAll();
    
} catch (Exception $e) {
    $error = "Database error: " . $e->getMessage();
    $categories = [];
    $services = [];
}

// Handle form submission
$message = '';
$messageType = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $serviceId = intval($_POST['service_id'] ?? 0);
    $link = sanitizeInput($_POST['link'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    // Validate input
    if (empty($serviceId) || empty($link) || $quantity <= 0) {
        $message = 'Please fill in all fields correctly.';
        $messageType = 'danger';
    } else {
        // Get service details
        try {
            $stmt = $pdo->prepare("SELECT * FROM services WHERE id = ? AND status = 'active'");
            $stmt->execute([$serviceId]);
            $service = $stmt->fetch();
            
            if (!$service) {
                $message = 'Selected service not found.';
                $messageType = 'danger';
            } else {
                // Validate quantity
                if ($quantity < $service['min_quantity'] || $quantity > $service['max_quantity']) {
                    $message = "Quantity must be between {$service['min_quantity']} and {$service['max_quantity']}.";
                    $messageType = 'danger';
                } else {
                    // Calculate total price
                    $totalPrice = $service['price'] * $quantity;
                    
                    // Store order data in session for ad verification
                    $_SESSION['pending_order'] = [
                        'service_id' => $serviceId,
                        'service_name' => $service['name'],
                        'link' => $link,
                        'quantity' => $quantity,
                        'price' => $service['price'],
                        'total_price' => $totalPrice,
                        'api_service_id' => $service['api_service_id']
                    ];
                    
                    // Redirect to ad verification
                    header('Location: ad-verification.php');
                    exit;
                }
            }
        } catch (Exception $e) {
            $message = 'Error processing service: ' . $e->getMessage();
            $messageType = 'danger';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo SITE_NAME; ?> - Professional SMM Services</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-rocket me-2"></i>
                <?php echo SITE_NAME; ?>
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="order-status.php">
                    <i class="fas fa-search me-1"></i>Order Status
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="main-container">
            <!-- Header -->
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold text-primary mb-3">
                    <i class="fas fa-rocket me-2"></i>
                    SMM Services
                </h1>
                <p class="text-muted">
                    Choose your service and place your order
                </p>
            </div>

            <!-- Alert Messages -->
            <?php if ($message): ?>
                <div class="alert alert-<?php echo $messageType; ?> alert-dismissible fade show" role="alert">
                    <i class="fas fa-info-circle me-2"></i>
                    <?php echo htmlspecialchars($message); ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <?php endif; ?>
            


            <!-- Order Form -->
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <form method="POST" id="orderForm">
                        <!-- Service Selection -->
                        <div class="mb-4">
                            <h5 class="text-center mb-3">
                                <i class="fas fa-cogs me-2"></i>Select Service
                            </h5>
                            
                            <?php if (empty($categories)): ?>
                                <div class="alert alert-warning text-center">
                                    <i class="fas fa-exclamation-triangle me-2"></i>
                                    No services available at the moment.
                                </div>
                            <?php else: ?>
                                <!-- Simple Service Grid -->
                                <div class="row">
                                    <?php 
                                    // Get first 6 services for simple display
                                    $displayServices = array_slice($services, 0, 6);
                                    ?>
                                    
                                    <?php foreach ($displayServices as $service): ?>
                                        <div class="col-md-4 mb-3">
                                            <div class="simple-service-card" 
                                                 data-service-id="<?php echo $service['id']; ?>"
                                                 data-service-price="<?php echo $service['price']; ?>"
                                                 data-service-min="<?php echo $service['min_quantity']; ?>"
                                                 data-service-max="<?php echo $service['max_quantity']; ?>">
                                                
                                                <div class="service-icon mb-2">
                                                    <i class="fas fa-<?php echo getServiceIcon($service['name']); ?> fa-2x text-primary"></i>
                                                </div>
                                                
                                                <h6 class="service-name mb-2">
                                                    <?php echo htmlspecialchars($service['name']); ?>
                                                </h6>
                                                
                                                <p class="service-desc small text-muted mb-2">
                                                    <?php echo htmlspecialchars($service['description']); ?>
                                                </p>
                                                
                                                <div class="service-badge">
                                                    <span class="badge bg-primary">
                                                        <?php 
                                                        $categoryName = '';
                                                        foreach ($categories as $cat) {
                                                            if ($cat['id'] == $service['category_id']) {
                                                                $categoryName = $cat['name'];
                                                                break;
                                                            }
                                                        }
                                                        echo htmlspecialchars($categoryName);
                                                        ?>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>

                                <input type="hidden" name="service_id" id="selectedServiceId" required>
                                <div class="invalid-feedback">Please select a service.</div>
                            <?php endif; ?>
                        </div>

                        <!-- Link/Username Input -->
                        <div class="mb-3">
                            <label for="link" class="form-label">
                                <strong><i class="fas fa-link me-2"></i>Instagram/TikTok Link or Username</strong>
                            </label>
                            <input type="text" 
                                   class="form-control" 
                                   id="link" 
                                   name="link" 
                                   placeholder="Enter Instagram username, TikTok link, or YouTube URL"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                Enter the link or username you want to boost
                            </div>
                        </div>

                        <!-- Quantity Input -->
                        <div class="mb-4">
                            <label for="quantity" class="form-label">
                                <strong><i class="fas fa-sort-numeric-up me-2"></i>Quantity</strong>
                            </label>
                            <input type="number" 
                                   class="form-control" 
                                   id="quantity" 
                                   name="quantity" 
                                   placeholder="1000"
                                   min="1000" 
                                   max="100000"
                                   value="1000"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                Enter the number of followers, likes, or views you want
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="submitBtn" disabled>
                                <i class="fas fa-paper-plane me-2"></i>
                                Place Order
                            </button>
                        </div>
                    </form>
                </div>
            </div>


        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Service selection functionality
        document.querySelectorAll('.simple-service-card').forEach(card => {
            card.addEventListener('click', function() {
                // Remove previous selection
                document.querySelectorAll('.simple-service-card').forEach(c => c.classList.remove('selected'));
                
                // Select current card
                this.classList.add('selected');
                
                // Update hidden input
                const serviceId = this.dataset.serviceId;
                document.getElementById('selectedServiceId').value = serviceId;
                
                // Enable submit button
                document.getElementById('submitBtn').disabled = false;
            });
        });

        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const serviceId = document.getElementById('selectedServiceId').value;
            const link = document.getElementById('link').value.trim();
            const quantity = document.getElementById('quantity').value;
            
            if (!serviceId || !link || !quantity) {
                e.preventDefault();
                alert('Please fill in all fields and select a service.');
                return false;
            }
            
            // Show loading state
            document.getElementById('submitBtn').innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
            document.getElementById('submitBtn').disabled = true;
        });
    </script>
</body>
</html>

<?php
// Helper function to get category icon
function getCategoryIcon($name) {
    $name = strtolower($name);
    $icons = [
        'instagram' => 'camera',
        'tiktok' => 'music',
        'youtube' => 'play-circle',
        'twitter' => 'twitter',
        'facebook' => 'facebook',
        'default' => 'tag'
    ];
    
    return $icons[$name] ?? $icons['default'];
}
?>