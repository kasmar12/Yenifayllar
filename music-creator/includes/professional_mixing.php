<?php
require_once 'config.php';
require_once 'advanced_audio_effects.php';

/**
 * Professional Mixing Console
 * Multi-Track Audio Mixing & Mastering
 * 100% Original - Studio Quality
 */
class ProfessionalMixing {
    private $config;
    private $sampleRate;
    private $tracks;
    private $masterBus;
    private $effectsEngine;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 24,
            'channels' => 2,
            'max_tracks' => 64,
            'quality' => 'professional'
        ];
        
        $this->sampleRate = $this->config['sample_rate'];
        $this->tracks = [];
        $this->masterBus = [
            'volume' => 1.0,
            'pan' => 0.0,
            'mute' => false,
            'solo' => false,
            'effects' => [],
            'automation' => []
        ];
        
        $this->effectsEngine = advanced_audio_effects();
    }
    
    /**
     * Create new track
     */
    public function createTrack($trackId, $name = '', $type = 'audio') {
        try {
            $track = [
                'id' => $trackId,
                'name' => $name ?: "Track $trackId",
                'type' => $type,
                'volume' => 1.0,
                'pan' => 0.0,
                'mute' => false,
                'solo' => false,
                'audio_data' => [],
                'effects' => [],
                'automation' => [],
                'eq' => [
                    'low' => 0.0,
                    'low_mid' => 0.0,
                    'mid' => 0.0,
                    'high_mid' => 0.0,
                    'high' => 0.0
                ],
                'compression' => [
                    'enabled' => false,
                    'threshold' => 0.5,
                    'ratio' => 4.0,
                    'attack' => 0.01,
                    'release' => 0.1
                ],
                'gate' => [
                    'enabled' => false,
                    'threshold' => 0.1,
                    'ratio' => 10.0,
                    'attack' => 0.001,
                    'release' => 0.1
                ],
                'created_at' => microtime(true)
            ];
            
            $this->tracks[$trackId] = $track;
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'track' => $track,
                    'message' => 'Track created successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Create Track Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to create track'
            ];
        }
    }
    
    /**
     * Load audio data to track
     */
    public function loadAudioToTrack($trackId, $audioData, $startTime = 0) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $this->tracks[$trackId]['audio_data'] = $audioData;
            $this->tracks[$trackId]['start_time'] = $startTime;
            $this->tracks[$trackId]['duration'] = count($audioData) / $this->sampleRate;
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'duration' => $this->tracks[$trackId]['duration'],
                    'message' => 'Audio loaded to track successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Load Audio to Track Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load audio to track'
            ];
        }
    }
    
    /**
     * Set track volume
     */
    public function setTrackVolume($trackId, $volume) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $volume = max(0.0, min(2.0, $volume)); // Clamp between 0 and 2
            $this->tracks[$trackId]['volume'] = $volume;
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'volume' => $volume,
                    'message' => 'Track volume updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Track Volume Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update track volume'
            ];
        }
    }
    
    /**
     * Set track pan
     */
    public function setTrackPan($trackId, $pan) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $pan = max(-1.0, min(1.0, $pan)); // Clamp between -1 and 1
            $this->tracks[$trackId]['pan'] = $pan;
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'pan' => $pan,
                    'message' => 'Track pan updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Track Pan Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update track pan'
            ];
        }
    }
    
    /**
     * Mute/unmute track
     */
    public function toggleTrackMute($trackId) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $this->tracks[$trackId]['mute'] = !$this->tracks[$trackId]['mute'];
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'muted' => $this->tracks[$trackId]['mute'],
                    'message' => 'Track mute toggled successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Toggle Track Mute Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to toggle track mute'
            ];
        }
    }
    
    /**
     * Solo track
     */
    public function toggleTrackSolo($trackId) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $this->tracks[$trackId]['solo'] = !$this->tracks[$trackId]['solo'];
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'solo' => $this->tracks[$trackId]['solo'],
                    'message' => 'Track solo toggled successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Toggle Track Solo Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to toggle track solo'
            ];
        }
    }
    
    /**
     * Apply effect to track
     */
    public function applyEffectToTrack($trackId, $effectName, $parameters = []) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            if (empty($this->tracks[$trackId]['audio_data'])) {
                return [
                    'success' => false,
                    'message' => 'No audio data in track'
                ];
            }
            
            $effect = [
                'name' => $effectName,
                'parameters' => $parameters,
                'applied_at' => microtime(true)
            ];
            
            // Apply effect using effects engine
            $result = $this->effectsEngine->applyEffectChain(
                $this->tracks[$trackId]['audio_data'],
                [$effect]
            );
            
            if ($result['success']) {
                $this->tracks[$trackId]['audio_data'] = $result['data']['final_audio'];
                $this->tracks[$trackId]['effects'][] = $effect;
                
                return [
                    'success' => true,
                    'data' => [
                        'track_id' => $trackId,
                        'effect' => $effect,
                        'message' => 'Effect applied to track successfully'
                    ]
                ];
            } else {
                return $result;
            }
        } catch (Exception $e) {
            error_log("Apply Effect to Track Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to apply effect to track'
            ];
        }
    }
    
    /**
     * Set track EQ
     */
    public function setTrackEQ($trackId, $eqSettings) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $allowedBands = ['low', 'low_mid', 'mid', 'high_mid', 'high'];
            
            foreach ($eqSettings as $band => $value) {
                if (in_array($band, $allowedBands)) {
                    $this->tracks[$trackId]['eq'][$band] = max(-12.0, min(12.0, $value));
                }
            }
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'eq' => $this->tracks[$trackId]['eq'],
                    'message' => 'Track EQ updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Track EQ Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update track EQ'
            ];
        }
    }
    
    /**
     * Set track compression
     */
    public function setTrackCompression($trackId, $compressionSettings) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $allowedSettings = ['enabled', 'threshold', 'ratio', 'attack', 'release'];
            
            foreach ($compressionSettings as $setting => $value) {
                if (in_array($setting, $allowedSettings)) {
                    if ($setting === 'enabled') {
                        $this->tracks[$trackId]['compression'][$setting] = (bool)$value;
                    } else {
                        $this->tracks[$trackId]['compression'][$setting] = $value;
                    }
                }
            }
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'compression' => $this->tracks[$trackId]['compression'],
                    'message' => 'Track compression updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Track Compression Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update track compression'
            ];
        }
    }
    
    /**
     * Set track gate
     */
    public function setTrackGate($trackId, $gateSettings) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $allowedSettings = ['enabled', 'threshold', 'ratio', 'attack', 'release'];
            
            foreach ($gateSettings as $setting => $value) {
                if (in_array($setting, $allowedSettings)) {
                    if ($setting === 'enabled') {
                        $this->tracks[$trackId]['gate'][$setting] = (bool)$value;
                    } else {
                        $this->tracks[$trackId]['gate'][$setting] = $value;
                    }
                }
            }
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'gate' => $this->tracks[$trackId]['gate'],
                    'message' => 'Track gate updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Track Gate Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update track gate'
            ];
        }
    }
    
    /**
     * Add automation point to track
     */
    public function addAutomationPoint($trackId, $parameter, $value, $time) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            $automationPoint = [
                'parameter' => $parameter,
                'value' => $value,
                'time' => $time,
                'created_at' => microtime(true)
            ];
            
            $this->tracks[$trackId]['automation'][] = $automationPoint;
            
            // Sort automation points by time
            usort($this->tracks[$trackId]['automation'], function($a, $b) {
                return $a['time'] <=> $b['time'];
            });
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'automation_point' => $automationPoint,
                    'message' => 'Automation point added successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Add Automation Point Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to add automation point'
            ];
        }
    }
    
    /**
     * Mix all tracks
     */
    public function mixTracks($startTime = 0, $duration = null) {
        try {
            if (empty($this->tracks)) {
                return [
                    'success' => false,
                    'message' => 'No tracks to mix'
                ];
            }
            
            // Determine mix duration
            if ($duration === null) {
                $maxDuration = 0;
                foreach ($this->tracks as $track) {
                    if (isset($track['duration'])) {
                        $maxDuration = max($maxDuration, $track['duration']);
                    }
                }
                $duration = $maxDuration;
            }
            
            $mixLength = intval($duration * $this->sampleRate);
            $mixedAudio = array_fill(0, $mixLength, 0);
            
            // Process each track
            foreach ($this->tracks as $trackId => $track) {
                if ($track['mute']) {
                    continue; // Skip muted tracks
                }
                
                // Check if track should be soloed
                $hasSolo = false;
                foreach ($this->tracks as $t) {
                    if ($t['solo']) {
                        $hasSolo = true;
                        break;
                    }
                }
                
                if ($hasSolo && !$track['solo']) {
                    continue; // Skip non-solo tracks when solo is active
                }
                
                if (empty($track['audio_data'])) {
                    continue; // Skip tracks without audio
                }
                
                // Apply track processing
                $processedAudio = $this->processTrack($track, $startTime, $duration);
                
                // Mix with main output
                for ($i = 0; $i < $mixLength; $i++) {
                    if (isset($processedAudio[$i])) {
                        $mixedAudio[$i] += $processedAudio[$i];
                    }
                }
            }
            
            // Apply master bus processing
            $finalMix = $this->processMasterBus($mixedAudio);
            
            return [
                'success' => true,
                'data' => [
                    'mixed_audio' => $finalMix,
                    'duration' => $duration,
                    'tracks_processed' => count($this->tracks),
                    'message' => 'Tracks mixed successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Mix Tracks Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to mix tracks'
            ];
        }
    }
    
    /**
     * Process individual track
     */
    private function processTrack($track, $startTime, $duration) {
        $audioData = $track['audio_data'];
        $trackLength = count($audioData);
        $mixLength = intval($duration * $this->sampleRate);
        
        // Initialize output array
        $output = array_fill(0, $mixLength, 0);
        
        // Calculate start and end positions
        $startSample = intval($startTime * $this->sampleRate);
        $endSample = min($startSample + $mixLength, $trackLength);
        
        // Copy audio data to output
        for ($i = $startSample; $j = 0; $i < $endSample; $i++, $j++) {
            $output[$j] = $audioData[$i];
        }
        
        // Apply volume
        for ($i = 0; $i < $mixLength; $i++) {
            $output[$i] *= $track['volume'];
        }
        
        // Apply pan (stereo)
        if ($this->config['channels'] == 2) {
            $leftGain = cos(($track['pan'] + 1) * M_PI / 4);
            $rightGain = sin(($track['pan'] + 1) * M_PI / 4);
            
            for ($i = 0; $i < $mixLength; $i++) {
                $output[$i] = [
                    'left' => $output[$i] * $leftGain,
                    'right' => $output[$i] * $rightGain
                ];
            }
        }
        
        // Apply EQ
        if (array_sum(array_values($track['eq'])) != 0) {
            $output = $this->applyTrackEQ($output, $track['eq']);
        }
        
        // Apply compression
        if ($track['compression']['enabled']) {
            $output = $this->applyTrackCompression($output, $track['compression']);
        }
        
        // Apply gate
        if ($track['gate']['enabled']) {
            $output = $this->applyTrackGate($output, $track['gate']);
        }
        
        // Apply automation
        if (!empty($track['automation'])) {
            $output = $this->applyTrackAutomation($output, $track['automation'], $startTime, $duration);
        }
        
        return $output;
    }
    
    /**
     * Apply track EQ
     */
    private function applyTrackEQ($audioData, $eqSettings) {
        // Create EQ bands for effects engine
        $bands = [
            ['frequency' => 60, 'gain' => $eqSettings['low'], 'q' => 1.0],
            ['frequency' => 250, 'gain' => $eqSettings['low_mid'], 'q' => 1.0],
            ['frequency' => 1000, 'gain' => $eqSettings['mid'], 'q' => 1.0],
            ['frequency' => 4000, 'gain' => $eqSettings['high_mid'], 'q' => 1.0],
            ['frequency' => 10000, 'gain' => $eqSettings['high'], 'q' => 1.0]
        ];
        
        $result = $this->effectsEngine->applyEQ($audioData, $bands);
        
        if ($result['success']) {
            return $result['data']['audio_data'];
        }
        
        return $audioData;
    }
    
    /**
     * Apply track compression
     */
    private function applyTrackCompression($audioData, $compressionSettings) {
        $result = $this->effectsEngine->applyCompression(
            $audioData,
            $compressionSettings['threshold'],
            $compressionSettings['ratio'],
            $compressionSettings['attack'],
            $compressionSettings['release']
        );
        
        if ($result['success']) {
            return $result['data']['audio_data'];
        }
        
        return $audioData;
    }
    
    /**
     * Apply track gate
     */
    private function applyTrackGate($audioData, $gateSettings) {
        // Gate is similar to compression but with higher ratio
        $result = $this->effectsEngine->applyCompression(
            $audioData,
            $gateSettings['threshold'],
            $gateSettings['ratio'],
            $gateSettings['attack'],
            $gateSettings['release']
        );
        
        if ($result['success']) {
            return $result['data']['audio_data'];
        }
        
        return $audioData;
    }
    
    /**
     * Apply track automation
     */
    private function applyTrackAutomation($audioData, $automation, $startTime, $duration) {
        $mixLength = count($audioData);
        
        foreach ($automation as $point) {
            $time = $point['time'] - $startTime;
            if ($time < 0 || $time > $duration) {
                continue;
            }
            
            $sampleIndex = intval($time * $this->sampleRate);
            if ($sampleIndex >= $mixLength) {
                continue;
            }
            
            // Apply automation value
            switch ($point['parameter']) {
                case 'volume':
                    $audioData[$sampleIndex] *= $point['value'];
                    break;
                case 'pan':
                    // Pan automation would be applied here
                    break;
                case 'eq':
                    // EQ automation would be applied here
                    break;
            }
        }
        
        return $audioData;
    }
    
    /**
     * Process master bus
     */
    private function processMasterBus($audioData) {
        $processed = $audioData;
        
        // Apply master volume
        for ($i = 0; $i < count($processed); $i++) {
            $processed[$i] *= $this->masterBus['volume'];
        }
        
        // Apply master effects
        if (!empty($this->masterBus['effects'])) {
            $result = $this->effectsEngine->applyEffectChain($processed, $this->masterBus['effects']);
            if ($result['success']) {
                $processed = $result['data']['final_audio'];
            }
        }
        
        // Apply limiting to prevent clipping
        $processed = $this->applyLimiting($processed);
        
        return $processed;
    }
    
    /**
     * Apply limiting to prevent clipping
     */
    private function applyLimiting($audioData) {
        $limited = [];
        $threshold = 0.95;
        $ratio = 20.0;
        
        foreach ($audioData as $sample) {
            if (abs($sample) > $threshold) {
                $excess = abs($sample) - $threshold;
                $limitedSample = $threshold + ($excess / $ratio);
                $limited[] = $sample > 0 ? $limitedSample : -$limitedSample;
            } else {
                $limited[] = $sample;
            }
        }
        
        return $limited;
    }
    
    /**
     * Set master bus volume
     */
    public function setMasterVolume($volume) {
        try {
            $volume = max(0.0, min(2.0, $volume));
            $this->masterBus['volume'] = $volume;
            
            return [
                'success' => true,
                'data' => [
                    'volume' => $volume,
                    'message' => 'Master volume updated successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Set Master Volume Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update master volume'
            ];
        }
    }
    
    /**
     * Add effect to master bus
     */
    public function addMasterEffect($effectName, $parameters = []) {
        try {
            $effect = [
                'name' => $effectName,
                'parameters' => $parameters,
                'added_at' => microtime(true)
            ];
            
            $this->masterBus['effects'][] = $effect;
            
            return [
                'success' => true,
                'data' => [
                    'effect' => $effect,
                    'message' => 'Master effect added successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Add Master Effect Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to add master effect'
            ];
        }
    }
    
    /**
     * Get all tracks
     */
    public function getAllTracks() {
        return [
            'success' => true,
            'data' => [
                'tracks' => $this->tracks,
                'total_tracks' => count($this->tracks)
            ]
        ];
    }
    
    /**
     * Get track details
     */
    public function getTrackDetails($trackId) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            return [
                'success' => true,
                'data' => [
                    'track' => $this->tracks[$trackId]
                ]
            ];
        } catch (Exception $e) {
            error_log("Get Track Details Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to get track details'
            ];
        }
    }
    
    /**
     * Delete track
     */
    public function deleteTrack($trackId) {
        try {
            if (!isset($this->tracks[$trackId])) {
                return [
                    'success' => false,
                    'message' => 'Track not found'
                ];
            }
            
            unset($this->tracks[$trackId]);
            
            return [
                'success' => true,
                'data' => [
                    'track_id' => $trackId,
                    'message' => 'Track deleted successfully'
                ]
            ];
        } catch (Exception $e) {
            error_log("Delete Track Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to delete track'
            ];
        }
    }
    
    /**
     * Export mix to file
     */
    public function exportMix($format = 'wav', $filename = null) {
        try {
            // Mix all tracks
            $mixResult = $this->mixTracks();
            
            if (!$mixResult['success']) {
                return $mixResult;
            }
            
            $mixedAudio = $mixResult['data']['mixed_audio'];
            
            if ($filename === null) {
                $filename = 'mix_' . date('Y-m-d_H-i-s') . '.' . $format;
            }
            
            // Convert audio data to file format
            $filePath = $this->convertAudioToFile($mixedAudio, $format, $filename);
            
            if ($filePath) {
                return [
                    'success' => true,
                    'data' => [
                        'file_path' => $filePath,
                        'filename' => $filename,
                        'format' => $format,
                        'duration' => $mixResult['data']['duration'],
                        'message' => 'Mix exported successfully'
                    ]
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to export mix file'
                ];
            }
        } catch (Exception $e) {
            error_log("Export Mix Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to export mix'
            ];
        }
    }
    
    /**
     * Convert audio data to file
     */
    private function convertAudioToFile($audioData, $format, $filename) {
        try {
            $filePath = 'exports/' . $filename;
            
            // Ensure exports directory exists
            if (!is_dir('exports')) {
                mkdir('exports', 0755, true);
            }
            
            // Simple WAV file creation (basic implementation)
            if ($format === 'wav') {
                $this->createWavFile($audioData, $filePath);
                return $filePath;
            }
            
            // For other formats, you would implement conversion here
            return false;
        } catch (Exception $e) {
            error_log("Convert Audio to File Error: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Create WAV file
     */
    private function createWavFile($audioData, $filePath) {
        try {
            $file = fopen($filePath, 'wb');
            
            if (!$file) {
                return false;
            }
            
            $numChannels = $this->config['channels'];
            $sampleRate = $this->config['sample_rate'];
            $bitsPerSample = $this->config['bit_depth'];
            $numSamples = count($audioData);
            $dataSize = $numSamples * $numChannels * ($bitsPerSample / 8);
            $fileSize = 36 + $dataSize;
            
            // Write WAV header
            fwrite($file, 'RIFF');
            fwrite($file, pack('V', $fileSize));
            fwrite($file, 'WAVE');
            fwrite($file, 'fmt ');
            fwrite($file, pack('V', 16));
            fwrite($file, pack('v', 1));
            fwrite($file, pack('v', $numChannels);
            fwrite($file, pack('V', $sampleRate);
            fwrite($file, pack('V', $sampleRate * $numChannels * ($bitsPerSample / 8)));
            fwrite($file, pack('v', $numChannels * ($bitsPerSample / 8)));
            fwrite($file, pack('v', $bitsPerSample));
            fwrite($file, 'data');
            fwrite($file, pack('V', $dataSize));
            
            // Write audio data
            foreach ($audioData as $sample) {
                $sample = max(-1.0, min(1.0, $sample));
                $sample = intval($sample * (pow(2, $bitsPerSample - 1) - 1));
                fwrite($file, pack('v', $sample));
            }
            
            fclose($file);
            return true;
        } catch (Exception $e) {
            error_log("Create WAV File Error: " . $e->getMessage());
            return false;
        }
    }
}

// Helper function to get professional mixing instance
function professional_mixing() {
    return new ProfessionalMixing();
}
?>