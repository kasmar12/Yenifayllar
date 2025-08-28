<?php
require_once 'config.php';

/**
 * Advanced Audio Effects Engine
 * Professional Quality Audio Processing
 * 100% Original - No External Dependencies
 */
class AudioEffectsEngine {
    private $config;
    private $sampleRate;
    private $bufferSize;
    private $effectsLibrary;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 24,
            'channels' => 2,
            'buffer_size' => 4096,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->bufferSize = $this->config['buffer_size'];
        $this->effectsLibrary = new EffectsLibrary();
    }
    
    /**
     * Apply multiple effects to audio
     */
    public function applyEffects($audioData, $effects = []) {
        try {
            $processedAudio = $audioData;
            
            foreach ($effects as $effect) {
                $processedAudio = $this->applySingleEffect($processedAudio, $effect);
            }
            
            return [
                'success' => true,
                'audio_data' => $processedAudio,
                'effects_applied' => $effects
            ];
            
        } catch (Exception $e) {
            error_log("Audio Effects Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Effects processing failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Apply single effect
     */
    private function applySingleEffect($audioData, $effect) {
        switch ($effect['type']) {
            case 'reverb':
                return $this->applyReverb($audioData, $effect['parameters']);
            case 'echo':
                return $this->applyEcho($audioData, $effect['parameters']);
            case 'chorus':
                return $this->applyChorus($audioData, $effect['parameters']);
            case 'distortion':
                return $this->applyDistortion($audioData, $effect['parameters']);
            case 'compression':
                return $this->applyCompression($audioData, $effect['parameters']);
            case 'eq':
                return $this->applyEQ($audioData, $effect['parameters']);
            case 'delay':
                return $this->applyDelay($audioData, $effect['parameters']);
            case 'flanger':
                return $this->applyFlanger($audioData, $effect['parameters']);
            case 'phaser':
                return $this->applyPhaser($audioData, $effect['parameters']);
            case 'wah':
                return $this->applyWah($audioData, $effect['parameters']);
            default:
                return $audioData;
        }
    }
    
    /**
     * Apply reverb effect
     */
    private function applyReverb($audioData, $parameters = []) {
        $defaultParams = [
            'room_size' => 0.5,      // 0.1 to 1.0
            'damping' => 0.5,        // 0.1 to 1.0
            'wet_level' => 0.3,      // 0.0 to 1.0
            'dry_level' => 0.7,      // 0.0 to 1.0
            'width' => 1.0           // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        // Convert audio data to samples
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        // Reverb algorithm
        $delayBuffer = array_fill(0, intval($this->sampleRate * $params['room_size']), 0);
        $feedbackBuffer = array_fill(0, intval($this->sampleRate * 0.1), 0);
        
        foreach ($samples as $i => $sample) {
            // Calculate reverb
            $reverbSample = 0;
            
            // Multiple delay lines for realistic reverb
            $delays = [0.03, 0.05, 0.07, 0.11, 0.13, 0.17, 0.19, 0.23];
            foreach ($delays as $delay) {
                $delaySamples = intval($delay * $this->sampleRate);
                if ($i >= $delaySamples) {
                    $delayedSample = $samples[$i - $delaySamples];
                    $reverbSample += $delayedSample * $params['damping'];
                }
            }
            
            // Apply feedback
            if ($i >= count($feedbackBuffer)) {
                $reverbSample += $feedbackBuffer[$i % count($feedbackBuffer)] * 0.6;
            }
            
            // Store feedback
            $feedbackBuffer[$i % count($feedbackBuffer)] = $reverbSample;
            
            // Mix dry and wet
            $drySample = $sample * $params['dry_level'];
            $wetSample = $reverbSample * $params['wet_level'];
            
            $processedSamples[] = $drySample + $wetSample;
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply echo effect
     */
    private function applyEcho($audioData, $parameters = []) {
        $defaultParams = [
            'delay_time' => 0.3,     // seconds
            'feedback' => 0.5,       // 0.0 to 0.9
            'mix' => 0.5             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $delaySamples = intval($params['delay_time'] * $this->sampleRate);
        $delayBuffer = array_fill(0, $delaySamples, 0);
        
        foreach ($samples as $i => $sample) {
            // Get delayed sample
            $delayedSample = 0;
            if ($i >= $delaySamples) {
                $delayedSample = $delayBuffer[$i % $delaySamples];
            }
            
            // Mix original and delayed
            $echoSample = $sample + ($delayedSample * $params['feedback']);
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($echoSample * $params['mix']);
            
            // Store in delay buffer
            $delayBuffer[$i % $delaySamples] = $echoSample;
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply chorus effect
     */
    private function applyChorus($audioData, $parameters = []) {
        $defaultParams = [
            'rate' => 1.5,           // Hz
            'depth' => 0.002,        // seconds
            'mix' => 0.5,            // 0.0 to 1.0
            'voices' => 3             // number of voices
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $maxDelay = intval($params['depth'] * $this->sampleRate);
        $delayBuffer = array_fill(0, $maxDelay, 0);
        
        foreach ($samples as $i => $sample) {
            $chorusSample = $sample;
            
            // Create multiple voices with different modulation
            for ($voice = 0; $voice < $params['voices']; $voice++) {
                $modulation = sin(2 * M_PI * $params['rate'] * $i / $this->sampleRate + $voice * M_PI / 3);
                $delayOffset = intval($maxDelay * 0.5 * (1 + $modulation));
                
                if ($i >= $delayOffset) {
                    $delayedSample = $samples[$i - $delayOffset];
                    $chorusSample += $delayedSample * (0.3 / $params['voices']);
                }
            }
            
            // Mix original and chorus
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($chorusSample * $params['mix']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply distortion effect
     */
    private function applyDistortion($audioData, $parameters = []) {
        $defaultParams = [
            'gain' => 20,            // dB
            'distortion_type' => 'soft', // soft, hard, tube
            'mix' => 0.8             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $gain = pow(10, $params['gain'] / 20);
        
        foreach ($samples as $sample) {
            // Apply gain
            $gainedSample = $sample * $gain;
            
            // Apply distortion based on type
            switch ($params['distortion_type']) {
                case 'soft':
                    $distortedSample = $this->softClip($gainedSample);
                    break;
                case 'hard':
                    $distortedSample = $this->hardClip($gainedSample);
                    break;
                case 'tube':
                    $distortedSample = $this->tubeDistortion($gainedSample);
                    break;
                default:
                    $distortedSample = $this->softClip($gainedSample);
            }
            
            // Mix original and distorted
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($distortedSample * $params['mix']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply compression effect
     */
    private function applyCompression($audioData, $parameters = []) {
        $defaultParams = [
            'threshold' => -20,       // dB
            'ratio' => 4,            // compression ratio
            'attack' => 0.005,       // seconds
            'release' => 0.1,        // seconds
            'makeup_gain' => 0       // dB
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $threshold = pow(10, $params['threshold'] / 20);
        $attackCoeff = exp(-1 / ($params['attack'] * $this->sampleRate));
        $releaseCoeff = exp(-1 / ($params['release'] * $this->sampleRate));
        $makeupGain = pow(10, $params['makeup_gain'] / 20);
        
        $envelope = 0;
        
        foreach ($samples as $sample) {
            $absSample = abs($sample);
            
            // Calculate envelope
            if ($absSample > $envelope) {
                $envelope = $attackCoeff * ($envelope - $absSample) + $absSample;
            } else {
                $envelope = $releaseCoeff * ($envelope - $absSample) + $absSample;
            }
            
            // Calculate gain reduction
            $gainReduction = 1.0;
            if ($envelope > $threshold) {
                $overThreshold = $envelope - $threshold;
                $gainReduction = pow($threshold / $envelope, 1 - 1 / $params['ratio']);
            }
            
            // Apply compression
            $compressedSample = $sample * $gainReduction * $makeupGain;
            $processedSamples[] = $compressedSample;
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply EQ effect
     */
    private function applyEQ($audioData, $parameters = []) {
        $defaultParams = [
            'low_gain' => 0,         // dB
            'mid_gain' => 0,         // dB
            'high_gain' => 0,        // dB
            'low_freq' => 200,       // Hz
            'high_freq' => 2000      // Hz
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        // Convert dB to linear gain
        $lowGain = pow(10, $params['low_gain'] / 20);
        $midGain = pow(10, $params['mid_gain'] / 20);
        $highGain = pow(10, $params['high_gain'] / 20);
        
        // Filter coefficients
        $lowFilter = $this->createLowPassFilter($params['low_freq']);
        $highFilter = $this->createHighPassFilter($params['high_freq']);
        
        $lowBuffer = array_fill(0, 2, 0);
        $highBuffer = array_fill(0, 2, 0);
        
        foreach ($samples as $sample) {
            // Apply low-pass filter
            $lowSample = $this->applyFilter($sample, $lowFilter, $lowBuffer);
            
            // Apply high-pass filter
            $highSample = $this->applyFilter($sample, $highFilter, $highBuffer);
            
            // Calculate mid frequencies
            $midSample = $sample - $lowSample - $highSample;
            
            // Apply gains and mix
            $processedSample = ($lowSample * $lowGain) + ($midSample * $midGain) + ($highSample * $highGain);
            $processedSamples[] = $processedSample;
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply delay effect
     */
    private function applyDelay($audioData, $parameters = []) {
        $defaultParams = [
            'delay_time' => 0.5,     // seconds
            'feedback' => 0.3,       // 0.0 to 0.9
            'mix' => 0.5             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $delaySamples = intval($params['delay_time'] * $this->sampleRate);
        $delayBuffer = array_fill(0, $delaySamples, 0);
        
        foreach ($samples as $i => $sample) {
            // Get delayed sample
            $delayedSample = 0;
            if ($i >= $delaySamples) {
                $delayedSample = $delayBuffer[$i % $delaySamples];
            }
            
            // Mix original and delayed
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($delayedSample * $params['mix']);
            
            // Store in delay buffer with feedback
            $delayBuffer[$i % $delaySamples] = $sample + ($delayedSample * $params['feedback']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply flanger effect
     */
    private function applyFlanger($audioData, $parameters = []) {
        $defaultParams = [
            'rate' => 0.5,           // Hz
            'depth' => 0.002,        // seconds
            'feedback' => 0.3,       // 0.0 to 0.9
            'mix' => 0.5             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $maxDelay = intval($params['depth'] * $this->sampleRate);
        $delayBuffer = array_fill(0, $maxDelay, 0);
        
        foreach ($samples as $i => $sample) {
            // Calculate modulation
            $modulation = sin(2 * M_PI * $params['rate'] * $i / $this->sampleRate);
            $delayOffset = intval($maxDelay * 0.5 * (1 + $modulation));
            
            // Get delayed sample
            $delayedSample = 0;
            if ($i >= $delayOffset) {
                $delayedSample = $samples[$i - $delayOffset];
            }
            
            // Mix original and delayed
            $flangedSample = $sample + ($delayedSample * $params['feedback']);
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($flangedSample * $params['mix']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply phaser effect
     */
    private function applyPhaser($audioData, $parameters = []) {
        $defaultParams = [
            'rate' => 1.0,           // Hz
            'depth' => 0.7,          // 0.0 to 1.0
            'stages' => 4,           // number of all-pass stages
            'mix' => 0.5             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        // All-pass filter buffers
        $filterBuffers = array_fill(0, $params['stages'], array_fill(0, 2, 0));
        
        foreach ($samples as $i => $sample) {
            // Calculate modulation
            $modulation = sin(2 * M_PI * $params['rate'] * $i / $this->sampleRate);
            $frequency = 1000 + (2000 * $params['depth'] * $modulation);
            
            // Apply all-pass filters
            $filteredSample = $sample;
            foreach ($filterBuffers as &$buffer) {
                $filteredSample = $this->applyAllPassFilter($filteredSample, $frequency, $buffer);
            }
            
            // Mix original and filtered
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($filteredSample * $params['mix']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply wah effect
     */
    private function applyWah($audioData, $parameters = []) {
        $defaultParams = [
            'rate' => 2.0,           // Hz
            'depth' => 0.8,          // 0.0 to 1.0
            'mix' => 0.7             // 0.0 to 1.0
        ];
        
        $params = array_merge($defaultParams, $parameters);
        
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $filterBuffer = array_fill(0, 2, 0);
        
        foreach ($samples as $i => $sample) {
            // Calculate modulation
            $modulation = sin(2 * M_PI * $params['rate'] * $i / $this->sampleRate);
            $frequency = 500 + (2000 * $params['depth'] * $modulation);
            
            // Apply band-pass filter
            $filteredSample = $this->applyBandPassFilter($sample, $frequency, $filterBuffer);
            
            // Mix original and filtered
            $processedSamples[] = ($sample * (1 - $params['mix'])) + ($filteredSample * $params['mix']);
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Helper methods for distortion types
     */
    private function softClip($sample) {
        if ($sample > 1.0) {
            return 1.0 - exp(-$sample + 1.0);
        } elseif ($sample < -1.0) {
            return -1.0 + exp($sample + 1.0);
        }
        return $sample;
    }
    
    private function hardClip($sample) {
        return max(-1.0, min(1.0, $sample));
    }
    
    private function tubeDistortion($sample) {
        // Tube saturation curve
        return (2.0 / M_PI) * atan($sample * 3.0);
    }
    
    /**
     * Filter creation methods
     */
    private function createLowPassFilter($frequency) {
        $omega = 2 * M_PI * $frequency / $this->sampleRate;
        $alpha = sin($omega) / (2.0 * 0.707);
        
        $b0 = (1.0 - cos($omega)) / 2.0;
        $b1 = 1.0 - cos($omega);
        $b2 = (1.0 - cos($omega)) / 2.0;
        $a0 = 1.0 + $alpha;
        $a1 = -2.0 * cos($omega);
        $a2 = 1.0 - $alpha;
        
        return [
            'b' => [$b0 / $a0, $b1 / $a0, $b2 / $a0],
            'a' => [1.0, $a1 / $a0, $a2 / $a0]
        ];
    }
    
    private function createHighPassFilter($frequency) {
        $omega = 2 * M_PI * $frequency / $this->sampleRate;
        $alpha = sin($omega) / (2.0 * 0.707);
        
        $b0 = (1.0 + cos($omega)) / 2.0;
        $b1 = -(1.0 + cos($omega));
        $b2 = (1.0 + cos($omega)) / 2.0;
        $a0 = 1.0 + $alpha;
        $a1 = -2.0 * cos($omega);
        $a2 = 1.0 - $alpha;
        
        return [
            'b' => [$b0 / $a0, $b1 / $a0, $b2 / $a0],
            'a' => [1.0, $a1 / $a0, $a2 / $a0]
        ];
    }
    
    private function applyFilter($sample, $filter, &$buffer) {
        $output = $filter['b'][0] * $sample + $filter['b'][1] * $buffer[0] + $filter['b'][2] * $buffer[1];
        $output -= $filter['a'][1] * $buffer[0] + $filter['a'][2] * $buffer[1];
        
        $buffer[1] = $buffer[0];
        $buffer[0] = $sample;
        
        return $output;
    }
    
    private function applyAllPassFilter($sample, $frequency, &$buffer) {
        $omega = 2 * M_PI * $frequency / $this->sampleRate;
        $alpha = sin($omega) / (2.0 * 0.707);
        
        $b0 = 1.0 - $alpha;
        $b1 = -2.0 * cos($omega);
        $b2 = 1.0 + $alpha;
        $a0 = 1.0 + $alpha;
        $a1 = -2.0 * cos($omega);
        $a2 = 1.0 - $alpha;
        
        $output = ($b0 * $sample + $b1 * $buffer[0] + $b2 * $buffer[1]) / $a0;
        $output -= ($a1 * $buffer[0] + $a2 * $buffer[1]) / $a0;
        
        $buffer[1] = $buffer[0];
        $buffer[0] = $sample;
        
        return $output;
    }
    
    private function applyBandPassFilter($sample, $frequency, &$buffer) {
        $omega = 2 * M_PI * $frequency / $this->sampleRate;
        $q = 1.0;
        $alpha = sin($omega) / (2.0 * $q);
        
        $b0 = $alpha;
        $b1 = 0;
        $b2 = -$alpha;
        $a0 = 1.0 + $alpha;
        $a1 = -2.0 * cos($omega);
        $a2 = 1.0 - $alpha;
        
        $output = ($b0 * $sample + $b1 * $buffer[0] + $b2 * $buffer[1]) / $a0;
        $output -= ($a1 * $buffer[0] + $a2 * $buffer[1]) / $a0;
        
        $buffer[1] = $buffer[0];
        $buffer[0] = $sample;
        
        return $output;
    }
    
    /**
     * Audio data conversion methods
     */
    private function audioDataToSamples($audioData) {
        $samples = [];
        $sampleCount = strlen($audioData) / 2; // 16-bit samples
        
        for ($i = 0; $i < $sampleCount; $i++) {
            $sample = unpack('s', substr($audioData, $i * 2, 2))[1];
            $samples[] = $sample / 32767.0; // Normalize to -1.0 to 1.0
        }
        
        return $samples;
    }
    
    private function samplesToAudioData($samples) {
        $audioData = '';
        
        foreach ($samples as $sample) {
            // Clamp to valid range
            $sample = max(-1.0, min(1.0, $sample));
            
            // Convert to 16-bit PCM
            $pcm = (int)($sample * 32767);
            $audioData .= pack('s', $pcm);
        }
        
        return $audioData;
    }
    
    /**
     * Get available effects
     */
    public function getAvailableEffects() {
        return [
            'reverb' => [
                'name' => 'Reverb',
                'description' => 'Adds room ambience and space',
                'parameters' => [
                    'room_size' => ['type' => 'float', 'min' => 0.1, 'max' => 1.0, 'default' => 0.5],
                    'damping' => ['type' => 'float', 'min' => 0.1, 'max' => 1.0, 'default' => 0.5],
                    'wet_level' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.3],
                    'dry_level' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.7]
                ]
            ],
            'echo' => [
                'name' => 'Echo',
                'description' => 'Creates repeating delayed copies',
                'parameters' => [
                    'delay_time' => ['type' => 'float', 'min' => 0.1, 'max' => 2.0, 'default' => 0.3],
                    'feedback' => ['type' => 'float', 'min' => 0.0, 'max' => 0.9, 'default' => 0.5],
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.5]
                ]
            ],
            'chorus' => [
                'name' => 'Chorus',
                'description' => 'Adds thickness and movement',
                'parameters' => [
                    'rate' => ['type' => 'float', 'min' => 0.1, 'max' => 5.0, 'default' => 1.5],
                    'depth' => ['type' => 'float', 'min' => 0.001, 'max' => 0.01, 'default' => 0.002],
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.5],
                    'voices' => ['type' => 'int', 'min' => 2, 'max' => 6, 'default' => 3]
                ]
            ],
            'distortion' => [
                'name' => 'Distortion',
                'description' => 'Adds harmonic saturation',
                'parameters' => [
                    'gain' => ['type' => 'float', 'min' => 1, 'max' => 40, 'default' => 20],
                    'distortion_type' => ['type' => 'select', 'options' => ['soft', 'hard', 'tube'], 'default' => 'soft'],
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.8]
                ]
            ],
            'compression' => [
                'name' => 'Compression',
                'description' => 'Controls dynamic range',
                'parameters' => [
                    'threshold' => ['type' => 'float', 'min' => -60, 'max' => 0, 'default' => -20],
                    'ratio' => ['type' => 'float', 'min' => 1, 'max' => 20, 'default' => 4],
                    'attack' => ['type' => 'float', 'min' => 0.001, 'max' => 0.1, 'default' => 0.005],
                    'release' => ['type' => 'float', 'min' => 0.01, 'max' => 1.0, 'default' => 0.1]
                ]
            ],
            'eq' => [
                'name' => 'Equalizer',
                'description' => 'Adjusts frequency balance',
                'parameters' => [
                    'low_gain' => ['type' => 'float', 'min' => -12, 'max' => 12, 'default' => 0],
                    'mid_gain' => ['type' => 'float', 'min' => -12, 'max' => 12, 'default' => 0],
                    'high_gain' => ['type' => 'float', 'min' => -12, 'max' => 12, 'default' => 0],
                    'low_freq' => ['type' => 'float', 'min' => 50, 'max' => 500, 'default' => 200],
                    'high_freq' => ['type' => 'float', 'min' => 1000, 'max' => 8000, 'default' => 2000]
                ]
            ]
        ];
    }
}

/**
 * Effects Library Class
 */
class EffectsLibrary {
    public function __construct() {
        // Initialize effects library
    }
}

// Helper function to get audio effects engine instance
function audio_effects_engine() {
    return new AudioEffectsEngine();
}
?>