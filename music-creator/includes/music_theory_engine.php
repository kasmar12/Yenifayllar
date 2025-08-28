<?php
require_once 'config.php';

/**
 * Music Theory Engine
 * Professional Music Theory & Harmony
 * 100% Original - Studio Quality
 */
class MusicTheoryEngine {
    private $config;
    
    public function __construct() {
        $this->config = [
            'temperament' => 'equal', // equal temperament
            'base_frequency' => 440,  // A4 = 440 Hz
            'octaves' => 8,           // 8 octaves
            'quality' => 'professional'
        ];
    }
    
    /**
     * Get all musical scales
     */
    public function getAllScales() {
        return [
            'major' => [
                'name' => 'Major Scale',
                'intervals' => [0, 2, 4, 5, 7, 9, 11],
                'description' => 'Bright, happy, uplifting sound',
                'characteristics' => ['bright', 'happy', 'uplifting', 'classical']
            ],
            'natural_minor' => [
                'name' => 'Natural Minor Scale',
                'intervals' => [0, 2, 3, 5, 7, 8, 10],
                'description' => 'Melancholic, sad, introspective sound',
                'characteristics' => ['melancholic', 'sad', 'introspective', 'jazz']
            ],
            'harmonic_minor' => [
                'name' => 'Harmonic Minor Scale',
                'intervals' => [0, 2, 3, 5, 7, 8, 11],
                'description' => 'Dramatic, exotic, mysterious sound',
                'characteristics' => ['dramatic', 'exotic', 'mysterious', 'classical']
            ],
            'melodic_minor' => [
                'name' => 'Melodic Minor Scale',
                'intervals' => [0, 2, 3, 5, 7, 9, 11],
                'description' => 'Smooth, flowing, jazz-like sound',
                'characteristics' => ['smooth', 'flowing', 'jazz', 'sophisticated']
            ],
            'pentatonic_major' => [
                'name' => 'Major Pentatonic Scale',
                'intervals' => [0, 2, 4, 7, 9],
                'description' => 'Simple, folk-like, universal sound',
                'characteristics' => ['simple', 'folk', 'universal', 'pop']
            ],
            'pentatonic_minor' => [
                'name' => 'Minor Pentatonic Scale',
                'intervals' => [0, 3, 5, 7, 10],
                'description' => 'Bluesy, rock, soulful sound',
                'characteristics' => ['bluesy', 'rock', 'soulful', 'guitar']
            ],
            'blues' => [
                'name' => 'Blues Scale',
                'intervals' => [0, 3, 5, 6, 7, 10],
                'description' => 'Blues, jazz, soul sound',
                'characteristics' => ['blues', 'jazz', 'soul', 'expressive']
            ],
            'dorian' => [
                'name' => 'Dorian Mode',
                'intervals' => [0, 2, 3, 5, 7, 9, 10],
                'description' => 'Jazzy, sophisticated, minor with major 6th',
                'characteristics' => ['jazzy', 'sophisticated', 'minor', 'modal']
            ],
            'mixolydian' => [
                'name' => 'Mixolydian Mode',
                'intervals' => [0, 2, 4, 5, 7, 9, 10],
                'description' => 'Rock, blues, dominant 7th sound',
                'characteristics' => ['rock', 'blues', 'dominant', 'guitar']
            ],
            'lydian' => [
                'name' => 'Lydian Mode',
                'intervals' => [0, 2, 4, 6, 7, 9, 11],
                'description' => 'Bright, dreamy, major with sharp 4th',
                'characteristics' => ['bright', 'dreamy', 'major', 'cinematic']
            ],
            'phrygian' => [
                'name' => 'Phrygian Mode',
                'intervals' => [0, 1, 3, 5, 7, 8, 10],
                'description' => 'Spanish, flamenco, exotic sound',
                'characteristics' => ['spanish', 'flamenco', 'exotic', 'ethnic']
            ],
            'locrian' => [
                'name' => 'Locrian Mode',
                'intervals' => [0, 1, 3, 5, 6, 8, 10],
                'description' => 'Dark, unstable, diminished sound',
                'characteristics' => ['dark', 'unstable', 'diminished', 'experimental']
            ]
        ];
    }
    
