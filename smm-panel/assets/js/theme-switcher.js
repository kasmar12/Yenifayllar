/**
 * Theme Switcher - Advanced Theme Management System
 * Supports 5 different themes with smooth transitions and persistence
 */

class ThemeSwitcher {
    constructor() {
        this.themes = {
            'modern': {
                name: 'Modern Professional',
                description: 'Glassmorphism effects with modern gradients',
                icon: '🎨',
                cssFile: 'themes/modern.css'
            },
            'gaming': {
                name: 'Gaming/Esports',
                description: 'Cyberpunk style with neon effects',
                icon: '🎮',
                cssFile: 'themes/gaming.css'
            },
            'creative': {
                name: 'Colorful Creative',
                description: 'Vibrant colors with artistic patterns',
                icon: '🌈',
                cssFile: 'themes/creative.css'
            },
            'corporate': {
                name: 'Corporate Business',
                description: 'Professional and clean design',
                icon: '🏢',
                cssFile: 'themes/corporate.css'
            },
            'dark': {
                name: 'Dark Elegant',
                description: 'Sophisticated dark theme',
                icon: '🌙',
                cssFile: 'themes/dark.css'
            }
        };
        
        this.currentTheme = 'modern';
        this.isTransitioning = false;
        
        this.init();
    }
    
    init() {
        this.loadSavedTheme();
        this.createThemeSelector();
        this.loadBaseCSS();
        this.applyTheme(this.currentTheme);
        this.bindEvents();
    }
    
    loadSavedTheme() {
        const savedTheme = localStorage.getItem('smm_theme');
        if (savedTheme && this.themes[savedTheme]) {
            this.currentTheme = savedTheme;
        }
    }
    
    createThemeSelector() {
        // Create theme selector container
        const themeContainer = document.createElement('div');
        themeContainer.className = 'theme-selector-container';
        themeContainer.innerHTML = `
            <div class="theme-selector">
                <button class="theme-toggle-btn" id="themeToggleBtn">
                    <span class="theme-icon">🎨</span>
                    <span class="theme-text">Modern</span>
                </button>
                <div class="theme-dropdown" id="themeDropdown">
                    <div class="theme-dropdown-header">
                        <h4>Choose Theme</h4>
                        <p>Select your preferred design style</p>
                    </div>
                    <div class="theme-options">
                        ${Object.entries(this.themes).map(([key, theme]) => `
                            <div class="theme-option ${key === this.currentTheme ? 'active' : ''}" 
                                 data-theme="${key}">
                                <span class="theme-option-icon">${theme.icon}</span>
                                <div class="theme-option-content">
                                    <h5>${theme.name}</h5>
                                    <p>${theme.description}</p>
                                </div>
                                <div class="theme-option-check">
                                    ${key === this.currentTheme ? '✓' : ''}
                                </div>
                            </div>
                        `).join('')}
                    </div>
                </div>
            </div>
        `;
        
        // Add to page
        const navbar = document.querySelector('.navbar-nav');
        if (navbar) {
            navbar.appendChild(themeContainer);
        } else {
            document.body.appendChild(themeContainer);
        }
        
        // Add CSS for theme selector
        this.addThemeSelectorCSS();
    }
    
    addThemeSelectorCSS() {
        const style = document.createElement('style');
        style.textContent = `
            .theme-selector-container {
                position: relative;
                margin-left: auto;
            }
            
            .theme-selector {
                position: relative;
                display: inline-block;
            }
            
            .theme-toggle-btn {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 14px;
                font-weight: 500;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }
            
            .theme-toggle-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
            }
            
            .theme-icon {
                font-size: 16px;
            }
            
            .theme-dropdown {
                position: absolute;
                top: 100%;
                right: 0;
                background: var(--card-bg);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                min-width: 300px;
                opacity: 0;
                visibility: hidden;
                transform: translateY(-10px);
                transition: all 0.3s ease;
                z-index: 1000;
                backdrop-filter: blur(20px);
            }
            
            .theme-dropdown.show {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }
            
            .theme-dropdown-header {
                padding: 20px;
                border-bottom: 1px solid var(--border-color);
                text-align: center;
            }
            
            .theme-dropdown-header h4 {
                margin: 0 0 8px 0;
                color: var(--text-primary);
                font-size: 18px;
                font-weight: 600;
            }
            
            .theme-dropdown-header p {
                margin: 0;
                color: var(--text-secondary);
                font-size: 14px;
            }
            
            .theme-options {
                padding: 16px;
                max-height: 300px;
                overflow-y: auto;
            }
            
            .theme-option {
                display: flex;
                align-items: center;
                gap: 16px;
                padding: 16px;
                border-radius: 8px;
                cursor: pointer;
                transition: all 0.3s ease;
                border: 2px solid transparent;
            }
            
            .theme-option:hover {
                background: rgba(0, 0, 0, 0.1);
                border-color: var(--primary-color);
            }
            
            .theme-option.active {
                background: rgba(0, 0, 0, 0.2);
                border-color: var(--primary-color);
            }
            
            .theme-option-icon {
                font-size: 24px;
                width: 40px;
                text-align: center;
            }
            
            .theme-option-content h5 {
                margin: 0 0 4px 0;
                color: var(--text-primary);
                font-size: 16px;
                font-weight: 600;
            }
            
            .theme-option-content p {
                margin: 0;
                color: var(--text-secondary);
                font-size: 14px;
                line-height: 1.4;
            }
            
            .theme-option-check {
                margin-left: auto;
                color: var(--success-color);
                font-weight: bold;
                font-size: 18px;
            }
            
            @media (max-width: 768px) {
                .theme-dropdown {
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%) scale(0.9);
                    min-width: 90vw;
                    max-width: 400px;
                }
                
                .theme-dropdown.show {
                    transform: translate(-50%, -50%) scale(1);
                }
            }
        `;
        document.head.appendChild(style);
    }
    
