<?php
require_once '../includes/config.php';
require_once '../includes/auth.php';
require_once '../includes/audio_processor.php';

$auth = auth();
if (!$auth->isLoggedIn()) {
    header('Location: login.php');
    exit;
}

$currentUser = $auth->getCurrentUser();
$audioProcessor = audio_processor();
$supportedFormats = $audioProcessor->getSupportedFormats();
$availableEffects = $audioProcessor->getAvailableEffects();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Audio Editor - <?php echo APP_NAME; ?></title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .editor-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .editor-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .editor-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
        }
        
        .upload-section, .edit-section {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 1rem;
            padding: 1.5rem;
        }
        
        .upload-area {
            border: 2px dashed var(--border-color);
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            transition: all var(--transition-fast);
            cursor: pointer;
        }
        
        .upload-area:hover {
            border-color: var(--primary-color);
            background: var(--bg-tertiary);
        }
        
        .upload-area.dragover {
            border-color: var(--accent-color);
            background: var(--bg-tertiary);
        }
        
        .upload-icon {
            font-size: 3rem;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }
        
        .file-input {
            display: none;
        }
        
        .audio-preview {
            margin-top: 1rem;
            padding: 1rem;
            background: var(--bg-tertiary);
            border-radius: 0.5rem;
        }
        
        .audio-player {
            width: 100%;
            margin-bottom: 1rem;
        }
        
        .edit-controls {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .control-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .control-group label {
            color: var(--text-secondary);
            font-size: 0.875rem;
            font-weight: 500;
        }
        
        .control-group input, .control-group select {
            background: var(--bg-tertiary);
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            padding: 0.75rem;
            color: var(--text-primary);
            font-size: 0.875rem;
        }
        
        .control-group input:focus, .control-group select:focus {
            outline: none;
            border-color: var(--primary-color);
        }
        
        .effects-section {
            margin-top: 1.5rem;
        }
        
        .effects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
        }
        
        .effect-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem;
            background: var(--bg-tertiary);
            border-radius: 0.5rem;
            cursor: pointer;
        }
        
        .effect-checkbox:hover {
            background: var(--bg-secondary);
        }
        
        .effect-params {
            margin-top: 1rem;
            padding: 1rem;
            background: var(--bg-tertiary);
            border-radius: 0.5rem;
            display: none;
        }
        
        .effect-params.active {
            display: block;
        }
        
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        .btn-process {
            background: var(--gradient-accent);
            color: white;
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            font-size: 1.125rem;
        }
        
        .btn-download {
            background: var(--gradient-secondary);
            color: white;
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            font-size: 1.125rem;
        }
        
        .progress-bar {
            width: 100%;
            height: 8px;
            background: var(--bg-tertiary);
            border-radius: 4px;
            overflow: hidden;
            margin: 1rem 0;
            display: none;
        }
        
        .progress-fill {
            height: 100%;
            background: var(--gradient-accent);
            width: 0%;
            transition: width 0.3s ease;
        }
        
        .status-message {
            text-align: center;
            margin: 1rem 0;
            padding: 1rem;
            border-radius: 0.5rem;
            display: none;
        }
        
        .status-success {
            background: rgba(34, 197, 94, 0.1);
            border: 1px solid rgba(34, 197, 94, 0.3);
            color: #86efac;
        }
        
        .status-error {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
        }
        
        @media (max-width: 768px) {
            .editor-grid {
                grid-template-columns: 1fr;
            }
            
            .edit-controls {
                grid-template-columns: 1fr;
            }
            
            .effects-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body class="dark-theme">
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-logo">
                <i class="fas fa-music"></i>
                <span>MusicCreator</span>
            </div>
            
            <div class="nav-menu">
                <a href="dashboard.php" class="nav-link">
                    <i class="fas fa-home"></i>
                    Dashboard
                </a>
                <a href="projects.php" class="nav-link">
                    <i class="fas fa-folder"></i>
                    My Projects
                </a>
                <a href="audio-editor.php" class="nav-link active">
                    <i class="fas fa-edit"></i>
                    Audio Editor
                </a>
                <div class="nav-user">
                    <span class="credits">
                        <i class="fas fa-coins"></i>
                        <?php echo $currentUser['credits']; ?> credits
                    </span>
                    <div class="user-dropdown">
                        <button class="user-btn">
                            <i class="fas fa-user"></i>
                            <?php echo $currentUser['username']; ?>
                        </button>
                        <div class="dropdown-content">
                            <a href="profile.php">Profile</a>
                            <a href="settings.php">Settings</a>
                            <a href="logout.php">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <main class="editor-container">
        <div class="editor-header">
            <h1>Audio Editor</h1>
            <p>Upload, edit, and enhance your audio files with professional tools</p>
        </div>

        <div class="editor-grid">
            <!-- Upload Section -->
            <div class="upload-section">
                <h3>Upload Audio</h3>
                
                <div class="upload-area" id="uploadArea">
                    <div class="upload-icon">
                        <i class="fas fa-cloud-upload-alt"></i>
                    </div>
                    <p>Drag & drop audio files here or click to browse</p>
                    <p class="text-muted">Supported formats: <?php echo implode(', ', $supportedFormats['input']); ?></p>
                    <input type="file" id="audioFile" class="file-input" accept="audio/*">
                </div>
                
                <div class="audio-preview" id="audioPreview" style="display: none;">
                    <h4>Audio Preview</h4>
                    <audio id="audioPlayer" class="audio-player" controls>
                        Your browser does not support the audio element.
                    </audio>
                    <div class="file-info" id="fileInfo"></div>
                </div>
            </div>

            <!-- Edit Section -->
            <div class="edit-section">
                <h3>Edit & Effects</h3>
                
                <div class="edit-controls">
                    <div class="control-group">
                        <label for="volume">Volume</label>
                        <input type="range" id="volume" min="0" max="2" step="0.1" value="1">
                        <span class="value-display">1.0</span>
                    </div>
                    
                    <div class="control-group">
                        <label for="tempo">Tempo</label>
                        <input type="range" id="tempo" min="0.5" max="2" step="0.1" value="1">
                        <span class="value-display">1.0</span>
                    </div>
                    
                    <div class="control-group">
                        <label for="pitch">Pitch</label>
                        <input type="range" id="pitch" min="0.5" max="2" step="0.1" value="1">
                        <span class="value-display">1.0</span>
                    </div>
                    
                    <div class="control-group">
                        <label for="fadeIn">Fade In (seconds)</label>
                        <input type="number" id="fadeIn" min="0" max="30" step="0.5" value="0">
                    </div>
                    
                    <div class="control-group">
                        <label for="fadeOut">Fade Out (seconds)</label>
                        <input type="number" id="fadeOut" min="0" max="30" step="0.5" value="0">
                    </div>
                    
                    <div class="control-group">
                        <label for="outputFormat">Output Format</label>
                        <select id="outputFormat">
                            <?php foreach ($supportedFormats['output'] as $format): ?>
                                <option value="<?php echo $format; ?>"><?php echo strtoupper($format); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                
                <div class="effects-section">
                    <h4>Audio Effects</h4>
                    <div class="effects-grid">
                        <?php foreach ($availableEffects as $effect => $description): ?>
                            <label class="effect-checkbox">
                                <input type="checkbox" name="effects[]" value="<?php echo $effect; ?>">
                                <span><?php echo ucfirst($effect); ?></span>
                            </label>
                        <?php endforeach; ?>
                    </div>
                    
                    <!-- Effect Parameters -->
                    <div class="effect-params" id="reverbParams">
                        <h5>Reverb Settings</h5>
                        <div class="edit-controls">
                            <div class="control-group">
                                <label for="reverbRoomSize">Room Size</label>
                                <input type="range" id="reverbRoomSize" min="0" max="1" step="0.1" value="0.5">
                                <span class="value-display">0.5</span>
                            </div>
                            <div class="control-group">
                                <label for="reverbDamping">Damping</label>
                                <input type="range" id="reverbDamping" min="0" max="1" step="0.1" value="0.5">
                                <span class="value-display">0.5</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="effect-params" id="echoParams">
                        <h5>Echo Settings</h5>
                        <div class="edit-controls">
                            <div class="control-group">
                                <label for="echoDelay">Delay (ms)</label>
                                <input type="range" id="echoDelay" min="100" max="2000" step="100" value="1000">
                                <span class="value-display">1000</span>
                            </div>
                            <div class="control-group">
                                <label for="echoDecay">Decay</label>
                                <input type="range" id="echoDecay" min="0" max="1" step="0.1" value="0.5">
                                <span class="value-display">0.5</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <button class="btn btn-process" id="processBtn">
                        <i class="fas fa-cog"></i>
                        Process Audio
                    </button>
                    <button class="btn btn-download" id="downloadBtn" style="display: none;">
                        <i class="fas fa-download"></i>
                        Download
                    </button>
                </div>
                
                <div class="progress-bar" id="progressBar">
                    <div class="progress-fill" id="progressFill"></div>
                </div>
                
                <div class="status-message" id="statusMessage"></div>
            </div>
        </div>
    </main>

    <script>
        class AudioEditor {
            constructor() {
                this.currentFile = null;
                this.processedFile = null;
                this.init();
            }
            
            init() {
                this.setupEventListeners();
                this.setupDragAndDrop();
            }
            
            setupEventListeners() {
                // File input
                const fileInput = document.getElementById('audioFile');
                const uploadArea = document.getElementById('uploadArea');
                
                uploadArea.addEventListener('click', () => fileInput.click());
                fileInput.addEventListener('change', (e) => this.handleFileSelect(e.target.files[0]));
                
                // Range inputs
                document.querySelectorAll('input[type="range"]').forEach(input => {
                    const display = input.parentElement.querySelector('.value-display');
                    if (display) {
                        input.addEventListener('input', () => {
                            display.textContent = input.value;
                        });
                    }
                });
                
                // Effect checkboxes
                document.querySelectorAll('input[name="effects[]"]').forEach(checkbox => {
                    checkbox.addEventListener('change', () => this.toggleEffectParams(checkbox));
                });
                
                // Process button
                document.getElementById('processBtn').addEventListener('click', () => this.processAudio());
                
                // Download button
                document.getElementById('downloadBtn').addEventListener('click', () => this.downloadAudio());
            }
            
            setupDragAndDrop() {
                const uploadArea = document.getElementById('uploadArea');
                
                uploadArea.addEventListener('dragover', (e) => {
                    e.preventDefault();
                    uploadArea.classList.add('dragover');
                });
                
                uploadArea.addEventListener('dragleave', () => {
                    uploadArea.classList.remove('dragover');
                });
                
                uploadArea.addEventListener('drop', (e) => {
                    e.preventDefault();
                    uploadArea.classList.remove('dragover');
                    
                    const files = e.dataTransfer.files;
                    if (files.length > 0) {
                        this.handleFileSelect(files[0]);
                    }
                });
            }
            
            handleFileSelect(file) {
                if (!file || !file.type.startsWith('audio/')) {
                    this.showStatus('Please select a valid audio file', 'error');
                    return;
                }
                
                this.currentFile = file;
                
                // Create preview
                const audioPlayer = document.getElementById('audioPlayer');
                const audioPreview = document.getElementById('audioPreview');
                const fileInfo = document.getElementById('fileInfo');
                
                audioPlayer.src = URL.createObjectURL(file);
                audioPreview.style.display = 'block';
                
                // Display file info
                fileInfo.innerHTML = `
                    <p><strong>Name:</strong> ${file.name}</p>
                    <p><strong>Size:</strong> ${this.formatFileSize(file.size)}</p>
                    <p><strong>Type:</strong> ${file.type}</p>
                `;
                
                this.showStatus('Audio file loaded successfully', 'success');
            }
            
            toggleEffectParams(checkbox) {
                const effectName = checkbox.value;
                const paramsDiv = document.getElementById(effectName + 'Params');
                
                if (checkbox.checked) {
                    paramsDiv.classList.add('active');
                } else {
                    paramsDiv.classList.remove('active');
                }
            }
            
            async processAudio() {
                if (!this.currentFile) {
                    this.showStatus('Please select an audio file first', 'error');
                    return;
                }
                
                const processBtn = document.getElementById('processBtn');
                const progressBar = document.getElementById('progressBar');
                const progressFill = document.getElementById('progressFill');
                
                processBtn.disabled = true;
                progressBar.style.display = 'block';
                
                try {
                    // Simulate processing progress
                    for (let i = 0; i <= 100; i += 10) {
                        progressFill.style.width = i + '%';
                        await new Promise(resolve => setTimeout(resolve, 200));
                    }
                    
                    // Create FormData
                    const formData = new FormData();
                    formData.append('audio', this.currentFile);
                    formData.append('title', this.currentFile.name.replace(/\.[^/.]+$/, ''));
                    formData.append('volume', document.getElementById('volume').value);
                    formData.append('tempo', document.getElementById('tempo').value);
                    formData.append('pitch', document.getElementById('pitch').value);
                    formData.append('fade_in', document.getElementById('fadeIn').value);
                    formData.append('fade_out', document.getElementById('fadeOut').value);
                    formData.append('output_format', document.getElementById('outputFormat').value);
                    
                    // Add effects
                    const selectedEffects = Array.from(document.querySelectorAll('input[name="effects[]"]:checked'))
                        .map(cb => cb.value);
                    
                    selectedEffects.forEach(effect => {
                        formData.append('effects[]', effect);
                        
                        switch (effect) {
                            case 'reverb':
                                formData.append('reverb_room_size', document.getElementById('reverbRoomSize').value);
                                formData.append('reverb_damping', document.getElementById('reverbDamping').value);
                                break;
                            case 'echo':
                                formData.append('echo_delay', document.getElementById('echoDelay').value);
                                formData.append('echo_decay', document.getElementById('echoDecay').value);
                                break;
                        }
                    });
                    
                    // Send to API
                    const response = await fetch('../api/upload.php', {
                        method: 'POST',
                        body: formData
                    });
                    
                    const result = await response.json();
                    
                    if (result.success) {
                        this.processedFile = result;
                        this.showStatus('Audio processed successfully!', 'success');
                        document.getElementById('downloadBtn').style.display = 'inline-flex';
                    } else {
                        throw new Error(result.message);
                    }
                    
                } catch (error) {
                    console.error('Processing error:', error);
                    this.showStatus('Processing failed: ' + error.message, 'error');
                } finally {
                    processBtn.disabled = false;
                    progressBar.style.display = 'none';
                    progressFill.style.width = '0%';
                }
            }
            
            downloadAudio() {
                if (!this.processedFile) {
                    this.showStatus('No processed audio available', 'error');
                    return;
                }
                
                const link = document.createElement('a');
                link.href = this.processedFile.download_url;
                link.download = this.processedFile.filename;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
            
            showStatus(message, type) {
                const statusDiv = document.getElementById('statusMessage');
                statusDiv.textContent = message;
                statusDiv.className = `status-message status-${type}`;
                statusDiv.style.display = 'block';
                
                setTimeout(() => {
                    statusDiv.style.display = 'none';
                }, 5000);
            }
            
            formatFileSize(bytes) {
                if (bytes === 0) return '0 Bytes';
                const k = 1024;
                const sizes = ['Bytes', 'KB', 'MB', 'GB'];
                const i = Math.floor(Math.log(bytes) / Math.log(k));
                return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
            }
        }
        
        // Initialize when DOM is loaded
        document.addEventListener('DOMContentLoaded', () => {
            window.audioEditor = new AudioEditor();
        });
    </script>
</body>
</html>