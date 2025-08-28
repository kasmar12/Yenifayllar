<?php
require_once 'includes/config.php';
require_once 'includes/auth.php';
require_once 'includes/advanced_piano_engine.php';
require_once 'includes/advanced_guitar_engine.php';
require_once 'includes/advanced_drum_engine.php';

// Check if user is logged in
$auth = new Auth();
if (!$auth->isLoggedIn()) {
    header('Location: user/login.php');
    exit;
}

$currentUser = $auth->getCurrentUser();

// Initialize engines
$pianoEngine = advanced_piano_engine();
$guitarEngine = advanced_guitar_engine();
$drumEngine = advanced_drum_engine();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Instruments - <?php echo APP_NAME; ?></title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="assets/css/modern_interface.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
    <style>
        .instruments-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: var(--spacing-3xl) 0;
        }
        
        .instrument-section {
            background: var(--secondary-bg);
            border-radius: var(--radius-xl);
            padding: var(--spacing-2xl);
            margin-bottom: var(--spacing-2xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .instrument-header {
            display: flex;
            align-items: center;
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-xl);
        }
        
        .instrument-icon {
            width: 80px;
            height: 80px;
            background: var(--accent-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: var(--primary-text);
        }
        
        .instrument-info h2 {
            margin-bottom: var(--spacing-sm);
            color: var(--primary-text);
        }
        
        .instrument-info p {
            color: var(--secondary-text);
            margin: 0;
        }
        
        .instrument-controls {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-xl);
        }
        
        .control-group {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm);
        }
        
        .control-group label {
            font-weight: 500;
            color: var(--primary-text);
        }
        
        .piano-keys {
            display: flex;
            justify-content: center;
            margin: var(--spacing-xl) 0;
            position: relative;
        }
        
        .piano-key {
            width: 40px;
            height: 120px;
            background: var(--primary-text);
            border: 1px solid var(--accent-text);
            margin: 0 1px;
            cursor: pointer;
            transition: all var(--transition-fast);
            display: flex;
            align-items: flex-end;
            justify-content: center;
            padding-bottom: var(--spacing-sm);
            font-size: 0.75rem;
            color: var(--primary-bg);
        }
        
        .piano-key:hover {
            background: var(--accent-text);
            transform: translateY(-2px);
        }
        
        .piano-key.active {
            background: var(--accent-text);
            transform: translateY(2px);
        }
        
        .piano-key.black {
            width: 24px;
            height: 80px;
            background: var(--primary-bg);
            color: var(--primary-text);
            border: 1px solid var(--accent-text);
            position: absolute;
            margin-left: -12px;
        }
        
        .guitar-fretboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: var(--spacing-xl) 0;
        }
        
        .guitar-string {
            display: flex;
            align-items: center;
            margin: var(--spacing-sm) 0;
        }
        
        .guitar-fret {
            width: 60px;
            height: 40px;
            background: var(--accent-bg);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin: 0 1px;
            cursor: pointer;
            transition: all var(--transition-fast);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
            color: var(--secondary-text);
        }
        
        .guitar-fret:hover {
            background: var(--accent-text);
            color: var(--primary-text);
        }
        
        .guitar-fret.active {
            background: var(--accent-text);
            color: var(--primary-text);
        }
        
        .drum-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            gap: var(--spacing-md);
            margin: var(--spacing-xl) 0;
        }
        
        .drum-pad {
            aspect-ratio: 1;
            background: var(--accent-bg);
            border: 2px solid transparent;
            border-radius: var(--radius-full);
            cursor: pointer;
            transition: all var(--transition-fast);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: var(--secondary-text);
        }
        
        .drum-pad:hover {
            background: var(--accent-text);
            color: var(--primary-text);
            transform: scale(1.05);
        }
        
        .drum-pad.active {
            background: var(--accent-text);
            color: var(--primary-text);
            transform: scale(0.95);
        }
        
        .audio-player {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-top: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .player-controls {
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-md);
        }
        
        .play-button {
            width: 48px;
            height: 48px;
            background: var(--accent-gradient);
            border: none;
            border-radius: var(--radius-full);
            color: var(--primary-text);
            cursor: pointer;
            transition: all var(--transition-fast);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .play-button:hover {
            transform: scale(1.1);
            box-shadow: var(--shadow-lg);
        }
        
        .volume-control {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
        }
        
        .volume-slider {
            width: 100px;
            height: 4px;
            background: var(--accent-bg);
            border-radius: var(--radius-full);
            outline: none;
            -webkit-appearance: none;
        }
        
        .volume-slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 16px;
            height: 16px;
            background: var(--accent-text);
            border-radius: var(--radius-full);
            cursor: pointer;
        }
        
        .instrument-settings {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-top: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .settings-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-lg);
        }
        
        .setting-item {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm);
        }
        
        .setting-item label {
            font-weight: 500;
            color: var(--primary-text);
        }
        
        .setting-item select,
        .setting-item input {
            padding: var(--spacing-sm);
            background: var(--accent-bg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-md);
            color: var(--primary-text);
            font-family: var(--font-primary);
        }
        
        .setting-item select:focus,
        .setting-item input:focus {
            outline: none;
            border-color: var(--accent-text);
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="hero">
            <div class="hero-container">
                <h1 class="hero-title">Virtual Instruments</h1>
                <p class="hero-subtitle">Professional quality virtual instruments with realistic sound generation</p>
                <div class="hero-actions">
                    <a href="studio.php" class="btn btn-primary">
                        <i class="fas fa-music"></i> Open Studio
                    </a>
                    <a href="index.php" class="btn btn-secondary">
                        <i class="fas fa-home"></i> Home
                    </a>
                </div>
            </div>
        </header>
        
        <!-- Instruments Container -->
        <div class="instruments-container">
            <!-- Piano Section -->
            <section class="instrument-section">
                <div class="instrument-header">
                    <div class="instrument-icon">
                        <i class="fas fa-piano"></i>
                    </div>
                    <div class="instrument-info">
                        <h2>Advanced Piano</h2>
                        <p>Professional piano with velocity layers, sustain pedal, and realistic string resonance</p>
                    </div>
                </div>
                
                <div class="instrument-controls">
                    <div class="control-group">
                        <label>Piano Type</label>
                        <select id="piano-type" class="form-select">
                            <option value="grand_piano">Grand Piano</option>
                            <option value="upright_piano">Upright Piano</option>
                            <option value="electric_piano">Electric Piano</option>
                            <option value="digital_piano">Digital Piano</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Velocity</label>
                        <input type="range" id="piano-velocity" min="1" max="127" value="64" class="form-input">
                        <span id="piano-velocity-value">64</span>
                    </div>
                    
                    <div class="control-group">
                        <label>Duration</label>
                        <input type="range" id="piano-duration" min="0.1" max="5.0" step="0.1" value="1.0" class="form-input">
                        <span id="piano-duration-value">1.0s</span>
                    </div>
                    
                    <div class="control-group">
                        <label>Sustain Pedal</label>
                        <input type="checkbox" id="piano-sustain" class="form-checkbox">
                    </div>
                </div>
                
                <div class="piano-keys">
                    <!-- Piano keys will be generated by JavaScript -->
                </div>
                
                <div class="audio-player">
                    <div class="player-controls">
                        <button class="play-button" id="piano-play">
                            <i class="fas fa-play"></i>
                        </button>
                        <div class="volume-control">
                            <label>Vol</label>
                            <input type="range" class="volume-slider" min="0" max="100" value="80">
                        </div>
                    </div>
                    <div id="piano-audio-info">No audio generated yet</div>
                </div>
                
                <div class="instrument-settings">
                    <h3>Piano Settings</h3>
                    <div class="settings-grid">
                        <div class="setting-item">
                            <label>String Resonance</label>
                            <select id="piano-string-resonance" class="form-select">
                                <option value="true">Enabled</option>
                                <option value="false">Disabled</option>
                            </select>
                        </div>
                        
                        <div class="setting-item">
                            <label>Hammer Mechanics</label>
                            <select id="piano-hammer-mechanics" class="form-select">
                                <option value="true">Enabled</option>
                                <option value="false">Disabled</option>
                            </select>
                        </div>
                        
                        <div class="setting-item">
                            <label>Velocity Layers</label>
                            <select id="piano-velocity-layers" class="form-select">
                                <option value="3">3 Layers</option>
                                <option value="4" selected>4 Layers</option>
                                <option value="5">5 Layers</option>
                            </select>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Guitar Section -->
            <section class="instrument-section">
                <div class="instrument-header">
                    <div class="instrument-icon">
                        <i class="fas fa-guitar"></i>
                    </div>
                    <div class="instrument-info">
                        <h2>Advanced Guitar</h2>
                        <p>Realistic guitar with string physics, body resonance, and multiple playing styles</p>
                    </div>
                </div>
                
                <div class="instrument-controls">
                    <div class="control-group">
                        <label>Guitar Type</label>
                        <select id="guitar-type" class="form-select">
                            <option value="acoustic">Acoustic Guitar</option>
                            <option value="electric">Electric Guitar</option>
                            <option value="classical">Classical Guitar</option>
                            <option value="bass">Bass Guitar</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>String Gauge</label>
                        <select id="guitar-string-gauge" class="form-select">
                            <option value="light">Light</option>
                            <option value="medium" selected>Medium</option>
                            <option value="heavy">Heavy</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Playing Style</label>
                        <select id="guitar-playing-style" class="form-select">
                            <option value="finger_picking" selected>Finger Picking</option>
                            <option value="flat_picking">Flat Picking</option>
                            <option value="strumming">Strumming</option>
                            <option value="slapping">Slapping</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Velocity</label>
                        <input type="range" id="guitar-velocity" min="1" max="127" value="64" class="form-input">
                        <span id="guitar-velocity-value">64</span>
                    </div>
                </div>
                
                <div class="guitar-fretboard">
                    <!-- Guitar fretboard will be generated by JavaScript -->
                </div>
                
                <div class="audio-player">
                    <div class="player-controls">
                        <button class="play-button" id="guitar-play">
                            <i class="fas fa-play"></i>
                        </button>
                        <div class="volume-control">
                            <label>Vol</label>
                            <input type="range" class="volume-slider" min="0" max="100" value="80">
                        </div>
                    </div>
                    <div id="guitar-audio-info">No audio generated yet</div>
                </div>
            </section>
            
            <!-- Drums Section -->
            <section class="instrument-section">
                <div class="instrument-header">
                    <div class="instrument-icon">
                        <i class="fas fa-drum"></i>
                    </div>
                    <div class="instrument-info">
                        <h2>Advanced Drums</h2>
                        <p>Professional drum kit with room acoustics, mic positioning, and realistic tuning</p>
                    </div>
                </div>
                
                <div class="instrument-controls">
                    <div class="control-group">
                        <label>Drum Kit</label>
                        <select id="drum-kit" class="form-select">
                            <option value="acoustic" selected>Acoustic</option>
                            <option value="electronic">Electronic</option>
                            <option value="jazz">Jazz</option>
                            <option value="rock">Rock</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Room Acoustics</label>
                        <select id="drum-room-acoustics" class="form-select">
                            <option value="true" selected>Enabled</option>
                            <option value="false">Disabled</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Mic Positioning</label>
                        <select id="drum-mic-positioning" class="form-select">
                            <option value="standard" selected>Standard</option>
                            <option value="close">Close</option>
                            <option value="distant">Distant</option>
                        </select>
                    </div>
                    
                    <div class="control-group">
                        <label>Velocity</label>
                        <input type="range" id="drum-velocity" min="1" max="127" value="64" class="form-input">
                        <span id="drum-velocity-value">64</span>
                    </div>
                </div>
                
                <div class="drum-grid">
                    <div class="drum-pad" data-drum="kick">🥁</div>
                    <div class="drum-pad" data-drum="snare">🥁</div>
                    <div class="drum-pad" data-drum="hi-hat">🥁</div>
                    <div class="drum-pad" data-drum="crash">🥁</div>
                    <div class="drum-pad" data-drum="ride">🥁</div>
                    <div class="drum-pad" data-drum="tom1">🥁</div>
                    <div class="drum-pad" data-drum="tom2">🥁</div>
                    <div class="drum-pad" data-drum="floor_tom">🥁</div>
                </div>
                
                <div class="audio-player">
                    <div class="player-controls">
                        <button class="play-button" id="drum-play">
                            <i class="fas fa-play"></i>
                        </button>
                        <div class="volume-control">
                            <label>Vol</label>
                            <input type="range" class="volume-slider" min="0" max="100" value="80">
                        </div>
                    </div>
                    <div id="drum-audio-info">No audio generated yet</div>
                </div>
            </section>
        </div>
    </div>
    
    <!-- Scripts -->
    <script>
        // Virtual Instruments Interface
        class VirtualInstrumentsInterface {
            constructor() {
                this.audioContext = null;
                this.currentAudio = null;
                this.init();
            }
            
            init() {
                this.initializeAudioContext();
                this.setupPiano();
                this.setupGuitar();
                this.setupDrums();
                this.setupEventListeners();
            }
            
            initializeAudioContext() {
                try {
                    this.audioContext = new (window.AudioContext || window.webkitAudioContext)();
                    console.log('Audio Context initialized');
                } catch (error) {
                    console.error('Failed to initialize Audio Context:', error);
                }
            }
            
            setupPiano() {
                this.generatePianoKeys();
                this.updatePianoControls();
            }
            
            setupGuitar() {
                this.generateGuitarFretboard();
                this.updateGuitarControls();
            }
            
            setupDrums() {
                this.updateDrumControls();
            }
            
            setupEventListeners() {
                // Piano controls
                document.getElementById('piano-type').addEventListener('change', () => this.updatePianoControls());
                document.getElementById('piano-velocity').addEventListener('input', (e) => {
                    document.getElementById('piano-velocity-value').textContent = e.target.value;
                });
                document.getElementById('piano-duration').addEventListener('input', (e) => {
                    document.getElementById('piano-duration-value').textContent = e.target.value + 's';
                });
                
                // Guitar controls
                document.getElementById('guitar-type').addEventListener('change', () => this.updateGuitarControls());
                document.getElementById('guitar-velocity').addEventListener('input', (e) => {
                    document.getElementById('guitar-velocity-value').textContent = e.target.value;
                });
                
                // Drum controls
                document.getElementById('drum-velocity').addEventListener('input', (e) => {
                    document.getElementById('drum-velocity-value').textContent = e.target.value;
                });
                
                // Play buttons
                document.getElementById('piano-play').addEventListener('click', () => this.playPiano());
                document.getElementById('guitar-play').addEventListener('click', () => this.playGuitar());
                document.getElementById('drum-play').addEventListener('click', () => this.playDrums());
            }
            
            generatePianoKeys() {
                const pianoKeys = document.querySelector('.piano-keys');
                pianoKeys.innerHTML = '';
                
                const notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
                const octave = 4;
                
                for (let i = 0; i < 12; i++) {
                    const note = notes[i];
                    const isBlack = note.includes('#');
                    
                    const key = document.createElement('div');
                    key.className = `piano-key ${isBlack ? 'black' : ''}`;
                    key.textContent = note + octave;
                    key.dataset.note = i + (octave * 12);
                    
                    key.addEventListener('mousedown', () => this.playPianoNote(i + (octave * 12)));
                    key.addEventListener('mouseup', () => this.stopPianoNote());
                    key.addEventListener('mouseleave', () => this.stopPianoNote());
                    
                    pianoKeys.appendChild(key);
                }
            }
            
            generateGuitarFretboard() {
                const fretboard = document.querySelector('.guitar-fretboard');
                fretboard.innerHTML = '';
                
                const strings = ['E', 'A', 'D', 'G', 'B', 'E'];
                const frets = 12;
                
                strings.forEach((stringNote, stringIndex) => {
                    const stringElement = document.createElement('div');
                    stringElement.className = 'guitar-string';
                    
                    for (let fret = 0; fret <= frets; fret++) {
                        const fretElement = document.createElement('div');
                        fretElement.className = 'guitar-fret';
                        fretElement.textContent = stringNote + fret;
                        fretElement.dataset.string = stringIndex;
                        fretElement.dataset.fret = fret;
                        
                        fretElement.addEventListener('click', () => this.playGuitarNote(stringIndex, fret));
                        
                        stringElement.appendChild(fretElement);
                    }
                    
                    fretboard.appendChild(stringElement);
                });
            }
            
            updatePianoControls() {
                const pianoType = document.getElementById('piano-type').value;
                console.log('Piano type changed to:', pianoType);
            }
            
            updateGuitarControls() {
                const guitarType = document.getElementById('guitar-type').value;
                console.log('Guitar type changed to:', guitarType);
            }
            
            updateDrumControls() {
                const drumKit = document.getElementById('drum-kit').value;
                console.log('Drum kit changed to:', drumKit);
            }
            
            playPianoNote(note) {
                const velocity = parseInt(document.getElementById('piano-velocity').value);
                const duration = parseFloat(document.getElementById('piano-duration').value);
                
                console.log('Playing piano note:', note, 'velocity:', velocity, 'duration:', duration);
                
                // Generate audio using the piano engine
                this.generatePianoAudio(note, velocity, duration);
            }
            
            stopPianoNote() {
                // Stop piano note
                console.log('Stopping piano note');
            }
            
            playGuitarNote(string, fret) {
                const velocity = parseInt(document.getElementById('guitar-velocity').value);
                
                console.log('Playing guitar note:', string, fret, 'velocity:', velocity);
                
                // Generate audio using the guitar engine
                this.generateGuitarAudio(string, fret, velocity);
            }
            
            playDrumHit(drumPiece) {
                const velocity = parseInt(document.getElementById('drum-velocity').value);
                
                console.log('Playing drum hit:', drumPiece, 'velocity:', velocity);
                
                // Generate audio using the drum engine
                this.generateDrumAudio(drumPiece, velocity);
            }
            
            generatePianoAudio(note, velocity, duration) {
                // This would call the PHP piano engine
                // For now, just show a message
                document.getElementById('piano-audio-info').textContent = 
                    `Generated piano note: ${note}, velocity: ${velocity}, duration: ${duration}s`;
            }
            
            generateGuitarAudio(string, fret, velocity) {
                // This would call the PHP guitar engine
                // For now, just show a message
                document.getElementById('guitar-audio-info').textContent = 
                    `Generated guitar note: string ${string}, fret ${fret}, velocity: ${velocity}`;
            }
            
            generateDrumAudio(drumPiece, velocity) {
                // This would call the PHP drum engine
                // For now, just show a message
                document.getElementById('drum-audio-info').textContent = 
                    `Generated drum hit: ${drumPiece}, velocity: ${velocity}`;
            }
            
            playPiano() {
                console.log('Play piano button clicked');
            }
            
            playGuitar() {
                console.log('Play guitar button clicked');
            }
            
            playDrums() {
                console.log('Play drums button clicked');
            }
        }
        
        // Initialize when DOM is loaded
        document.addEventListener('DOMContentLoaded', () => {
            window.virtualInstruments = new VirtualInstrumentsInterface();
            
            // Setup drum pad event listeners
            document.querySelectorAll('.drum-pad').forEach(pad => {
                pad.addEventListener('click', () => {
                    const drumPiece = pad.dataset.drum;
                    window.virtualInstruments.playDrumHit(drumPiece);
                    
                    // Visual feedback
                    pad.classList.add('active');
                    setTimeout(() => pad.classList.remove('active'), 100);
                });
            });
        });
    </script>
</body>
</html>