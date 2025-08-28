<?php
require_once 'config.php';

/**
 * Advanced Audio Effects Engine
 * Professional Real-Time Audio Processing
 * 100% Original - Studio Quality
 */
class AdvancedAudioEffects {
    private $config;
    private $sampleRate;
    private $bufferSize;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'buffer_size' => 1024,
            'bit_depth' => 24,
            'channels' => 2,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->bufferSize = $this->config['buffer_size'];
    }
    
    /**
     * Apply Reverb effect
     */
    public function applyReverb($audioData, $roomSize = 0.5, $damping = 0.5, $wetLevel = 0.3, $dryLevel = 0.7) {
        try {
            $reverb = [];
            $delayBuffer = array_fill(0, intval($roomSize * $this->sampleRate), 0);
            $delayIndex = 0;
            
            foreach ($audioData as $sample) {
                // Get delayed sample from buffer
                $delayedSample = $delayBuffer[$delayIndex];
                
                // Apply damping
                $delayedSample *= (1 - $damping);
                
                // Mix with current sample
                $reverbSample = ($sample * $dryLevel) + ($delayedSample * $wetLevel);
                
                // Store in delay buffer
                $delayBuffer[$delayIndex] = $sample + ($delayedSample * 0.6);
                
                // Update delay index
                $delayIndex = ($delayIndex + 1) % count($delayBuffer);
                
                $reverb[] = $reverbSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'reverb',
                    'parameters' => [
                        'room_size' => $roomSize,
                        'damping' => $damping,
                        'wet_level' => $wetLevel,
                        'dry_level' => $dryLevel
                    ],
                    'audio_data' => $reverb
                ]
            ];
        } catch (Exception $e) {
            error_log("Reverb Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply reverb effect'
            ];
        }
    }
    
    /**
     * Apply Delay effect
     */
    public function applyDelay($audioData, $delayTime = 0.3, $feedback = 0.5, $mix = 0.5) {
        try {
            $delay = [];
            $delaySamples = intval($delayTime * $this->sampleRate);
            $delayBuffer = array_fill(0, $delaySamples, 0);
            $bufferIndex = 0;
            
            foreach ($audioData as $sample) {
                // Get delayed sample
                $delayedSample = $delayBuffer[$bufferIndex];
                
                // Mix original and delayed
                $outputSample = ($sample * (1 - $mix)) + ($delayedSample * $mix);
                
                // Store in delay buffer with feedback
                $delayBuffer[$bufferIndex] = $sample + ($delayedSample * $feedback);
                
                // Update buffer index
                $bufferIndex = ($bufferIndex + 1) % $delaySamples;
                
                $delay[] = $outputSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'delay',
                    'parameters' => [
                        'delay_time' => $delayTime,
                        'feedback' => $feedback,
                        'mix' => $mix
                    ],
                    'audio_data' => $delay
                ]
            ];
        } catch (Exception $e) {
            error_log("Delay Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply delay effect'
            ];
        }
    }
    
    /**
     * Apply Chorus effect
     */
    public function applyChorus($audioData, $rate = 1.5, $depth = 0.002, $mix = 0.5) {
        try {
            $chorus = [];
            $lfoPhase = 0;
            $lfoIncrement = 2 * M_PI * $rate / $this->sampleRate;
            
            foreach ($audioData as $sample) {
                // Generate LFO for modulation
                $modulation = sin($lfoPhase) * $depth * $this->sampleRate;
                
                // Get modulated sample (simplified interpolation)
                $modIndex = max(0, min(count($audioData) - 1, $modulation));
                $modulatedSample = $audioData[intval($modIndex)];
                
                // Mix original and modulated
                $outputSample = ($sample * (1 - $mix)) + ($modulatedSample * $mix);
                
                // Update LFO phase
                $lfoPhase += $lfoIncrement;
                if ($lfoPhase >= 2 * M_PI) {
                    $lfoPhase -= 2 * M_PI;
                }
                
                $chorus[] = $outputSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'chorus',
                    'parameters' => [
                        'rate' => $rate,
                        'depth' => $depth,
                        'mix' => $mix
                    ],
                    'audio_data' => $chorus
                ]
            ];
        } catch (Exception $e) {
            error_log("Chorus Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply chorus effect'
            ];
        }
    }
    
    /**
     * Apply Distortion effect
     */
    public function applyDistortion($audioData, $gain = 2.0, $distortion = 0.8, $mix = 0.7) {
        try {
            $distorted = [];
            
            foreach ($audioData as $sample) {
                // Apply gain
                $gainedSample = $sample * $gain;
                
                // Apply distortion (soft clipping)
                if ($gainedSample > 0) {
                    $distortedSample = 1 - exp(-$gainedSample * $distortion);
                } else {
                    $distortedSample = -1 + exp($gainedSample * $distortion);
                }
                
                // Mix original and distorted
                $outputSample = ($sample * (1 - $mix)) + ($distortedSample * $mix);
                
                // Clamp to valid range
                $outputSample = max(-1, min(1, $outputSample));
                
                $distorted[] = $outputSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'distortion',
                    'parameters' => [
                        'gain' => $gain,
                        'distortion' => $distortion,
                        'mix' => $mix
                    ],
                    'audio_data' => $distorted
                ]
            ];
        } catch (Exception $e) {
            error_log("Distortion Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply distortion effect'
            ];
        }
    }
    
    /**
     * Apply Compression effect
     */
    public function applyCompression($audioData, $threshold = 0.5, $ratio = 4.0, $attack = 0.01, $release = 0.1) {
        try {
            $compressed = [];
            $envelope = 0;
            $attackCoeff = exp(-1 / ($attack * $this->sampleRate));
            $releaseCoeff = exp(-1 / ($release * $this->sampleRate));
            
            foreach ($audioData as $sample) {
                $absSample = abs($sample);
                
                // Update envelope
                if ($absSample > $envelope) {
                    $envelope = $absSample * (1 - $attackCoeff) + $envelope * $attackCoeff;
                } else {
                    $envelope = $absSample * (1 - $releaseCoeff) + $envelope * $releaseCoeff;
                }
                
                // Calculate gain reduction
                if ($envelope > $threshold) {
                    $gainReduction = pow(($threshold / $envelope), (1 - 1 / $ratio));
                } else {
                    $gainReduction = 1.0;
                }
                
                $compressed[] = $sample * $gainReduction;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'compression',
                    'parameters' => [
                        'threshold' => $threshold,
                        'ratio' => $ratio,
                        'attack' => $attack,
                        'release' => $release
                    ],
                    'audio_data' => $compressed
                ]
            ];
        } catch (Exception $e) {
            error_log("Compression Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply compression effect'
            ];
        }
    }
    
    /**
     * Apply EQ (Equalizer) effect
     */
    public function applyEQ($audioData, $bands = []) {
        try {
            $eqed = $audioData;
            
            // Default EQ bands if none provided
            if (empty($bands)) {
                $bands = [
                    ['frequency' => 60, 'gain' => 0, 'q' => 1.0],    // Low
                    ['frequency' => 250, 'gain' => 0, 'q' => 1.0],   // Low-Mid
                    ['frequency' => 1000, 'gain' => 0, 'q' => 1.0],  // Mid
                    ['frequency' => 4000, 'gain' => 0, 'q' => 1.0],  // High-Mid
                    ['frequency' => 10000, 'gain' => 0, 'q' => 1.0]  // High
                ];
            }
            
            foreach ($bands as $band) {
                $eqed = $this->applyEQBand($eqed, $band['frequency'], $band['gain'], $band['q']);
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'eq',
                    'parameters' => [
                        'bands' => $bands
                    ],
                    'audio_data' => $eqed
                ]
            ];
        } catch (Exception $e) {
            error_log("EQ Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply EQ effect'
            ];
        }
    }
    
    /**
     * Apply individual EQ band
     */
    private function applyEQBand($audioData, $frequency, $gain, $q) {
        $eqed = [];
        $w0 = 2 * M_PI * $frequency / $this->sampleRate;
        $alpha = sin($w0) / (2 * $q);
        
        $b0 = 1 + $alpha;
        $b1 = -2 * cos($w0);
        $b2 = 1 - $alpha;
        $a0 = 1 + $alpha;
        $a1 = -2 * cos($w0);
        $a2 = 1 - $alpha;
        
        // Apply filter coefficients
        $x1 = $x2 = $y1 = $y2 = 0;
        
        foreach ($audioData as $sample) {
            $output = ($b0 * $sample + $b1 * $x1 + $b2 * $x2 - $a1 * $y1 - $a2 * $y2) / $a0;
            
            $x2 = $x1;
            $x1 = $sample;
            $y2 = $y1;
            $y1 = $output;
            
            $eqed[] = $output * pow(10, $gain / 20);
        }
        
        return $eqed;
    }
    
    /**
     * Apply Flanger effect
     */
    public function applyFlanger($audioData, $rate = 0.5, $depth = 0.002, $feedback = 0.3, $mix = 0.5) {
        try {
            $flanged = [];
            $lfoPhase = 0;
            $lfoIncrement = 2 * M_PI * $rate / $this->sampleRate;
            $delayBuffer = array_fill(0, intval($depth * $this->sampleRate), 0);
            $bufferIndex = 0;
            
            foreach ($audioData as $sample) {
                // Generate LFO for modulation
                $modulation = sin($lfoPhase) * $depth * $this->sampleRate;
                
                // Get delayed sample
                $modIndex = ($bufferIndex - intval($modulation) + count($delayBuffer)) % count($delayBuffer);
                $delayedSample = $delayBuffer[$modIndex];
                
                // Mix original and delayed
                $outputSample = ($sample * (1 - $mix)) + ($delayedSample * $mix);
                
                // Store in delay buffer with feedback
                $delayBuffer[$bufferIndex] = $sample + ($delayedSample * $feedback);
                
                // Update buffer index
                $bufferIndex = ($bufferIndex + 1) % count($delayBuffer);
                
                // Update LFO phase
                $lfoPhase += $lfoIncrement;
                if ($lfoPhase >= 2 * M_PI) {
                    $lfoPhase -= 2 * M_PI;
                }
                
                $flanged[] = $outputSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'flanger',
                    'parameters' => [
                        'rate' => $rate,
                        'depth' => $depth,
                        'feedback' => $feedback,
                        'mix' => $mix
                    ],
                    'audio_data' => $flanged
                ]
            ];
        } catch (Exception $e) {
            error_log("Flanger Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply flanger effect'
            ];
        }
    }
    
    /**
     * Apply Phaser effect
     */
    public function applyPhaser($audioData, $rate = 0.5, $depth = 0.5, $feedback = 0.3, $stages = 4) {
        try {
            $phased = [];
            $lfoPhase = 0;
            $lfoIncrement = 2 * M_PI * $rate / $this->sampleRate;
            
            // Initialize all-pass filter states
            $filterStates = array_fill(0, $stages, ['x1' => 0, 'y1' => 0]);
            
            foreach ($audioData as $sample) {
                // Generate LFO for modulation
                $modulation = sin($lfoPhase) * $depth;
                
                // Apply all-pass filters in series
                $filteredSample = $sample;
                foreach ($filterStates as &$state) {
                    $w0 = 2 * M_PI * (1000 + 8000 * $modulation) / $this->sampleRate;
                    $alpha = sin($w0) / (2 * 0.7);
                    
                    $b0 = 1 - $alpha;
                    $b1 = -2 * cos($w0);
                    $b2 = 1 + $alpha;
                    $a0 = 1 + $alpha;
                    $a1 = -2 * cos($w0);
                    $a2 = 1 - $alpha;
                    
                    $output = ($b0 * $filteredSample + $b1 * $state['x1'] + $b2 * $state['x2'] - $a1 * $state['y1'] - $a2 * $state['y2']) / $a0;
                    
                    $state['x2'] = $state['x1'];
                    $state['x1'] = $filteredSample;
                    $state['y2'] = $state['y1'];
                    $state['y1'] = $output;
                    
                    $filteredSample = $output;
                }
                
                // Mix original and filtered with feedback
                $outputSample = $sample + ($filteredSample * $feedback);
                
                // Update LFO phase
                $lfoPhase += $lfoIncrement;
                if ($lfoPhase >= 2 * M_PI) {
                    $lfoPhase -= 2 * M_PI;
                }
                
                $phased[] = $outputSample;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'phaser',
                    'parameters' => [
                        'rate' => $rate,
                        'depth' => $depth,
                        'feedback' => $feedback,
                        'stages' => $stages
                    ],
                    'audio_data' => $phased
                ]
            ];
        } catch (Exception $e) {
            error_log("Phaser Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply phaser effect'
            ];
        }
    }
    
    /**
     * Apply Wah-Wah effect
     */
    public function applyWahWah($audioData, $rate = 2.0, $depth = 0.5, $resonance = 2.0) {
        try {
            $wahWah = [];
            $lfoPhase = 0;
            $lfoIncrement = 2 * M_PI * $rate / $this->sampleRate;
            
            // Initialize filter state
            $x1 = $x2 = $y1 = $y2 = 0;
            
            foreach ($audioData as $sample) {
                // Generate LFO for modulation
                $modulation = sin($lfoPhase) * $depth;
                
                // Calculate center frequency (500Hz to 2000Hz)
                $centerFreq = 500 + 1500 * (0.5 + 0.5 * $modulation);
                
                // Apply resonant filter
                $w0 = 2 * M_PI * $centerFreq / $this->sampleRate;
                $alpha = sin($w0) / (2 * $resonance);
                
                $b0 = $alpha;
                $b1 = 0;
                $b2 = -$alpha;
                $a0 = 1 + $alpha;
                $a1 = -2 * cos($w0);
                $a2 = 1 - $alpha;
                
                $output = ($b0 * $sample + $b1 * $x1 + $b2 * $x2 - $a1 * $y1 - $a2 * $y2) / $a0;
                
                $x2 = $x1;
                $x1 = $sample;
                $y2 = $y1;
                $y1 = $output;
                
                // Update LFO phase
                $lfoPhase += $lfoIncrement;
                if ($lfoPhase >= 2 * M_PI) {
                    $lfoPhase -= 2 * M_PI;
                }
                
                $wahWah[] = $output;
            }
            
            return [
                'success' => true,
                'data' => [
                    'effect' => 'wah_wah',
                    'parameters' => [
                        'rate' => $rate,
                        'depth' => $depth,
                        'resonance' => $resonance
                    ],
                    'audio_data' => $wahWah
                ]
            ];
        } catch (Exception $e) {
            error_log("Wah-Wah Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply wah-wah effect'
            ];
        }
    }
    
    /**
     * Apply multiple effects in chain
     */
    public function applyEffectChain($audioData, $effects = []) {
        try {
            $processedAudio = $audioData;
            $appliedEffects = [];
            
            foreach ($effects as $effect) {
                $effectName = $effect['name'];
                $parameters = $effect['parameters'] ?? [];
                
                switch ($effectName) {
                    case 'reverb':
                        $result = $this->applyReverb($processedAudio, 
                            $parameters['room_size'] ?? 0.5,
                            $parameters['damping'] ?? 0.5,
                            $parameters['wet_level'] ?? 0.3,
                            $parameters['dry_level'] ?? 0.7
                        );
                        break;
                        
                    case 'delay':
                        $result = $this->applyDelay($processedAudio,
                            $parameters['delay_time'] ?? 0.3,
                            $parameters['feedback'] ?? 0.5,
                            $parameters['mix'] ?? 0.5
                        );
                        break;
                        
                    case 'chorus':
                        $result = $this->applyChorus($processedAudio,
                            $parameters['rate'] ?? 1.5,
                            $parameters['depth'] ?? 0.002,
                            $parameters['mix'] ?? 0.5
                        );
                        break;
                        
                    case 'distortion':
                        $result = $this->applyDistortion($processedAudio,
                            $parameters['gain'] ?? 2.0,
                            $parameters['distortion'] ?? 0.8,
                            $parameters['mix'] ?? 0.7
                        );
                        break;
                        
                    case 'compression':
                        $result = $this->applyCompression($processedAudio,
                            $parameters['threshold'] ?? 0.5,
                            $parameters['ratio'] ?? 4.0,
                            $parameters['attack'] ?? 0.01,
                            $parameters['release'] ?? 0.1
                        );
                        break;
                        
                    case 'eq':
                        $result = $this->applyEQ($processedAudio, $parameters['bands'] ?? []);
                        break;
                        
                    case 'flanger':
                        $result = $this->applyFlanger($processedAudio,
                            $parameters['rate'] ?? 0.5,
                            $parameters['depth'] ?? 0.002,
                            $parameters['feedback'] ?? 0.3,
                            $parameters['mix'] ?? 0.5
                        );
                        break;
                        
                    case 'phaser':
                        $result = $this->applyPhaser($processedAudio,
                            $parameters['rate'] ?? 0.5,
                            $parameters['depth'] ?? 0.5,
                            $parameters['feedback'] ?? 0.3,
                            $parameters['stages'] ?? 4
                        );
                        break;
                        
                    case 'wah_wah':
                        $result = $this->applyWahWah($processedAudio,
                            $parameters['rate'] ?? 2.0,
                            $parameters['depth'] ?? 0.5,
                            $parameters['resonance'] ?? 2.0
                        );
                        break;
                        
                    default:
                        continue 2; // Skip unknown effects
                }
                
                if ($result['success']) {
                    $processedAudio = $result['data']['audio_data'];
                    $appliedEffects[] = $result['data'];
                }
            }
            
            return [
                'success' => true,
                'data' => [
                    'effects_applied' => $appliedEffects,
                    'final_audio' => $processedAudio
                ]
            ];
        } catch (Exception $e) {
            error_log("Effect Chain Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply effect chain'
            ];
        }
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
                    'damping' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.5],
                    'wet_level' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.3],
                    'dry_level' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.7]
                ]
            ],
            'delay' => [
                'name' => 'Delay',
                'description' => 'Creates echo and time-based effects',
                'parameters' => [
                    'delay_time' => ['type' => 'float', 'min' => 0.01, 'max' => 2.0, 'default' => 0.3],
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
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.5]
                ]
            ],
            'distortion' => [
                'name' => 'Distortion',
                'description' => 'Adds harmonic saturation and grit',
                'parameters' => [
                    'gain' => ['type' => 'float', 'min' => 1.0, 'max' => 10.0, 'default' => 2.0],
                    'distortion' => ['type' => 'float', 'min' => 0.1, 'max' => 2.0, 'default' => 0.8],
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.7]
                ]
            ],
            'compression' => [
                'name' => 'Compression',
                'description' => 'Controls dynamic range',
                'parameters' => [
                    'threshold' => ['type' => 'float', 'min' => 0.1, 'max' => 1.0, 'default' => 0.5],
                    'ratio' => ['type' => 'float', 'min' => 1.0, 'max' => 20.0, 'default' => 4.0],
                    'attack' => ['type' => 'float', 'min' => 0.001, 'max' => 0.1, 'default' => 0.01],
                    'release' => ['type' => 'float', 'min' => 0.01, 'max' => 1.0, 'default' => 0.1]
                ]
            ],
            'eq' => [
                'name' => 'Equalizer',
                'description' => 'Adjusts frequency response',
                'parameters' => [
                    'bands' => ['type' => 'array', 'description' => 'Array of frequency bands with gain and Q']
                ]
            ],
            'flanger' => [
                'name' => 'Flanger',
                'description' => 'Creates jet-like sweeping effect',
                'parameters' => [
                    'rate' => ['type' => 'float', 'min' => 0.1, 'max' => 2.0, 'default' => 0.5],
                    'depth' => ['type' => 'float', 'min' => 0.001, 'max' => 0.01, 'default' => 0.002],
                    'feedback' => ['type' => 'float', 'min' => 0.0, 'max' => 0.9, 'default' => 0.3],
                    'mix' => ['type' => 'float', 'min' => 0.0, 'max' => 1.0, 'default' => 0.5]
                ]
            ],
            'phaser' => [
                'name' => 'Phaser',
                'description' => 'Creates sweeping notch filter effect',
                'parameters' => [
                    'rate' => ['type' => 'float', 'min' => 0.1, 'max' => 2.0, 'default' => 0.5],
                    'depth' => ['type' => 'float', 'min' => 0.1, 'max' => 1.0, 'default' => 0.5],
                    'feedback' => ['type' => 'float', 'min' => 0.0, 'max' => 0.9, 'default' => 0.3],
                    'stages' => ['type' => 'int', 'min' => 2, 'max' => 8, 'default' => 4]
                ]
            ],
            'wah_wah' => [
                'name' => 'Wah-Wah',
                'description' => 'Creates vocal-like filtering effect',
                'parameters' => [
                    'rate' => ['type' => 'float', 'min' => 0.5, 'max' => 5.0, 'default' => 2.0],
                    'depth' => ['type' => 'float', 'min' => 0.1, 'max' => 1.0, 'default' => 0.5],
                    'resonance' => ['type' => 'float', 'min' => 0.5, 'max' => 5.0, 'default' => 2.0]
                ]
            ]
        ];
    }
}

// Helper function to get advanced audio effects instance
function advanced_audio_effects() {
    return new AdvancedAudioEffects();
}
?>