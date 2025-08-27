<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once '../includes/config.php';
require_once '../includes/auth.php';
require_once '../includes/ai_service.php';

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode([
        'success' => false,
        'message' => 'Method not allowed'
    ]);
    exit();
}

try {
    // Get JSON input
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!$input) {
        throw new Exception('Invalid JSON input');
    }
    
    // Validate required fields
    $requiredFields = ['prompt', 'genre', 'mood', 'tempo'];
    foreach ($requiredFields as $field) {
        if (empty($input[$field])) {
            throw new Exception("Missing required field: {$field}");
        }
    }
    
    // Extract parameters
    $prompt = trim($input['prompt']);
    $genre = $input['genre'];
    $mood = $input['mood'];
    $tempo = $input['tempo'];
    $instruments = $input['instruments'] ?? '';
    
    // Validate parameters
    $validGenres = ['pop', 'rock', 'jazz', 'classical', 'electronic', 'folk', 'hip-hop', 'country'];
    $validMoods = ['happy', 'sad', 'energetic', 'calm', 'romantic', 'mysterious'];
    $validTempos = ['slow', 'medium', 'fast'];
    
    if (!in_array($genre, $validGenres)) {
        throw new Exception('Invalid genre');
    }
    
    if (!in_array($mood, $validMoods)) {
        throw new Exception('Invalid mood');
    }
    
    if (!in_array($tempo, $validTempos)) {
        throw new Exception('Invalid tempo');
    }
    
    // Check authentication
    $auth = auth();
    if (!$auth->isLoggedIn()) {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'message' => 'Authentication required'
        ]);
        exit();
    }
    
    $currentUser = $auth->getCurrentUser();
    
    // Check if user has enough credits
    if (!$auth->hasCredits(1)) {
        http_response_code(402);
        echo json_encode([
            'success' => false,
            'message' => 'Insufficient credits',
            'error_code' => 'INSUFFICIENT_CREDITS',
            'current_credits' => $currentUser['credits']
        ]);
        exit();
    }
    
    // Initialize AI service
    $aiService = ai_service();
    
    // Generate music
    $result = $aiService->generateMusic(
        $prompt,
        $genre,
        $mood,
        $tempo,
        $instruments,
        $currentUser['id']
    );
    
    if ($result['success']) {
        // Return success response
        echo json_encode([
            'success' => true,
            'generation_id' => $result['generation_id'],
            'audio_file' => basename($result['audio_file']),
            'duration' => $result['duration'],
            'file_size' => $result['file_size'],
            'download_url' => '../assets/uploads/' . basename($result['audio_file']),
            'message' => 'Music generated successfully'
        ]);
    } else {
        // Return error response
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => $result['message'],
            'error_code' => $result['error_code'] ?? 'GENERATION_FAILED'
        ]);
    }
    
} catch (Exception $e) {
    error_log("AI Generation API Error: " . $e->getMessage());
    
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'An error occurred during generation',
        'error_code' => 'INTERNAL_ERROR'
    ]);
}
?>