    /**
     * Get scale notes for a specific key
     */
    public function getScaleNotes($scaleType, $rootNote, $octave = 4) {
        try {
            $scales = $this->getAllScales();
            
            if (!isset($scales[$scaleType])) {
                return [
                    'success' => false,
                    'message' => 'Invalid scale type'
                ];
            }
            
            $scale = $scales[$scaleType];
            $rootMidi = $this->noteToMidi($rootNote, $octave);
            $notes = [];
            
            foreach ($scale['intervals'] as $interval) {
                $noteMidi = $rootMidi + $interval;
                $notes[] = [
                    'midi' => $noteMidi,
                    'note' => $this->midiToNote($noteMidi),
                    'frequency' => $this->midiToFrequency($noteMidi),
                    'octave' => $this->getOctaveFromMidi($noteMidi)
                ];
            }
            
            return [
                'success' => true,
                'data' => [
                    'scale_type' => $scaleType,
                    'scale_name' => $scale['name'],
                    'root_note' => $rootNote,
                    'root_octave' => $octave,
                    'intervals' => $scale['intervals'],
                    'notes' => $notes,
                    'characteristics' => $scale['characteristics'],
                    'description' => $scale['description']
                ]
            ];
            
        } catch (Exception $e) {
            error_log("Get Scale Notes Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to generate scale notes'
            ];
        }
    }
    
    /**
     * Get all chord types
     */
    public function getAllChords() {
        return [
            'major' => [
                'name' => 'Major Chord',
                'intervals' => [0, 4, 7],
                'description' => 'Bright, happy, stable sound',
                'characteristics' => ['bright', 'happy', 'stable', 'resolved']
            ],
            'minor' => [
                'name' => 'Minor Chord',
                'intervals' => [0, 3, 7],
                'description' => 'Melancholic, sad, introspective sound',
                'characteristics' => ['melancholic', 'sad', 'introspective', 'unresolved']
            ],
            'diminished' => [
                'name' => 'Diminished Chord',
                'intervals' => [0, 3, 6],
                'description' => 'Tense, unstable, dark sound',
                'characteristics' => ['tense', 'unstable', 'dark', 'dissonant']
            ],
            'augmented' => [
                'name' => 'Augmented Chord',
                'intervals' => [0, 4, 8],
                'description' => 'Bright, tense, mysterious sound',
                'characteristics' => ['bright', 'tense', 'mysterious', 'unstable']
            ],
            'major_7th' => [
                'name' => 'Major 7th Chord',
                'intervals' => [0, 4, 7, 11],
                'description' => 'Jazzy, sophisticated, dreamy sound',
                'characteristics' => ['jazzy', 'sophisticated', 'dreamy', 'complex']
            ],
            'minor_7th' => [
                'name' => 'Minor 7th Chord',
                'intervals' => [0, 3, 7, 10],
                'description' => 'Jazzy, bluesy, soulful sound',
                'characteristics' => ['jazzy', 'bluesy', 'soulful', 'complex']
            ],
            'dominant_7th' => [
                'name' => 'Dominant 7th Chord',
                'intervals' => [0, 4, 7, 10],
                'description' => 'Bluesy, rock, tension sound',
                'characteristics' => ['bluesy', 'rock', 'tension', 'unresolved']
            ],
            'diminished_7th' => [
                'name' => 'Diminished 7th Chord',
                'intervals' => [0, 3, 6, 9],
                'description' => 'Very tense, unstable, dark sound',
                'characteristics' => ['very_tense', 'unstable', 'dark', 'dissonant']
            ],
            'half_diminished' => [
                'name' => 'Half-Diminished Chord',
                'intervals' => [0, 3, 6, 10],
                'description' => 'Jazzy, tense, sophisticated sound',
                'characteristics' => ['jazzy', 'tense', 'sophisticated', 'complex']
            ],
            'sus2' => [
                'name' => 'Suspended 2nd Chord',
                'intervals' => [0, 2, 7],
                'description' => 'Open, airy, folk-like sound',
                'characteristics' => ['open', 'airy', 'folk', 'unresolved']
            ],
            'sus4' => [
                'name' => 'Suspended 4th Chord',
                'intervals' => [0, 5, 7],
                'description' => 'Open, airy, rock sound',
                'characteristics' => ['open', 'airy', 'rock', 'unresolved']
            ],
            'power' => [
                'name' => 'Power Chord',
                'intervals' => [0, 7],
                'description' => 'Rock, punk, heavy sound',
                'characteristics' => ['rock', 'punk', 'heavy', 'simple']
            ]
        ];
    }
    
