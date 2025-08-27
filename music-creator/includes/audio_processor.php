<?php
require_once 'config.php';

class AudioProcessor {
    private $ffmpegPath;
    private $uploadDir;
    private $tempDir;
    
    public function __construct() {
        $this->ffmpegPath = $this->getFFmpegPath();
        $this->uploadDir = UPLOAD_DIR;
        $this->tempDir = sys_get_temp_dir() . '/music_creator/';
        
        // Create temp directory if it doesn't exist
        if (!is_dir($this->tempDir)) {
            mkdir($this->tempDir, 0755, true);
        }
    }
    
    /**
     * Get FFmpeg path
     */
    private function getFFmpegPath() {
        // Try to find FFmpeg in common locations
        $possiblePaths = [
            '/usr/bin/ffmpeg',
            '/usr/local/bin/ffmpeg',
            '/opt/homebrew/bin/ffmpeg',
            'ffmpeg' // If in PATH
        ];
        
        foreach ($possiblePaths as $path) {
            if (is_executable($path) || shell_exec("which {$path}")) {
                return $path;
            }
        }
        
        return null;
    }
    
    /**
     * Check if FFmpeg is available
     */
    public function isFFmpegAvailable() {
        return $this->ffmpegPath !== null;
    }
    
    /**
     * Process uploaded audio file
     */
    public function processUploadedFile($file, $options = []) {
        try {
            // Validate file
            if (!$this->validateAudioFile($file)) {
                return [
                    'success' => false,
                    'message' => 'Invalid audio file'
                ];
            }
            
            // Generate unique filename
            $filename = $this->generateUniqueFilename($file['name']);
            $filePath = $this->uploadDir . $filename;
            
            // Move uploaded file
            if (!move_uploaded_file($file['tmp_name'], $filePath)) {
                return [
                    'success' => false,
                    'message' => 'Failed to save uploaded file'
                ];
            }
            
            // Process audio if options provided
            if (!empty($options)) {
                $processedPath = $this->processAudio($filePath, $options);
                if ($processedPath) {
                    // Replace original with processed
                    unlink($filePath);
                    $filePath = $processedPath;
                    $filename = basename($processedPath);
                }
            }
            
            // Get audio metadata
            $metadata = $this->getAudioMetadata($filePath);
            
            return [
                'success' => true,
                'filename' => $filename,
                'file_path' => $filePath,
                'file_size' => filesize($filePath),
                'duration' => $metadata['duration'] ?? 0,
                'format' => $metadata['format'] ?? 'unknown',
                'sample_rate' => $metadata['sample_rate'] ?? 0,
                'bitrate' => $metadata['bitrate'] ?? 0
            ];
            
        } catch (Exception $e) {
            error_log("Audio processing error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Audio processing failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Process audio with various effects and modifications
     */
    public function processAudio($inputPath, $options) {
        if (!$this->isFFmpegAvailable()) {
            return false;
        }
        
        $outputPath = $this->tempDir . 'processed_' . uniqid() . '.mp3';
        $filters = [];
        
        // Build FFmpeg filters based on options
        if (isset($options['volume'])) {
            $filters[] = "volume={$options['volume']}";
        }
        
        if (isset($options['tempo'])) {
            $filters[] = "atempo={$options['tempo']}";
        }
        
        if (isset($options['pitch'])) {
            $filters[] = "asetrate=44100*{$options['pitch']}";
        }
        
        if (isset($options['reverb'])) {
            $filters[] = $this->buildReverbFilter($options['reverb']);
        }
        
        if (isset($options['echo'])) {
            $filters[] = $this->buildEchoFilter($options['echo']);
        }
        
        if (isset($options['fade_in'])) {
            $filters[] = "afade=t=in:st=0:d={$options['fade_in']}";
        }
        
        if (isset($options['fade_out'])) {
            $filters[] = "afade=t=out:st={$options['fade_out']}:d={$options['fade_out']}";
        }
        
        // Build FFmpeg command
        $filterString = !empty($filters) ? '-af "' . implode(',', $filters) . '"' : '';
        
        $command = sprintf(
            '%s -i "%s" %s -y "%s"',
            $this->ffmpegPath,
            $inputPath,
            $filterString,
            $outputPath
        );
        
        // Execute command
        $output = shell_exec($command . ' 2>&1');
        
        if (file_exists($outputPath)) {
            return $outputPath;
        }
        
        return false;
    }
    
    /**
     * Convert audio format
     */
    public function convertFormat($inputPath, $outputFormat, $quality = 'high') {
        if (!$this->isFFmpegAvailable()) {
            return false;
        }
        
        $outputPath = $this->tempDir . 'converted_' . uniqid() . '.' . $outputFormat;
        
        $qualitySettings = [
            'low' => '-b:a 128k',
            'medium' => '-b:a 256k',
            'high' => '-b:a 320k'
        ];
        
        $qualityParam = $qualitySettings[$quality] ?? $qualitySettings['high'];
        
        $command = sprintf(
            '%s -i "%s" %s -y "%s"',
            $this->ffmpegPath,
            $inputPath,
            $qualityParam,
            $outputPath
        );
        
        $output = shell_exec($command . ' 2>&1');
        
        if (file_exists($outputPath)) {
            return $outputPath;
        }
        
        return false;
    }
    
    /**
     * Extract audio segment
     */
    public function extractSegment($inputPath, $startTime, $duration) {
        if (!$this->isFFmpegAvailable()) {
            return false;
        }
        
        $outputPath = $this->tempDir . 'segment_' . uniqid() . '.mp3';
        
        $command = sprintf(
            '%s -i "%s" -ss %s -t %s -c copy -y "%s"',
            $this->ffmpegPath,
            $inputPath,
            $startTime,
            $duration,
            $outputPath
        );
        
        $output = shell_exec($command . ' 2>&1');
        
        if (file_exists($outputPath)) {
            return $outputPath;
        }
        
        return false;
    }
    
    /**
     * Merge multiple audio files
     */
    public function mergeAudioFiles($filePaths, $outputFormat = 'mp3') {
        if (!$this->isFFmpegAvailable()) {
            return false;
        }
        
        $outputPath = $this->tempDir . 'merged_' . uniqid() . '.' . $outputFormat;
        
        // Create file list for FFmpeg
        $fileList = $this->tempDir . 'filelist_' . uniqid() . '.txt';
        $content = '';
        foreach ($filePaths as $filePath) {
            $content .= "file '" . realpath($filePath) . "'\n";
        }
        file_put_contents($fileList, $content);
        
        $command = sprintf(
            '%s -f concat -safe 0 -i "%s" -c copy -y "%s"',
            $this->ffmpegPath,
            $fileList,
            $outputPath
        );
        
        $output = shell_exec($command . ' 2>&1');
        
        // Clean up file list
        unlink($fileList);
        
        if (file_exists($outputPath)) {
            return $outputPath;
        }
        
        return false;
    }
    
    /**
     * Apply audio effects
     */
    public function applyEffect($inputPath, $effect, $parameters = []) {
        if (!$this->isFFmpegAvailable()) {
            return false;
        }
        
        $outputPath = $this->tempDir . 'effect_' . uniqid() . '.mp3';
        $filter = '';
        
        switch ($effect) {
            case 'reverb':
                $filter = $this->buildReverbFilter($parameters);
                break;
                
            case 'echo':
                $filter = $this->buildEchoFilter($parameters);
                break;
                
            case 'chorus':
                $filter = $this->buildChorusFilter($parameters);
                break;
                
            case 'distortion':
                $filter = $this->buildDistortionFilter($parameters);
                break;
                
            case 'compression':
                $filter = $this->buildCompressionFilter($parameters);
                break;
                
            default:
                return false;
        }
        
        $command = sprintf(
            '%s -i "%s" -af "%s" -y "%s"',
            $this->ffmpegPath,
            $inputPath,
            $filter,
            $outputPath
        );
        
        $output = shell_exec($command . ' 2>&1');
        
        if (file_exists($outputPath)) {
            return $outputPath;
        }
        
        return false;
    }
    
    /**
     * Build reverb filter
     */
    private function buildReverbFilter($params) {
        $roomSize = $params['room_size'] ?? 0.5;
        $damping = $params['damping'] ?? 0.5;
        $wetLevel = $params['wet_level'] ?? 0.33;
        $dryLevel = $params['dry_level'] ?? 0.4;
        
        return "aecho=0.8:0.5:60:0.5";
    }
    
    /**
     * Build echo filter
     */
    private function buildEchoFilter($params) {
        $delay = $params['delay'] ?? 1000;
        $decay = $params['decay'] ?? 0.5;
        
        return "aecho=0.8:0.5:{$delay}:{$decay}";
    }
    
    /**
     * Build chorus filter
     */
    private function buildChorusFilter($params) {
        $inGain = $params['in_gain'] ?? 0.4;
        $outGain = $params['out_gain'] ?? 0.4;
        $delays = $params['delays'] ?? '40,60,80';
        $decays = $params['decays'] ?? '0.4,0.6,0.8';
        $speeds = $params['speeds'] ?? '0.25,0.4,0.5';
        $depths = $params['depths'] ?? '2,3,4';
        
        return "chorus={$inGain}:{$outGain}:{$delays}:{$decays}:{$speeds}:{$depths}";
    }
    
    /**
     * Build distortion filter
     */
    private function buildDistortionFilter($params) {
        $amount = $params['amount'] ?? 0.5;
        
        return "acompressor=threshold=0.1:ratio=9:attack=200:release=1000";
    }
    
    /**
     * Build compression filter
     */
    private function buildCompressionFilter($params) {
        $threshold = $params['threshold'] ?? -20;
        $ratio = $params['ratio'] ?? 4;
        $attack = $params['attack'] ?? 0.005;
        $release = $params['release'] ?? 0.1;
        
        return "acompressor=threshold={$threshold}:ratio={$ratio}:attack={$attack}:release={$release}";
    }
    
    /**
     * Get audio metadata
     */
    public function getAudioMetadata($filePath) {
        if (!$this->isFFmpegAvailable()) {
            return $this->getBasicMetadata($filePath);
        }
        
        $command = sprintf(
            '%s -i "%s" -f null - 2>&1',
            $this->ffmpegPath,
            $filePath
        );
        
        $output = shell_exec($command);
        
        $metadata = [];
        
        // Extract duration
        if (preg_match('/Duration: (\d{2}):(\d{2}):(\d{2}\.\d{2})/', $output, $matches)) {
            $hours = (int)$matches[1];
            $minutes = (int)$matches[2];
            $seconds = (float)$matches[3];
            $metadata['duration'] = $hours * 3600 + $minutes * 60 + $seconds;
        }
        
        // Extract format
        if (preg_match('/Input #0, ([^,]+)/', $output, $matches)) {
            $metadata['format'] = trim($matches[1]);
        }
        
        // Extract sample rate
        if (preg_match('/(\d+) Hz/', $output, $matches)) {
            $metadata['sample_rate'] = (int)$matches[1];
        }
        
        // Extract bitrate
        if (preg_match('/(\d+) kb\/s/', $output, $matches)) {
            $metadata['bitrate'] = (int)$matches[1];
        }
        
        return $metadata;
    }
    
    /**
     * Get basic metadata without FFmpeg
     */
    private function getBasicMetadata($filePath) {
        $metadata = [];
        $metadata['file_size'] = filesize($filePath);
        $metadata['format'] = pathinfo($filePath, PATHINFO_EXTENSION);
        
        // Try to get duration from file headers
        $metadata['duration'] = $this->estimateDuration($filePath);
        
        return $metadata;
    }
    
    /**
     * Estimate duration based on file size and format
     */
    private function estimateDuration($filePath) {
        $fileSize = filesize($filePath);
        $format = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
        
        // Rough estimates based on format and file size
        $bitrates = [
            'mp3' => 128, // kbps
            'wav' => 1411, // kbps
            'flac' => 1000, // kbps
            'ogg' => 128, // kbps
            'm4a' => 256 // kbps
        ];
        
        $bitrate = $bitrates[$format] ?? 128;
        $duration = ($fileSize * 8) / ($bitrate * 1000); // seconds
        
        return round($duration, 2);
    }
    
    /**
     * Validate uploaded audio file
     */
    private function validateAudioFile($file) {
        // Check file size
        if ($file['size'] > MAX_FILE_SIZE) {
            return false;
        }
        
        // Check file type
        $allowedTypes = ALLOWED_AUDIO_TYPES;
        $extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
        
        if (!in_array($extension, $allowedTypes)) {
            return false;
        }
        
        // Check MIME type
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $mimeType = finfo_file($finfo, $file['tmp_name']);
        finfo_close($finfo);
        
        $allowedMimes = [
            'audio/mpeg',
            'audio/wav',
            'audio/flac',
            'audio/ogg',
            'audio/mp4',
            'audio/x-m4a'
        ];
        
        if (!in_array($mimeType, $allowedMimes)) {
            return false;
        }
        
        return true;
    }
    
    /**
     * Generate unique filename
     */
    private function generateUniqueFilename($originalName) {
        $extension = pathinfo($originalName, PATHINFO_EXTENSION);
        $basename = pathinfo($originalName, PATHINFO_FILENAME);
        $basename = preg_replace('/[^a-zA-Z0-9_-]/', '_', $basename);
        
        return $basename . '_' . uniqid() . '.' . $extension;
    }
    
    /**
     * Clean up temporary files
     */
    public function cleanupTempFiles() {
        $files = glob($this->tempDir . '*');
        foreach ($files as $file) {
            if (is_file($file)) {
                unlink($file);
            }
        }
    }
    
    /**
     * Get supported formats
     */
    public function getSupportedFormats() {
        return [
            'input' => ['mp3', 'wav', 'flac', 'ogg', 'm4a'],
            'output' => ['mp3', 'wav', 'ogg', 'm4a']
        ];
    }
    
    /**
     * Get available effects
     */
    public function getAvailableEffects() {
        return [
            'reverb' => 'Adds room reverb effect',
            'echo' => 'Adds echo/delay effect',
            'chorus' => 'Adds chorus effect',
            'distortion' => 'Adds distortion effect',
            'compression' => 'Adds dynamic compression'
        ];
    }
}

// Helper function to get audio processor instance
function audio_processor() {
    return new AudioProcessor();
}
?>