// Music Creator - Main JavaScript File
// Handles AI music generation, audio playback, and UI interactions

class MusicCreator {
    constructor() {
        this.audioContext = null;
        this.currentAudio = null;
        this.isGenerating = false;
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.initializeAudioContext();
        this.loadRecentCreations();
    }

    setupEventListeners() {
        // Generate Music Button
        const generateBtn = document.getElementById('generateBtn');
        if (generateBtn) {
            generateBtn.addEventListener('click', () => this.generateMusic());
        }

        // Play Buttons
        document.addEventListener('click', (e) => {
            if (e.target.closest('.btn-play')) {
                const card = e.target.closest('.creation-card');
                const title = card.querySelector('h4').textContent;
                this.playMusic(title);
            }
        });

        // Form Inputs
        const musicPrompt = document.getElementById('musicPrompt');
        if (musicPrompt) {
            musicPrompt.addEventListener('input', () => this.updateCharacterCount());
            musicPrompt.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' && e.ctrlKey) {
                    this.generateMusic();
                }
            });
        }

        // Option Changes
        const genreSelect = document.getElementById('genreSelect');
        const moodSelect = document.getElementById('moodSelect');
        const tempoSelect = document.getElementById('tempoSelect');

        if (genreSelect) genreSelect.addEventListener('change', () => this.updatePrompt());
        if (moodSelect) moodSelect.addEventListener('change', () => this.updatePrompt());
        if (tempoSelect) tempoSelect.addEventListener('change', () => this.updatePrompt());
    }

    initializeAudioContext() {
        try {
            this.audioContext = new (window.AudioContext || window.webkitAudioContext)();
        } catch (e) {
            console.warn('Web Audio API not supported');
        }
    }

    async generateMusic() {
        if (this.isGenerating) return;

        const prompt = document.getElementById('musicPrompt')?.value.trim();
        const genre = document.getElementById('genreSelect')?.value;
        const mood = document.getElementById('moodSelect')?.value;
        const tempo = document.getElementById('tempoSelect')?.value;

        if (!prompt) {
            this.showNotification('Please describe the music you want to create', 'error');
            return;
        }

        this.isGenerating = true;
        this.updateGenerateButton(true);

        try {
            // Simulate AI generation (replace with actual API call)
            const result = await this.simulateAIGeneration(prompt, genre, mood, tempo);
            
            if (result.success) {
                this.showNotification('Music generated successfully!', 'success');
                this.addNewCreation(result.music);
                this.updateCredits();
            } else {
                this.showNotification(result.message || 'Generation failed', 'error');
            }
        } catch (error) {
            console.error('Generation error:', error);
            this.showNotification('An error occurred during generation', 'error');
        } finally {
            this.isGenerating = false;
            this.updateGenerateButton(false);
        }
    }

    async simulateAIGeneration(prompt, genre, mood, tempo) {
        // Simulate API delay
        await new Promise(resolve => setTimeout(resolve, 3000));

        // Simulate success/failure (90% success rate)
        const isSuccess = Math.random() > 0.1;

        if (isSuccess) {
            const musicTitle = this.generateMusicTitle(prompt, genre, mood);
            
            return {
                success: true,
                music: {
                    title: musicTitle,
                    description: `${mood} ${genre} song`,
                    genre: genre,
                    mood: mood,
                    tempo: tempo,
                    audioUrl: this.generateMockAudioUrl(),
                    duration: Math.floor(Math.random() * 180) + 60 // 1-4 minutes
                }
            };
        } else {
            return {
                success: false,
                message: 'AI service temporarily unavailable. Please try again.'
            };
        }
    }

    generateMusicTitle(prompt, genre, mood) {
        const titles = [
            'Digital Dreams', 'Neon Nights', 'Crystal Clear',
            'Ocean Waves', 'Mountain Echo', 'City Lights',
            'Starlight Serenade', 'Midnight Melody', 'Dawn Chorus',
            'Electric Soul', 'Acoustic Memories', 'Synthetic Harmony'
        ];

        const randomTitle = titles[Math.floor(Math.random() * titles.length)];
        return `${randomTitle} (${genre.charAt(0).toUpperCase() + genre.slice(1)})`;
    }

    generateMockAudioUrl() {
        // Generate a mock audio URL for demonstration
        const audioFiles = [
            'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
            'https://www.soundjay.com/misc/sounds/bell-ringing-04.wav',
            'https://www.soundjay.com/misc/sounds/bell-ringing-03.wav'
        ];
        return audioFiles[Math.floor(Math.random() * audioFiles.length)];
    }

    updateGenerateButton(isGenerating) {
        const btn = document.getElementById('generateBtn');
        if (!btn) return;

        if (isGenerating) {
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating...';
            btn.disabled = true;
            btn.classList.add('loading');
        } else {
            btn.innerHTML = '<i class="fas fa-magic"></i> Generate Music';
            btn.disabled = false;
            btn.classList.remove('loading');
        }
    }

    updatePrompt() {
        const genre = document.getElementById('genreSelect')?.value;
        const mood = document.getElementById('moodSelect')?.value;
        const tempo = document.getElementById('tempoSelect')?.value;
        const prompt = document.getElementById('musicPrompt');

        if (!prompt || !genre || !mood || !tempo) return;

        const suggestions = {
            pop: 'upbeat and catchy',
            rock: 'powerful and energetic',
            jazz: 'smooth and sophisticated',
            classical: 'elegant and timeless',
            electronic: 'modern and innovative',
            folk: 'warm and authentic',
            'hip-hop': 'rhythmic and urban',
            country: 'down-to-earth and heartfelt'
        };

        const moodDescriptions = {
            happy: 'joyful and uplifting',
            sad: 'melancholic and emotional',
            energetic: 'dynamic and powerful',
            calm: 'peaceful and relaxing',
            romantic: 'passionate and intimate',
            mysterious: 'enigmatic and intriguing'
        };

        const tempoDescriptions = {
            slow: 'gentle and flowing',
            medium: 'balanced and steady',
            fast: 'quick and lively'
        };

        const suggestion = `A ${moodDescriptions[mood]} ${suggestions[genre]} song with ${tempoDescriptions[tempo]} tempo.`;
        
        if (!prompt.value.trim()) {
            prompt.value = suggestion;
        }
    }

    updateCharacterCount() {
        const prompt = document.getElementById('musicPrompt');
        const maxLength = 500;
        
        if (prompt && prompt.value.length > maxLength) {
            prompt.value = prompt.value.substring(0, maxLength);
        }
    }

    async playMusic(title) {
        try {
            // Stop current audio if playing
            if (this.currentAudio) {
                this.currentAudio.pause();
                this.currentAudio = null;
            }

            // Create mock audio for demonstration
            this.currentAudio = new Audio();
            this.currentAudio.src = this.generateMockAudioUrl();
            
            // Add event listeners
            this.currentAudio.addEventListener('ended', () => {
                this.currentAudio = null;
            });

            this.currentAudio.addEventListener('error', (e) => {
                console.error('Audio playback error:', e);
                this.showNotification('Audio playback failed', 'error');
            });

            // Play audio
            await this.currentAudio.play();
            
            // Update play button state
            this.updatePlayButtonState(title, true);
            
            this.showNotification(`Now playing: ${title}`, 'success');
            
        } catch (error) {
            console.error('Playback error:', error);
            this.showNotification('Audio playback failed', 'error');
        }
    }

    updatePlayButtonState(title, isPlaying) {
        const cards = document.querySelectorAll('.creation-card');
        cards.forEach(card => {
            const cardTitle = card.querySelector('h4').textContent;
            const playBtn = card.querySelector('.btn-play');
            
            if (cardTitle === title) {
                if (isPlaying) {
                    playBtn.innerHTML = '<i class="fas fa-pause"></i>';
                    playBtn.classList.add('playing');
                } else {
                    playBtn.innerHTML = '<i class="fas fa-play"></i>';
                    playBtn.classList.remove('playing');
                }
            }
        });
    }

    addNewCreation(music) {
        const creationsGrid = document.querySelector('.creations-grid');
        if (!creationsGrid) return;

        const newCard = document.createElement('div');
        newCard.className = 'creation-card';
        newCard.style.animation = 'fadeInUp 0.6s ease-out';
        
        newCard.innerHTML = `
            <div class="card-image">
                <i class="fas fa-music"></i>
            </div>
            <div class="card-content">
                <h4>${music.title}</h4>
                <p>${music.description}</p>
                <button class="btn btn-play">
                    <i class="fas fa-play"></i>
                </button>
            </div>
        `;

        // Add click event for play button
        const playBtn = newCard.querySelector('.btn-play');
        playBtn.addEventListener('click', () => this.playMusic(music.title));

        // Insert at the beginning
        creationsGrid.insertBefore(newCard, creationsGrid.firstChild);

        // Remove oldest card if more than 6
        const cards = creationsGrid.querySelectorAll('.creation-card');
        if (cards.length > 6) {
            cards[cards.length - 1].remove();
        }
    }

    loadRecentCreations() {
        // This would typically load from an API
        // For now, we'll just ensure the existing cards work
        console.log('Recent creations loaded');
    }

    updateCredits() {
        // Simulate credit deduction
        const creditsElement = document.querySelector('.credits');
        if (creditsElement) {
            const currentCredits = parseInt(creditsElement.textContent.match(/\d+/)[0]);
            const newCredits = Math.max(0, currentCredits - 1);
            creditsElement.innerHTML = `<i class="fas fa-coins"></i> ${newCredits} credits`;
            
            if (newCredits === 0) {
                this.showNotification('You\'re out of credits! Upgrade your plan to continue.', 'warning');
            }
        }
    }

    showNotification(message, type = 'info') {
        // Create notification element
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.innerHTML = `
            <div class="notification-content">
                <i class="fas fa-${this.getNotificationIcon(type)}"></i>
                <span>${message}</span>
                <button class="notification-close">&times;</button>
            </div>
        `;

        // Add styles
        notification.style.cssText = `
            position: fixed;
            top: 100px;
            right: 20px;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            padding: 1rem;
            color: var(--text-primary);
            z-index: 10000;
            box-shadow: var(--shadow-lg);
            transform: translateX(400px);
            transition: transform 0.3s ease;
            max-width: 400px;
        `;

        // Add to page
        document.body.appendChild(notification);

        // Animate in
        setTimeout(() => {
            notification.style.transform = 'translateX(0)';
        }, 100);

        // Close button functionality
        const closeBtn = notification.querySelector('.notification-close');
        closeBtn.addEventListener('click', () => {
            notification.style.transform = 'translateX(400px)';
            setTimeout(() => notification.remove(), 300);
        });

        // Auto-remove after 5 seconds
        setTimeout(() => {
            if (notification.parentNode) {
                notification.style.transform = 'translateX(400px)';
                setTimeout(() => notification.remove(), 300);
            }
        }, 5000);
    }

    getNotificationIcon(type) {
        const icons = {
            success: 'check-circle',
            error: 'exclamation-circle',
            warning: 'exclamation-triangle',
            info: 'info-circle'
        };
        return icons[type] || 'info-circle';
    }
}

// Utility Functions
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.musicCreator = new MusicCreator();
    
    // Add some interactive effects
    const cards = document.querySelectorAll('.creation-card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-5px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
});

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MusicCreator;
}