    /**
     * Get chord notes for a specific root note
     */
    public function getChordNotes($chordType, $rootNote, $octave = 4) {
        try {
            $chords = $this->getAllChords();
            
            if (!isset($chords[$chordType])) {
                return [
                    'success' => false,
                    'message' => 'Invalid chord type'
                ];
            }
            
            $chord = $chords[$chordType];
            $rootMidi = $this->noteToMidi($rootNote, $octave);
            $notes = [];
            
            foreach ($chord['intervals'] as $interval) {
                $noteMidi = $rootMidi + $interval;
                $notes[] = [
                    'midi' => $noteMidi,
                    'note' => $this->midiToNote($noteMidi),
                    'frequency' => $this->midiToFrequency($noteMidi),
                    'octave' => $this->getOctaveFromMidi($noteMidi)
                ];
            }
            
            return [
                'success' => true,
                'data' => [
                    'chord_type' => $chordType,
                    'chord_name' => $chord['name'],
                    'root_note' => $rootNote,
                    'root_octave' => $octave,
                    'intervals' => $chord['intervals'],
                    'notes' => $notes,
                    'characteristics' => $chord['characteristics'],
                    'description' => $chord['description']
                ]
            ];
            
        } catch (Exception $e) {
            error_log("Get Chord Notes Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to generate chord notes'
            ];
        }
    }
    
    /**
     * Get common chord progressions
     */
    public function getChordProgressions() {
        return [
            'pop_1' => [
                'name' => 'Pop Progression I-V-vi-IV',
                'chords' => ['I', 'V', 'vi', 'IV'],
                'description' => 'Classic pop progression used in countless songs',
                'examples' => ['Let It Be', 'Someone Like You', 'Perfect'],
                'characteristics' => ['pop', 'familiar', 'emotional', 'versatile']
            ],
            'pop_2' => [
                'name' => 'Pop Progression vi-IV-I-V',
                'chords' => ['vi', 'IV', 'I', 'V'],
                'description' => 'Modern pop progression with emotional start',
                'examples' => ['Someone Like You', 'All of Me', 'Stay With Me'],
                'characteristics' => ['modern', 'emotional', 'pop', 'versatile']
            ],
            'jazz_1' => [
                'name' => 'Jazz II-V-I',
                'chords' => ['ii', 'V', 'I'],
                'description' => 'Fundamental jazz progression',
                'examples' => ['Autumn Leaves', 'Take Five', 'So What'],
                'characteristics' => ['jazz', 'sophisticated', 'fundamental', 'complex']
            ],
            'jazz_2' => [
                'name' => 'Jazz I-vi-ii-V',
                'chords' => ['I', 'vi', 'ii', 'V'],
                'description' => 'Classic jazz progression',
                'examples' => ['I Got Rhythm', 'Cherokee', 'All the Things You Are'],
                'characteristics' => ['jazz', 'classic', 'sophisticated', 'complex']
            ],
            'blues_1' => [
                'name' => '12-Bar Blues',
                'chords' => ['I', 'I', 'I', 'I', 'IV', 'IV', 'I', 'I', 'V', 'IV', 'I', 'I'],
                'description' => 'Classic 12-bar blues progression',
                'examples' => ['Hound Dog', 'Sweet Home Chicago', 'Pride and Joy'],
                'characteristics' => ['blues', 'classic', 'repetitive', 'guitar']
            ],
            'rock_1' => [
                'name' => 'Rock Progression I-IV-V',
                'chords' => ['I', 'IV', 'V'],
                'description' => 'Classic rock progression',
                'examples' => ['Johnny B. Goode', 'Louie Louie', 'Wild Thing'],
                'characteristics' => ['rock', 'classic', 'simple', 'powerful']
            ],
            'rock_2' => [
                'name' => 'Rock Progression I-V-vi-IV',
                'chords' => ['I', 'V', 'vi', 'IV'],
                'description' => 'Modern rock progression',
                'examples' => ['Wonderwall', 'Creep', 'Basket Case'],
                'characteristics' => ['rock', 'modern', 'emotional', 'versatile']
            ],
            'classical_1' => [
                'name' => 'Classical I-IV-V-I',
                'chords' => ['I', 'IV', 'V', 'I'],
                'description' => 'Classical cadence progression',
                'examples' => ['Beethoven Symphony No. 5', 'Mozart Symphony No. 40'],
                'characteristics' => ['classical', 'traditional', 'resolved', 'formal']
            ],
            'classical_2' => [
                'name' => 'Classical I-vi-IV-V',
                'chords' => ['I', 'vi', 'IV', 'V'],
                'description' => 'Classical progression with deceptive cadence',
                'examples' => ['Pachelbel Canon', 'Bach Prelude in C'],
                'characteristics' => ['classical', 'sophisticated', 'deceptive', 'formal']
            ]
        ];
    }
    