    loadBaseCSS() {
        // Load base CSS
        this.loadCSS('assets/css/base.css');
    }
    
    loadCSS(href) {
        return new Promise((resolve, reject) => {
            const link = document.createElement('link');
            link.rel = 'stylesheet';
            link.href = href;
            link.onload = () => resolve();
            link.onerror = () => reject();
            document.head.appendChild(link);
        });
    }
    
    async applyTheme(themeName) {
        if (this.isTransitioning || !this.themes[themeName]) return;
        
        this.isTransitioning = true;
        
        try {
            // Remove current theme CSS
            this.removeCurrentThemeCSS();
            
            // Load new theme CSS
            await this.loadCSS(`assets/css/${this.themes[themeName].cssFile}`);
            
            // Update current theme
            this.currentTheme = themeName;
            
            // Save to localStorage
            localStorage.setItem('smm_theme', themeName);
            
            // Update UI
            this.updateThemeUI();
            
            // Add transition effect
            this.addThemeTransition();
            
            // Update theme toggle button
            this.updateThemeToggleButton();
            
        } catch (error) {
            console.error('Error loading theme:', error);
        } finally {
            this.isTransitioning = false;
        }
    }
    
    removeCurrentThemeCSS() {
        const themeLinks = document.querySelectorAll('link[href*="themes/"]');
        themeLinks.forEach(link => link.remove());
    }
    
    addThemeTransition() {
        // Add smooth transition class to body
        document.body.classList.add('theme-transitioning');
        
        // Remove after transition
        setTimeout(() => {
            document.body.classList.remove('theme-transitioning');
        }, 500);
    }
    
    updateThemeUI() {
        // Update theme options
        document.querySelectorAll('.theme-option').forEach(option => {
            option.classList.remove('active');
            if (option.dataset.theme === this.currentTheme) {
                option.classList.add('active');
            }
        });
        
        // Update theme toggle button
        this.updateThemeToggleButton();
    }
    
    updateThemeToggleButton() {
        const theme = this.themes[this.currentTheme];
        const icon = document.querySelector('.theme-icon');
        const text = document.querySelector('.theme-text');
        
        if (icon) icon.textContent = theme.icon;
        if (text) text.textContent = theme.name;
    }
    
    bindEvents() {
        // Theme toggle button click
        document.addEventListener('click', (e) => {
            if (e.target.closest('#themeToggleBtn')) {
                this.toggleThemeDropdown();
            }
        });
        
        // Theme option click
        document.addEventListener('click', (e) => {
            const themeOption = e.target.closest('.theme-option');
            if (themeOption) {
                const themeName = themeOption.dataset.theme;
                this.applyTheme(themeName);
                this.hideThemeDropdown();
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.theme-selector')) {
                this.hideThemeDropdown();
            }
        });
        
        // Keyboard navigation
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                this.hideThemeDropdown();
            }
        });
    }
    
    toggleThemeDropdown() {
        const dropdown = document.getElementById('themeDropdown');
        if (dropdown.classList.contains('show')) {
            this.hideThemeDropdown();
        } else {
            this.showThemeDropdown();
        }
    }
    
    showThemeDropdown() {
        const dropdown = document.getElementById('themeDropdown');
        dropdown.classList.add('show');
    }
    
    hideThemeDropdown() {
        const dropdown = document.getElementById('themeDropdown');
        dropdown.classList.remove('show');
    }
    
    // Public method to get current theme
    getCurrentTheme() {
        return this.currentTheme;
    }
    
    // Public method to get theme info
    getThemeInfo(themeName) {
        return this.themes[themeName] || null;
    }
    
    // Public method to get all themes
    getAllThemes() {
        return this.themes;
    }
}

// Initialize theme switcher when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.themeSwitcher = new ThemeSwitcher();
    
    // Add theme transition CSS
    const transitionStyle = document.createElement('style');
    transitionStyle.textContent = `
        .theme-transitioning * {
            transition: all 0.3s ease !important;
        }
        
        .theme-transitioning {
            transition: all 0.3s ease !important;
        }
    `;
    document.head.appendChild(transitionStyle);
});

// Export for use in other scripts
if (typeof module !== 'undefined' && module.exports) {
    module.exports = ThemeSwitcher;
}