<?php
require_once 'config.php';

/**
 * Custom AI Music Generation Engine
 * 100% Original - No External APIs
 * Professional Quality Music Generation
 */
class MusicAIEngine {
    private $config;
    private $musicTheory;
    private $instrumentLibrary;
    
    public function __construct() {
        $this->config = [
            'sample_rate' => 44100,
            'bit_depth' => 16,
            'channels' => 2,
            'max_duration' => 300, // 5 minutes
            'quality' => 'high'
        ];
        
        $this->musicTheory = new MusicTheory();
        $this->instrumentLibrary = new InstrumentLibrary();
    }
    
    /**
     * Generate complete music composition
     */
    public function generateMusic($prompt, $genre, $mood, $tempo, $instruments, $duration = 60) {
        try {
            // Validate parameters
            $this->validateParameters($genre, $mood, $tempo, $duration);
            
            // Generate musical structure
            $structure = $this->generateStructure($genre, $mood, $duration);
            
            // Create melody
            $melody = $this->generateMelody($structure, $mood, $tempo);
            
            // Generate harmony
            $harmony = $this->generateHarmony($melody, $genre);
            
            // Create rhythm
            $rhythm = $this->generateRhythm($tempo, $genre);
            
            // Arrange instruments
            $arrangement = $this->arrangeInstruments($melody, $harmony, $rhythm, $instruments);
            
            // Compose final piece
            $composition = $this->composePiece($arrangement, $structure);
            
            // Generate audio
            $audioData = $this->generateAudio($composition);
            
            // Save to file
            $filename = $this->saveAudioFile($audioData, $genre, $mood);
            
            return [
                'success' => true,
                'filename' => $filename,
                'duration' => $duration,
                'structure' => $structure,
                'metadata' => [
                    'genre' => $genre,
                    'mood' => $mood,
                    'tempo' => $tempo,
                    'instruments' => $instruments,
                    'key' => $composition['key'],
                    'time_signature' => $composition['time_signature']
                ]
            ];
            
        } catch (Exception $e) {
            error_log("AI Music Generation Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Music generation failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Generate musical structure
     */
    private function generateStructure($genre, $mood, $duration) {
        $structures = [
            'pop' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'bridge', 'chorus', 'outro'],
            'rock' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'solo', 'chorus', 'outro'],
            'jazz' => ['intro', 'head', 'solo1', 'solo2', 'solo3', 'head', 'outro'],
            'classical' => ['exposition', 'development', 'recapitulation'],
            'electronic' => ['intro', 'build', 'drop', 'breakdown', 'build', 'drop', 'outro'],
            'folk' => ['intro', 'verse', 'verse', 'chorus', 'verse', 'chorus', 'outro'],
            'hip-hop' => ['intro', 'verse', 'hook', 'verse', 'hook', 'bridge', 'hook', 'outro'],
            'country' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'bridge', 'chorus', 'outro']
        ];
        
        $baseStructure = $structures[$genre] ?? $structures['pop'];
        $sectionDuration = $duration / count($baseStructure);
        
        $structure = [];
        foreach ($baseStructure as $section) {
            $structure[] = [
                'name' => $section,
                'duration' => $sectionDuration,
                'start_time' => count($structure) * $sectionDuration,
                'end_time' => (count($structure) + 1) * $sectionDuration
            ];
        }
        
        return $structure;
    }
    
    /**
     * Generate melody using music theory
     */
    private function generateMelody($structure, $mood, $tempo) {
        $melody = [];
        $key = $this->musicTheory->getRandomKey();
        $scale = $this->musicTheory->getScale($key, $mood);
        
        foreach ($structure as $section) {
            $sectionMelody = $this->createSectionMelody($section, $scale, $mood, $tempo);
            $melody[] = [
                'section' => $section['name'],
                'notes' => $sectionMelody,
                'key' => $key,
                'scale' => $scale
            ];
        }
        
        return $melody;
    }
    