    /**
     * Generate chord progression in a specific key
     */
    public function generateChordProgression($progressionType, $key, $octave = 4) {
        try {
            $progressions = $this->getChordProgressions();
            
            if (!isset($progressions[$progressionType])) {
                return [
                    'success' => false,
                    'message' => 'Invalid progression type'
                ];
            }
            
            $progression = $progressions[$progressionType];
            $keyMidi = $this->noteToMidi($key, $octave);
            $chords = [];
            
            foreach ($progression['chords'] as $chordNumeral) {
                $chordRoot = $this->getChordRootFromNumeral($chordNumeral, $key);
                $chordType = $this->getChordTypeFromNumeral($chordNumeral);
                
                $chordNotes = $this->getChordNotes($chordType, $chordRoot, $octave);
                
                if ($chordNotes['success']) {
                    $chords[] = [
                        'numeral' => $chordNumeral,
                        'root' => $chordRoot,
                        'type' => $chordType,
                        'notes' => $chordNotes['data']['notes']
                    ];
                }
            }
            
            return [
                'success' => true,
                'data' => [
                    'progression_type' => $progressionType,
                    'progression_name' => $progression['name'],
                    'key' => $key,
                    'key_octave' => $octave,
                    'chord_numerals' => $progression['chords'],
                    'chords' => $chords,
                    'characteristics' => $progression['characteristics'],
                    'description' => $progression['description'],
                    'examples' => $progression['examples']
                ]
            ];
            
        } catch (Exception $e) {
            error_log("Generate Chord Progression Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to generate chord progression'
            ];
        }
    }
    
    /**
     * Analyze harmony of a chord progression
     */
    public function analyzeHarmony($chordProgression) {
        try {
            $analysis = [
                'tension_level' => 0,
                'resolution_points' => [],
                'voice_leading' => [],
                'harmonic_function' => [],
                'suggestions' => []
            ];
            
            $totalChords = count($chordProgression);
            
            for ($i = 0; $i < $totalChords; $i++) {
                $currentChord = $chordProgression[$i];
                $nextChord = isset($chordProgression[$i + 1]) ? $chordProgression[$i + 1] : null;
                
                // Analyze tension level
                $analysis['tension_level'] += $this->calculateChordTension($currentChord);
                
                // Analyze voice leading
                if ($nextChord) {
                    $voiceLeading = $this->analyzeVoiceLeading($currentChord, $nextChord);
                    $analysis['voice_leading'][] = $voiceLeading;
                }
                
                // Analyze harmonic function
                $harmonicFunction = $this->analyzeHarmonicFunction($currentChord, $i, $totalChords);
                $analysis['harmonic_function'][] = $harmonicFunction;
                
                // Check for resolution points
                if ($this->isResolutionPoint($currentChord, $i, $totalChords)) {
                    $analysis['resolution_points'][] = $i;
                }
            }
            
            // Generate suggestions
            $analysis['suggestions'] = $this->generateHarmonicSuggestions($analysis);
            
            return [
                'success' => true,
                'data' => $analysis
            ];
            
        } catch (Exception $e) {
            error_log("Analyze Harmony Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to analyze harmony'
            ];
        }
    }
    
