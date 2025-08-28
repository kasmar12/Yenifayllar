<?php
require_once 'includes/config.php';
require_once 'includes/auth.php';
require_once 'includes/audio_effects_engine.php';
require_once 'includes/mixing_console.php';
require_once 'includes/virtual_instruments.php';

// Check if user is logged in
$auth = new Auth();
if (!$auth->isLoggedIn()) {
    header('Location: user/login.php');
    exit;
}

$currentUser = $auth->getCurrentUser();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Studio - <?php echo APP_NAME; ?></title>
    
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
        /* Studio-specific styles */
        .studio-container {
            display: grid;
            grid-template-areas: 
                "header header"
                "sidebar main"
                "footer footer";
            grid-template-columns: 250px 1fr;
            grid-template-rows: auto 1fr auto;
            height: 100vh;
            background: var(--primary-bg);
        }
        
        .studio-header {
            grid-area: header;
            background: var(--secondary-bg);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: var(--spacing-md);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .studio-sidebar {
            grid-area: sidebar;
            background: var(--secondary-bg);
            border-right: 1px solid rgba(255, 255, 255, 0.1);
            padding: var(--spacing-md);
            overflow-y: auto;
        }
        
        .studio-main {
            grid-area: main;
            background: var(--primary-bg);
            overflow-y: auto;
            padding: var(--spacing-md);
        }
        
        .studio-footer {
            grid-area: footer;
            background: var(--secondary-bg);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: var(--spacing-md);
            text-align: center;
            color: var(--secondary-text);
        }
        
        .transport {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .transport-controls {
            display: flex;
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }
        
        .transport-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-lg);
        }
        
        .timeline {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            --progress: 0%;
        }
        
        .timeline-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: var(--spacing-md);
            font-family: var(--font-mono);
        }
        
        .timeline-ruler {
            height: 40px;
            background: var(--accent-bg);
            border-radius: var(--radius-md);
            position: relative;
            overflow: hidden;
        }
        
        .timeline-ruler::after {
            content: '';
            position: absolute;
            top: 0;
            left: var(--progress);
            width: 2px;
            height: 100%;
            background: var(--accent-text);
            box-shadow: 0 0 10px var(--accent-text);
        }
        
        .tracks-container {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            min-height: 400px;
        }
        
        .track {
            background: var(--accent-bg);
            border-radius: var(--radius-md);
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
            border: 2px solid transparent;
            border-left: 4px solid var(--track-color);
            transition: all var(--transition-normal);
        }
        
        .track:hover {
            border-color: var(--accent-text);
            transform: translateX(4px);
        }
        
        .track-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-md);
        }
        
        .track-info .track-name {
            font-weight: 600;
            color: var(--primary-text);
        }
        
        .track-info .track-type {
            font-size: 0.875rem;
            color: var(--secondary-text);
        }
        
        .track-controls {
            display: flex;
            gap: var(--spacing-sm);
        }
        
        .track-controls button {
            background: none;
            border: none;
            color: var(--secondary-text);
            cursor: pointer;
            padding: var(--spacing-sm);
            border-radius: var(--radius-sm);
            transition: all var(--transition-fast);
        }
        
        .track-controls button:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--primary-text);
        }
        
        .track-controls button.active {
            background: var(--accent-text);
            color: var(--primary-text);
        }
        
        .track-content {
            margin-bottom: var(--spacing-md);
        }
        
        .track-clips {
            position: relative;
            height: 80px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: var(--radius-sm);
            overflow: hidden;
        }
        
        .clip {
            position: absolute;
            top: 0;
            height: 100%;
            background: var(--accent-gradient);
            border-radius: var(--radius-sm);
            padding: var(--spacing-sm);
            cursor: pointer;
            transition: all var(--transition-fast);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .clip:hover {
            transform: scale(1.02);
            box-shadow: var(--shadow-md);
        }
        
        .clip.selected {
            border-color: var(--accent-text);
            box-shadow: 0 0 0 2px var(--accent-text);
        }
        
        .clip-content {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .clip-name {
            font-size: 0.75rem;
            font-weight: 600;
            color: var(--primary-text);
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .clip-duration {
            font-size: 0.625rem;
            color: var(--secondary-text);
            font-family: var(--font-mono);
        }
        
        .track-mixer {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--spacing-md);
        }
        
        .volume-control,
        .pan-control {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm);
        }
        
        .volume-control label,
        .pan-control label {
            font-size: 0.75rem;
            color: var(--secondary-text);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .volume-control input,
        .pan-control input {
            width: 100%;
        }
        
        .volume-value,
        .pan-value {
            font-size: 0.75rem;
            color: var(--accent-text);
            font-family: var(--font-mono);
            text-align: center;
        }
        
        .mixer {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .mixer-header {
            margin-bottom: var(--spacing-lg);
        }
        
        .mixer-tracks {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: var(--spacing-lg);
        }
        
        .mixer-track {
            text-align: center;
        }
        
        .mixer-track-name {
            font-size: 0.875rem;
            color: var(--primary-text);
            margin-bottom: var(--spacing-sm);
        }
        
        .mixer-track-fader input {
            height: 120px;
            writing-mode: bt-lr;
            -webkit-appearance: slider-vertical;
        }
        
        .mixer-track-pan input {
            width: 100%;
        }
        
        .tools {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .tools-header {
            margin-bottom: var(--spacing-lg);
        }
        
        .tools-content {
            display: flex;
            gap: var(--spacing-md);
            flex-wrap: wrap;
        }
        
        .drop-zone {
            border: 2px dashed rgba(255, 255, 255, 0.3);
            border-radius: var(--radius-lg);
            padding: var(--spacing-2xl);
            text-align: center;
            transition: all var(--transition-fast);
            margin-bottom: var(--spacing-lg);
        }
        
        .drop-zone.drag-over {
            border-color: var(--accent-text);
            background: rgba(0, 212, 255, 0.1);
        }
        
        .drop-zone-icon {
            font-size: 3rem;
            color: var(--secondary-text);
            margin-bottom: var(--spacing-md);
        }
        
        .drop-zone-text {
            color: var(--secondary-text);
            margin-bottom: var(--spacing-md);
        }
        
        .file-input {
            display: none;
        }
        
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--tertiary-bg);
            color: var(--primary-text);
            padding: var(--spacing-md) var(--spacing-lg);
            border-radius: var(--radius-md);
            border: 1px solid rgba(255, 255, 255, 0.1);
            z-index: var(--z-tooltip);
            animation: slideIn 0.3s ease-out;
        }
        
        .notification-success {
            border-color: var(--success-text);
            background: rgba(0, 255, 136, 0.1);
        }
        
        .notification-error {
            border-color: var(--error-text);
            background: rgba(255, 68, 68, 0.1);
        }
        
        .notification-info {
            border-color: var(--accent-text);
            background: rgba(0, 212, 255, 0.1);
        }
        
        @media (max-width: 1024px) {
            .studio-container {
                grid-template-columns: 200px 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .studio-container {
                grid-template-areas: 
                    "header"
                    "main"
                    "footer";
                grid-template-columns: 1fr;
            }
            
            .studio-sidebar {
                display: none;
            }
            
            .transport-info {
                grid-template-columns: 1fr;
            }
            
            .track-mixer {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="studio-container">
        <!-- Studio Header -->
        <header class="studio-header">
            <div class="studio-brand">
                <h1><i class="fas fa-music"></i> Music Studio</h1>
                <p>Professional Music Production</p>
            </div>
            
            <div class="studio-user">
                <span>Welcome, <?php echo htmlspecialchars($currentUser['username']); ?></span>
                <a href="user/logout.php" class="btn btn-secondary btn-sm">Logout</a>
            </div>
        </header>
        
        <!-- Studio Sidebar -->
        <aside class="studio-sidebar">
            <div class="sidebar-section">
                <h3>Projects</h3>
                <div class="project-list">
                    <div class="project-item active">
                        <i class="fas fa-folder"></i>
                        <span>Untitled Project</span>
                    </div>
                    <div class="project-item">
                        <i class="fas fa-folder"></i>
                        <span>Rock Song</span>
                    </div>
                    <div class="project-item">
                        <i class="fas fa-folder"></i>
                        <span>Jazz Improv</span>
                    </div>
                </div>
            </div>
            
            <div class="sidebar-section">
                <h3>Instruments</h3>
                <div class="instrument-list">
                    <div class="instrument-item">
                        <i class="fas fa-piano"></i>
                        <span>Piano</span>
                    </div>
                    <div class="instrument-item">
                        <i class="fas fa-guitar"></i>
                        <span>Guitar</span>
                    </div>
                    <div class="instrument-item">
                        <i class="fas fa-drum"></i>
                        <span>Drums</span>
                    </div>
                    <div class="instrument-item">
                        <i class="fas fa-violin"></i>
                        <span>Strings</span>
                    </div>
                </div>
            </div>
            
            <div class="sidebar-section">
                <h3>Effects</h3>
                <div class="effects-list">
                    <div class="effect-item">
                        <i class="fas fa-wave-square"></i>
                        <span>Reverb</span>
                    </div>
                    <div class="effect-item">
                        <i class="fas fa-echo"></i>
                        <span>Echo</span>
                    </div>
                    <div class="effect-item">
                        <i class="fas fa-compress"></i>
                        <span>Compression</span>
                    </div>
                    <div class="effect-item">
                        <i class="fas fa-equalizer"></i>
                        <span>EQ</span>
                    </div>
                </div>
            </div>
        </aside>
        
        <!-- Studio Main Content -->
        <main class="studio-main">
            <!-- Transport Controls -->
            <div class="transport">
                <div class="transport-controls">
                    <button class="play-button btn btn-primary">▶️</button>
                    <button class="stop-button btn btn-secondary">⏹️</button>
                    <button class="record-button btn btn-error">🔴</button>
                </div>
                
                <div class="transport-info">
                    <div class="tempo-control">
                        <label>Tempo:</label>
                        <input type="range" class="tempo-slider" min="60" max="200" value="120">
                        <span class="tempo-value">120 BPM</span>
                    </div>
                    
                    <div class="time-signature-control">
                        <label>Time Signature:</label>
                        <select class="time-signature-select">
                            <option value="4/4" selected>4/4</option>
                            <option value="3/4">3/4</option>
                            <option value="6/8">6/8</option>
                            <option value="2/4">2/4</option>
                        </select>
                    </div>
                    
                    <div class="key-control">
                        <label>Key:</label>
                        <select class="key-select">
                            <option value="C" selected>C</option>
                            <option value="G">G</option>
                            <option value="D">D</option>
                            <option value="A">A</option>
                            <option value="E">E</option>
                            <option value="B">B</option>
                            <option value="F#">F#</option>
                            <option value="C#">C#</option>
                            <option value="F">F</option>
                            <option value="Bb">Bb</option>
                            <option value="Eb">Eb</option>
                            <option value="Ab">Ab</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <!-- Timeline -->
            <div class="timeline">
                <div class="timeline-header">
                    <div class="timeline-time">0:00</div>
                    <div class="timeline-duration">0:00</div>
                </div>
                <div class="timeline-ruler">
                    <div class="timeline-markers"></div>
                </div>
            </div>
            
            <!-- Drop Zone -->
            <div class="drop-zone">
                <input type="file" class="file-input" accept="audio/*" multiple>
                <div class="drop-zone-icon">
                    <i class="fas fa-cloud-upload-alt"></i>
                </div>
                <div class="drop-zone-text">
                    <h3>Drop Audio Files Here</h3>
                    <p>Drag and drop audio files to add them to your project</p>
                </div>
                <button class="btn btn-secondary" onclick="document.querySelector('.file-input').click()">
                    Choose Files
                </button>
            </div>
            
            <!-- Tracks Container -->
            <div class="tracks-container">
                <div class="tracks-header">
                    <h3>Project Tracks</h3>
                    <button class="btn btn-primary" onclick="studio.addTrack('New Track', 'audio')">
                        <i class="fas fa-plus"></i> Add Track
                    </button>
                </div>
                
                <!-- Tracks will be rendered here by JavaScript -->
            </div>
            
            <!-- Mixer -->
            <div class="mixer">
                <div class="mixer-header">
                    <h3>Mixer</h3>
                </div>
                <div class="mixer-tracks">
                    <!-- Mixer tracks will be rendered here by JavaScript -->
                </div>
            </div>
            
            <!-- Tools -->
            <div class="tools">
                <div class="tools-header">
                    <h3>Tools</h3>
                </div>
                <div class="tools-content">
                    <button class="btn btn-secondary" onclick="studio.saveProject()">
                        <i class="fas fa-save"></i> Save Project
                    </button>
                    <button class="btn btn-secondary" onclick="studio.exportProject()">
                        <i class="fas fa-download"></i> Export
                    </button>
                    <button class="btn btn-secondary" onclick="studio.undo()">
                        <i class="fas fa-undo"></i> Undo
                    </button>
                    <button class="btn btn-secondary" onclick="studio.redo()">
                        <i class="fas fa-redo"></i> Redo
                    </button>
                </div>
            </div>
        </main>
        
        <!-- Studio Footer -->
        <footer class="studio-footer">
            <p>&copy; <?php echo date('Y'); ?> <?php echo APP_NAME; ?> - Professional Music Creation Studio</p>
        </footer>
    </div>
    
    <!-- Scripts -->
    <script src="assets/js/studio_interface.js"></script>
    
    <script>
        // Additional studio functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize studio interface
            if (typeof studio !== 'undefined') {
                console.log('Studio interface initialized');
                
                // Add additional event listeners
                setupStudioEventListeners();
            }
        });
        
        function setupStudioEventListeners() {
            // Project selection
            document.querySelectorAll('.project-item').forEach(item => {
                item.addEventListener('click', function() {
                    document.querySelectorAll('.project-item').forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                });
            });
            
            // Instrument selection
            document.querySelectorAll('.instrument-item').forEach(item => {
                item.addEventListener('click', function() {
                    const instrument = this.querySelector('span').textContent.toLowerCase();
                    studio.addTrack(instrument.charAt(0).toUpperCase() + instrument.slice(1), instrument);
                });
            });
            
            // Effect selection
            document.querySelectorAll('.effect-item').forEach(item => {
                item.addEventListener('click', function() {
                    const effect = this.querySelector('span').textContent.toLowerCase();
                    // Add effect to selected track
                    const selectedTrack = document.querySelector('.track.selected');
                    if (selectedTrack) {
                        const trackId = selectedTrack.dataset.trackId;
                        studio.addTrackEffect(trackId, effect, {});
                    }
                });
            });
        }
        
        // Global studio functions
        function addTrack(name, type) {
            if (typeof studio !== 'undefined') {
                studio.addTrack(name, type);
            }
        }
        
        function saveProject() {
            if (typeof studio !== 'undefined') {
                studio.saveProject();
            }
        }
        
        function exportProject() {
            if (typeof studio !== 'undefined') {
                studio.exportProject();
            }
        }
    </script>
</body>
</html>