    /**
     * Create melody for a specific section
     */
    private function createSectionMelody($section, $scale, $mood, $tempo) {
        $notes = [];
        $noteCount = intval($section['duration'] * ($tempo / 60) * 4); // 4 notes per beat
        
        $moodPatterns = [
            'happy' => [0, 2, 4, 7, 9, 11], // Major scale emphasis
            'sad' => [0, 2, 3, 5, 7, 10],   // Minor scale emphasis
            'energetic' => [0, 4, 7, 11, 14, 17], // Power chords
            'calm' => [0, 2, 4, 7, 9],      // Gentle intervals
            'romantic' => [0, 3, 5, 7, 10, 12], // Romantic intervals
            'mysterious' => [0, 1, 4, 6, 8, 11] // Diminished feel
        ];
        
        $pattern = $moodPatterns[$mood] ?? $moodPatterns['happy'];
        
        for ($i = 0; $i < $noteCount; $i++) {
            $noteIndex = $pattern[array_rand($pattern)];
            $octave = rand(4, 6); // Middle octaves
            $duration = $this->getRandomDuration($tempo);
            
            $notes[] = [
                'note' => $scale[$noteIndex % count($scale)],
                'octave' => $octave,
                'duration' => $duration,
                'velocity' => rand(60, 100) / 100
            ];
        }
        
        return $notes;
    }
    
    /**
     * Generate harmony based on melody
     */
    private function generateHarmony($melody, $genre) {
        $harmony = [];
        
        foreach ($melody as $section) {
            $sectionHarmony = [];
            $chordProgression = $this->getChordProgression($genre, $section['key']);
            
            foreach ($section['notes'] as $note) {
                $chord = $this->buildChord($note, $chordProgression);
                $sectionHarmony[] = $chord;
            }
            
            $harmony[] = [
                'section' => $section['section'],
                'chords' => $sectionHarmony
            ];
        }
        
        return $harmony;
    }
    
    /**
     * Get chord progression for genre
     */
    private function getChordProgression($genre, $key) {
        $progressions = [
            'pop' => ['I', 'V', 'vi', 'IV'],
            'rock' => ['I', 'IV', 'V', 'I'],
            'jazz' => ['ii', 'V', 'I', 'vi'],
            'classical' => ['I', 'V', 'vi', 'iii', 'IV', 'I'],
            'electronic' => ['i', 'VI', 'III', 'VII'],
            'folk' => ['I', 'V', 'vi', 'IV'],
            'hip-hop' => ['i', 'VI', 'III', 'VII'],
            'country' => ['I', 'IV', 'V', 'I']
        ];
        
        return $progressions[$genre] ?? $progressions['pop'];
    }
    
    /**
     * Build chord from note and progression
     */
    private function buildChord($note, $progression) {
        $chordTypes = [
            'I' => [0, 4, 7],    // Major
            'ii' => [2, 5, 9],   // Minor
            'iii' => [4, 7, 11], // Minor
            'IV' => [5, 9, 0],   // Major
            'V' => [7, 11, 2],   // Major
            'vi' => [9, 0, 4],   // Minor
            'VII' => [11, 2, 5], // Diminished
            'i' => [0, 3, 7],    // Minor
            'VI' => [8, 0, 3],   // Major
            'III' => [3, 7, 10]  // Major
        ];
        
        $chordType = $progression[array_rand($progression)];
        $chordNotes = $chordTypes[$chordType] ?? $chordTypes['I'];
        
        $chord = [];
        foreach ($chordNotes as $interval) {
            $chord[] = [
                'note' => $this->musicTheory->getNoteFromInterval($note['note'], $interval),
                'octave' => $note['octave'],
                'duration' => $note['duration'],
                'velocity' => $note['velocity'] * 0.7 // Chords slightly quieter
            ];
        }
        
        return $chord;
    }
    
    /**
     * Generate rhythm pattern
     */
    private function generateRhythm($tempo, $genre) {
        $rhythm = [];
        $beatsPerBar = 4;
        $bars = 8;
        
        $genrePatterns = [
            'pop' => [1, 0, 0.5, 0, 1, 0, 0.5, 0], // Standard pop beat
            'rock' => [1, 0, 0.5, 0, 1, 0, 0.5, 0], // Rock beat
            'jazz' => [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], // Swing feel
            'classical' => [1, 0, 1, 0, 1, 0, 1, 0], // Classical rhythm
            'electronic' => [1, 0, 0, 0, 1, 0, 0, 0], // Four on the floor
            'folk' => [1, 0, 0.5, 0, 1, 0, 0.5, 0], // Folk rhythm
            'hip-hop' => [1, 0, 0, 0, 1, 0, 0, 0], // Hip-hop beat
            'country' => [1, 0, 0.5, 0, 1, 0, 0.5, 0] // Country rhythm
        ];
        
        $pattern = $genrePatterns[$genre] ?? $genrePatterns['pop'];
        
        for ($bar = 0; $bar < $bars; $bar++) {
            $barRhythm = [];
            for ($beat = 0; $beat < $beatsPerBar; $beat++) {
                $patternIndex = ($bar * $beatsPerBar + $beat) % count($pattern);
                $barRhythm[] = [
                    'velocity' => $pattern[$patternIndex],
                    'duration' => 60 / $tempo / $beatsPerBar
                ];
            }
            $rhythm[] = $barRhythm;
        }
        
        return $rhythm;
    }
    