    /**
     * Generate melody based on scale and chord progression
     */
    public function generateMelody($scaleType, $key, $chordProgression, $length = 8) {
        try {
            $scaleNotes = $this->getScaleNotes($scaleType, $key);
            
            if (!$scaleNotes['success']) {
                return $scaleNotes;
            }
            
            $melody = [];
            $scaleNoteArray = $scaleNotes['data']['notes'];
            $scaleLength = count($scaleNoteArray);
            
            for ($i = 0; $i < $length; $i++) {
                $chordIndex = $i % count($chordProgression);
                $currentChord = $chordProgression[$chordIndex];
                
                // Choose melody note based on chord
                $melodyNote = $this->chooseMelodyNote($scaleNoteArray, $currentChord, $i);
                
                $melody[] = [
                    'note' => $melodyNote,
                    'chord' => $currentChord,
                    'position' => $i,
                    'duration' => $this->generateNoteDuration($i, $length)
                ];
            }
            
            return [
                'success' => true,
                'data' => [
                    'scale_type' => $scaleType,
                    'key' => $key,
                    'chord_progression' => $chordProgression,
                    'melody' => $melody,
                    'length' => $length
                ]
            ];
            
        } catch (Exception $e) {
            error_log("Generate Melody Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to generate melody'
            ];
        }
    }
    
    /**
     * Get chord root from roman numeral
     */
    private function getChordRootFromNumeral($numeral, $key) {
        $keyMidi = $this->noteToMidi($key, 4);
        $scaleIntervals = [0, 2, 4, 5, 7, 9, 11]; // Major scale intervals
        
        $chordDegree = $this->getChordDegreeFromNumeral($numeral);
        $interval = $scaleIntervals[$chordDegree];
        
        return $this->midiToNote($keyMidi + $interval);
    }
    
    /**
     * Get chord type from roman numeral
     */
    private function getChordTypeFromNumeral($numeral) {
        if (strpos($numeral, 'i') !== false) {
            return 'minor';
        } elseif (strpos($numeral, 'o') !== false) {
            return 'diminished';
        } elseif (strpos($numeral, '+') !== false) {
            return 'augmented';
        } else {
            return 'major';
        }
    }
    
    /**
     * Get chord degree from roman numeral
     */
    private function getChordDegreeFromNumeral($numeral) {
        $numeral = strtolower($numeral);
        
        if (strpos($numeral, 'i') !== false) return 0;
        if (strpos($numeral, 'ii') !== false) return 1;
        if (strpos($numeral, 'iii') !== false) return 2;
        if (strpos($numeral, 'iv') !== false) return 3;
        if (strpos($numeral, 'v') !== false) return 4;
        if (strpos($numeral, 'vi') !== false) return 5;
        if (strpos($numeral, 'vii') !== false) return 6;
        
        return 0;
    }
    
    /**
     * Calculate chord tension
     */
    private function calculateChordTension($chord) {
        $tension = 0;
        
        // Major chords have low tension
        if ($chord['type'] === 'major') {
            $tension = 1;
        }
        // Minor chords have medium tension
        elseif ($chord['type'] === 'minor') {
            $tension = 2;
        }
        // Diminished chords have high tension
        elseif ($chord['type'] === 'diminished') {
            $tension = 4;
        }
        // Augmented chords have high tension
        elseif ($chord['type'] === 'augmented') {
            $tension = 4;
        }
        
        return $tension;
    }
    
    /**
     * Analyze voice leading between chords
     */
    private function analyzeVoiceLeading($chord1, $chord2) {
        $voiceLeading = [
            'smooth' => true,
            'leaps' => [],
            'common_tones' => 0
        ];
        
        $notes1 = array_column($chord1['notes'], 'midi');
        $notes2 = array_column($chord2['notes'], 'midi');
        
        // Find common tones
        $commonTones = array_intersect($notes1, $notes2);
        $voiceLeading['common_tones'] = count($commonTones);
        
        // Check for large leaps
        foreach ($notes1 as $note1) {
            foreach ($notes2 as $note2) {
                $interval = abs($note2 - $note1);
                if ($interval > 7) { // More than a perfect 5th
                    $voiceLeading['leaps'][] = $interval;
                    $voiceLeading['smooth'] = false;
                }
            }
        }
        
        return $voiceLeading;
    }
    
