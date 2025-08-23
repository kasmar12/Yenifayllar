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
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-rocket me-2"></i>
                <?php echo SITE_NAME; ?>
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="order-status.php">
                    <i class="fas fa-search me-1"></i>Check Order Status
                </a>
                <a class="nav-link" href="../admin/login.php">
                    <i class="fas fa-user-shield me-1"></i>Admin
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="main-container fade-in">
            <!-- Header -->
            <div class="text-center mb-4">
                <h1 class="display-4 fw-bold text-primary mb-3">
                    <i class="fas fa-chart-line me-3"></i>
                    Professional SMM Services
                </h1>
                <p class="lead text-muted">
                    Boost your social media presence with our high-quality services
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
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">
                        <i class="fas fa-shopping-cart me-2"></i>
                        Place Your Order
                    </h4>
                </div>
                <div class="card-body">
                    <form method="POST" id="orderForm">
                        <!-- Service Selection -->
                        <div class="mb-4">
                            <label for="service_id" class="form-label">
                                <strong><i class="fas fa-cogs me-2"></i>Select Service</strong>
                            </label>
                            
                            <?php if (empty($categories)): ?>
                                <div class="alert alert-warning">
                                    <i class="fas fa-exclamation-triangle me-2"></i>
                                    No services available at the moment.
                                </div>
                            <?php else: ?>
                                <!-- Category Tabs -->
                                <ul class="nav nav-tabs mb-3" id="categoryTabs" role="tablist">
                                    <?php foreach ($categories as $index => $category): ?>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link <?php echo $index === 0 ? 'active' : ''; ?>" 
                                                    id="tab-<?php echo $category['id']; ?>" 
                                                    data-bs-toggle="tab" 
                                                    data-bs-target="#content-<?php echo $category['id']; ?>" 
                                                    type="button" 
                                                    role="tab">
                                                <i class="fas fa-<?php echo getCategoryIcon($category['name']); ?> me-2"></i>
                                                <?php echo htmlspecialchars($category['name']); ?>
                                            </button>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>

                                <!-- Category Content -->
                                <div class="tab-content" id="categoryContent">
                                    <?php foreach ($categories as $index => $category): ?>
                                        <div class="tab-pane fade <?php echo $index === 0 ? 'show active' : ''; ?>" 
                                             id="content-<?php echo $category['id']; ?>" 
                                             role="tabpanel">
                                            
                                            <div class="row">
                                                <?php 
                                                $categoryServices = array_filter($services, function($service) use ($category) {
                                                    return $service['category_id'] == $category['id'];
                                                });
                                                ?>
                                                
                                                <?php foreach ($categoryServices as $service): ?>
                                                    <div class="col-md-6 mb-3">
                                                        <div class="service-card" 
                                                             data-service-id="<?php echo $service['id']; ?>"
                                                             data-service-price="<?php echo $service['price']; ?>"
                                                             data-service-min="<?php echo $service['min_quantity']; ?>"
                                                             data-service-max="<?php echo $service['max_quantity']; ?>">
                                                            
                                                            <div class="d-flex justify-content-between align-items-start mb-2">
                                                                <h6 class="mb-0 fw-bold">
                                                                    <?php echo htmlspecialchars($service['name']); ?>
                                                                </h6>
                                                                <span class="category-badge">
                                                                    <?php echo htmlspecialchars($category['name']); ?>
                                                                </span>
                                                            </div>
                                                            
                                                            <p class="text-muted small mb-2">
                                                                <?php echo htmlspecialchars($service['description']); ?>
                                                            </p>
                                                            
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="service-price">
                                                                    AZN <?php echo rtrim(rtrim(number_format($service['price'], 4), '0'), '.'); ?>/1000
                                                                </span>
                                                                <small class="text-muted">
                                                                    Min: <?php echo number_format($service['min_quantity']); ?>
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <?php endforeach; ?>
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
                                   placeholder="1000 (1 AZN)"
                                   min="1000" 
                                   max="100000"
                                   value="1000"
                                   required>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                Enter the number of followers, likes, or views you want (1000 = 1 AZN)
                            </div>
                        </div>

                        <!-- Price Display -->
                        <div class="alert alert-info" id="priceDisplay" style="display: none;">
                            <div class="d-flex justify-content-between align-items-center">
                                <span><strong>Total Price:</strong></span>
                                <span class="fw-bold" id="totalPrice">AZN 0</span>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg" id="submitBtn" disabled>
                                <i class="fas fa-paper-plane me-2"></i>
                                Continue to Order
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Features Section -->
            <div class="row mt-5">
                <div class="col-md-4 text-center mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="fas fa-bolt fa-3x text-primary mb-3"></i>
                            <h5 class="card-title">Fast Delivery</h5>
                            <p class="card-text">Get your orders completed quickly with our efficient service.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="fas fa-shield-alt fa-3x text-primary mb-3"></i>
                            <h5 class="card-title">Secure & Safe</h5>
                            <p class="card-text">Your account safety is our top priority.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="fas fa-headset fa-3x text-primary mb-3"></i>
                            <h5 class="card-title">24/7 Support</h5>
                            <p class="card-text">Our support team is always here to help you.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Service selection functionality
        document.querySelectorAll('.service-card').forEach(card => {
            card.addEventListener('click', function() {
                // Remove previous selection
                document.querySelectorAll('.service-card').forEach(c => c.classList.remove('selected'));
                
                // Select current card
                this.classList.add('selected');
                
                // Update hidden input
                const serviceId = this.dataset.serviceId;
                document.getElementById('selectedServiceId').value = serviceId;
                
                // Update price display
                updatePriceDisplay();
                
                // Enable submit button
                document.getElementById('submitBtn').disabled = false;
            });
        });

        // Update price display
        function updatePriceDisplay() {
            const selectedCard = document.querySelector('.service-card.selected');
            if (selectedCard) {
                const price = parseFloat(selectedCard.dataset.servicePrice);
                const quantity = parseInt(document.getElementById('quantity').value) || 1000;
                const totalPrice = price * quantity;
                
                // Format price without trailing zeros
                let formattedPrice;
                if (totalPrice === 0) {
                    formattedPrice = 'Pulsuz (Free)';
                } else if (totalPrice === 1) {
                    formattedPrice = '1 AZN';
                } else {
                    formattedPrice = 'AZN ' + totalPrice.toFixed(4).replace(/\.?0+$/, '');
                }
                
                document.getElementById('totalPrice').textContent = formattedPrice;
                document.getElementById('priceDisplay').style.display = 'block';
                
                // Show price per 1000 units
                const pricePer1000 = (price * 1000).toFixed(4).replace(/\.?0+$/, '');
                console.log(`Price per 1000 units: AZN ${pricePer1000}`);
            }
        }

        // Update price when quantity changes
        document.getElementById('quantity').addEventListener('input', updatePriceDisplay);
        
        // Initialize price display with default quantity (1000)
        document.addEventListener('DOMContentLoaded', function() {
            // Set default quantity to 1000
            document.getElementById('quantity').value = 1000;
            
            // Show default price for 1000 quantity
            document.getElementById('totalPrice').textContent = '1 AZN';
            document.getElementById('priceDisplay').style.display = 'block';
            
            // If a service is pre-selected, show its price
            const selectedCard = document.querySelector('.service-card.selected');
            if (selectedCard) {
                updatePriceDisplay();
            }
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