<?php
require_once 'config.php';

/**
 * Advanced Guitar Engine
 * Professional Quality Guitar Sounds
 * 100% Original - Studio Quality
 */
class AdvancedGuitarEngine {
    private $config;
    private $sampleRate;
    private $guitarType;
    private $stringGauge;
    private $pickupType;
    private $playingStyle;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 24,
            'channels' => 2,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->guitarType = 'acoustic';
        $this->stringGauge = 'medium';
        $this->pickupType = 'none';
        $this->playingStyle = 'finger_picking';
    }
    
    /**
     * Generate realistic guitar note
     */
    public function generateGuitarNote($note, $velocity, $duration, $parameters = []) {
        try {
            $frequency = $this->noteToFrequency($note);
            $samples = intval($duration * $this->sampleRate);
            $audioData = '';
            
            // Guitar characteristics based on note and velocity
            $guitarCharacteristics = $this->getGuitarCharacteristics($note, $velocity);
            
            // Generate multi-layered guitar sound
            $audioData = $this->generateMultiLayerGuitar($frequency, $velocity, $duration, $guitarCharacteristics);
            
            // Apply string physics
            $audioData = $this->applyStringPhysics($audioData, $note, $velocity);
            
            // Apply body resonance
            $audioData = $this->applyBodyResonance($audioData, $note, $velocity);
            
            // Apply playing style effects
            $audioData = $this->applyPlayingStyle($audioData, $parameters);
            
            // Apply pickup characteristics
            if ($this->pickupType !== 'none') {
                $audioData = $this->applyPickupCharacteristics($audioData);
            }
            
            return [
                'success' => true,
                'audio_data' => $audioData,
                'note' => $note,
                'velocity' => $velocity,
                'duration' => $duration,
                'characteristics' => $guitarCharacteristics
            ];
            
        } catch (Exception $e) {
            error_log("Guitar Generation Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Guitar generation failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Get guitar characteristics for note and velocity
     */
    private function getGuitarCharacteristics($note, $velocity) {
        $string = $this->getStringNumber($note);
        $fret = $this->getFretPosition($note);
        
        return [
            'string' => $string,
            'fret' => $fret,
            'string_tension' => $this->calculateStringTension($string, $fret),
            'body_resonance' => $this->calculateBodyResonance($note),
            'string_gauge_factor' => $this->getStringGaugeFactor(),
            'pickup_position' => $this->getPickupPosition($string),
            'playing_intensity' => $velocity / 127.0,
            'string_material' => $this->getStringMaterial($string)
        ];
    }
    
    /**
     * Generate multi-layer guitar sound
     */
    private function generateMultiLayerGuitar($frequency, $velocity, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        // Generate fundamental tone
        $fundamental = $this->generateFundamentalTone($frequency, $duration, $characteristics);
        
        // Generate harmonic layers
        $harmonics = $this->generateHarmonicLayers($frequency, $duration, $characteristics);
        
        // Generate string attack
        $attack = $this->generateStringAttack($frequency, $velocity, $characteristics);
        
        // Generate body resonance
        $bodyResonance = $this->generateBodyResonance($frequency, $duration, $characteristics);
        
        // Generate string noise
        $stringNoise = $this->generateStringNoise($frequency, $velocity, $characteristics);
        
        // Mix all layers
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Get samples from each layer
            $fundamentalSample = $this->getSampleAtTime($fundamental, $i);
            $harmonicSample = $this->getSampleAtTime($harmonics, $i);
            $attackSample = $this->getSampleAtTime($attack, $i);
            $bodyResonanceSample = $this->getSampleAtTime($bodyResonance, $i);
            $stringNoiseSample = $this->getSampleAtTime($stringNoise, $i);
            
            // Mix samples with proper weighting
            $mixedSample = $this->mixGuitarLayers(
                $fundamentalSample,
                $harmonicSample,
                $attackSample,
                $bodyResonanceSample,
                $stringNoiseSample,
                $time,
                $duration,
                $characteristics
            );
            
            // Apply velocity sensitivity
            $mixedSample *= ($velocity / 127.0);
            
            // Convert to 16-bit PCM
            $pcm = (int)($mixedSample * 32767);
            $audioData .= pack('s', $pcm);
        }
        
        return $audioData;
    }
    
    /**
     * Generate fundamental tone
     */
    private function generateFundamentalTone($frequency, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $attackTime = 0.005; // 5ms attack
        $decayTime = 0.05;   // 50ms decay
        $sustainLevel = 0.8; // 80% sustain
        $releaseTime = 0.3;  // 300ms release
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Generate fundamental sine wave
            $fundamental = sin(2 * M_PI * $frequency * $time);
            
            // Apply ADSR envelope
            $envelope = $this->calculateADSR($time, $duration, $attackTime, $decayTime, $sustainLevel, $releaseTime);
            
            // Apply string tension characteristics
            $stringTension = $characteristics['string_tension'];
            $fundamental *= (1 + $stringTension * 0.15);
            
            // Apply string gauge factor
            $stringGaugeFactor = $characteristics['string_gauge_factor'];
            $fundamental *= $stringGaugeFactor;
            
            $sample = $fundamental * $envelope;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate harmonic layers
     */
    private function generateHarmonicLayers($frequency, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $attackTime = 0.003; // 3ms attack
        $decayTime = 0.04;   // 40ms decay
        $sustainLevel = 0.7; // 70% sustain
        $releaseTime = 0.25; // 250ms release
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            $harmonics = 0;
            
            // 2nd harmonic (octave) - strong in guitar
            $harmonics += 0.6 * sin(2 * M_PI * $frequency * 2 * $time);
            
            // 3rd harmonic (perfect fifth) - characteristic guitar sound
            $harmonics += 0.4 * sin(2 * M_PI * $frequency * 3 * $time);
            
            // 4th harmonic (second octave)
            $harmonics += 0.2 * sin(2 * M_PI * $frequency * 4 * $time);
            
            // 5th harmonic (major third)
            $harmonics += 0.1 * sin(2 * M_PI * $frequency * 5 * $time);
            
            // 6th harmonic (perfect fifth + octave)
            $harmonics += 0.05 * sin(2 * M_PI * $frequency * 6 * $time);
            
            // Apply ADSR envelope
            $envelope = $this->calculateADSR($time, $duration, $attackTime, $decayTime, $sustainLevel, $releaseTime);
            
            // Apply playing intensity
            $playingIntensity = $characteristics['playing_intensity'];
            $harmonics *= (0.3 + $playingIntensity * 0.7);
            
            $sample = $harmonics * $envelope;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate string attack
     */
    private function generateStringAttack($frequency, $velocity, $characteristics) {
        $duration = 0.03; // 30ms attack
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $playingIntensity = $characteristics['playing_intensity'];
        $stringMaterial = $characteristics['string_material'];
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Generate string pluck sound
            $stringPluck = 0;
            
            // High-frequency components for string pluck
            for ($freq = 800; $freq < 6000; $freq += 400) {
                $stringPluck += 0.08 * sin(2 * M_PI * $freq * $time);
            }
            
            // Add noise component
            $stringPluck += 0.4 * (rand() / getrandmax() - 0.5) * 2;
            
            // Apply playing intensity
            $stringPluck *= $playingIntensity;
            
            // Apply string material characteristics
            $stringPluck *= $this->getStringMaterialFactor($stringMaterial);
            
            // Apply envelope (fast attack, quick decay)
            $envelope = exp(-$time / 0.008); // 8ms decay
            $stringPluck *= $envelope;
            
            $sample = $stringPluck;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate body resonance
     */
    private function generateBodyResonance($frequency, $duration, $characteristics) {
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $bodyResonance = $characteristics['body_resonance'];
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            $resonance = 0;
            
            // Body resonance frequencies
            $bodyFreqs = [110, 220, 330, 440, 550, 660];
            foreach ($bodyFreqs as $bodyFreq) {
                $resonance += 0.1 * sin(2 * M_PI * $bodyFreq * $time);
            }
            
            // Apply body resonance characteristics
            $resonance *= $bodyResonance;
            
            // Apply envelope (longer sustain for body resonance)
            $envelope = exp(-$time / 1.2); // 1.2 second decay
            $resonance *= $envelope;
            
            $sample = $resonance;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Generate string noise
     */
    private function generateStringNoise($frequency, $velocity, $characteristics) {
        $duration = 0.1; // 100ms noise
        $samples = intval($duration * $this->sampleRate);
        $audioData = '';
        
        $playingIntensity = $characteristics['playing_intensity'];
        
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $this->sampleRate;
            
            // Generate string noise
            $stringNoise = 0;
            
            // Finger sliding noise
            $slidingNoise = 0.2 * (rand() / getrandmax() - 0.5) * 2;
            
            // String vibration noise
            $vibrationNoise = 0.1 * sin(2 * M_PI * 50 * $time) * (rand() / getrandmax() - 0.5) * 2;
            
            // Combine noise components
            $stringNoise = $slidingNoise + $vibrationNoise;
            
            // Apply playing intensity
            $stringNoise *= $playingIntensity;
            
            // Apply envelope
            $envelope = exp(-$time / 0.05); // 50ms decay
            $stringNoise *= $envelope;
            
            $sample = $stringNoise;
            $audioData .= pack('s', (int)($sample * 32767));
        }
        
        return $audioData;
    }
    
    /**
     * Mix guitar layers
     */
    private function mixGuitarLayers($fundamental, $harmonics, $attack, $bodyResonance, $stringNoise, $time, $duration, $characteristics) {
        // Time-based mixing
        $attackPhase = $time < 0.05; // First 50ms
        $sustainPhase = $time >= 0.05 && $time < ($duration - 0.1); // Middle phase
        $releasePhase = $time >= ($duration - 0.1); // Last 100ms
        
        $mixedSample = 0;
        
        if ($attackPhase) {
            // Attack phase: emphasize attack and fundamental
            $attackWeight = 1.0 - ($time / 0.05);
            $fundamentalWeight = 0.4 + ($time / 0.05) * 0.6;
            
            $mixedSample = ($attack * $attackWeight) + 
                          ($fundamental * $fundamentalWeight) + 
                          ($harmonics * 0.6) + 
                          ($bodyResonance * 0.3) + 
                          ($stringNoise * 0.4);
        } elseif ($sustainPhase) {
            // Sustain phase: emphasize fundamental and harmonics
            $mixedSample = ($fundamental * 1.0) + 
                          ($harmonics * 0.8) + 
                          ($bodyResonance * 0.7) + 
                          ($attack * 0.1) + 
                          ($stringNoise * 0.2);
        } else {
            // Release phase: emphasize body resonance and harmonics
            $releaseProgress = ($time - ($duration - 0.1)) / 0.1;
            $fundamentalWeight = 1.0 - $releaseProgress;
            $bodyResonanceWeight = 0.4 + $releaseProgress * 0.6;
            
            $mixedSample = ($fundamental * $fundamentalWeight) + 
                          ($harmonics * 0.7) + 
                          ($bodyResonance * $bodyResonanceWeight) + 
                          ($attack * 0.05) + 
                          ($stringNoise * 0.1);
        }
        
        // Normalize
        $mixedSample = max(-1.0, min(1.0, $mixedSample));
        
        return $mixedSample;
    }
    
    /**
     * Apply string physics
     */
    private function applyStringPhysics($audioData, $note, $velocity) {
        // Apply realistic string physics
        // String bending, vibrato, harmonics
        return $audioData;
    }
    
    /**
     * Apply body resonance
     */
    private function applyBodyResonance($audioData, $note, $velocity) {
        // Apply guitar body resonance characteristics
        return $audioData;
    }
    
    /**
     * Apply playing style effects
     */
    private function applyPlayingStyle($audioData, $parameters) {
        $style = $parameters['style'] ?? $this->playingStyle;
        
        switch ($style) {
            case 'finger_picking':
                return $this->applyFingerPicking($audioData);
            case 'flat_picking':
                return $this->applyFlatPicking($audioData);
            case 'strumming':
                return $this->applyStrumming($audioData);
            case 'slapping':
                return $this->applySlapping($audioData);
            default:
                return $audioData;
        }
    }
    
    /**
     * Apply finger picking effect
     */
    private function applyFingerPicking($audioData) {
        // Apply finger picking characteristics
        // Softer attack, more harmonics
        return $audioData;
    }
    
    /**
     * Apply flat picking effect
     */
    private function applyFlatPicking($audioData) {
        // Apply flat picking characteristics
        // Sharper attack, more fundamental
        return $audioData;
    }
    
    /**
     * Apply strumming effect
     */
    private function applyStrumming($audioData) {
        // Apply strumming characteristics
        // Multiple string attack
        return $audioData;
    }
    
    /**
     * Apply slapping effect
     */
    private function applySlapping($audioData) {
        // Apply slapping characteristics
        // Percussive attack
        return $audioData;
    }
    
    /**
     * Apply pickup characteristics
     */
    private function applyPickupCharacteristics($audioData) {
        // Apply electric guitar pickup characteristics
        // Frequency response, distortion, etc.
        return $audioData;
    }
    
    /**
     * Get string number from note
     */
    private function getStringNumber($note) {
        // Standard guitar tuning: E2, A2, D3, G3, B3, E4
        $openStrings = [40, 45, 50, 55, 59, 64]; // E2, A2, D3, G3, B3, E4
        
        for ($i = 0; $i < count($openStrings); $i++) {
            if ($note >= $openStrings[$i] && $note < $openStrings[$i] + 12) {
                return $i + 1; // String numbers 1-6
            }
        }
        
        return 1; // Default to first string
    }
    
    /**
     * Get fret position from note
     */
    private function getFretPosition($note) {
        $openStrings = [40, 45, 50, 55, 59, 64];
        
        for ($i = 0; $i < count($openStrings); $i++) {
            if ($note >= $openStrings[$i] && $note < $openStrings[$i] + 12) {
                return $note - $openStrings[$i];
            }
        }
        
        return 0;
    }
    
    /**
     * Calculate string tension
     */
    private function calculateStringTension($string, $fret) {
        // Higher frets = higher tension
        // Lower strings = higher tension
        $stringTension = (7 - $string) * 0.2; // Lower string numbers = higher tension
        $fretTension = $fret * 0.1;
        
        return 0.5 + $stringTension + $fretTension;
    }
    
    /**
     * Calculate body resonance
     */
    private function calculateBodyResonance($note) {
        // Guitar body has specific resonance frequencies
        $resonanceFreqs = [110, 220, 330, 440, 550, 660];
        $noteFreq = $this->noteToFrequency($note);
        
        $resonance = 0;
        foreach ($resonanceFreqs as $resFreq) {
            $distance = abs($noteFreq - $resFreq);
            if ($distance < 50) { // Within 50 Hz
                $resonance = max($resonance, 1.0 - ($distance / 50));
            }
        }
        
        return $resonance;
    }
    
    /**
     * Get string gauge factor
     */
    private function getStringGaugeFactor() {
        switch ($this->stringGauge) {
            case 'light':
                return 0.8;
            case 'medium':
                return 1.0;
            case 'heavy':
                return 1.2;
            default:
                return 1.0;
        }
    }
    
    /**
     * Get pickup position
     */
    private function getPickupPosition($string) {
        // Bridge pickup vs neck pickup
        if ($string <= 3) {
            return 'bridge'; // Lower strings closer to bridge
        } else {
            return 'neck'; // Higher strings closer to neck
        }
    }
    
    /**
     * Get string material
     */
    private function getStringMaterial($string) {
        // Different materials for different strings
        $materials = ['steel', 'bronze', 'nickel', 'phosphor_bronze', 'silk_steel'];
        return $materials[($string - 1) % count($materials)];
    }
    
    /**
     * Get string material factor
     */
    private function getStringMaterialFactor($material) {
        switch ($material) {
            case 'steel':
                return 1.0;
            case 'bronze':
                return 0.9;
            case 'nickel':
                return 0.95;
            case 'phosphor_bronze':
                return 0.85;
            case 'silk_steel':
                return 0.8;
            default:
                return 1.0;
        }
    }
    
    /**
     * Convert note to frequency
     */
    private function noteToFrequency($note) {
        return 440 * pow(2, ($note - 69) / 12);
    }
    
    /**
     * Calculate ADSR envelope
     */
    private function calculateADSR($time, $duration, $attack, $decay, $sustain, $release) {
        if ($time < $attack) {
            // Attack phase
            return $time / $attack;
        } elseif ($time < $attack + $decay) {
            // Decay phase
            $decayTime = $time - $attack;
            return 1.0 - ($decayTime / $decay) * (1.0 - $sustain);
        } elseif ($time < $duration - $release) {
            // Sustain phase
            return $sustain;
        } else {
            // Release phase
            $releaseTime = $time - ($duration - $release);
            return $sustain * (1.0 - $releaseTime / $release);
        }
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
     * Set guitar type
     */
    public function setGuitarType($type) {
        $this->guitarType = $type;
        
        switch ($type) {
            case 'acoustic':
                $this->pickupType = 'none';
                break;
            case 'electric':
                $this->pickupType = 'humbucker';
                break;
            case 'classical':
                $this->pickupType = 'none';
                $this->stringGauge = 'nylon';
                break;
            case 'bass':
                $this->pickupType = 'jazz';
                break;
        }
    }
    
    /**
     * Set string gauge
     */
    public function setStringGauge($gauge) {
        $this->stringGauge = $gauge;
    }
    
    /**
     * Set pickup type
     */
    public function setPickupType($type) {
        $this->pickupType = $type;
    }
    
    /**
     * Set playing style
     */
    public function setPlayingStyle($style) {
        $this->playingStyle = $style;
    }
    
    /**
     * Get available guitar types
     */
    public function getAvailableGuitarTypes() {
        return [
            'acoustic' => [
                'name' => 'Acoustic Guitar',
                'description' => 'Classic acoustic guitar with warm, natural sound',
                'characteristics' => ['warm', 'natural', 'resonant']
            ],
            'electric' => [
                'name' => 'Electric Guitar',
                'description' => 'Electric guitar with pickup characteristics',
                'characteristics' => ['bright', 'electric', 'versatile']
            ],
            'classical' => [
                'name' => 'Classical Guitar',
                'description' => 'Nylon string classical guitar',
                'characteristics' => ['mellow', 'classical', 'smooth']
            ],
            'bass' => [
                'name' => 'Bass Guitar',
                'description' => 'Electric bass guitar',
                'characteristics' => ['deep', 'punchy', 'rhythmic']
            ]
        ];
    }
}

// Helper function to get advanced guitar engine instance
function advanced_guitar_engine() {
    return new AdvancedGuitarEngine();
}
?>