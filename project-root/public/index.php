<?php
/**
 * Main user form for placing SMM orders
 * Dynamically fetches services from SMM API
 */

require_once '../includes/functions.php';

// Fetch services and categories from API
$services = fetchServices();
$categories = fetchCategories();

// Handle form submission
$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $link = sanitizeInput($_POST['link'] ?? '');
    $service = sanitizeInput($_POST['service'] ?? '');
    $quantity = intval($_POST['quantity'] ?? 0);
    
    // Validate input
    if (empty($link) || empty($service) || $quantity <= 0) {
        $error = 'Please fill in all fields correctly.';
    } else {
        // Redirect to create-order.php with form data
        header('Location: create-order.php?' . http_build_query([
            'link' => $link,
            'service' => $service,
            'quantity' => $quantity
        ]));
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Place Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px 0;
        }
        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin: 20px auto;
            max-width: 600px;
        }
        .form-title {
            text-align: center;
            color: #333;
            margin-bottom: 2rem;
            font-weight: 700;
            font-size: 2.2rem;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 15px 40px;
            font-weight: 600;
            border-radius: 30px;
            font-size: 1.1rem;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }
        .service-card {
            border: 2px solid #e9ecef;
            border-radius: 15px;
            padding: 1rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        .service-card:hover {
            border-color: #667eea;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
        }
        .service-card.selected {
            border-color: #667eea;
            background-color: #f8f9ff;
        }
        .category-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        .loading {
            text-align: center;
            padding: 2rem;
            color: #666;
        }
        .error-message {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1 class="form-title">
                <i class="fas fa-rocket text-primary me-2"></i>
                <?php echo APP_NAME; ?>
            </h1>
            
            <?php if ($error): ?>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <?php echo $error; ?>
                </div>
            <?php endif; ?>
            
            <?php if ($success): ?>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle me-2"></i>
                    <?php echo $success; ?>
                </div>
            <?php endif; ?>
            
            <form method="POST" id="orderForm">
                <div class="mb-4">
                    <label for="link" class="form-label">
                        <strong><i class="fas fa-link me-2"></i>Username or Link</strong>
                    </label>
                    <input type="text" 
                           class="form-control form-control-lg" 
                           id="link" 
                           name="link" 
                           placeholder="Enter Instagram username or profile link"
                           value="<?php echo htmlspecialchars($_POST['link'] ?? ''); ?>"
                           required>
                    <div class="form-text">
                        <i class="fas fa-info-circle me-1"></i>
                        Enter your social media username or profile URL
                    </div>
                </div>

                <div class="mb-4">
                    <label for="service" class="form-label">
                        <strong><i class="fas fa-cogs me-2"></i>Select Service</strong>
                    </label>
                    
                    <?php if ($services === false): ?>
                        <div class="loading">
                            <i class="fas fa-spinner fa-spin fa-2x mb-3"></i>
                            <p>Loading services...</p>
                            <button type="button" class="btn btn-outline-primary" onclick="location.reload()">
                                <i class="fas fa-redo me-2"></i>Retry
                            </button>
                        </div>
                    <?php else: ?>
                        <select class="form-select form-select-lg" id="service" name="service" required>
                            <option value="">Choose a service...</option>
                            <?php if ($categories && is_array($categories)): ?>
                                <?php foreach ($categories as $category): ?>
                                    <optgroup label="<?php echo htmlspecialchars(ucfirst($category)); ?>">
                                        <?php 
                                        $categoryServices = fetchServicesByCategory($category);
                                        if ($categoryServices && is_array($categoryServices)):
                                            foreach ($categoryServices as $service):
                                        ?>
                                            <option value="<?php echo htmlspecialchars($service['service']); ?>">
                                                <?php echo htmlspecialchars($service['name'] ?? formatServiceName($service['service'])); ?>
                                                - $<?php echo number_format($service['rate'] ?? 0, 4); ?>/1000
                                            </option>
                                        <?php 
                                            endforeach;
                                        endif;
                                        ?>
                                    </optgroup>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <?php foreach ($services as $service): ?>
                                    <option value="<?php echo htmlspecialchars($service['service']); ?>">
                                        <?php echo htmlspecialchars($service['name'] ?? formatServiceName($service['service'])); ?>
                                        - $<?php echo number_format($service['rate'] ?? 0, 4); ?>/1000
                                    </option>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </select>
                    <?php endif; ?>
                </div>

                <div class="mb-4">
                    <label for="quantity" class="form-label">
                        <strong><i class="fas fa-sort-numeric-up me-2"></i>Quantity</strong>
                    </label>
                    <input type="number" 
                           class="form-control form-control-lg" 
                           id="quantity" 
                           name="quantity" 
                           placeholder="1000"
                           value="<?php echo htmlspecialchars($_POST['quantity'] ?? ''); ?>"
                           min="1" 
                           max="1000000"
                           required>
                    <div class="form-text">
                        <i class="fas fa-info-circle me-1"></i>
                        Enter the number of followers, likes, or views you want
                    </div>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg" id="submitBtn">
                        <i class="fas fa-paper-plane me-2"></i>
                        Continue to Order
                    </button>
                </div>
            </form>

            <div class="mt-4 text-center">
                <small class="text-muted">
                    <i class="fas fa-shield-alt me-1"></i>
                    Your order will be processed after completing the verification step
                </small>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation and enhancement
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const link = document.getElementById('link').value.trim();
            const service = document.getElementById('service').value;
            const quantity = document.getElementById('quantity').value;
            const submitBtn = document.getElementById('submitBtn');
            
            if (!link || !service || !quantity) {
                e.preventDefault();
                alert('Please fill in all fields');
                return false;
            }
            
            if (quantity < 1 || quantity > 1000000) {
                e.preventDefault();
                alert('Quantity must be between 1 and 1,000,000');
                return false;
            }
            
            // Show loading state
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
            submitBtn.disabled = true;
        });
        
        // Service selection enhancement
        document.getElementById('service').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            if (selectedOption.value) {
                this.classList.add('is-valid');
            } else {
                this.classList.remove('is-valid');
            }
        });
    </script>
</body>
</html>