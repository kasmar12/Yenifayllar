<?php
require_once 'config.php';
require_once 'database.php';

class AIService {
    private $db;
    private $apiKey;
    private $endpoint;
    
    public function __construct() {
        $this->db = db();
        $this->apiKey = AI_API_KEY;
        $this->endpoint = AI_ENDPOINT;
    }
    
    /**
     * Generate music using AI service
     */
    public function generateMusic($prompt, $genre, $mood, $tempo, $instruments, $userId) {
        try {
            // Check if user has enough credits
            if (!$this->checkUserCredits($userId)) {
                return [
                    'success' => false,
                    'message' => 'Insufficient credits. Please upgrade your plan.',
                    'error_code' => 'INSUFFICIENT_CREDITS'
                ];
            }
            
            // Create AI generation record
            $generationId = $this->db->insert('ai_generations', [
                'user_id' => $userId,
                'prompt' => $prompt,
                'genre' => $genre,
                'mood' => $mood,
                'tempo' => $tempo,
                'instruments' => $instruments,
                'status' => 'pending'
            ]);
            
            // Start generation process
            $result = $this->processAIGeneration($prompt, $genre, $mood, $tempo, $instruments);
            
            if ($result['success']) {
                // Update generation record
                $this->db->update('ai_generations', [
                    'status' => 'completed',
                    'generated_file' => $result['audio_file'],
                    'completed_at' => date('Y-m-d H:i:s')
                ], 'id = ?', [$generationId]);
                
                // Deduct credits
                $this->deductUserCredits($userId);
                
                return [
                    'success' => true,
                    'generation_id' => $generationId,
                    'audio_file' => $result['audio_file'],
                    'duration' => $result['duration'],
                    'file_size' => $result['file_size']
                ];
            } else {
                // Update generation record with error
                $this->db->update('ai_generations', [
                    'status' => 'failed'
                ], 'id = ?', [$generationId]);
                
                return [
                    'success' => false,
                    'message' => $result['message'],
                    'error_code' => $result['error_code']
                ];
            }
            
        } catch (Exception $e) {
            error_log("AI Generation Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'An error occurred during generation',
                'error_code' => 'GENERATION_ERROR'
            ];
        }
    }
    
    /**
     * Process AI generation with different services
     */
    private function processAIGeneration($prompt, $genre, $mood, $tempo, $instruments) {
        // Try different AI services in order of preference
        $services = [
            'openai' => [$this, 'generateWithOpenAI'],
            'suno' => [$this, 'generateWithSuno'],
            'mubert' => [$this, 'generateWithMubert'],
            'fallback' => [$this, 'generateFallback']
        ];
        
        foreach ($services as $serviceName => $serviceMethod) {
            try {
                $result = $serviceMethod($prompt, $genre, $mood, $tempo, $instruments);
                if ($result['success']) {
                    return $result;
                }
            } catch (Exception $e) {
                error_log("{$serviceName} service error: " . $e->getMessage());
                continue;
            }
        }
        
        return [
            'success' => false,
            'message' => 'All AI services are currently unavailable',
            'error_code' => 'SERVICE_UNAVAILABLE'
        ];
    }
    
    /**
     * Generate music using OpenAI API
     */
    private function generateWithOpenAI($prompt, $genre, $mood, $tempo, $instruments) {
        if (empty($this->apiKey) || $this->apiKey === 'your_ai_api_key_here') {
            throw new Exception('OpenAI API key not configured');
        }
        
        $enhancedPrompt = $this->buildEnhancedPrompt($prompt, $genre, $mood, $tempo, $instruments);
        
        $data = [
            'model' => 'tts-1', // Text-to-speech model
            'input' => $enhancedPrompt,
            'voice' => 'alloy',
            'response_format' => 'mp3',
            'speed' => $this->getTempoSpeed($tempo)
        ];
        
        $response = $this->makeAPIRequest(
            'https://api.openai.com/v1/audio/speech',
            $data,
            ['Authorization: Bearer ' . $this->apiKey]
        );
        
        if ($response['success']) {
            $audioFile = $this->saveAudioFile($response['data'], 'openai_' . uniqid() . '.mp3');
            return [
                'success' => true,
                'audio_file' => $audioFile,
                'duration' => $this->estimateDuration($enhancedPrompt),
                'file_size' => filesize($audioFile)
            ];
        }
        
        return [
            'success' => false,
            'message' => 'OpenAI generation failed: ' . $response['message'],
            'error_code' => 'OPENAI_ERROR'
        ];
    }
    