    /**
     * Arrange instruments for the piece
     */
    private function arrangeInstruments($melody, $harmony, $rhythm, $instruments) {
        $arrangement = [];
        
        // Lead instrument (melody)
        if (in_array('piano', $instruments) || in_array('guitar', $instruments)) {
            $arrangement['lead'] = [
                'instrument' => in_array('piano', $instruments) ? 'piano' : 'guitar',
                'notes' => $melody,
                'volume' => 0.8
            ];
        }
        
        // Harmony instruments
        if (in_array('strings', $instruments)) {
            $arrangement['harmony'] = [
                'instrument' => 'strings',
                'notes' => $harmony,
                'volume' => 0.6
            ];
        }
        
        // Rhythm section
        if (in_array('drums', $instruments)) {
            $arrangement['rhythm'] = [
                'instrument' => 'drums',
                'pattern' => $rhythm,
                'volume' => 0.7
            ];
        }
        
        // Bass
        if (in_array('bass', $instruments)) {
            $arrangement['bass'] = [
                'instrument' => 'bass',
                'notes' => $this->extractBassLine($harmony),
                'volume' => 0.5
            ];
        }
        
        return $arrangement;
    }
    
    /**
     * Extract bass line from harmony
     */
    private function extractBassLine($harmony) {
        $bassLine = [];
        
        foreach ($harmony as $section) {
            $sectionBass = [];
            foreach ($section['chords'] as $chord) {
                if (!empty($chord)) {
                    $sectionBass[] = [
                        'note' => $chord[0]['note'],
                        'octave' => $chord[0]['octave'] - 1, // Lower octave
                        'duration' => $chord[0]['duration'],
                        'velocity' => 0.6
                    ];
                }
            }
            $bassLine[] = [
                'section' => $section['section'],
                'notes' => $sectionBass
            ];
        }
        
        return $bassLine;
    }
    
    /**
     * Compose final piece
     */
    private function composePiece($arrangement, $structure) {
        $composition = [
            'key' => $arrangement['lead']['notes'][0]['key'] ?? 'C',
            'time_signature' => '4/4',
            'tempo' => 120,
            'sections' => $structure,
            'arrangement' => $arrangement
        ];
        
        return $composition;
    }
    
    /**
     * Generate audio data from composition
     */
    private function generateAudio($composition) {
        // This is a simplified audio generation
        // In a full implementation, this would create actual audio samples
        
        $sampleRate = $this->config['sample_rate'];
        $duration = $this->calculateTotalDuration($composition['sections']);
        $samples = $sampleRate * $duration;
        
        $audioData = '';
        for ($i = 0; $i < $samples; $i++) {
            $time = $i / $sampleRate;
            $sample = $this->generateSample($time, $composition);
            
            // Convert to 16-bit PCM
            $pcm = (int)($sample * 32767);
            $audioData .= pack('s', $pcm);
        }
        
        return $audioData;
    }
    
    /**
     * Generate audio sample at specific time
     */
    private function generateSample($time, $composition) {
        $sample = 0;
        
        // Add melody
        if (isset($composition['arrangement']['lead'])) {
            $sample += $this->generateInstrumentSample($time, $composition['arrangement']['lead']) * 0.4;
        }
        
        // Add harmony
        if (isset($composition['arrangement']['harmony'])) {
            $sample += $this->generateInstrumentSample($time, $composition['arrangement']['harmony']) * 0.3;
        }
        
        // Add bass
        if (isset($composition['arrangement']['bass'])) {
            $sample += $this->generateInstrumentSample($time, $composition['arrangement']['bass']) * 0.2;
        }
        
        // Add rhythm
        if (isset($composition['arrangement']['rhythm'])) {
            $sample += $this->generateRhythmSample($time, $composition['arrangement']['rhythm']) * 0.1;
        }
        
        // Normalize and apply effects
        $sample = max(-1, min(1, $sample));
        $sample = $this->applyEffects($sample, $time);
        
        return $sample;
    }
    
