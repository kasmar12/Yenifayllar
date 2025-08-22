<?php
/**
 * Create Link Handler
 * Accepts form data and creates shortened ad link via AY.Live API
 */

// Include configuration
require_once '../includes/config.php';

// Check if request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.php');
    exit;
}

// Validate and sanitize input data
$link = trim($_POST['link'] ?? '');
$service = trim($_POST['service'] ?? '');
$quantity = intval($_POST['quantity'] ?? 0);

// Validate required fields
if (empty($link) || empty($service) || $quantity <= 0) {
    die('Error: Invalid input data. Please go back and try again.');
}

// Build verification URL with parameters
$verifyUrl = VERIFY_URL . '?link=' . urlencode($link) . 
             '&service=' . urlencode($service) . 
             '&quantity=' . urlencode($quantity);

// Build AY.Live API URL
$ayliveApiUrl = 'https://ay.live/api/?' . http_build_query([
    'api' => AYLIVE_API_KEY,
    'url' => $verifyUrl
]);

// Initialize cURL session
$ch = curl_init();

// Set cURL options
curl_setopt_array($ch, [
    CURLOPT_URL => $ayliveApiUrl,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_USERAGENT => 'SMM-Order-System/1.0'
]);

// Execute cURL request
$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);

// Close cURL session
curl_close($ch);

// Check for cURL errors
if ($curlError) {
    die('Error: Failed to connect to AY.Live API: ' . htmlspecialchars($curlError));
}

// Check HTTP response code
if ($httpCode !== 200) {
    die('Error: AY.Live API returned HTTP code ' . $httpCode);
}

// Parse JSON response
$data = json_decode($response, true);

// Check if JSON parsing failed
if (json_last_error() !== JSON_ERROR_NONE) {
    die('Error: Invalid response from AY.Live API. Raw response: ' . htmlspecialchars($response));
}

// Check if API call was successful
if (isset($data['status']) && $data['status'] === 'success' && isset($data['shortenedUrl'])) {
    // Success - redirect to shortened ad link
    $shortenedUrl = $data['shortenedUrl'];
    header('Location: ' . $shortenedUrl);
    exit;
} else {
    // API error - show error message
    $errorMessage = isset($data['message']) ? $data['message'] : 'Unknown error occurred';
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error - Link Creation Failed</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .error-container {
                background: white;
                border-radius: 15px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                text-align: center;
                max-width: 500px;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h2 class="text-danger mb-4">❌ Link Creation Failed</h2>
            <p class="text-muted mb-4"><?php echo htmlspecialchars($errorMessage); ?></p>
            <div class="d-grid gap-2">
                <a href="index.php" class="btn btn-primary">← Back to Form</a>
                <button onclick="window.location.reload()" class="btn btn-outline-secondary">🔄 Try Again</button>
            </div>
        </div>
    </body>
    </html>
    <?php
}
?>