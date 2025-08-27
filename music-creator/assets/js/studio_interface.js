/**
 * Music Creation Studio Interface
 * Professional Music Production Tools
 * 100% Original - Studio Quality
 */

class MusicStudioInterface {
    constructor() {
        this.audioContext = null;
        this.currentProject = null;
        this.tracks = [];
        this.isPlaying = false;
        this.currentTime = 0;
        this.tempo = 120;
        this.timeSignature = '4/4';
        this.key = 'C';
        
        this.init();
    }
    
    /**
     * Initialize studio interface
     */
    init() {
        this.initializeAudioContext();
        this.setupEventListeners();
        this.createDefaultProject();
        this.renderInterface();
    }
    
    /**
     * Initialize Web Audio API context
     */
    initializeAudioContext() {
        try {
            this.audioContext = new (window.AudioContext || window.webkitAudioContext)();
            console.log('Audio Context initialized successfully');
        } catch (error) {
            console.error('Failed to initialize Audio Context:', error);
            this.showNotification('Audio initialization failed', 'error');
        }
    }
    
    /**
     * Setup event listeners
     */
    setupEventListeners() {
        // Play/Pause button
        document.addEventListener('click', (e) => {
            if (e.target.matches('.play-button')) {
                this.togglePlayback();
            }
        });
        
        // Tempo slider
        const tempoSlider = document.querySelector('.tempo-slider');
        if (tempoSlider) {
            tempoSlider.addEventListener('input', (e) => {
                this.setTempo(parseInt(e.target.value));
            });
        }
        
        // Time signature selector
        const timeSignatureSelect = document.querySelector('.time-signature-select');
        if (timeSignatureSelect) {
            timeSignatureSelect.addEventListener('change', (e) => {
                this.setTimeSignature(e.target.value);
            });
        }
        
        // Key selector
        const keySelect = document.querySelector('.key-select');
        if (keySelect) {
            keySelect.addEventListener('change', (e) => {
                this.setKey(e.target.value);
            });
        }
        
        // Track controls
        this.setupTrackEventListeners();
        
        // Drag and drop
        this.setupDragAndDrop();
        
        // Keyboard shortcuts
        this.setupKeyboardShortcuts();
    }
    
    /**
     * Setup track event listeners
     */
    setupTrackEventListeners() {
        document.addEventListener('click', (e) => {
            // Track mute button
            if (e.target.matches('.track-mute')) {
                const trackId = e.target.closest('.track').dataset.trackId;
                this.toggleTrackMute(trackId);
            }
            
            // Track solo button
            if (e.target.matches('.track-solo')) {
                const trackId = e.target.closest('.track').dataset.trackId;
                this.toggleTrackSolo(trackId);
            }
            
            // Track delete button
            if (e.target.matches('.track-delete')) {
                const trackId = e.target.closest('.track').dataset.trackId;
                this.deleteTrack(trackId);
            }
        });
        
        // Track volume slider
        document.addEventListener('input', (e) => {
            if (e.target.matches('.track-volume')) {
                const trackId = e.target.closest('.track').dataset.trackId;
                const volume = parseFloat(e.target.value);
                this.setTrackVolume(trackId, volume);
            }
        });
        
        // Track pan slider
        document.addEventListener('input', (e) => {
            if (e.target.matches('.track-pan')) {
                const trackId = e.target.closest('.track').dataset.trackId;
                const pan = parseFloat(e.target.value);
                this.setTrackPan(trackId, pan);
            }
        });
    }
    
