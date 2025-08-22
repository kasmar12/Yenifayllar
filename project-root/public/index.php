<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Service Order Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 500px;
        }
        .form-title {
            text-align: center;
            color: #333;
            margin-bottom: 2rem;
            font-weight: 600;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 25px;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">📱 SMM Service Order</h2>
        
        <form action="create-link.php" method="POST" id="orderForm">
            <div class="mb-3">
                <label for="link" class="form-label">
                    <strong>Username or Link</strong>
                </label>
                <input type="text" 
                       class="form-control" 
                       id="link" 
                       name="link" 
                       placeholder="Enter Instagram username or profile link"
                       required>
                <div class="form-text">Enter your social media username or profile URL</div>
            </div>

            <div class="mb-3">
                <label for="service" class="form-label">
                    <strong>Service Type</strong>
                </label>
                <select class="form-select" id="service" name="service" required>
                    <option value="">Choose a service...</option>
                    <option value="instagram_followers">Instagram Followers</option>
                    <option value="instagram_likes">Instagram Likes</option>
                    <option value="instagram_views">Instagram Views</option>
                    <option value="tiktok_followers">TikTok Followers</option>
                    <option value="tiktok_likes">TikTok Likes</option>
                    <option value="tiktok_views">TikTok Views</option>
                    <option value="youtube_subscribers">YouTube Subscribers</option>
                    <option value="youtube_views">YouTube Views</option>
                    <option value="twitter_followers">Twitter Followers</option>
                    <option value="facebook_likes">Facebook Page Likes</option>
                </select>
            </div>

            <div class="mb-4">
                <label for="quantity" class="form-label">
                    <strong>Quantity</strong>
                </label>
                <input type="number" 
                       class="form-control" 
                       id="quantity" 
                       name="quantity" 
                       placeholder="1000"
                       min="1" 
                       max="1000000"
                       required>
                <div class="form-text">Enter the number of followers, likes, or views you want</div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg">
                    🚀 Continue to Order
                </button>
            </div>
        </form>

        <div class="mt-4 text-center">
            <small class="text-muted">
                Your order will be processed after completing the verification step
            </small>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation
        document.getElementById('orderForm').addEventListener('submit', function(e) {
            const link = document.getElementById('link').value.trim();
            const service = document.getElementById('service').value;
            const quantity = document.getElementById('quantity').value;
            
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
        });
    </script>
</body>
</html>