    /**
     * Generate music using Suno AI API
     */
    private function generateWithSuno($prompt, $genre, $mood, $tempo, $instruments) {
        // Suno AI API endpoint (you'll need to get actual endpoint)
        $sunoEndpoint = 'https://api.suno.ai/v1/generate';
        
        $data = [
            'prompt' => $this->buildEnhancedPrompt($prompt, $genre, $mood, $tempo, $instruments),
            'duration' => 30, // 30 seconds
            'format' => 'mp3',
            'model' => 'suno-v1'
        ];
        
        $response = $this->makeAPIRequest($sunoEndpoint, $data);
        
        if ($response['success']) {
            $audioFile = $this->saveAudioFile($response['data'], 'suno_' . uniqid() . '.mp3');
            return [
                'success' => true,
                'audio_file' => $audioFile,
                'duration' => 30,
                'file_size' => filesize($audioFile)
            ];
        }
        
        return [
            'success' => false,
            'message' => 'Suno AI generation failed: ' . $response['message'],
            'error_code' => 'SUNO_ERROR'
        ];
    }
    
    /**
     * Generate music using Mubert API
     */
    private function generateWithMubert($prompt, $genre, $mood, $tempo, $instruments) {
        // Mubert API endpoint
        $mubertEndpoint = 'https://api.mubert.com/v2/GenerateTrack';
        
        $data = [
            'prompt' => $this->buildEnhancedPrompt($prompt, $genre, $mood, $tempo, $instruments),
            'duration' => 30,
            'format' => 'mp3',
            'mood' => $mood,
            'genre' => $genre
        ];
        
        $response = $this->makeAPIRequest($mubertEndpoint, $data);
        
        if ($response['success']) {
            $audioFile = $this->saveAudioFile($response['data'], 'mubert_' . uniqid() . '.mp3');
            return [
                'success' => true,
                'audio_file' => $audioFile,
                'duration' => 30,
                'file_size' => filesize($audioFile)
            ];
        }
        
        return [
            'success' => false,
            'message' => 'Mubert generation failed: ' . $response['message'],
            'error_code' => 'MUBERT_ERROR'
        ];
    }
    
    /**
     * Fallback generation (synthetic audio)
     */
    private function generateFallback($prompt, $genre, $mood, $tempo, $instruments) {
        // Generate a simple synthetic audio as fallback
        $audioFile = $this->generateSyntheticAudio($genre, $mood, $tempo);
        
        return [
            'success' => true,
            'audio_file' => $audioFile,
            'duration' => 15,
            'file_size' => filesize($audioFile)
        ];
    }
    
    /**
     * Build enhanced prompt for AI
     */
    private function buildEnhancedPrompt($prompt, $genre, $mood, $tempo, $instruments) {
        $enhanced = "Create a {$mood} {$genre} music piece with {$tempo} tempo";
        
        if (!empty($instruments)) {
            $enhanced .= " featuring " . $instruments;
        }
        
        $enhanced .= ". Style: {$prompt}. ";
        $enhanced .= "Make it professional quality with clear structure and engaging melody.";
        
        return $enhanced;
    }
    
