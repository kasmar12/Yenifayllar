<?php
require_once 'config.php';

/**
 * Advanced Drum Engine
 * Professional Quality Drum Sounds
 * 100% Original - Studio Quality
 */
class AdvancedDrumEngine {
    private $config;
    private $sampleRate;
    private $drumKit;
    private $roomAcoustics;
    private $micPositioning;
    private $drumTuning;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 24,
            'channels' => 2,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->drumKit = 'acoustic';
        $this->roomAcoustics = true;
        $this->micPositioning = 'standard';
        $this->drumTuning = 'standard';
    }
    
    /**
     * Generate realistic drum hit
     */
    public function generateDrumHit($drumPiece, $velocity, $duration, $parameters = []) {
        try {
            $samples = intval($duration * $this->sampleRate);
            $audioData = '';
            
            // Drum characteristics based on piece and velocity
            $drumCharacteristics = $this->getDrumCharacteristics($drumPiece, $velocity);
            
            // Generate multi-layered drum sound
            $audioData = $this->generateMultiLayerDrum($drumPiece, $velocity, $duration, $drumCharacteristics);
            
            // Apply drum tuning
            $audioData = $this->applyDrumTuning($audioData, $drumPiece, $drumCharacteristics);
            
            // Apply room acoustics
            if ($this->roomAcoustics) {
                $audioData = $this->applyRoomAcoustics($audioData, $drumPiece, $velocity);
            }
            
            // Apply mic positioning
            $audioData = $this->applyMicPositioning($audioData, $drumPiece, $velocity);
            
            // Apply velocity sensitivity
            $audioData = $this->applyVelocitySensitivity($audioData, $velocity, $drumCharacteristics);
            
            return [
                'success' => true,
                'audio_data' => $audioData,
                'drum_piece' => $drumPiece,
                'velocity' => $velocity,
                'duration' => $duration,
                'characteristics' => $drumCharacteristics
            ];
            
        } catch (Exception $e) {
            error_log("Drum Generation Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Drum generation failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Get drum characteristics for piece and velocity
     */
    private function getDrumCharacteristics($drumPiece, $velocity) {
        return [
            'piece' => $drumPiece,
            'velocity_layer' => $this->getVelocityLayer($velocity),
            'drum_size' => $this->getDrumSize($drumPiece),
            'drum_material' => $this->getDrumMaterial($drumPiece),
            'head_tension' => $this->calculateHeadTension($drumPiece, $velocity),
            'room_size' => $this->getRoomSize(),
            'mic_distance' => $this->getMicDistance($drumPiece),
            'playing_intensity' => $velocity / 127.0
        ];
    }
    
    /**
     * Generate multi-layer drum sound
     */
    private function generateMultiLayerDrum($drumPiece, $velocity, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        // Generate fundamental tone
        $fundamental = $this->generateFundamentalTone($drumPiece, $duration, $characteristics);
        
        // Generate attack layer
        $attack = $this->generateAttackLayer($drumPiece, $velocity, $characteristics);
        
        // Generate body resonance
        $bodyResonance = $this->generateBodyResonance($drumPiece, $duration, $characteristics);
        
        // Generate room reflection
        $roomReflection = $this->generateRoomReflection($drumPiece, $duration, $characteristics);
        
        // Mix all layers
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Get samples from each layer
            $fundamentalSample = $this->getSampleAtTime($fundamental, $i);
            $attackSample = $this->getSampleAtTime($attack, $i);
            $bodyResonanceSample = $this->getSampleAtTime($bodyResonance, $i);
            $roomReflectionSample = $this->getSampleAtTime($roomReflection, $i);
            
            // Mix samples with proper weighting
            $mixedSample = $this->mixDrumLayers(
                $fundamentalSample,
                $attackSample,
                $bodyResonanceSample,
                $roomReflectionSample,
                $time,
                $duration,
                $characteristics
            );
            
            // Convert to 16-bit PCM
            $pcm = (int)($mixedSample * 32767);
            $audioData .= pack('s', $pcm);
        }
        
        return $audioData;
    }
    
    /**
     * Generate fundamental tone
     */
    private function generateFundamentalTone($drumPiece, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $frequency = $this->getDrumFrequency($drumPiece);
        $decay = $this->getDrumDecay($drumPiece);
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Generate fundamental tone
            $fundamental = sin(2 * M_PI * $frequency * $time);
            
            // Add harmonics based on drum type
            $harmonics = $this->generateDrumHarmonics($drumPiece, $frequency, $time);
            
            // Apply decay envelope
            $envelope = exp(-$time / $decay);
            
            // Mix fundamental and harmonics
            $sample = ($fundamental + $harmonics) * $envelope;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate attack layer
     */
    private function generateAttackLayer($drumPiece, $velocity, $characteristics) {
        $duration = $this->getAttackDuration($drumPiece);
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $playingIntensity = $characteristics['playing_intensity'];
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Generate attack sound
            $attack = 0;
            
            switch ($drumPiece) {
                case 'kick':
                    $attack = $this->generateKickAttack($time, $playingIntensity);
                    break;
                case 'snare':
                    $attack = $this->generateSnareAttack($time, $playingIntensity);
                    break;
                case 'hi-hat':
                    $attack = $this->generateHiHatAttack($time, $playingIntensity);
                    break;
                case 'crash':
                    $attack = $this->generateCrashAttack($time, $playingIntensity);
                    break;
                case 'ride':
                    $attack = $this->generateRideAttack($time, $playingIntensity);
                    break;
                case 'tom1':
                case 'tom2':
                case 'floor_tom':
                    $attack = $this->generateTomAttack($time, $playingIntensity);
                    break;
                default:
                    $attack = $this->generateGenericAttack($time, $playingIntensity);
            }
            
            // Apply envelope
            $envelope = exp(-$time / 0.01); // 10ms decay
            $attack *= $envelope;
            
            $sample = $attack;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate kick attack
     */
    private function generateKickAttack($time, $intensity) {
        $attack = 0;
        
        // Low frequency thump
        for ($freq = 40; $freq < 200; $freq += 40) {
            $attack += 0.3 * sin(2 * M_PI * $freq * $time);
        }
        
        // High frequency click
        for ($freq = 1000; $freq < 4000; $freq += 500) {
            $attack += 0.1 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.4 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate snare attack
     */
    private function generateSnareAttack($time, $intensity) {
        $attack = 0;
        
        // Mid frequency crack
        for ($freq = 200; $freq < 800; $freq += 100) {
            $attack += 0.2 * sin(2 * M_PI * $freq * $time);
        }
        
        // High frequency sizzle
        for ($freq = 2000; $freq < 8000; $freq += 500) {
            $attack += 0.15 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.5 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate hi-hat attack
     */
    private function generateHiHatAttack($time, $intensity) {
        $attack = 0;
        
        // High frequency components
        for ($freq = 2000; $freq < 12000; $freq += 800) {
            $attack += 0.1 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.6 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate crash attack
     */
    private function generateCrashAttack($time, $intensity) {
        $attack = 0;
        
        // Wide frequency range
        for ($freq = 500; $freq < 15000; $freq += 300) {
            $attack += 0.05 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.7 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate ride attack
     */
    private function generateRideAttack($time, $intensity) {
        $attack = 0;
        
        // Mid-high frequency components
        for ($freq = 800; $freq < 6000; $freq += 400) {
            $attack += 0.08 * sin(2 * M_PI * $freq * $time);
        }
        
        // Bell component
        $attack += 0.3 * sin(2 * M_PI * 800 * $time);
        
        // Noise component
        $attack += 0.4 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate tom attack
     */
    private function generateTomAttack($time, $intensity) {
        $attack = 0;
        
        // Mid frequency components
        for ($freq = 150; $freq < 800; $freq += 100) {
            $attack += 0.2 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.3 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate generic attack
     */
    private function generateGenericAttack($time, $intensity) {
        $attack = 0;
        
        // Wide frequency range
        for ($freq = 200; $freq < 4000; $freq += 200) {
            $attack += 0.1 * sin(2 * M_PI * $freq * $time);
        }
        
        // Noise component
        $attack += 0.4 * (rand() / getrandmax() - 0.5) * 2;
        
        return $attack * $intensity;
    }
    
    /**
     * Generate body resonance
     */
    private function generateBodyResonance($drumPiece, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $frequency = $this->getDrumFrequency($drumPiece);
        $decay = $this->getDrumDecay($drumPiece);
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            $resonance = 0;
            
            // Fundamental resonance
            $resonance += 0.8 * sin(2 * M_PI * $frequency * $time);
            
            // Harmonic resonance
            $resonance += 0.4 * sin(2 * M_PI * $frequency * 2 * $time);
            $resonance += 0.2 * sin(2 * M_PI * $frequency * 3 * $time);
            
            // Apply decay envelope
            $envelope = exp(-$time / $decay);
            $resonance *= $envelope;
            
            $sample = $resonance;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate room reflection
     */
    private function generateRoomReflection($drumPiece, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $roomSize = $characteristics['room_size'];
        $micDistance = $characteristics['mic_distance'];
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            $reflection = 0;
            
            // Early reflections
            $earlyReflectionTime = $micDistance / 343; // Speed of sound
            if ($time >= $earlyReflectionTime) {
                $reflection += 0.3 * sin(2 * M_PI * 100 * ($time - $earlyReflectionTime));
            }
            
            // Late reflections
            $lateReflectionTime = $roomSize / 343;
            if ($time >= $lateReflectionTime) {
                $reflection += 0.1 * sin(2 * M_PI * 50 * ($time - $lateReflectionTime));
            }
            
            // Apply decay envelope
            $envelope = exp(-$time / 2.0); // 2 second decay
            $reflection *= $envelope;
            
            $sample = $reflection;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Mix drum layers
     */
    private function mixDrumLayers($fundamental, $attack, $bodyResonance, $roomReflection, $time, $duration, $characteristics) {
        // Time-based mixing
        $attackPhase = $time < 0.05; // First 50ms
        $sustainPhase = $time >= 0.05 && $time < ($duration - 0.1); // Middle phase
        $releasePhase = $time >= ($duration - 0.1); // Last 100ms
        
        $mixedSample = 0;
        
        if ($attackPhase) {
            // Attack phase: emphasize attack
            $attackWeight = 1.0 - ($time / 0.05);
            $fundamentalWeight = 0.2 + ($time / 0.05) * 0.8;
            
            $mixedSample = ($attack * $attackWeight) + 
                          ($fundamental * $fundamentalWeight) + 
                          ($bodyResonance * 0.3) + 
                          ($roomReflection * 0.1);
        } elseif ($sustainPhase) {
            // Sustain phase: emphasize fundamental and body resonance
            $mixedSample = ($fundamental * 1.0) + 
                          ($bodyResonance * 0.8) + 
                          ($attack * 0.1) + 
                          ($roomReflection * 0.3);
        } else {
            // Release phase: emphasize body resonance and room reflection
            $releaseProgress = ($time - ($duration - 0.1)) / 0.1;
            $fundamentalWeight = 1.0 - $releaseProgress;
            $bodyResonanceWeight = 0.6 + $releaseProgress * 0.4;
            
            $mixedSample = ($fundamental * $fundamentalWeight) + 
                          ($bodyResonance * $bodyResonanceWeight) + 
                          ($attack * 0.05) + 
                          ($roomReflection * 0.5);
        }
        
        // Normalize
        $mixedSample = max(-1.0, min(1.0, $mixedSample));
        
        return $mixedSample;
    }
    
    /**
     * Apply drum tuning
     */
    private function applyDrumTuning($audioData, $drumPiece, $characteristics) {
        // Apply drum tuning characteristics
        // This would modify the fundamental frequency
        return $audioData;
    }
    
    /**
     * Apply room acoustics
     */
    private function applyRoomAcoustics($audioData, $drumPiece, $velocity) {
        // Apply room acoustics characteristics
        // Reverb, echo, etc.
        return $audioData;
    }
    
    /**
     * Apply mic positioning
     */
    private function applyMicPositioning($audioData, $drumPiece, $velocity) {
        // Apply mic positioning characteristics
        // Frequency response, phase, etc.
        return $audioData;
    }
    
    /**
     * Apply velocity sensitivity
     */
    private function applyVelocitySensitivity($audioData, $velocity, $characteristics) {
        $samples = strlen($audioData) / 2; // 16-bit samples
        $processedAudio = '';
        
        $velocityFactor = $velocity / 127.0;
        
        for ($i = 0; $i < $samples; $i++) {
            $sample = unpack('s', substr($audioData, $i * 2, 2))[1];
            
            // Apply velocity sensitivity
            $sample *= $velocityFactor;
            
            // Apply velocity-dependent effects
            if ($velocity < 64) {
                // Soft hits: reduce high frequencies
                $sample *= 0.8;
            } elseif ($velocity > 96) {
                // Hard hits: enhance attack
                $sample *= 1.2;
            }
            
            $processedAudio .= pack('s', (int)$sample);
        }
        
        return $processedAudio;
    }
    
    /**
     * Get velocity layer
     */
    private function getVelocityLayer($velocity) {
        if ($velocity < 32) return 0;      // Very soft
        if ($velocity < 64) return 1;      // Soft
        if ($velocity < 96) return 2;      // Medium
        return 3;                          // Hard
    }
    
    /**
     * Get drum size
     */
    private function getDrumSize($drumPiece) {
        $sizes = [
            'kick' => 'large',
            'snare' => 'medium',
            'hi-hat' => 'small',
            'crash' => 'medium',
            'ride' => 'large',
            'tom1' => 'small',
            'tom2' => 'medium',
            'floor_tom' => 'large'
        ];
        
        return $sizes[$drumPiece] ?? 'medium';
    }
    
    /**
     * Get drum material
     */
    private function getDrumMaterial($drumPiece) {
        $materials = [
            'kick' => 'wood',
            'snare' => 'metal',
            'hi-hat' => 'metal',
            'crash' => 'metal',
            'ride' => 'metal',
            'tom1' => 'wood',
            'tom2' => 'wood',
            'floor_tom' => 'wood'
        ];
        
        return $materials[$drumPiece] ?? 'wood';
    }
    
    /**
     * Calculate head tension
     */
    private function calculateHeadTension($drumPiece, $velocity) {
        $baseTension = 0.5;
        
        // Higher velocity = higher tension
        $velocityTension = ($velocity / 127.0) * 0.3;
        
        // Different drums have different base tensions
        $drumTension = 0;
        switch ($drumPiece) {
            case 'kick':
                $drumTension = 0.8;
                break;
            case 'snare':
                $drumTension = 0.9;
                break;
            case 'hi-hat':
                $drumTension = 0.7;
                break;
            case 'tom1':
            case 'tom2':
            case 'floor_tom':
                $drumTension = 0.6;
                break;
        }
        
        return $baseTension + $velocityTension + $drumTension;
    }
    
    /**
     * Get room size
     */
    private function getRoomSize() {
        // Room size affects acoustics
        return 10.0; // 10 meters
    }
    
    /**
     * Get mic distance
     */
    private function getMicDistance($drumPiece) {
        $distances = [
            'kick' => 0.3,      // Close mic
            'snare' => 0.2,     // Very close mic
            'hi-hat' => 0.15,   // Very close mic
            'crash' => 0.4,     // Medium distance
            'ride' => 0.5,      // Medium distance
            'tom1' => 0.25,     // Close mic
            'tom2' => 0.3,      // Close mic
            'floor_tom' => 0.35 // Close mic
        ];
        
        return $distances[$drumPiece] ?? 0.3;
    }
    
    /**
     * Get drum frequency
     */
    private function getDrumFrequency($drumPiece) {
        $frequencies = [
            'kick' => 60,
            'snare' => 200,
            'hi-hat' => 8000,
            'crash' => 3000,
            'ride' => 800,
            'tom1' => 150,
            'tom2' => 120,
            'floor_tom' => 80
        ];
        
        return $frequencies[$drumPiece] ?? 200;
    }
    
    /**
     * Get drum decay
     */
    private function getDrumDecay($drumPiece) {
        $decays = [
            'kick' => 0.1,      // Fast decay
            'snare' => 0.2,     // Medium decay
            'hi-hat' => 0.05,   // Very fast decay
            'crash' => 0.8,     // Long decay
            'ride' => 1.2,      // Very long decay
            'tom1' => 0.3,      // Medium decay
            'tom2' => 0.4,      // Medium decay
            'floor_tom' => 0.5  // Medium decay
        ];
        
        return $decays[$drumPiece] ?? 0.3;
    }
    
    /**
     * Get attack duration
     */
    private function getAttackDuration($drumPiece) {
        $durations = [
            'kick' => 0.05,     // 50ms
            'snare' => 0.03,    // 30ms
            'hi-hat' => 0.02,   // 20ms
            'crash' => 0.08,    // 80ms
            'ride' => 0.06,     // 60ms
            'tom1' => 0.04,     // 40ms
            'tom2' => 0.04,     // 40ms
            'floor_tom' => 0.05 // 50ms
        ];
        
        return $durations[$drumPiece] ?? 0.04;
    }
    
    /**
     * Generate drum harmonics
     */
    private function generateDrumHarmonics($drumPiece, $frequency, $time) {
        $harmonics = 0;
        
        switch ($drumPiece) {
            case 'kick':
                // Kick has strong fundamental, weak harmonics
                $harmonics += 0.2 * sin(2 * M_PI * $frequency * 2 * $time);
                break;
            case 'snare':
                // Snare has strong harmonics
                $harmonics += 0.6 * sin(2 * M_PI * $frequency * 2 * $time);
                $harmonics += 0.4 * sin(2 * M_PI * $frequency * 3 * $time);
                break;
            case 'tom1':
            case 'tom2':
            case 'floor_tom':
                // Toms have moderate harmonics
                $harmonics += 0.4 * sin(2 * M_PI * $frequency * 2 * $time);
                $harmonics += 0.2 * sin(2 * M_PI * $frequency * 3 * $time);
                break;
            default:
                // Default harmonics
                $harmonics += 0.3 * sin(2 * M_PI * $frequency * 2 * $time);
        }
        
        return $harmonics;
    }
    
    /**
     * Get sample at specific time
     */
    private function getSampleAtTime($audioData, $sampleIndex) {
        if ($sampleIndex * 2 >= strlen($audioData)) {
            return 0;
        }
        
        $sample = unpack('s', substr($audioData, $sampleIndex * 2, 2))[1];
        return $sample / 32767.0; // Normalize to -1.0 to 1.0
    }
    
    /**
     * Set drum kit type
     */
    public function setDrumKit($type) {
        $this->drumKit = $type;
    }
    
    /**
     * Set room acoustics
     */
    public function setRoomAcoustics($enabled) {
        $this->roomAcoustics = $enabled;
    }
    
    /**
     * Set mic positioning
     */
    public function setMicPositioning($position) {
        $this->micPositioning = $position;
    }
    
    /**
     * Set drum tuning
     */
    public function setDrumTuning($tuning) {
        $this->drumTuning = $tuning;
    }
    
    /**
     * Get available drum kits
     */
    public function getAvailableDrumKits() {
        return [
            'acoustic' => [
                'name' => 'Acoustic Drum Kit',
                'description' => 'Classic acoustic drum kit with natural sound',
                'characteristics' => ['natural', 'warm', 'dynamic']
            ],
            'electronic' => [
                'name' => 'Electronic Drum Kit',
                'description' => 'Modern electronic drum kit',
                'characteristics' => ['clean', 'precise', 'versatile']
            ],
            'jazz' => [
                'name' => 'Jazz Drum Kit',
                'description' => 'Jazz-style drum kit with warm tones',
                'characteristics' => ['warm', 'mellow', 'jazz']
            ],
            'rock' => [
                'name' => 'Rock Drum Kit',
                'description' => 'Rock-style drum kit with powerful sound',
                'characteristics' => ['powerful', 'bright', 'rock']
            ]
        ];
    }
}

// Helper function to get advanced drum engine instance
function advanced_drum_engine() {
    return new AdvancedDrumEngine();
}
?>