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
require_once '../includes/audio_processor.php';

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
    
    // Check if file was uploaded
    if (!isset($_FILES['audio']) || $_FILES['audio']['error'] !== UPLOAD_ERR_OK) {
        $errorMessage = 'No file uploaded or upload error';
        if (isset($_FILES['audio']['error'])) {
            switch ($_FILES['audio']['error']) {
                case UPLOAD_ERR_INI_SIZE:
                    $errorMessage = 'File exceeds upload_max_filesize';
                    break;
                case UPLOAD_ERR_FORM_SIZE:
                    $errorMessage = 'File exceeds MAX_FILE_SIZE';
                    break;
                case UPLOAD_ERR_PARTIAL:
                    $errorMessage = 'File was only partially uploaded';
                    break;
                case UPLOAD_ERR_NO_FILE:
                    $errorMessage = 'No file was uploaded';
                    break;
                case UPLOAD_ERR_NO_TMP_DIR:
                    $errorMessage = 'Missing temporary folder';
                    break;
                case UPLOAD_ERR_CANT_WRITE:
                    $errorMessage = 'Failed to write file to disk';
                    break;
                case UPLOAD_ERR_EXTENSION:
                    $errorMessage = 'File upload stopped by extension';
                    break;
            }
        }
        
        throw new Exception($errorMessage);
    }
    
    $file = $_FILES['audio'];
    
    // Get processing options from form data
    $options = [];
    
    if (isset($_POST['volume']) && is_numeric($_POST['volume'])) {
        $options['volume'] = (float)$_POST['volume'];
    }
    
    if (isset($_POST['tempo']) && is_numeric($_POST['tempo'])) {
        $options['tempo'] = (float)$_POST['tempo'];
    }
    
    if (isset($_POST['pitch']) && is_numeric($_POST['pitch'])) {
        $options['pitch'] = (float)$_POST['pitch'];
    }
    
    if (isset($_POST['fade_in']) && is_numeric($_POST['fade_in'])) {
        $options['fade_in'] = (float)$_POST['fade_in'];
    }
    
    if (isset($_POST['fade_out']) && is_numeric($_POST['fade_out'])) {
        $options['fade_out'] = (float)$_POST['fade_out'];
    }
    
    // Apply effects if specified
    if (isset($_POST['effects']) && is_array($_POST['effects'])) {
        foreach ($_POST['effects'] as $effect) {
            switch ($effect) {
                case 'reverb':
                    $options['reverb'] = [
                        'room_size' => $_POST['reverb_room_size'] ?? 0.5,
                        'damping' => $_POST['reverb_damping'] ?? 0.5
                    ];
                    break;
                    
                case 'echo':
                    $options['echo'] = [
                        'delay' => $_POST['echo_delay'] ?? 1000,
                        'decay' => $_POST['echo_decay'] ?? 0.5
                    ];
                    break;
                    
                case 'chorus':
                    $options['chorus'] = [
                        'in_gain' => $_POST['chorus_in_gain'] ?? 0.4,
                        'out_gain' => $_POST['chorus_out_gain'] ?? 0.4
                    ];
                    break;
            }
        }
    }
    
    // Initialize audio processor
    $audioProcessor = audio_processor();
    
    // Process uploaded file
    $result = $audioProcessor->processUploadedFile($file, $options);
    
    if ($result['success']) {
        // Save to database
        $db = db();
        
        $projectId = $db->insert('projects', [
            'user_id' => $currentUser['id'],
            'title' => $_POST['title'] ?? 'Uploaded Audio',
            'description' => $_POST['description'] ?? '',
            'genre' => $_POST['genre'] ?? 'unknown',
            'mood' => $_POST['mood'] ?? 'unknown',
            'tempo' => $_POST['tempo'] ?? 'medium',
            'instruments' => $_POST['instruments'] ?? '',
            'audio_file' => $result['file_path'],
            'is_public' => isset($_POST['is_public']) ? (bool)$_POST['is_public'] : false
        ]);
        
        // Save audio file record
        $db->insert('audio_files', [
            'project_id' => $projectId,
            'original_name' => $file['name'],
            'file_path' => $result['file_path'],
            'file_size' => $result['file_size'],
            'duration' => $result['duration'],
            'format' => $result['format']
        ]);
        
        // Return success response
        echo json_encode([
            'success' => true,
            'project_id' => $projectId,
            'filename' => $result['filename'],
            'file_path' => $result['file_path'],
            'file_size' => $result['file_size'],
            'duration' => $result['duration'],
            'format' => $result['format'],
            'download_url' => '../assets/uploads/' . $result['filename'],
            'message' => 'Audio file uploaded and processed successfully'
        ]);
        
    } else {
        // Return error response
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => $result['message']
        ]);
    }
    
} catch (Exception $e) {
    error_log("Audio Upload API Error: " . $e->getMessage());
    
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'An error occurred during upload: ' . $e->getMessage()
    ]);
}
?>