    /**
     * Make API request to external service
     */
    private function makeAPIRequest($url, $data, $headers = []) {
        $defaultHeaders = [
            'Content-Type: application/json',
            'User-Agent: MusicCreator/1.0'
        ];
        
        $headers = array_merge($defaultHeaders, $headers);
        
        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 60,
            CURLOPT_SSL_VERIFYPEER => true,
            CURLOPT_FOLLOWLOCATION => true
        ]);
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);
        
        if ($error) {
            return [
                'success' => false,
                'message' => 'cURL error: ' . $error,
                'error_code' => 'CURL_ERROR'
            ];
        }
        
        if ($httpCode !== 200) {
            return [
                'success' => false,
                'message' => "HTTP error: {$httpCode}",
                'error_code' => 'HTTP_ERROR'
            ];
        }
        
        return [
            'success' => true,
            'data' => $response,
            'http_code' => $httpCode
        ];
    }
    
    /**
     * Save audio file from API response
     */
    private function saveAudioFile($audioData, $filename) {
        $uploadDir = UPLOAD_DIR;
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }
        
        $filePath = $uploadDir . $filename;
        file_put_contents($filePath, $audioData);
        
        return $filePath;
    }
    
    /**
     * Generate synthetic audio as fallback
     */
    private function generateSyntheticAudio($genre, $mood, $tempo) {
        // This is a simplified synthetic audio generation
        // In production, you might use a more sophisticated approach
        
        $sampleRate = 44100;
        $duration = 15; // 15 seconds
        $samples = $sampleRate * $duration;
        
        $audioData = '';
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $sampleRate;
            $frequency = $this->getGenreFrequency($genre);
            $amplitude = $this->getMoodAmplitude($mood);
            
            $sample = $amplitude * sin(2 * M_PI * $frequency * $time);
            $sample = max(-1, min(1, $sample)); // Clamp to [-1, 1]
            
            // Convert to 16-bit PCM
            $pcm = (int)($sample * 32767);
            $audioData .= pack('s', $pcm);
        }
        
        $filename = 'synthetic_' . uniqid() . '.wav';
        $filePath = UPLOAD_DIR . $filename;
        
        // Create WAV header
        $wavHeader = $this->createWAVHeader($sampleRate, 1, 16, $samples);
        file_put_contents($filePath, $wavHeader . $audioData);
        
        return $filePath;
    }
    
    /**
     * Create WAV file header
     */
    private function createWAVHeader($sampleRate, $channels, $bitsPerSample, $sampleCount) {
        $byteRate = $sampleRate * $channels * $bitsPerSample / 8;
        $blockAlign = $channels * $bitsPerSample / 8;
        $dataSize = $sampleCount * $channels * $bitsPerSample / 8;
        $fileSize = 36 + $dataSize;
        
        $header = 'RIFF';
        $header .= pack('V', $fileSize);
        $header .= 'WAVE';
        $header .= 'fmt ';
        $header .= pack('V', 16);
        $header .= pack('v', 1);
        $header .= pack('v', $channels);
        $header .= pack('V', $sampleRate);
        $header .= pack('V', $byteRate);
        $header .= pack('v', $blockAlign);
        $header .= pack('v', $bitsPerSample);
        $header .= 'data';
        $header .= pack('V', $dataSize);
        
        return $header;
    }
    
    /**
     * Get frequency based on genre
     */
    private function getGenreFrequency($genre) {
        $frequencies = [
            'pop' => 440,      // A4
            'rock' => 330,     // E4
            'jazz' => 523,     // C5
            'classical' => 261, // C4
            'electronic' => 880, // A5
            'folk' => 392,     // G4
            'hip-hop' => 220,  // A3
            'country' => 349   // F4
        ];
        
        return $frequencies[$genre] ?? 440;
    }
    
    /**
     * Get amplitude based on mood
     */
    private function getMoodAmplitude($mood) {
        $amplitudes = [
            'happy' => 0.8,
            'sad' => 0.4,
            'energetic' => 1.0,
            'calm' => 0.3,
            'romantic' => 0.6,
            'mysterious' => 0.5
        ];
        
        return $amplitudes[$mood] ?? 0.7;
    }
    
    /**
     * Get tempo speed multiplier
     */
    private function getTempoSpeed($tempo) {
        $speeds = [
            'slow' => 0.7,
            'medium' => 1.0,
            'fast' => 1.3
        ];
        
        return $speeds[$tempo] ?? 1.0;
    }
    
    /**
     * Estimate audio duration based on prompt
     */
    private function estimateDuration($prompt) {
        $wordCount = str_word_count($prompt);
        $baseDuration = 15; // Base 15 seconds
        $wordMultiplier = 0.5; // 0.5 seconds per word
        
        return min(180, $baseDuration + ($wordCount * $wordMultiplier)); // Max 3 minutes
    }
    
    /**
     * Check if user has enough credits
     */
    private function checkUserCredits($userId) {
        $user = $this->db->fetch(
            "SELECT credits FROM users WHERE id = ?",
            [$userId]
        );
        
        return $user && $user['credits'] > 0;
    }
    
    /**
     * Deduct credits from user
     */
    private function deductUserCredits($userId) {
        $this->db->update('users', 
            ['credits' => 'credits - 1'], 
            'id = ?', 
            [$userId]
        );
    }
    
    /**
     * Get generation status
     */
    public function getGenerationStatus($generationId) {
        return $this->db->fetch(
            "SELECT * FROM ai_generations WHERE id = ?",
            [$generationId]
        );
    }
    
    /**
     * Get user's generation history
     */
    public function getUserGenerations($userId, $limit = 10) {
        return $this->db->fetchAll(
            "SELECT * FROM ai_generations WHERE user_id = ? ORDER BY created_at DESC LIMIT ?",
            [$userId, $limit]
        );
    }
}

// Helper function to get AI service instance
function ai_service() {
    return new AIService();
}
?>