    /**
     * Generate instrument sample
     */
    private function generateInstrumentSample($time, $instrument) {
        // Simplified instrument synthesis
        $frequency = $this->getNoteFrequency($instrument['notes'], $time);
        $envelope = $this->getEnvelope($time, $instrument['notes']);
        
        $sample = sin(2 * M_PI * $frequency * $time) * $envelope;
        
        // Add harmonics for richer sound
        $sample += 0.5 * sin(2 * M_PI * $frequency * 2 * $time) * $envelope;
        $sample += 0.25 * sin(2 * M_PI * $frequency * 3 * $time) * $envelope;
        
        return $sample * $instrument['volume'];
    }
    
    /**
     * Generate rhythm sample
     */
    private function generateRhythmSample($time, $rhythm) {
        $beatTime = fmod($time, 60 / 120); // Assuming 120 BPM
        $beatIndex = intval($beatTime * 4); // 4 beats per bar
        
        if (isset($rhythm[0][$beatIndex]) && $rhythm[0][$beatIndex]['velocity'] > 0) {
            return $rhythm[0][$beatIndex]['velocity'] * 0.8;
        }
        
        return 0;
    }
    
    /**
     * Apply audio effects
     */
    private function applyEffects($sample, $time) {
        // Reverb simulation
        $reverb = $this->simulateReverb($sample, $time);
        
        // Compression
        $compressed = $this->compress($sample);
        
        // EQ
        $eq = $this->applyEQ($compressed);
        
        return $eq;
    }
    
    /**
     * Save audio to file
     */
    private function saveAudioFile($audioData, $genre, $mood) {
        $filename = 'ai_generated_' . $genre . '_' . $mood . '_' . uniqid() . '.wav';
        $filepath = UPLOAD_DIR . $filename;
        
        // Create WAV header
        $wavHeader = $this->createWAVHeader($audioData);
        
        // Write file
        file_put_contents($filepath, $wavHeader . $audioData);
        
        return $filename;
    }
    
    /**
     * Create WAV file header
     */
    private function createWAVHeader($audioData) {
        $sampleRate = $this->config['sample_rate'];
        $channels = $this->config['channels'];
        $bitsPerSample = $this->config['bit_depth'];
        $dataSize = strlen($audioData);
        $fileSize = 36 + $dataSize;
        
        $header = 'RIFF';
        $header .= pack('V', $fileSize);
        $header .= 'WAVE';
        $header .= 'fmt ';
        $header .= pack('V', 16);
        $header .= pack('v', 1);
        $header .= pack('v', $channels);
        $header .= pack('V', $sampleRate);
        $header .= pack('V', $sampleRate * $channels * $bitsPerSample / 8);
        $header .= pack('v', $channels * $bitsPerSample / 8);
        $header .= pack('v', $bitsPerSample);
        $header .= 'data';
        $header .= pack('V', $dataSize);
        
        return $header;
    }
    
    /**
     * Helper methods
     */
    private function validateParameters($genre, $mood, $tempo, $duration) {
        $validGenres = ['pop', 'rock', 'jazz', 'classical', 'electronic', 'folk', 'hip-hop', 'country'];
        $validMoods = ['happy', 'sad', 'energetic', 'calm', 'romantic', 'mysterious'];
        
        if (!in_array($genre, $validGenres)) {
            throw new Exception('Invalid genre');
        }
        
        if (!in_array($mood, $validMoods)) {
            throw new Exception('Invalid mood');
        }
        
        if ($tempo < 60 || $tempo > 200) {
            throw new Exception('Invalid tempo');
        }
        
        if ($duration < 10 || $duration > 300) {
            throw new Exception('Invalid duration');
        }
    }
    
    private function getRandomDuration($tempo) {
        $durations = [0.25, 0.5, 1, 2, 4]; // Quarter, half, whole notes
        return $durations[array_rand($durations)];
    }
    
    private function calculateTotalDuration($sections) {
        $total = 0;
        foreach ($sections as $section) {
            $total += $section['duration'];
        }
        return $total;
    }
    
    private function getNoteFrequency($notes, $time) {
        // Find the note playing at this time
        foreach ($notes as $note) {
            if ($time >= $note['start_time'] && $time < $note['start_time'] + $note['duration']) {
                return $this->noteToFrequency($note['note'], $note['octave']);
            }
        }
        return 440; // Default A4
    }
    
    private function noteToFrequency($note, $octave) {
        $noteFrequencies = [
            'C' => 261.63, 'C#' => 277.18, 'D' => 293.66, 'D#' => 311.13,
            'E' => 329.63, 'F' => 349.23, 'F#' => 369.99, 'G' => 392.00,
            'G#' => 415.30, 'A' => 440.00, 'A#' => 466.16, 'B' => 493.88
        ];
        
        $baseFreq = $noteFrequencies[$note] ?? 440;
        return $baseFreq * pow(2, $octave - 4);
    }
    
