<?php
require_once 'config.php';

/**
 * Professional Mixing Console
 * Advanced Audio Mixing and Processing
 * 100% Original - Studio Quality
 */
class MixingConsole {
    private $config;
    private $sampleRate;
    private $channels;
    private $tracks;
    private $master;
    private $effectsEngine;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 24,
            'channels' => 2,
            'buffer_size' => 4096,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->channels = $this->config['channels'];
        $this->tracks = [];
        $this->master = $this->initializeMaster();
        $this->effectsEngine = new AudioEffectsEngine();
    }
    
    /**
     * Initialize master bus
     */
    private function initializeMaster() {
        return [
            'volume' => 1.0,
            'pan' => 0.0,
            'mute' => false,
            'solo' => false,
            'effects' => [],
            'eq' => [
                'low_gain' => 0,
                'mid_gain' => 0,
                'high_gain' => 0,
                'low_freq' => 200,
                'high_freq' => 2000
            ],
            'compression' => [
                'enabled' => false,
                'threshold' => -20,
                'ratio' => 4,
                'attack' => 0.005,
                'release' => 0.1,
                'makeup_gain' => 0
            ],
            'limiting' => [
                'enabled' => false,
                'threshold' => -1.0,
                'release' => 0.1
            ],
            'stereo_enhancement' => [
                'enabled' => false,
                'width' => 1.2,
                'phase' => 0
            ]
        ];
    }
    
    /**
     * Add track to console
     */
    public function addTrack($name, $type = 'audio', $instrument = null) {
        $track = [
            'id' => uniqid('track_'),
            'name' => $name,
            'type' => $type,
            'instrument' => $instrument,
            'volume' => 1.0,
            'pan' => 0.0,
            'mute' => false,
            'solo' => false,
            'record_arm' => false,
            'monitor' => false,
            'effects' => [],
            'eq' => [
                'low_gain' => 0,
                'mid_gain' => 0,
                'high_gain' => 0,
                'low_freq' => 200,
                'high_freq' => 2000
            ],
            'compression' => [
                'enabled' => false,
                'threshold' => -20,
                'ratio' => 4,
                'attack' => 0.005,
                'release' => 0.1,
                'makeup_gain' => 0
            ],
            'gate' => [
                'enabled' => false,
                'threshold' => -40,
                'attack' => 0.001,
                'release' => 0.1,
                'ratio' => 10
            ],
            'automation' => [],
            'clips' => [],
            'input_gain' => 1.0,
            'output_gain' => 1.0,
            'phase_invert' => false,
            'mono' => false
        ];
        
        $this->tracks[] = $track;
        return $track['id'];
    }
    
    /**
     * Remove track from console
     */
    public function removeTrack($trackId) {
        foreach ($this->tracks as $key => $track) {
            if ($track['id'] === $trackId) {
                unset($this->tracks[$key]);
                $this->tracks = array_values($this->tracks);
                return true;
            }
        }
        return false;
    }
    
    /**
     * Set track volume
     */
    public function setTrackVolume($trackId, $volume) {
        $volume = max(0.0, min(2.0, $volume)); // 0.0 to 2.0
        
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['volume'] = $volume;
                return true;
            }
        }
        return false;
    }
    
    /**
     * Set track pan
     */
    public function setTrackPan($trackId, $pan) {
        $pan = max(-1.0, min(1.0, $pan)); // -1.0 (left) to 1.0 (right)
        
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['pan'] = $pan;
                return true;
            }
        }
        return false;
    }
    
    /**
     * Mute/unmute track
     */
    public function setTrackMute($trackId, $mute) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['mute'] = $mute;
                return true;
            }
        }
        return false;
    }
    
    /**
     * Solo/unsolo track
     */
    public function setTrackSolo($trackId, $solo) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['solo'] = $solo;
                return true;
            }
        }
        return false;
    }
    
    /**
     * Add effect to track
     */
    public function addTrackEffect($trackId, $effectType, $parameters = []) {
        $effect = [
            'id' => uniqid('effect_'),
            'type' => $effectType,
            'parameters' => $parameters,
            'enabled' => true,
            'bypass' => false
        ];
        
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['effects'][] = $effect;
                return $effect['id'];
            }
        }
        return false;
    }
    
    /**
     * Remove effect from track
     */
    public function removeTrackEffect($trackId, $effectId) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                foreach ($track['effects'] as $key => $effect) {
                    if ($effect['id'] === $effectId) {
                        unset($track['effects'][$key]);
                        $track['effects'] = array_values($track['effects']);
                        return true;
                    }
                }
            }
        }
        return false;
    }
    
    /**
     * Set track EQ settings
     */
    public function setTrackEQ($trackId, $eqSettings) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['eq'] = array_merge($track['eq'], $eqSettings);
                return true;
            }
        }
        return false;
    }
    
    /**
     * Set track compression settings
     */
    public function setTrackCompression($trackId, $compressionSettings) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['compression'] = array_merge($track['compression'], $compressionSettings);
                return true;
            }
        }
        return false;
    }
    
    /**
     * Set track gate settings
     */
    public function setTrackGate($trackId, $gateSettings) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['gate'] = array_merge($track['gate'], $gateSettings);
                return true;
            }
        }
        return false;
    }
    
    /**
     * Add automation point to track
     */
    public function addAutomationPoint($trackId, $parameter, $time, $value, $curve = 'linear') {
        $automationPoint = [
            'id' => uniqid('auto_'),
            'parameter' => $parameter,
            'time' => $time,
            'value' => $value,
            'curve' => $curve
        ];
        
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                $track['automation'][] = $automationPoint;
                // Sort by time
                usort($track['automation'], function($a, $b) {
                    return $a['time'] <=> $b['time'];
                });
                return $automationPoint['id'];
            }
        }
        return false;
    }
    
    /**
     * Remove automation point from track
     */
    public function removeAutomationPoint($trackId, $automationId) {
        foreach ($this->tracks as &$track) {
            if ($track['id'] === $trackId) {
                foreach ($track['automation'] as $key => $point) {
                    if ($point['id'] === $automationId) {
                        unset($track['automation'][$key]);
                        $track['automation'] = array_values($track['automation']);
                        return true;
                    }
                }
            }
        }
        return false;
    }
    
    /**
     * Set master volume
     */
    public function setMasterVolume($volume) {
        $volume = max(0.0, min(2.0, $volume));
        $this->master['volume'] = $volume;
        return true;
    }
    
    /**
     * Set master pan
     */
    public function setMasterPan($pan) {
        $pan = max(-1.0, min(1.0, $pan));
        $this->master['pan'] = $pan;
        return true;
    }
    
    /**
     * Set master EQ
     */
    public function setMasterEQ($eqSettings) {
        $this->master['eq'] = array_merge($this->master['eq'], $eqSettings);
        return true;
    }
    
    /**
     * Set master compression
     */
    public function setMasterCompression($compressionSettings) {
        $this->master['compression'] = array_merge($this->master['compression'], $compressionSettings);
        return true;
    }
    
    /**
     * Set master limiting
     */
    public function setMasterLimiting($limitingSettings) {
        $this->master['limiting'] = array_merge($this->master['limiting'], $limitingSettings);
        return true;
    }
    
    /**
     * Set master stereo enhancement
     */
    public function setMasterStereoEnhancement($stereoSettings) {
        $this->master['stereo_enhancement'] = array_merge($this->master['stereo_enhancement'], $stereoSettings);
        return true;
    }
    
    /**
     * Mix all tracks
     */
    public function mixTracks($duration = 60) {
        try {
            $sampleRate = $this->sampleRate;
            $channels = $this->channels;
            $totalSamples = $duration * $sampleRate;
            
            // Initialize mix buffer
            $mixBuffer = array_fill(0, $totalSamples * $channels, 0);
            
            // Process each track
            foreach ($this->tracks as $track) {
                if ($track['mute']) continue;
                
                // Check if any track is soloed
                $hasSolo = false;
                foreach ($this->tracks as $t) {
                    if ($t['solo']) {
                        $hasSolo = true;
                        break;
                    }
                }
                
                // Skip if track is not soloed and there are soloed tracks
                if ($hasSolo && !$track['solo']) continue;
                
                $trackAudio = $this->processTrack($track, $duration);
                $this->mixTrackToBuffer($mixBuffer, $trackAudio, $track);
            }
            
            // Apply master processing
            $masteredAudio = $this->applyMasterProcessing($mixBuffer);
            
            return [
                'success' => true,
                'audio_data' => $masteredAudio,
                'duration' => $duration,
                'tracks_processed' => count($this->tracks)
            ];
            
        } catch (Exception $e) {
            error_log("Mixing Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Mixing failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Process individual track
     */
    private function processTrack($track, $duration) {
        $sampleRate = $this->sampleRate;
        $channels = $this->channels;
        $totalSamples = $duration * $sampleRate;
        
        // Initialize track buffer
        $trackBuffer = array_fill(0, $totalSamples * $channels, 0);
        
        // Process clips
        foreach ($track['clips'] as $clip) {
            $clipAudio = $this->processClip($clip);
            $this->addClipToBuffer($trackBuffer, $clipAudio, $clip, $track);
        }
        
        // Apply track effects
        $processedAudio = $this->applyTrackEffects($trackBuffer, $track);
        
        // Apply track processing
        $finalAudio = $this->applyTrackProcessing($processedAudio, $track);
        
        return $finalAudio;
    }
    
    /**
     * Process individual clip
     */
    private function processClip($clip) {
        // This would process the actual audio data from the clip
        // For now, return empty audio
        return str_repeat("\x00\x00", 44100 * 2); // 1 second stereo
    }
    
    /**
     * Add clip to track buffer
     */
    private function addClipToBuffer(&$trackBuffer, $clipAudio, $clip, $track) {
        $startSample = intval($clip['start_time'] * $this->sampleRate);
        $clipSamples = strlen($clipAudio) / 2; // 16-bit samples
        
        for ($i = 0; $i < $clipSamples && ($startSample + $i) < count($trackBuffer); $i++) {
            $trackBuffer[$startSample + $i] += unpack('s', substr($clipAudio, $i * 2, 2))[1];
        }
    }
    
    /**
     * Apply track effects
     */
    private function applyTrackEffects($audioData, $track) {
        $processedAudio = $audioData;
        
        foreach ($track['effects'] as $effect) {
            if ($effect['enabled'] && !$effect['bypass']) {
                $processedAudio = $this->effectsEngine->applyEffects($processedAudio, [$effect]);
            }
        }
        
        return $processedAudio;
    }
    
    /**
     * Apply track processing (EQ, compression, gate)
     */
    private function applyTrackProcessing($audioData, $track) {
        $processedAudio = $audioData;
        
        // Apply EQ
        if ($track['eq']['low_gain'] != 0 || $track['eq']['mid_gain'] != 0 || $track['eq']['high_gain'] != 0) {
            $processedAudio = $this->effectsEngine->applyEffects($processedAudio, [[
                'type' => 'eq',
                'parameters' => $track['eq']
            ]]);
        }
        
        // Apply compression
        if ($track['compression']['enabled']) {
            $processedAudio = $this->effectsEngine->applyEffects($processedAudio, [[
                'type' => 'compression',
                'parameters' => $track['compression']
            ]]);
        }
        
        // Apply gate
        if ($track['gate']['enabled']) {
            $processedAudio = $this->applyGate($processedAudio, $track['gate']);
        }
        
        return $processedAudio;
    }
    
    /**
     * Apply noise gate
     */
    private function applyGate($audioData, $gateSettings) {
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $threshold = pow(10, $gateSettings['threshold'] / 20);
        $attackCoeff = exp(-1 / ($gateSettings['attack'] * $this->sampleRate));
        $releaseCoeff = exp(-1 / ($gateSettings['release'] * $this->sampleRate));
        
        $envelope = 0;
        $gateOpen = false;
        
        foreach ($samples as $sample) {
            $absSample = abs($sample);
            
            // Calculate envelope
            if ($absSample > $envelope) {
                $envelope = $attackCoeff * ($envelope - $absSample) + $absSample;
            } else {
                $envelope = $releaseCoeff * ($envelope - $absSample) + $absSample;
            }
            
            // Determine gate state
            if ($envelope > $threshold) {
                $gateOpen = true;
            } else {
                $gateOpen = false;
            }
            
            // Apply gate
            if ($gateOpen) {
                $processedSamples[] = $sample;
            } else {
                $processedSamples[] = $sample * 0.01; // Very low level when closed
            }
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Mix track to main buffer
     */
    private function mixTrackToBuffer(&$mixBuffer, $trackAudio, $track) {
        $samples = $this->audioDataToSamples($trackAudio);
        $sampleCount = count($samples);
        
        // Apply track volume and pan
        $leftGain = $track['volume'] * (1 - $track['pan']) / 2;
        $rightGain = $track['volume'] * (1 + $track['pan']) / 2;
        
        for ($i = 0; $i < $sampleCount && $i < count($mixBuffer); $i++) {
            $channel = $i % $this->channels;
            
            if ($channel == 0) { // Left channel
                $mixBuffer[$i] += $samples[$i] * $leftGain;
            } else { // Right channel
                $mixBuffer[$i] += $samples[$i] * $rightGain;
            }
        }
    }
    
    /**
     * Apply master processing
     */
    private function applyMasterProcessing($mixBuffer) {
        $masteredAudio = $mixBuffer;
        
        // Apply master volume
        foreach ($masteredAudio as &$sample) {
            $sample *= $this->master['volume'];
        }
        
        // Apply master EQ
        if ($this->master['eq']['low_gain'] != 0 || $this->master['eq']['mid_gain'] != 0 || $this->master['eq']['high_gain'] != 0) {
            $masteredAudio = $this->effectsEngine->applyEffects($masteredAudio, [[
                'type' => 'eq',
                'parameters' => $this->master['eq']
            ]]);
        }
        
        // Apply master compression
        if ($this->master['compression']['enabled']) {
            $masteredAudio = $this->effectsEngine->applyEffects($masteredAudio, [[
                'type' => 'compression',
                'parameters' => $this->master['compression']
            ]]);
        }
        
        // Apply master limiting
        if ($this->master['limiting']['enabled']) {
            $masteredAudio = $this->applyLimiting($masteredAudio, $this->master['limiting']);
        }
        
        // Apply stereo enhancement
        if ($this->master['stereo_enhancement']['enabled']) {
            $masteredAudio = $this->applyStereoEnhancement($masteredAudio, $this->master['stereo_enhancement']);
        }
        
        return $masteredAudio;
    }
    
    /**
     * Apply limiting
     */
    private function applyLimiting($audioData, $limitingSettings) {
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $threshold = pow(10, $limitingSettings['threshold'] / 20);
        $releaseCoeff = exp(-1 / ($limitingSettings['release'] * $this->sampleRate));
        
        $envelope = 0;
        
        foreach ($samples as $sample) {
            $absSample = abs($sample);
            
            // Calculate envelope
            if ($absSample > $envelope) {
                $envelope = $absSample;
            } else {
                $envelope = $releaseCoeff * ($envelope - $absSample) + $absSample;
            }
            
            // Apply limiting
            if ($envelope > $threshold) {
                $gainReduction = $threshold / $envelope;
                $sample *= $gainReduction;
            }
            
            $processedSamples[] = $sample;
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Apply stereo enhancement
     */
    private function applyStereoEnhancement($audioData, $stereoSettings) {
        $samples = $this->audioDataToSamples($audioData);
        $processedSamples = [];
        
        $width = $stereoSettings['width'];
        $phase = $stereoSettings['phase'];
        
        for ($i = 0; $i < count($samples); $i += 2) {
            if ($i + 1 < count($samples)) {
                $left = $samples[$i];
                $right = $samples[$i + 1];
                
                // Calculate mid and side
                $mid = ($left + $right) / 2;
                $side = ($left - $right) / 2;
                
                // Enhance stereo width
                $side *= $width;
                
                // Apply phase shift
                $side *= cos($phase);
                
                // Reconstruct left and right
                $processedSamples[] = $mid + $side;
                $processedSamples[] = $mid - $side;
            }
        }
        
        return $this->samplesToAudioData($processedSamples);
    }
    
    /**
     * Get automation value at specific time
     */
    private function getAutomationValue($track, $parameter, $time) {
        $automation = $track['automation'];
        $value = null;
        
        // Find the automation points around the current time
        $beforePoint = null;
        $afterPoint = null;
        
        foreach ($automation as $point) {
            if ($point['parameter'] === $parameter) {
                if ($point['time'] <= $time) {
                    $beforePoint = $point;
                } else {
                    $afterPoint = $point;
                    break;
                }
            }
        }
        
        // If no automation, return default value
        if ($beforePoint === null && $afterPoint === null) {
            switch ($parameter) {
                case 'volume':
                    return $track['volume'];
                case 'pan':
                    return $track['pan'];
                default:
                    return 0;
            }
        }
        
        // If only one point, return its value
        if ($beforePoint === null) {
            return $afterPoint['value'];
        }
        if ($afterPoint === null) {
            return $beforePoint['value'];
        }
        
        // Interpolate between points
        $timeDiff = $afterPoint['time'] - $beforePoint['time'];
        $valueDiff = $afterPoint['value'] - $beforePoint['value'];
        $interpolation = ($time - $beforePoint['time']) / $timeDiff;
        
        // Apply curve
        switch ($beforePoint['curve']) {
            case 'exponential':
                $interpolation = $interpolation * $interpolation;
                break;
            case 'logarithmic':
                $interpolation = sqrt($interpolation);
                break;
            case 'sine':
                $interpolation = sin($interpolation * M_PI / 2);
                break;
            default: // linear
                break;
        }
        
        return $beforePoint['value'] + ($valueDiff * $interpolation);
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
     * Get console status
     */
    public function getConsoleStatus() {
        return [
            'tracks' => count($this->tracks),
            'master' => $this->master,
            'sample_rate' => $this->sampleRate,
            'channels' => $this->channels,
            'buffer_size' => $this->config['buffer_size']
        ];
    }
    
    /**
     * Get track information
     */
    public function getTrackInfo($trackId) {
        foreach ($this->tracks as $track) {
            if ($track['id'] === $trackId) {
                return $track;
            }
        }
        return null;
    }
    
    /**
     * Get all tracks
     */
    public function getAllTracks() {
        return $this->tracks;
    }
}

// Helper function to get mixing console instance
function mixing_console() {
    return new MixingConsole();
}
?>