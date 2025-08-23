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
    
    // Debug: Check database connection
    if (!$pdo) {
        throw new Exception("Database connection failed");
    }
    
    // Get active categories
    $stmt = $pdo->prepare("SELECT * FROM categories WHERE status = 'active' ORDER BY name");
    $stmt->execute();
    $categories = $stmt->fetchAll();
    
    // Debug: Log categories count
    error_log("Found " . count($categories) . " active categories");
    
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
    
    // Debug: Log services count
    error_log("Found " . count($services) . " active services");
    
} catch (Exception $e) {
    $error = "Database error: " . $e->getMessage();
    error_log("SMM Panel Error: " . $e->getMessage());
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
            
            <!-- Debug Information -->
            <?php if (isset($error)): ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <strong>Error:</strong> <?php echo htmlspecialchars($error); ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <?php endif; ?>
            
            <!-- Debug Info (remove in production) -->
            <div class="alert alert-info">
                <i class="fas fa-info-circle me-2"></i>
                <strong>Debug Info:</strong><br>
                Categories: <?php echo count($categories); ?><br>
                Services: <?php echo count($services); ?><br>
                Database Status: <?php echo isset($pdo) ? 'Connected' : 'Not Connected'; ?>
            </div>

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
                            <div class="service-selection-header text-center mb-4">
                                <h5 class="text-primary mb-2">
                                    <i class="fas fa-star me-2"></i>Choose Your Service
                                </h5>
                                <p class="text-muted">Select from our premium social media services</p>
                            </div>
                            
                            <?php if (empty($categories)): ?>
                                <div class="alert alert-warning text-center">
                                    <i class="fas fa-exclamation-triangle me-2"></i>
                                    No services available at the moment.
                                </div>
                            <?php else: ?>
                                <!-- Modern Category Pills -->
                                <div class="category-pills mb-4">
                                    <div class="d-flex flex-wrap justify-content-center gap-2">
                                        <?php foreach ($categories as $index => $category): ?>
                                            <button class="category-pill <?php echo $index === 0 ? 'active' : ''; ?>" 
                                                    data-category="<?php echo $category['id']; ?>"
                                                    onclick="showCategory(<?php echo $category['id']; ?>)">
                                                <i class="fas fa-<?php echo getCategoryIcon($category['name']); ?> me-2"></i>
                                                <?php echo htmlspecialchars($category['name']); ?>
                                            </button>
                                        <?php endforeach; ?>
                                    </div>
                                </div>

                                <!-- Services Grid -->
                                <div class="services-container">
                                    <?php foreach ($categories as $index => $category): ?>
                                        <div class="category-services <?php echo $index === 0 ? 'active' : ''; ?>" 
                                             id="category-<?php echo $category['id']; ?>">
                                            
                                            <div class="row g-3">
                                                <?php 
                                                $categoryServices = array_filter($services, function($service) use ($category) {
                                                    return $service['category_id'] == $category['id'];
                                                });
                                                ?>
                                                
                                                <?php foreach ($categoryServices as $service): ?>
                                                    <div class="col-lg-4 col-md-6">
                                                        <div class="modern-service-card" 
                                                             data-service-id="<?php echo $service['id']; ?>"
                                                             data-service-price="<?php echo $service['price']; ?>"
                                                             data-service-min="<?php echo $service['min_quantity']; ?>"
                                                             data-service-max="<?php echo $service['max_quantity']; ?>"
                                                             onclick="selectService(this)">
                                                            
                                                            <div class="service-card-header">
                                                                <div class="service-icon">
                                                                    <i class="fas fa-<?php echo getServiceIcon($service['name']); ?>"></i>
                                                                </div>
                                                                <div class="service-status">
                                                                    <span class="status-dot active"></span>
                                                                    <small>Active</small>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="service-card-body">
                                                                <h6 class="service-title">
                                                                    <?php echo htmlspecialchars($service['name']); ?>
                                                                </h6>
                                                                
                                                                <p class="service-description">
                                                                    <?php echo htmlspecialchars($service['description']); ?>
                                                                </p>
                                                                
                                                                <div class="service-meta">
                                                                    <div class="price-info">
                                                                        <span class="price-label">Price per 1000:</span>
                                                                        <span class="price-value">
                                                                            <?php if ($service['price'] == 0): ?>
                                                                                <span class="text-success">Free</span>
                                                                            <?php else: ?>
                                                                                AZN <?php echo rtrim(rtrim(number_format($service['price'], 4), '0'), '.'); ?>
                                                                            <?php endif; ?>
                                                                        </span>
                                                                    </div>
                                                                    
                                                                    <div class="quantity-info">
                                                                        <span class="quantity-label">Quantity Range:</span>
                                                                        <span class="quantity-value">
                                                                            <?php echo number_format($service['min_quantity']); ?> - <?php echo number_format($service['max_quantity']); ?>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="service-card-footer">
                                                                <div class="selection-indicator">
                                                                    <i class="fas fa-check-circle"></i>
                                                                </div>
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
        // Category switching
        function showCategory(categoryId) {
            // Hide all category services
            document.querySelectorAll('.category-services').forEach(cat => {
                cat.classList.remove('active');
            });
            
            // Show selected category
            document.getElementById('category-' + categoryId).classList.add('active');
            
            // Update category pills
            document.querySelectorAll('.category-pill').forEach(pill => {
                pill.classList.remove('active');
            });
            event.target.classList.add('active');
        }

        // Service selection
        function selectService(serviceCard) {
            // Remove previous selection
            document.querySelectorAll('.modern-service-card').forEach(card => {
                card.classList.remove('selected');
            });
            
            // Select current card
            serviceCard.classList.add('selected');
            
            // Update hidden input
            const serviceId = serviceCard.dataset.serviceId;
            document.getElementById('selectedServiceId').value = serviceId;
            
            // Update price display
            updatePriceDisplay();
            
            // Enable submit button
            document.getElementById('submitBtn').disabled = false;
        }

        // Update price display
        function updatePriceDisplay() {
            const selectedCard = document.querySelector('.modern-service-card.selected');
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
            const selectedCard = document.querySelector('.modern-service-card.selected');
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