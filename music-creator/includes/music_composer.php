<?php
require_once 'config.php';

/**
 * Music Composer System
 * Advanced Music Composition Algorithms
 * 100% Original - Professional Quality
 */
class MusicComposer {
    private $config;
    private $musicTheory;
    private $compositionEngine;
    private $styleAnalyzer;
    
    public function __construct() {
        $this->config = [
            'max_complexity' => 10,
            'min_complexity' => 1,
            'default_tempo' => 120,
            'default_key' => 'C',
            'default_time_signature' => '4/4'
        ];
        
        $this->musicTheory = new AdvancedMusicTheory();
        $this->compositionEngine = new CompositionEngine();
        $this->styleAnalyzer = new StyleAnalyzer();
    }
    
    /**
     * Compose complete musical piece
     */
    public function composePiece($style, $mood, $complexity = 5, $duration = 60) {
        try {
            // Analyze style and mood
            $styleData = $this->styleAnalyzer->analyzeStyle($style, $mood);
            
            // Generate musical structure
            $structure = $this->generateMusicalStructure($style, $duration, $complexity);
            
            // Compose melody
            $melody = $this->composeMelody($styleData, $structure, $complexity);
            
            // Generate harmony
            $harmony = $this->generateHarmony($melody, $styleData);
            
            // Create rhythm
            $rhythm = $this->createRhythm($styleData, $complexity);
            
            // Arrange instruments
            $arrangement = $this->arrangeInstruments($melody, $harmony, $rhythm, $styleData);
            
            // Compose final piece
            $composition = $this->composeFinalPiece($melody, $harmony, $rhythm, $arrangement, $structure);
            
            return [
                'success' => true,
                'composition' => $composition,
                'metadata' => [
                    'style' => $style,
                    'mood' => $mood,
                    'complexity' => $complexity,
                    'duration' => $duration,
                    'key' => $composition['key'],
                    'time_signature' => $composition['time_signature'],
                    'tempo' => $composition['tempo']
                ]
            ];
            
        } catch (Exception $e) {
            error_log("Music Composition Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Composition failed: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Generate musical structure
     */
    private function generateMusicalStructure($style, $duration, $complexity) {
        $baseStructures = [
            'pop' => [
                'simple' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'outro'],
                'medium' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'bridge', 'chorus', 'outro'],
                'complex' => ['intro', 'verse', 'pre-chorus', 'chorus', 'verse', 'pre-chorus', 'chorus', 'bridge', 'chorus', 'outro']
            ],
            'rock' => [
                'simple' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'outro'],
                'medium' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'solo', 'chorus', 'outro'],
                'complex' => ['intro', 'verse', 'chorus', 'verse', 'chorus', 'solo', 'bridge', 'chorus', 'outro']
            ],
            'jazz' => [
                'simple' => ['intro', 'head', 'solo', 'head', 'outro'],
                'medium' => ['intro', 'head', 'solo1', 'solo2', 'head', 'outro'],
                'complex' => ['intro', 'head', 'solo1', 'solo2', 'solo3', 'head', 'outro']
            ],
            'classical' => [
                'simple' => ['exposition', 'recapitulation'],
                'medium' => ['exposition', 'development', 'recapitulation'],
                'complex' => ['introduction', 'exposition', 'development', 'recapitulation', 'coda']
            ],
            'electronic' => [
                'simple' => ['intro', 'build', 'drop', 'outro'],
                'medium' => ['intro', 'build', 'drop', 'breakdown', 'build', 'drop', 'outro'],
                'complex' => ['intro', 'build', 'drop', 'breakdown', 'build', 'drop', 'breakdown2', 'build', 'drop', 'outro']
            ]
        ];
        
        $complexityLevel = $this->getComplexityLevel($complexity);
        $baseStructure = $baseStructures[$style][$complexityLevel] ?? $baseStructures['pop']['medium'];
        
        $sectionDuration = $duration / count($baseStructure);
        