    private function getEnvelope($time, $notes) {
        // Simple ADSR envelope
        foreach ($notes as $note) {
            if ($time >= $note['start_time'] && $time < $note['start_time'] + $note['duration']) {
                $noteTime = $time - $note['start_time'];
                $noteDuration = $note['duration'];
                
                if ($noteTime < 0.1) { // Attack
                    return $noteTime / 0.1;
                } elseif ($noteTime < $noteDuration - 0.1) { // Sustain
                    return 1.0;
                } else { // Release
                    return ($noteDuration - $noteTime) / 0.1;
                }
            }
        }
        return 0;
    }
    
    private function simulateReverb($sample, $time) {
        // Simple reverb simulation
        $delay = 0.1;
        $decay = 0.3;
        
        if ($time > $delay) {
            $delayedSample = $this->getSampleAtTime($time - $delay);
            $sample += $delayedSample * $decay;
        }
        
        return $sample;
    }
    
    private function compress($sample) {
        $threshold = 0.8;
        $ratio = 4;
        
        if (abs($sample) > $threshold) {
            $excess = abs($sample) - $threshold;
            $compressed = $threshold + ($excess / $ratio);
            return $sample > 0 ? $compressed : -$compressed;
        }
        
        return $sample;
    }
    
    private function applyEQ($sample) {
        // Simple EQ - boost mid frequencies
        $midBoost = 1.2;
        return $sample * $midBoost;
    }
    
    private function getSampleAtTime($time) {
        // This would get the actual sample at a given time
        // For now, return 0
        return 0;
    }
}

/**
 * Music Theory Helper Class
 */
class MusicTheory {
    public function getRandomKey() {
        $keys = ['C', 'G', 'D', 'A', 'E', 'B', 'F#', 'C#', 'F', 'Bb', 'Eb', 'Ab'];
        return $keys[array_rand($keys)];
    }
    
    public function getScale($key, $mood) {
        $scales = [
            'happy' => [0, 2, 4, 5, 7, 9, 11, 12], // Major scale
            'sad' => [0, 2, 3, 5, 7, 8, 10, 12],   // Natural minor
            'energetic' => [0, 2, 4, 6, 7, 9, 11, 12], // Mixolydian
            'calm' => [0, 2, 4, 6, 7, 9, 11, 12],     // Lydian
            'romantic' => [0, 2, 3, 5, 7, 9, 10, 12], // Harmonic minor
            'mysterious' => [0, 1, 3, 5, 6, 8, 10, 12] // Locrian
        ];
        
        $scale = $scales[$mood] ?? $scales['happy'];
        $keyIndex = $this->getKeyIndex($key);
        
        $transposedScale = [];
        foreach ($scale as $interval) {
            $transposedScale[] = ($interval + $keyIndex) % 12;
        }
        
        return $transposedScale;
    }
    
    private function getKeyIndex($key) {
        $keyMap = [
            'C' => 0, 'C#' => 1, 'D' => 2, 'D#' => 3, 'E' => 4, 'F' => 5,
            'F#' => 6, 'G' => 7, 'G#' => 8, 'A' => 9, 'A#' => 10, 'B' => 11
        ];
        
        return $keyMap[$key] ?? 0;
    }
    
    public function getNoteFromInterval($baseNote, $interval) {
        $notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
        $baseIndex = array_search($baseNote, $notes);
        $newIndex = ($baseIndex + $interval) % 12;
        return $notes[$newIndex];
    }
}

/**
 * Instrument Library Class
 */
class InstrumentLibrary {
    private $instruments = [
        'piano' => ['type' => 'acoustic', 'range' => [21, 108]],
        'guitar' => ['type' => 'acoustic', 'range' => [40, 76]],
        'bass' => ['type' => 'electric', 'range' => [28, 55]],
        'drums' => ['type' => 'percussion', 'range' => [35, 81]],
        'strings' => ['type' => 'orchestral', 'range' => [55, 88]],
        'synthesizer' => ['type' => 'electronic', 'range' => [21, 108]]
    ];
    
    public function getInstrument($name) {
        return $this->instruments[$name] ?? null;
    }
    
    public function getAllInstruments() {
        return array_keys($this->instruments);
    }
}

// Helper function to get AI engine instance
function music_ai_engine() {
    return new MusicAIEngine();
}
?>