    /**
     * Analyze harmonic function
     */
    private function analyzeHarmonicFunction($chord, $position, $totalChords) {
        $function = '';
        
        if ($position === 0) {
            $function = 'Tonic (I) - Home base';
        } elseif ($position === $totalChords - 1) {
            $function = 'Final (I) - Resolution';
        } elseif ($chord['numeral'] === 'V') {
            $function = 'Dominant (V) - Tension';
        } elseif ($chord['numeral'] === 'IV') {
            $function = 'Subdominant (IV) - Movement';
        } else {
            $function = 'Passing chord';
        }
        
        return $function;
    }
    
    /**
     * Check if chord is a resolution point
     */
    private function isResolutionPoint($chord, $position, $totalChords) {
        // First and last chords are resolution points
        if ($position === 0 || $position === $totalChords - 1) {
            return true;
        }
        
        // Major chords on strong beats can be resolution points
        if ($chord['type'] === 'major' && $position % 2 === 0) {
            return true;
        }
        
        return false;
    }
    
    /**
     * Generate harmonic suggestions
     */
    private function generateHarmonicSuggestions($analysis) {
        $suggestions = [];
        
        if ($analysis['tension_level'] > 15) {
            $suggestions[] = 'Consider adding more consonant chords to reduce tension';
        }
        
        if (count($analysis['resolution_points']) < 2) {
            $suggestions[] = 'Add more resolution points for better harmonic flow';
        }
        
        if (count(array_filter($analysis['voice_leading'], function($vl) { return !$vl['smooth']; })) > 0) {
            $suggestions[] = 'Smooth out voice leading to reduce large leaps';
        }
        
        return $suggestions;
    }
    
    /**
     * Choose melody note based on chord and scale
     */
    private function chooseMelodyNote($scaleNotes, $chord, $position) {
        // Prefer chord tones for strong beats
        if ($position % 2 === 0) {
            $chordTones = array_column($chord['notes'], 'midi');
            $availableNotes = array_filter($scaleNotes, function($note) use ($chordTones) {
                return in_array($note['midi'], $chordTones);
            });
            
            if (!empty($availableNotes)) {
                return $availableNotes[array_rand($availableNotes)];
            }
        }
        
        // Otherwise choose from scale notes
        return $scaleNotes[array_rand($scaleNotes)];
    }
    
    /**
     * Generate note duration
     */
    private function generateNoteDuration($position, $totalLength) {
        $durations = [0.25, 0.5, 1.0, 2.0]; // Quarter, half, whole, double whole notes
        
        // Strong beats get longer notes
        if ($position % 2 === 0) {
            return $durations[array_rand([1, 2])]; // Half or whole note
        } else {
            return $durations[array_rand([0, 1])]; // Quarter or half note
        }
    }
    
    /**
     * Convert note to MIDI number
     */
    private function noteToMidi($note, $octave) {
        $noteNames = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
        $noteIndex = array_search($note, $noteNames);
        
        if ($noteIndex === false) {
            return 60; // Default to middle C
        }
        
        return $noteIndex + ($octave * 12);
    }
    
    /**
     * Convert MIDI number to note
     */
    private function midiToNote($midi) {
        $noteNames = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
        $noteIndex = $midi % 12;
        return $noteNames[$noteIndex];
    }
    
    /**
     * Convert MIDI number to frequency
     */
    private function midiToFrequency($midi) {
        return $this->config['base_frequency'] * pow(2, ($midi - 69) / 12);
    }
    
    /**
     * Get octave from MIDI number
     */
    private function getOctaveFromMidi($midi) {
        return intval($midi / 12) - 1;
    }
}

// Helper function to get music theory engine instance
function music_theory_engine() {
    return new MusicTheoryEngine();
}
?>