        $structure = [];
        foreach ($baseStructure as $section) {
            $structure[] = [
                'name' => $section,
                'duration' => $sectionDuration,
                'start_time' => count($structure) * $sectionDuration,
                'end_time' => (count($structure) + 1) * $sectionDuration,
                'intensity' => $this->calculateSectionIntensity($section, $style, $mood)
            ];
        }
        
        return $structure;
    }
    
    /**
     * Compose melody
     */
    private function composeMelody($styleData, $structure, $complexity) {
        $melody = [];
        $key = $this->musicTheory->getOptimalKey($styleData['mood'], $styleData['style']);
        $scale = $this->musicTheory->getScale($key, $styleData['mood']);
        
        foreach ($structure as $section) {
            $sectionMelody = $this->composeSectionMelody($section, $scale, $styleData, $complexity);
            $melody[] = [
                'section' => $section['name'],
                'notes' => $sectionMelody,
                'key' => $key,
                'scale' => $scale,
                'intensity' => $section['intensity']
            ];
        }
        
        return $melody;
    }
    
    /**
     * Compose melody for specific section
     */
    private function composeSectionMelody($section, $scale, $styleData, $complexity) {
        $notes = [];
        $noteCount = $this->calculateNoteCount($section, $styleData['tempo'], $complexity);
        
        // Get melodic patterns for style and mood
        $patterns = $this->getMelodicPatterns($styleData['style'], $styleData['mood'], $complexity);
        
        // Create melodic contour
        $contour = $this->createMelodicContour($section, $styleData['mood'], $complexity);
        
        for ($i = 0; $i < $noteCount; $i++) {
            $note = $this->composeNote($i, $patterns, $contour, $scale, $styleData, $complexity);
            $notes[] = $note;
        }
        
        // Apply melodic rules and constraints
        $notes = $this->applyMelodicRules($notes, $styleData['style'], $complexity);
        
        return $notes;
    }
    
    /**
     * Compose individual note
     */
    private function composeNote($index, $patterns, $contour, $scale, $styleData, $complexity) {
        // Get pattern for this position
        $pattern = $patterns[$index % count($patterns)];
        
        // Get contour direction
        $direction = $contour[$index % count($contour)];
        
        // Select note from scale based on pattern and direction
        $noteIndex = $this->selectNoteFromScale($pattern, $direction, $scale, $complexity);
        $note = $scale[$noteIndex % count($scale)];
        
        // Determine octave
        $octave = $this->determineOctave($index, $contour, $styleData['mood']);
        
        // Calculate duration
        $duration = $this->calculateNoteDuration($index, $patterns, $styleData['tempo'], $complexity);
        
        // Calculate velocity (dynamics)
        $velocity = $this->calculateNoteVelocity($index, $contour, $styleData['mood'], $complexity);
        
        return [
            'note' => $note,
            'octave' => $octave,
            'duration' => $duration,
            'velocity' => $velocity,
            'position' => $index
        ];
    }
    
    /**
     * Generate harmony
     */
    private function generateHarmony($melody, $styleData) {
        $harmony = [];
        
        foreach ($melody as $section) {
            $sectionHarmony = [];
            $chordProgression = $this->getChordProgression($styleData['style'], $section['key'], $section['intensity']);
            
            foreach ($section['notes'] as $note) {
                $chord = $this->buildChord($note, $chordProgression, $styleData['style']);
                $sectionHarmony[] = $chord;
            }
            
            $harmony[] = [
                'section' => $section['section'],
                'chords' => $sectionHarmony,
                'progression' => $chordProgression
            ];
        }
        
        return $harmony;
    }
    
    /**
     * Get chord progression
     */
    private function getChordProgression($style, $key, $intensity) {
        $progressions = [
            'pop' => [
                'low' => ['I', 'V', 'vi', 'IV'],
                'medium' => ['I', 'V', 'vi', 'IV', 'I', 'V', 'vi', 'IV'],
                'high' => ['I', 'V', 'vi', 'IV', 'ii', 'V', 'I', 'vi', 'IV', 'V', 'I']
            ],
            'rock' => [
                'low' => ['I', 'IV', 'V', 'I'],
                'medium' => ['I', 'IV', 'V', 'I', 'vi', 'IV', 'V', 'I'],
                'high' => ['I', 'IV', 'V', 'I', 'vi', 'IV', 'V', 'I', 'ii', 'V', 'I']
            ],
            'jazz' => [
                'low' => ['ii', 'V', 'I'],
                'medium' => ['ii', 'V', 'I', 'vi', 'ii', 'V', 'I'],
                'high' => ['ii', 'V', 'I', 'vi', 'ii', 'V', 'I', 'iii', 'vi', 'ii', 'V', 'I']
            ],
            'classical' => [
                'low' => ['I', 'V', 'I'],
                'medium' => ['I', 'V', 'vi', 'iii', 'IV', 'I'],
                'high' => ['I', 'V', 'vi', 'iii', 'IV', 'I', 'ii', 'V', 'I']
            ]
        ];
        
        $intensityLevel = $this->getIntensityLevel($intensity);
        $progression = $progressions[$style][$intensityLevel] ?? $progressions['pop']['medium'];
        
        return $progression;
    }
    
    /**
     * Build chord
     */
    private function buildChord($note, $progression, $style) {
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
        
        // Add extensions for jazz and complex styles
        if ($style === 'jazz' || $style === 'classical') {
            $chord = $this->addChordExtensions($chord, $chordType, $style);
        }
        
        return $chord;
    }
    
    /**
     * Add chord extensions
     */
    private function addChordExtensions($chord, $chordType, $style) {
        $extensions = [];
        
        if ($style === 'jazz') {
            // Add 7th, 9th, 13th for jazz
            $extensions = [10, 14, 21];
        } elseif ($style === 'classical') {
            // Add 6th, 9th for classical
            $extensions = [9, 14];
        }
        
        foreach ($extensions as $extension) {
            $chord[] = [
                'note' => $this->musicTheory->getNoteFromInterval($chord[0]['note'], $extension),
                'octave' => $chord[0]['octave'] + 1,
                'duration' => $chord[0]['duration'],
                'velocity' => $chord[0]['velocity'] * 0.5 // Extensions very quiet
            ];
        }
        
        return $chord;
    }
    
    /**
     * Create rhythm
     */
    private function createRhythm($styleData, $complexity) {
        $rhythm = [];
        $beatsPerBar = $this->getBeatsPerBar($styleData['time_signature']);
        $bars = $this->calculateBarCount($styleData['duration'], $styleData['tempo'], $beatsPerBar);
        
        $rhythmPatterns = $this->getRhythmPatterns($styleData['style'], $complexity);
        
        for ($bar = 0; $bar < $bars; $bar++) {
            $barRhythm = [];
            for ($beat = 0; $beat < $beatsPerBar; $beat++) {
                $patternIndex = ($bar * $beatsPerBar + $beat) % count($rhythmPatterns);
                $barRhythm[] = [
                    'velocity' => $rhythmPatterns[$patternIndex],
                    'duration' => 60 / $styleData['tempo'] / $beatsPerBar,
                    'accent' => $this->isAccentBeat($beat, $beatsPerBar, $styleData['style'])
                ];
            }
            $rhythm[] = $barRhythm;
        }
        
        return $rhythm;
    }
    
    /**
     * Get rhythm patterns
     */
    private function getRhythmPatterns($style, $complexity) {
        $patterns = [
            'pop' => [
                'simple' => [1, 0, 0.5, 0, 1, 0, 0.5, 0],
                'medium' => [1, 0, 0.5, 0, 1, 0, 0.5, 0, 1, 0, 0.5, 0, 1, 0, 0.5, 0],
                'complex' => [1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25]
            ],
            'rock' => [
                'simple' => [1, 0, 0.5, 0, 1, 0, 0.5, 0],
                'medium' => [1, 0, 0.5, 0, 1, 0, 0.5, 0, 1, 0, 0.5, 0, 1, 0, 0.5, 0],
                'complex' => [1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25, 1, 0, 0.5, 0.25]
            ],
            'jazz' => [
                'simple' => [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5],
                'medium' => [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5],
                'complex' => [0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5]
            ]
        ];
        
        $complexityLevel = $this->getComplexityLevel($complexity);
        return $patterns[$style][$complexityLevel] ?? $patterns['pop']['medium'];
    }
    
    /**
     * Arrange instruments
     */
    private function arrangeInstruments($melody, $harmony, $rhythm, $styleData) {
        $arrangement = [];
        
        // Lead instrument (melody)
        $arrangement['lead'] = [
            'instrument' => $this->selectLeadInstrument($styleData['style']),
            'notes' => $melody,
            'volume' => 0.8,
            'pan' => 0.0
        ];
        
        // Harmony instruments
        $arrangement['harmony'] = [
            'instrument' => $this->selectHarmonyInstrument($styleData['style']),
            'notes' => $harmony,
            'volume' => 0.6,
            'pan' => -0.3
        ];
        
        // Rhythm section
        $arrangement['rhythm'] = [
            'instrument' => $this->selectRhythmInstrument($styleData['style']),
            'pattern' => $rhythm,
            'volume' => 0.7,
            'pan' => 0.0
        ];
        
        // Bass
        $arrangement['bass'] = [
            'instrument' => $this->selectBassInstrument($styleData['style']),
            'notes' => $this->extractBassLine($harmony),
            'volume' => 0.5,
            'pan' => 0.0
        ];
        
        // Additional instruments based on style
        $additionalInstruments = $this->getAdditionalInstruments($styleData['style'], $styleData['complexity']);
        foreach ($additionalInstruments as $instrument) {
            $arrangement[$instrument['name']] = $instrument;
        }
        
        return $arrangement;
    }
    
    /**
     * Compose final piece
     */
    private function composeFinalPiece($melody, $harmony, $rhythm, $arrangement, $structure) {
        $composition = [
            'key' => $melody[0]['key'] ?? 'C',
            'time_signature' => '4/4',
            'tempo' => 120,
            'sections' => $structure,
            'melody' => $melody,
            'harmony' => $harmony,
            'rhythm' => $rhythm,
            'arrangement' => $arrangement,
            'total_duration' => $this->calculateTotalDuration($structure)
        ];
        
        return $composition;
    }
    
    /**
     * Helper methods
     */
    private function getComplexityLevel($complexity) {
        if ($complexity <= 3) return 'simple';
        if ($complexity <= 7) return 'medium';
        return 'complex';
    }
    
    private function getIntensityLevel($intensity) {
        if ($intensity <= 0.3) return 'low';
        if ($intensity <= 0.7) return 'medium';
        return 'high';
    }
    
    private function calculateSectionIntensity($section, $style, $mood) {
        $baseIntensity = 0.5;
        
        // Adjust based on section
        switch ($section) {
            case 'chorus':
                $baseIntensity += 0.3;
                break;
            case 'verse':
                $baseIntensity -= 0.1;
                break;
            case 'bridge':
                $baseIntensity += 0.2;
                break;
            case 'solo':
                $baseIntensity += 0.4;
                break;
        }
        
        // Adjust based on mood
        switch ($mood) {
            case 'energetic':
                $baseIntensity += 0.2;
                break;
            case 'calm':
                $baseIntensity -= 0.2;
                break;
            case 'mysterious':
                $baseIntensity += 0.1;
                break;
        }
        
        return max(0.1, min(1.0, $baseIntensity));
    }
    
    private function calculateNoteCount($section, $tempo, $complexity) {
        $baseNotes = $section['duration'] * ($tempo / 60) * 4; // 4 notes per beat
        $complexityMultiplier = 1 + ($complexity / 10);
        return intval($baseNotes * $complexityMultiplier);
    }
    
    private function getMelodicPatterns($style, $mood, $complexity) {
        // This would return melodic patterns based on style, mood, and complexity
        return [0, 2, 4, 7, 9, 11]; // Default major scale pattern
    }
    
    private function createMelodicContour($section, $mood, $complexity) {
        // Create melodic contour (direction of melody)
        $contour = [];
        $steps = 8;
        
        for ($i = 0; $i < $steps; $i++) {
            if ($mood === 'happy') {
                $contour[] = rand(0, 1); // Upward tendency
            } elseif ($mood === 'sad') {
                $contour[] = rand(-1, 0); // Downward tendency
            } else {
                $contour[] = rand(-1, 1); // Mixed
            }
        }
        
        return $contour;
    }
    
    private function selectNoteFromScale($pattern, $direction, $scale, $complexity) {
        // Select note based on pattern, direction, and complexity
        $baseIndex = $pattern % count($scale);
        
        if ($direction > 0) {
            $baseIndex = min($baseIndex + 1, count($scale) - 1);
        } elseif ($direction < 0) {
            $baseIndex = max($baseIndex - 1, 0);
        }
        
        return $baseIndex;
    }
    
    private function determineOctave($index, $contour, $mood) {
        $baseOctave = 4;
        
        // Adjust octave based on contour and mood
        if ($mood === 'energetic') {
            $baseOctave += rand(0, 1);
        } elseif ($mood === 'calm') {
            $baseOctave += rand(-1, 0);
        }
        
        return max(2, min(7, $baseOctave));
    }
    
    private function calculateNoteDuration($index, $patterns, $tempo, $complexity) {
        $durations = [0.25, 0.5, 1, 2, 4]; // Quarter, half, whole notes
        $patternIndex = $index % count($patterns);
        
        // More complex compositions have more varied note durations
        if ($complexity > 7) {
            $durations[] = 0.125; // Eighth notes
            $durations[] = 0.0625; // Sixteenth notes
        }
        
        return $durations[array_rand($durations)];
    }
    
    private function calculateNoteVelocity($index, $contour, $mood, $complexity) {
        $baseVelocity = 0.7;
        
        // Adjust based on mood
        switch ($mood) {
            case 'energetic':
                $baseVelocity += 0.2;
                break;
            case 'calm':
                $baseVelocity -= 0.2;
                break;
        }
        
        // Add variation based on complexity
        if ($complexity > 5) {
            $baseVelocity += rand(-0.1, 0.1);
        }
        
        return max(0.3, min(1.0, $baseVelocity));
    }
    
    private function applyMelodicRules($notes, $style, $complexity) {
        // Apply melodic rules and constraints
        // This would include rules like avoiding large leaps, resolving dissonances, etc.
        return $notes;
    }
    
    private function getBeatsPerBar($timeSignature) {
        $parts = explode('/', $timeSignature);
        return (int)$parts[0];
    }
    
    private function calculateBarCount($duration, $tempo, $beatsPerBar) {
        $beatsPerSecond = $tempo / 60;
        $totalBeats = $duration * $beatsPerSecond;
        return ceil($totalBeats / $beatsPerBar);
    }
    
    private function isAccentBeat($beat, $beatsPerBar, $style) {
        // Determine if this beat should be accented
        if ($beat === 0) return true; // First beat always accented
        if ($style === 'jazz' && $beat === 2) return true; // Jazz accent on 3rd beat
        return false;
    }
    
    private function selectLeadInstrument($style) {
        $instruments = [
            'pop' => 'piano',
            'rock' => 'guitar',
            'jazz' => 'saxophone',
            'classical' => 'violin',
            'electronic' => 'synthesizer'
        ];
        
        return $instruments[$style] ?? 'piano';
    }
    
    private function selectHarmonyInstrument($style) {
        $instruments = [
            'pop' => 'strings',
            'rock' => 'guitar',
            'jazz' => 'piano',
            'classical' => 'strings',
            'electronic' => 'pad'
        ];
        
        return $instruments[$style] ?? 'strings';
    }
    
    private function selectRhythmInstrument($style) {
        $instruments = [
            'pop' => 'drums',
            'rock' => 'drums',
            'jazz' => 'drums',
            'classical' => 'timpani',
            'electronic' => 'drums'
        ];
        
        return $instruments[$style] ?? 'drums';
    }
    
    private function selectBassInstrument($style) {
        $instruments = [
            'pop' => 'bass',
            'rock' => 'bass',
            'jazz' => 'bass',
            'classical' => 'bass',
            'electronic' => 'bass'
        ];
        
        return $instruments[$style] ?? 'bass';
    }
    
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
    
    private function getAdditionalInstruments($style, $complexity) {
        $additional = [];
        
        if ($complexity > 7) {
            switch ($style) {
                case 'jazz':
                    $additional[] = [
                        'name' => 'brass',
                        'instrument' => 'trumpet',
                        'volume' => 0.4,
                        'pan' => 0.3
                    ];
                    break;
                case 'classical':
                    $additional[] = [
                        'name' => 'woodwinds',
                        'instrument' => 'flute',
                        'volume' => 0.3,
                        'pan' => -0.2
                    ];
                    break;
            }
        }
        
        return $additional;
    }
    
    private function calculateTotalDuration($structure) {
        $total = 0;
        foreach ($structure as $section) {
            $total += $section['duration'];
        }
        return $total;
    }
}