    /**
     * Setup drag and drop functionality
     */
    setupDragAndDrop() {
        const dropZone = document.querySelector('.drop-zone');
        if (!dropZone) return;
        
        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('drag-over');
        });
        
        dropZone.addEventListener('dragleave', () => {
            dropZone.classList.remove('drag-over');
        });
        
        dropZone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropZone.classList.remove('drag-over');
            
            const files = Array.from(e.dataTransfer.files);
            this.handleDroppedFiles(files);
        });
        
        // File input change
        const fileInput = document.querySelector('.file-input');
        if (fileInput) {
            fileInput.addEventListener('change', (e) => {
                const files = Array.from(e.target.files);
                this.handleDroppedFiles(files);
            });
        }
    }
    
    /**
     * Setup keyboard shortcuts
     */
    setupKeyboardShortcuts() {
        document.addEventListener('keydown', (e) => {
            // Spacebar - Play/Pause
            if (e.code === 'Space' && !e.target.matches('input, textarea')) {
                e.preventDefault();
                this.togglePlayback();
            }
            
            // Escape - Stop
            if (e.code === 'Escape') {
                this.stopPlayback();
            }
            
            // Delete - Delete selected clips
            if (e.code === 'Delete') {
                this.deleteSelectedClips();
            }
            
            // Ctrl+S - Save project
            if (e.ctrlKey && e.code === 'KeyS') {
                e.preventDefault();
                this.saveProject();
            }
            
            // Ctrl+O - Open project
            if (e.ctrlKey && e.code === 'KeyO') {
                e.preventDefault();
                this.openProject();
            }
        });
    }
    
    /**
     * Create default project
     */
    createDefaultProject() {
        this.currentProject = {
            id: 'proj_' + Date.now(),
            name: 'Untitled Project',
            tempo: this.tempo,
            timeSignature: this.timeSignature,
            key: this.key,
            tracks: [],
            createdAt: new Date(),
            updatedAt: new Date()
        };
        
        // Add default tracks
        this.addTrack('Drums', 'drums');
        this.addTrack('Bass', 'bass');
        this.addTrack('Melody', 'piano');
        this.addTrack('Harmony', 'strings');
    }
    
    /**
     * Add new track
     */
    addTrack(name, type) {
        const track = {
            id: 'track_' + Date.now(),
            name: name,
            type: type,
            volume: 1.0,
            pan: 0.0,
            mute: false,
            solo: false,
            clips: [],
            effects: [],
            color: this.getRandomTrackColor()
        };
        
        this.tracks.push(track);
        this.currentProject.tracks.push(track);
        this.renderTrack(track);
        
        return track.id;
    }
    
    /**
     * Delete track
     */
    deleteTrack(trackId) {
        const trackIndex = this.tracks.findIndex(t => t.id === trackId);
        if (trackIndex !== -1) {
            this.tracks.splice(trackIndex, 1);
            this.currentProject.tracks.splice(trackIndex, 1);
            
            // Remove from DOM
            const trackElement = document.querySelector(`[data-track-id="${trackId}"]`);
            if (trackElement) {
                trackElement.remove();
            }
            
            this.showNotification('Track deleted', 'success');
        }
    }
    
    /**
     * Toggle track mute
     */
    toggleTrackMute(trackId) {
        const track = this.tracks.find(t => t.id === trackId);
        if (track) {
            track.mute = !track.mute;
            this.updateTrackUI(trackId);
        }
    }
    
    /**
     * Toggle track solo
     */
    toggleTrackSolo(trackId) {
        const track = this.tracks.find(t => t.id === trackId);
        if (track) {
            track.solo = !track.solo;
            this.updateTrackUI(trackId);
        }
    }
    
    /**
     * Set track volume
     */
    setTrackVolume(trackId, volume) {
        const track = this.tracks.find(t => t.id === trackId);
        if (track) {
            track.volume = volume;
            this.updateTrackUI(trackId);
        }
    }
    
    /**
     * Set track pan
     */
    setTrackPan(trackId, pan) {
        const track = this.tracks.find(t => t.id === trackId);
        if (track) {
            track.pan = pan;
            this.updateTrackUI(trackId);
        }
    }
    
    /**
     * Handle dropped files
     */
    async handleDroppedFiles(files) {
        for (const file of files) {
            if (file.type.startsWith('audio/')) {
                try {
                    await this.loadAudioFile(file);
                } catch (error) {
                    console.error('Failed to load audio file:', error);
                    this.showNotification(`Failed to load ${file.name}`, 'error');
                }
            }
        }
    }
    
    /**
     * Load audio file
     */
    async loadAudioFile(file) {
        const arrayBuffer = await file.arrayBuffer();
        const audioBuffer = await this.audioContext.decodeAudioData(arrayBuffer);
        
        // Create clip
        const clip = {
            id: 'clip_' + Date.now(),
            name: file.name.replace(/\.[^/.]+$/, ''),
            audioBuffer: audioBuffer,
            startTime: 0,
            duration: audioBuffer.duration,
            trackId: this.getSelectedTrackId() || this.tracks[0]?.id
        };
        
        if (clip.trackId) {
            const track = this.tracks.find(t => t.id === clip.trackId);
            if (track) {
                track.clips.push(clip);
                this.renderClip(clip, track);
                this.showNotification(`Loaded ${clip.name}`, 'success');
            }
        }
    }
    
    /**
     * Get selected track ID
     */
    getSelectedTrackId() {
        const selectedTrack = document.querySelector('.track.selected');
        return selectedTrack ? selectedTrack.dataset.trackId : null;
    }
    
    /**
     * Toggle playback
     */
    togglePlayback() {
        if (this.isPlaying) {
            this.pausePlayback();
        } else {
            this.startPlayback();
        }
    }
    
    /**
     * Start playback
     */
    startPlayback() {
        if (!this.audioContext) {
            this.showNotification('Audio context not available', 'error');
            return;
        }
        
        if (this.audioContext.state === 'suspended') {
            this.audioContext.resume();
        }
        
        this.isPlaying = true;
        this.updatePlayButton();
        this.startPlaybackTimer();
        this.playAllTracks();
        
        this.showNotification('Playback started', 'success');
    }
    
    /**
     * Pause playback
     */
    pausePlayback() {
        this.isPlaying = false;
        this.updatePlayButton();
        this.stopPlaybackTimer();
        this.pauseAllTracks();
        
        this.showNotification('Playback paused', 'info');
    }
    
    /**
     * Stop playback
     */
    stopPlayback() {
        this.isPlaying = false;
        this.currentTime = 0;
        this.updatePlayButton();
        this.stopPlaybackTimer();
        this.stopAllTracks();
        this.updateTimeline();
        
        this.showNotification('Playback stopped', 'info');
    }
    
    /**
     * Start playback timer
     */
    startPlaybackTimer() {
        this.playbackTimer = setInterval(() => {
            this.currentTime += 0.1;
            this.updateTimeline();
            
            // Check if playback should end
            const maxDuration = this.getMaxProjectDuration();
            if (this.currentTime >= maxDuration) {
                this.stopPlayback();
            }
        }, 100);
    }
    
    /**
     * Stop playback timer
     */
    stopPlaybackTimer() {
        if (this.playbackTimer) {
            clearInterval(this.playbackTimer);
            this.playbackTimer = null;
        }
    }
    
    /**
     * Play all tracks
     */
    playAllTracks() {
        this.tracks.forEach(track => {
            if (!track.mute) {
                track.clips.forEach(clip => {
                    this.playClip(clip, track);
                });
            }
        });
    }
    
    /**
     * Pause all tracks
     */
    pauseAllTracks() {
        // Implementation for pausing tracks
    }
    
    /**
     * Stop all tracks
     */
    stopAllTracks() {
        // Implementation for stopping tracks
    }
    
    /**
     * Play individual clip
     */
    playClip(clip, track) {
        if (!this.audioContext || !clip.audioBuffer) return;
        
        const source = this.audioContext.createBufferSource();
        const gainNode = this.audioContext.createGain();
        const pannerNode = this.audioContext.createStereoPanner();
        
        source.buffer = clip.audioBuffer;
        source.connect(gainNode);
        gainNode.connect(pannerNode);
        pannerNode.connect(this.audioContext.destination);
        
        // Apply track settings
        gainNode.gain.value = track.volume;
        pannerNode.pan.value = track.pan;
        
        // Schedule playback
        const startTime = this.audioContext.currentTime + (clip.startTime - this.currentTime);
        source.start(startTime);
        
        // Store reference for stopping
        clip.source = source;
    }
    
    /**
     * Set tempo
     */
    setTempo(tempo) {
        this.tempo = tempo;
        this.currentProject.tempo = tempo;
        this.updateTempoDisplay();
    }
    
    /**
     * Set time signature
     */
    setTimeSignature(timeSignature) {
        this.timeSignature = timeSignature;
        this.currentProject.timeSignature = timeSignature;
        this.updateTimeSignatureDisplay();
    }
    
    /**
     * Set key
     */
    setKey(key) {
        this.key = key;
        this.currentProject.key = key;
        this.updateKeyDisplay();
    }
    
    /**
     * Get maximum project duration
     */
    getMaxProjectDuration() {
        let maxDuration = 0;
        this.tracks.forEach(track => {
            track.clips.forEach(clip => {
                const clipEnd = clip.startTime + clip.duration;
                maxDuration = Math.max(maxDuration, clipEnd);
            });
        });
        return maxDuration;
    }
    
    /**
     * Update play button
     */
    updatePlayButton() {
        const playButton = document.querySelector('.play-button');
        if (playButton) {
            if (this.isPlaying) {
                playButton.innerHTML = '⏸️';
                playButton.classList.add('playing');
            } else {
                playButton.innerHTML = '▶️';
                playButton.classList.remove('playing');
            }
        }
    }
    
    /**
     * Update timeline
     */
    updateTimeline() {
        const timeline = document.querySelector('.timeline');
        if (timeline) {
            const maxDuration = this.getMaxProjectDuration();
            const progress = (this.currentTime / maxDuration) * 100;
            timeline.style.setProperty('--progress', `${progress}%`);
        }
        
        // Update time display
        const timeDisplay = document.querySelector('.current-time');
        if (timeDisplay) {
            timeDisplay.textContent = this.formatTime(this.currentTime);
        }
    }
    
    /**
     * Update tempo display
     */
    updateTempoDisplay() {
        const tempoDisplay = document.querySelector('.tempo-value');
        if (tempoDisplay) {
            tempoDisplay.textContent = this.tempo + ' BPM';
        }
    }
    
    /**
     * Update time signature display
     */
    updateTimeSignatureDisplay() {
        const timeSignatureDisplay = document.querySelector('.time-signature-value');
        if (timeSignatureDisplay) {
            timeSignatureDisplay.textContent = this.timeSignature;
        }
    }
    
    /**
     * Update key display
     */
    updateKeyDisplay() {
        const keyDisplay = document.querySelector('.key-value');
        if (keyDisplay) {
            keyDisplay.textContent = this.key;
        }
    }
    
    /**
     * Update track UI
     */
    updateTrackUI(trackId) {
        const trackElement = document.querySelector(`[data-track-id="${trackId}"]`);
        if (!trackElement) return;
        
        const track = this.tracks.find(t => t.id === trackId);
        if (!track) return;
        
        // Update mute button
        const muteButton = trackElement.querySelector('.track-mute');
        if (muteButton) {
            muteButton.classList.toggle('active', track.mute);
        }
        
        // Update solo button
        const soloButton = trackElement.querySelector('.track-solo');
        if (soloButton) {
            soloButton.classList.toggle('active', track.solo);
        }
        
        // Update volume display
        const volumeDisplay = trackElement.querySelector('.volume-value');
        if (volumeDisplay) {
            volumeDisplay.textContent = Math.round(track.volume * 100) + '%';
        }
        
        // Update pan display
        const panDisplay = trackElement.querySelector('.pan-value');
        if (panDisplay) {
            panDisplay.textContent = track.pan > 0 ? '+' + track.pan : track.pan;
        }
    }
    
    /**
     * Render interface
     */
    renderInterface() {
        this.renderTransport();
        this.renderTimeline();
        this.renderTracks();
        this.renderMixer();
        this.renderTools();
    }
    
    /**
     * Render transport controls
     */
    renderTransport() {
        const transport = document.querySelector('.transport');
        if (!transport) return;
        
        transport.innerHTML = `
            <div class="transport-controls">
                <button class="play-button btn btn-primary">▶️</button>
                <button class="stop-button btn btn-secondary">⏹️</button>
                <button class="record-button btn btn-error">🔴</button>
            </div>
            <div class="transport-info">
                <div class="tempo-control">
                    <label>Tempo:</label>
                    <input type="range" class="tempo-slider" min="60" max="200" value="${this.tempo}">
                    <span class="tempo-value">${this.tempo} BPM</span>
                </div>
                <div class="time-signature-control">
                    <label>Time Signature:</label>
                    <select class="time-signature-select">
                        <option value="4/4" ${this.timeSignature === '4/4' ? 'selected' : ''}>4/4</option>
                        <option value="3/4" ${this.timeSignature === '3/4' ? 'selected' : ''}>3/4</option>
                        <option value="6/8" ${this.timeSignature === '6/8' ? 'selected' : ''}>6/8</option>
                        <option value="2/4" ${this.timeSignature === '2/4' ? 'selected' : ''}>2/4</option>
                    </select>
                </div>
                <div class="key-control">
                    <label>Key:</label>
                    <select class="key-select">
                        <option value="C" ${this.key === 'C' ? 'selected' : ''}>C</option>
                        <option value="G" ${this.key === 'G' ? 'selected' : ''}>G</option>
                        <option value="D" ${this.key === 'D' ? 'selected' : ''}>D</option>
                        <option value="A" ${this.key === 'A' ? 'selected' : ''}>A</option>
                        <option value="E" ${this.key === 'E' ? 'selected' : ''}>E</option>
                        <option value="B" ${this.key === 'B' ? 'selected' : ''}>B</option>
                        <option value="F#" ${this.key === 'F#' ? 'selected' : ''}>F#</option>
                        <option value="C#" ${this.key === 'C#' ? 'selected' : ''}>C#</option>
                        <option value="F" ${this.key === 'F' ? 'selected' : ''}>F</option>
                        <option value="Bb" ${this.key === 'Bb' ? 'selected' : ''}>Bb</option>
                        <option value="Eb" ${this.key === 'Eb' ? 'selected' : ''}>Eb</option>
                        <option value="Ab" ${this.key === 'Ab' ? 'selected' : ''}>Ab</option>
                    </select>
                </div>
            </div>
        `;
    }
    
    /**
     * Render timeline
     */
    renderTimeline() {
        const timeline = document.querySelector('.timeline');
        if (!timeline) return;
        
        timeline.innerHTML = `
            <div class="timeline-header">
                <div class="timeline-time">${this.formatTime(this.currentTime)}</div>
                <div class="timeline-duration">${this.formatTime(this.getMaxProjectDuration())}</div>
            </div>
            <div class="timeline-ruler">
                <div class="timeline-markers"></div>
            </div>
        `;
    }
    
    /**
     * Render tracks
     */
    renderTracks() {
        const tracksContainer = document.querySelector('.tracks-container');
        if (!tracksContainer) return;
        
        tracksContainer.innerHTML = '';
        this.tracks.forEach(track => {
            this.renderTrack(track);
        });
    }
    
    /**
     * Render individual track
     */
    renderTrack(track) {
        const tracksContainer = document.querySelector('.tracks-container');
        if (!tracksContainer) return;
        
        const trackElement = document.createElement('div');
        trackElement.className = 'track';
        trackElement.dataset.trackId = track.id;
        trackElement.style.setProperty('--track-color', track.color);
        
        trackElement.innerHTML = `
            <div class="track-header">
                <div class="track-info">
                    <div class="track-name">${track.name}</div>
                    <div class="track-type">${track.type}</div>
                </div>
                <div class="track-controls">
                    <button class="track-mute" title="Mute">🔇</button>
                    <button class="track-solo" title="Solo">🎧</button>
                    <button class="track-delete" title="Delete">🗑️</button>
                </div>
            </div>
            <div class="track-content">
                <div class="track-clips">
                    ${track.clips.map(clip => this.renderClipHTML(clip)).join('')}
                </div>
            </div>
            <div class="track-mixer">
                <div class="volume-control">
                    <label>Vol</label>
                    <input type="range" class="track-volume" min="0" max="2" step="0.1" value="${track.volume}">
                    <span class="volume-value">${Math.round(track.volume * 100)}%</span>
                </div>
                <div class="pan-control">
                    <label>Pan</label>
                    <input type="range" class="track-pan" min="-1" max="1" step="0.1" value="${track.pan}">
                    <span class="pan-value">${track.pan > 0 ? '+' + track.pan : track.pan}</span>
                </div>
            </div>
        `;
        
        tracksContainer.appendChild(trackElement);
    }
    
    /**
     * Render clip HTML
     */
    renderClipHTML(clip) {
        return `
            <div class="clip" data-clip-id="${clip.id}" style="left: ${clip.startTime * 100}px; width: ${clip.duration * 100}px;">
                <div class="clip-content">
                    <div class="clip-name">${clip.name}</div>
                    <div class="clip-duration">${this.formatTime(clip.duration)}</div>
                </div>
            </div>
        `;
    }
    
    /**
     * Render clip
     */
    renderClip(clip, track) {
        const trackElement = document.querySelector(`[data-track-id="${track.id}"]`);
        if (!trackElement) return;
        
        const clipsContainer = trackElement.querySelector('.track-clips');
        if (!clipsContainer) return;
        
        const clipElement = document.createElement('div');
        clipElement.className = 'clip';
        clipElement.dataset.clipId = clip.id;
        clipElement.style.left = (clip.startTime * 100) + 'px';
        clipElement.style.width = (clip.duration * 100) + 'px';
        
        clipElement.innerHTML = `
            <div class="clip-content">
                <div class="clip-name">${clip.name}</div>
                <div class="clip-duration">${this.formatTime(clip.duration)}</div>
            </div>
        `;
        
        clipsContainer.appendChild(clipElement);
    }
    
    /**
     * Render mixer
     */
    renderMixer() {
        const mixer = document.querySelector('.mixer');
        if (!mixer) return;
        
        mixer.innerHTML = `
            <div class="mixer-header">
                <h3>Mixer</h3>
            </div>
            <div class="mixer-tracks">
                ${this.tracks.map(track => `
                    <div class="mixer-track" data-track-id="${track.id}">
                        <div class="mixer-track-name">${track.name}</div>
                        <div class="mixer-track-fader">
                            <input type="range" class="track-volume" min="0" max="2" step="0.1" value="${track.volume}" orient="vertical">
                        </div>
                        <div class="mixer-track-pan">
                            <input type="range" class="track-pan" min="-1" max="1" step="0.1" value="${track.pan}">
                        </div>
                    </div>
                `).join('')}
            </div>
        `;
    }
    
    /**
     * Render tools
     */
    renderTools() {
        const tools = document.querySelector('.tools');
        if (!tools) return;
        
        tools.innerHTML = `
            <div class="tools-header">
                <h3>Tools</h3>
            </div>
            <div class="tools-content">
                <button class="btn btn-secondary" onclick="studio.addTrack('New Track', 'audio')">Add Track</button>
                <button class="btn btn-secondary" onclick="studio.saveProject()">Save Project</button>
                <button class="btn btn-secondary" onclick="studio.exportProject()">Export</button>
            </div>
        `;
    }
    
    /**
     * Get random track color
     */
    getRandomTrackColor() {
        const colors = [
            '#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEAA7',
            '#DDA0DD', '#98D8C8', '#F7DC6F', '#BB8FCE', '#85C1E9'
        ];
        return colors[Math.floor(Math.random() * colors.length)];
    }
    
    /**
     * Format time
     */
    formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${minutes}:${remainingSeconds.toString().padStart(2, '0')}`;
    }
    
    /**
     * Show notification
     */
    showNotification(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.textContent = message;
        
        document.body.appendChild(notification);
        
        // Auto-remove after 3 seconds
        setTimeout(() => {
            notification.remove();
        }, 3000);
    }
    
    /**
     * Save project
     */
    saveProject() {
        try {
            const projectData = JSON.stringify(this.currentProject, null, 2);
            const blob = new Blob([projectData], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            
            const a = document.createElement('a');
            a.href = url;
            a.download = `${this.currentProject.name}.json`;
            a.click();
            
            URL.revokeObjectURL(url);
            this.showNotification('Project saved successfully', 'success');
        } catch (error) {
            console.error('Failed to save project:', error);
            this.showNotification('Failed to save project', 'error');
        }
    }
    
    /**
     * Export project
     */
    exportProject() {
        this.showNotification('Export functionality coming soon', 'info');
    }
    
    /**
     * Delete selected clips
     */
    deleteSelectedClips() {
        const selectedClips = document.querySelectorAll('.clip.selected');
        selectedClips.forEach(clipElement => {
            const clipId = clipElement.dataset.clipId;
            this.deleteClip(clipId);
        });
    }
    
    /**
     * Delete clip
     */
    deleteClip(clipId) {
        this.tracks.forEach(track => {
            const clipIndex = track.clips.findIndex(c => c.id === clipId);
            if (clipIndex !== -1) {
                track.clips.splice(clipIndex, 1);
                
                // Remove from DOM
                const clipElement = document.querySelector(`[data-clip-id="${clipId}"]`);
                if (clipElement) {
                    clipElement.remove();
                }
            }
        });
    }
}

// Initialize studio interface when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.studio = new MusicStudioInterface();
});

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MusicStudioInterface;
}