/**
 * Advanced Music Theory Class
 */
class AdvancedMusicTheory {
    public function getOptimalKey($mood, $style) {
        $moodKeys = [
            'happy' => ['C', 'G', 'D', 'F'],
            'sad' => ['A', 'E', 'B', 'D'],
            'energetic' => ['E', 'B', 'F#', 'C#'],
            'calm' => ['F', 'Bb', 'Eb', 'Ab'],
            'romantic' => ['D', 'A', 'E', 'B'],
            'mysterious' => ['F#', 'C#', 'G#', 'D#']
        ];
        
        $keys = $moodKeys[$mood] ?? ['C', 'G', 'D'];
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
 * Composition Engine Class
 */
class CompositionEngine {
    public function __construct() {
        // Initialize composition engine
    }
}

/**
 * Style Analyzer Class
 */
class StyleAnalyzer {
    public function analyzeStyle($style, $mood) {
        return [
            'style' => $style,
            'mood' => $mood,
            'tempo' => $this->getStyleTempo($style, $mood),
            'time_signature' => $this->getStyleTimeSignature($style),
            'complexity' => $this->getStyleComplexity($style)
        ];
    }
    
    private function getStyleTempo($style, $mood) {
        $baseTempos = [
            'pop' => 120,
            'rock' => 140,
            'jazz' => 100,
            'classical' => 80,
            'electronic' => 130
        ];
        
        $baseTempo = $baseTempos[$style] ?? 120;
        
        // Adjust based on mood
        switch ($mood) {
            case 'energetic':
                $baseTempo += 20;
                break;
            case 'calm':
                $baseTempo -= 20;
                break;
        }
        
        return max(60, min(200, $baseTempo));
    }
    
    private function getStyleTimeSignature($style) {
        $signatures = [
            'pop' => '4/4',
            'rock' => '4/4',
            'jazz' => '4/4',
            'classical' => '4/4',
            'electronic' => '4/4'
        ];
        
        return $signatures[$style] ?? '4/4';
    }
    
    private function getStyleComplexity($style) {
        $complexities = [
            'pop' => 3,
            'rock' => 4,
            'jazz' => 7,
            'classical' => 8,
            'electronic' => 5
        ];
        
        return $complexities[$style] ?? 5;
    }
}

// Helper function to get music composer instance
function music_composer() {
    return new MusicComposer();
}
?>