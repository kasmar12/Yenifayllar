<?php
require_once 'includes/config.php';
require_once 'includes/auth.php';

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
    <title>UI/UX Polish - <?php echo APP_NAME; ?></title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="assets/css/modern_interface.css">
    <link rel="stylesheet" href="assets/css/mobile_optimization.css">
    <link rel="stylesheet" href="assets/css/advanced_ui_components.css">
    <link rel="stylesheet" href="assets/css/advanced_animations.css">
    <link rel="stylesheet" href="assets/css/enhanced_theme_system.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
    <style>
        .polish-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .polish-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .polish-title {
            font-size: 3rem;
            font-weight: 800;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 16px;
        }
        
        .polish-subtitle {
            font-size: 1.25rem;
            color: var(--text-secondary);
            margin-bottom: 32px;
        }
        
        .polish-section {
            margin-bottom: 60px;
        }
        
        .section-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 24px;
            text-align: center;
        }
        
        .component-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }
        
        .demo-card {
            background: var(--secondary-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 24px;
            transition: all 0.3s ease;
        }
        
        .demo-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
            border-color: var(--primary-color);
        }
        
        .demo-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 16px;
        }
        
        .demo-description {
            color: var(--text-secondary);
            margin-bottom: 20px;
            line-height: 1.6;
        }
        
        .theme-showcase {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 24px;
        }
        
        .theme-card {
            background: var(--secondary-bg);
            border: 2px solid var(--border-color);
            border-radius: 16px;
            padding: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .theme-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }
        
        .theme-card.active {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }
        
        .theme-preview {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin: 0 auto 16px;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }
        
        .theme-name {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
        }
        
        .theme-description {
            font-size: 14px;
            color: var(--text-secondary);
            line-height: 1.4;
        }
        
        .animation-showcase {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 24px;
        }
        
        .animation-item {
            background: var(--secondary-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .animation-item:hover {
            border-color: var(--primary-color);
            transform: scale(1.05);
        }
        
        .animation-icon {
            font-size: 32px;
            color: var(--primary-color);
            margin-bottom: 16px;
        }
        
        .animation-name {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
        }
        
        .animation-description {
            font-size: 14px;
            color: var(--text-secondary);
        }
        
        .component-showcase {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            margin-top: 24px;
        }
        
        .component-demo {
            background: var(--secondary-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 24px;
        }
        
        .component-title {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 16px;
        }
        
        .button-showcase {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 20px;
        }
        
        .form-showcase {
            max-width: 400px;
        }
        
        .progress-showcase {
            margin-bottom: 20px;
        }
        
        .alert-showcase {
            margin-bottom: 16px;
        }
        
        .badge-showcase {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .tabs-showcase {
            margin-bottom: 20px;
        }
        
        .accordion-showcase {
            margin-bottom: 20px;
        }
        
        .slider-showcase {
            margin-bottom: 20px;
        }
        
        .dropdown-showcase {
            margin-bottom: 20px;
        }
        
        .notification-showcase {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }
        
        .floating-actions {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            flex-direction: column;
            gap: 16px;
            z-index: 1000;
        }
        
        .floating-button {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: var(--gradient-primary);
            border: none;
            color: white;
            font-size: 20px;
            cursor: pointer;
            box-shadow: var(--shadow-lg);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .floating-button:hover {
            transform: scale(1.1);
            box-shadow: var(--shadow-xl);
        }
        
        .floating-button.secondary {
            background: var(--gradient-secondary);
        }
        
        .floating-button.accent {
            background: var(--gradient-accent);
        }
        
        @media (max-width: 768px) {
            .polish-title {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 1.5rem;
            }
            
            .component-grid {
                grid-template-columns: 1fr;
            }
            
            .theme-showcase {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
            
            .animation-showcase {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }
            
            .floating-actions {
                bottom: 20px;
                right: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Mobile Header -->
    <header class="mobile-header">
        <div class="mobile-header-content">
            <button class="mobile-menu-toggle" id="mobile-menu-toggle">
                <i class="fas fa-bars"></i>
            </button>
            <h1 class="mobile-header-title">UI/UX Polish</h1>
            <div class="mobile-header-actions">
                <div class="theme-switcher" id="theme-switcher">
                    <button class="theme-switcher-button">
                        <i class="fas fa-palette theme-switcher-icon"></i>
                        Theme
                    </button>
                    <div class="theme-dropdown">
                        <div class="theme-option" data-theme="dark">
                            <div class="theme-option-icon" style="background: #6366f1;"></div>
                            <div>
                                <div class="theme-option-name">Dark Professional</div>
                                <div class="theme-option-description">Default dark theme</div>
                            </div>
                        </div>
                        <div class="theme-option" data-theme="light">
                            <div class="theme-option-icon" style="background: #6366f1;"></div>
                            <div>
                                <div class="theme-option-name">Light Professional</div>
                                <div class="theme-option-description">Clean light theme</div>
                            </div>
                        </div>
                        <div class="theme-option" data-theme="sunset">
                            <div class="theme-option-icon" style="background: #f97316;"></div>
                            <div>
                                <div class="theme-option-name">Sunset Warm</div>
                                <div class="theme-option-description">Warm orange theme</div>
                            </div>
                        </div>
                        <div class="theme-option" data-theme="ocean">
                            <div class="theme-option-icon" style="background: #0891b2;"></div>
                            <div>
                                <div class="theme-option-name">Ocean Cool</div>
                                <div class="theme-option-description">Cool blue theme</div>
                            </div>
                        </div>
                        <div class="theme-option" data-theme="forest">
                            <div class="theme-option-icon" style="background: #059669;"></div>
                            <div>
                                <div class="theme-option-name">Forest Natural</div>
                                <div class="theme-option-description">Natural green theme</div>
                            </div>
                        </div>
                        <div class="theme-option" data-theme="neon">
                            <div class="theme-option-icon" style="background: #00ff88;"></div>
                            <div>
                                <div class="theme-option-name">Neon Cyberpunk</div>
                                <div class="theme-option-description">Bright neon theme</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay" id="mobile-menu-overlay">
        <nav class="mobile-menu">
            <div class="mobile-menu-header">
                <h3>Menu</h3>
                <button class="mobile-menu-close" id="mobile-menu-close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <ul class="mobile-menu-items">
                <li><a href="index.php"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="studio.php"><i class="fas fa-music"></i> Studio</a></li>
                <li><a href="virtual_instruments.php"><i class="fas fa-guitar"></i> Instruments</a></li>
                <li><a href="dashboard.php"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="admin/"><i class="fas fa-cog"></i> Admin</a></li>
            </ul>
        </nav>
    </div>
    
    <div class="container">
        <div class="polish-container">
            <!-- Header -->
            <div class="polish-header">
                <h1 class="polish-title">UI/UX Polish System</h1>
                <p class="polish-subtitle">Professional Interface Components & Advanced Animations</p>
            </div>
            
            <!-- Theme System Section -->
            <div class="polish-section">
                <h2 class="section-title">🎨 Theme System</h2>
                <div class="demo-card">
                    <h3 class="demo-title">Multiple Professional Themes</h3>
                    <p class="demo-description">
                        Choose from 6 professionally designed themes with automatic color scheme switching, 
                        smooth transitions, and accessibility support.
                    </p>
                    <div class="theme-showcase">
                        <div class="theme-card active" data-theme="dark">
                            <div class="theme-preview">
                                <i class="fas fa-moon"></i>
                            </div>
                            <div class="theme-name">Dark Professional</div>
                            <div class="theme-description">Default dark theme with blue accents</div>
                        </div>
                        <div class="theme-card" data-theme="light">
                            <div class="theme-preview">
                                <i class="fas fa-sun"></i>
                            </div>
                            <div class="theme-name">Light Professional</div>
                            <div class="theme-description">Clean light theme for productivity</div>
                        </div>
                        <div class="theme-card" data-theme="sunset">
                            <div class="theme-preview">
                                <i class="fas fa-fire"></i>
                            </div>
                            <div class="theme-name">Sunset Warm</div>
                            <div class="theme-description">Warm orange and pink theme</div>
                        </div>
                        <div class="theme-card" data-theme="ocean">
                            <div class="theme-preview">
                                <i class="fas fa-water"></i>
                            </div>
                            <div class="theme-name">Ocean Cool</div>
                            <div class="theme-description">Cool blue ocean theme</div>
                        </div>
                        <div class="theme-card" data-theme="forest">
                            <div class="theme-preview">
                                <i class="fas fa-tree"></i>
                            </div>
                            <div class="theme-name">Forest Natural</div>
                            <div class="theme-description">Natural green forest theme</div>
                        </div>
                        <div class="theme-card" data-theme="neon">
                            <div class="theme-preview">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <div class="theme-name">Neon Cyberpunk</div>
                            <div class="theme-description">Bright neon cyberpunk theme</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Advanced Components Section -->
            <div class="polish-section">
                <h2 class="section-title">🔧 Advanced UI Components</h2>
                <div class="component-showcase">
                    <!-- Buttons -->
                    <div class="component-demo">
                        <h3 class="component-title">Advanced Buttons</h3>
                        <div class="button-showcase">
                            <button class="btn-advanced btn-primary">Primary</button>
                            <button class="btn-advanced btn-secondary">Secondary</button>
                            <button class="btn-advanced btn-success">Success</button>
                            <button class="btn-advanced btn-warning">Warning</button>
                            <button class="btn-advanced btn-danger">Danger</button>
                            <button class="btn-advanced btn-ghost">Ghost</button>
                        </div>
                        <p class="demo-description">
                            Professional buttons with hover effects, gradients, and smooth animations.
                        </p>
                    </div>
                    
                    <!-- Forms -->
                    <div class="component-demo">
                        <h3 class="component-title">Advanced Forms</h3>
                        <div class="form-showcase">
                            <div class="form-group-advanced">
                                <label class="form-label-advanced">Email Address</label>
                                <input type="email" class="form-input-advanced" placeholder="Enter your email">
                            </div>
                            <div class="form-group-advanced">
                                <label class="form-label-advanced">Password</label>
                                <input type="password" class="form-input-advanced" placeholder="Enter your password">
                            </div>
                        </div>
                        <p class="demo-description">
                            Professional form inputs with focus states and validation styling.
                        </p>
                    </div>
                    
                    <!-- Progress Bars -->
                    <div class="component-demo">
                        <h3 class="component-title">Progress Indicators</h3>
                        <div class="progress-showcase">
                            <div class="progress-label">
                                <span>Upload Progress</span>
                                <span class="progress-percentage">75%</span>
                            </div>
                            <div class="progress-container">
                                <div class="progress-bar" style="width: 75%"></div>
                            </div>
                        </div>
                        <p class="demo-description">
                            Animated progress bars with gradient fills and shimmer effects.
                        </p>
                    </div>
                    
                    <!-- Alerts -->
                    <div class="component-demo">
                        <h3 class="component-title">Alert System</h3>
                        <div class="alert-showcase">
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle alert-icon"></i>
                                <div class="alert-content">
                                    <div class="alert-title">Success!</div>
                                    <div class="alert-message">Your changes have been saved successfully.</div>
                                </div>
                                <button class="alert-close">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <p class="demo-description">
                            Professional alert system with icons, titles, and close functionality.
                        </p>
                    </div>
                    
                    <!-- Badges -->
                    <div class="component-demo">
                        <h3 class="component-title">Status Badges</h3>
                        <div class="badge-showcase">
                            <span class="badge badge-primary">Primary</span>
                            <span class="badge badge-success">Success</span>
                            <span class="badge badge-warning">Warning</span>
                            <span class="badge badge-danger">Danger</span>
                            <span class="badge badge-info">Info</span>
                        </div>
                        <p class="demo-description">
                            Color-coded badges for status indicators and labels.
                        </p>
                    </div>
                    
                    <!-- Tabs -->
                    <div class="component-demo">
                        <h3 class="component-title">Tab Navigation</h3>
                        <div class="tabs-showcase">
                            <div class="tabs-container">
                                <div class="tabs-header">
                                    <button class="tab-button active">Overview</button>
                                    <button class="tab-button">Features</button>
                                    <button class="tab-button">Settings</button>
                                </div>
                                <div class="tab-content active">
                                    <p>This is the overview tab content.</p>
                                </div>
                                <div class="tab-content">
                                    <p>This is the features tab content.</p>
                                </div>
                                <div class="tab-content">
                                    <p>This is the settings tab content.</p>
                                </div>
                            </div>
                        </div>
                        <p class="demo-description">
                            Interactive tab navigation with smooth transitions.
                        </p>
                    </div>
                    
                    <!-- Accordion -->
                    <div class="component-demo">
                        <h3 class="component-title">Accordion</h3>
                        <div class="accordion-showcase">
                            <div class="accordion-container">
                                <div class="accordion-item">
                                    <div class="accordion-header">
                                        <span class="accordion-title">Section 1</span>
                                        <i class="fas fa-chevron-down accordion-icon"></i>
                                    </div>
                                    <div class="accordion-content">
                                        <div class="accordion-body">
                                            This is the content for section 1.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <div class="accordion-header">
                                        <span class="accordion-title">Section 2</span>
                                        <i class="fas fa-chevron-down accordion-icon"></i>
                                    </div>
                                    <div class="accordion-content">
                                        <div class="accordion-body">
                                            This is the content for section 2.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="demo-description">
                            Collapsible accordion sections with smooth animations.
                        </p>
                    </div>
                    
                    <!-- Sliders -->
                    <div class="component-demo">
                        <h3 class="component-title">Range Sliders</h3>
                        <div class="slider-showcase">
                            <div class="slider-container">
                                <div class="slider-track">
                                    <div class="slider-fill" style="width: 60%"></div>
                                    <div class="slider-thumb"></div>
                                </div>
                            </div>
                        </div>
                        <p class="demo-description">
                            Interactive range sliders with visual feedback.
                        </p>
                    </div>
                    
                    <!-- Dropdowns -->
                    <div class="component-demo">
                        <h3 class="component-title">Dropdown Menus</h3>
                        <div class="dropdown-showcase">
                            <div class="dropdown-container">
                                <div class="dropdown-trigger">
                                    <span>Select Option</span>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div class="dropdown-menu">
                                    <div class="dropdown-item">Option 1</div>
                                    <div class="dropdown-item">Option 2</div>
                                    <div class="dropdown-item">Option 3</div>
                                </div>
                            </div>
                        </div>
                        <p class="demo-description">
                            Professional dropdown menus with hover effects.
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- Animations Section -->
            <div class="polish-section">
                <h2 class="section-title">🎭 Advanced Animations</h2>
                <div class="demo-card">
                    <h3 class="demo-title">Micro-Interactions & Transitions</h3>
                    <p class="demo-description">
                        Smooth animations, hover effects, and micro-interactions that enhance user experience.
                    </p>
                    <div class="animation-showcase">
                        <div class="animation-item hover-lift">
                            <div class="animation-icon">
                                <i class="fas fa-arrow-up"></i>
                            </div>
                            <div class="animation-name">Hover Lift</div>
                            <div class="animation-description">Elements lift on hover</div>
                        </div>
                        <div class="animation-item hover-glow">
                            <div class="animation-icon">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="animation-name">Hover Glow</div>
                            <div class="animation-description">Glowing shadow effect</div>
                        </div>
                        <div class="animation-item hover-pulse">
                            <div class="animation-icon">
                                <i class="fas fa-heartbeat"></i>
                            </div>
                            <div class="animation-name">Hover Pulse</div>
                            <div class="animation-description">Pulsing scale effect</div>
                        </div>
                        <div class="animation-item hover-rotate">
                            <div class="animation-icon">
                                <i class="fas fa-sync-alt"></i>
                            </div>
                            <div class="animation-name">Hover Rotate</div>
                            <div class="animation-description">360° rotation</div>
                        </div>
                        <div class="animation-item hover-bounce">
                            <div class="animation-icon">
                                <i class="fas fa-basketball-ball"></i>
                            </div>
                            <div class="animation-name">Hover Bounce</div>
                            <div class="animation-description">Bouncing animation</div>
                        </div>
                        <div class="animation-item loading-pulse">
                            <div class="animation-icon">
                                <i class="fas fa-circle"></i>
                            </div>
                            <div class="animation-name">Loading Pulse</div>
                            <div class="animation-description">Continuous pulse</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Floating Actions -->
            <div class="floating-actions">
                <button class="floating-button" title="Quick Actions">
                    <i class="fas fa-plus"></i>
                </button>
                <button class="floating-button secondary" title="Settings">
                    <i class="fas fa-cog"></i>
                </button>
                <button class="floating-button accent" title="Help">
                    <i class="fas fa-question"></i>
                </button>
            </div>
        </div>
    </div>
    
    <!-- Mobile Navigation -->
    <nav class="mobile-nav">
        <a href="index.php" class="mobile-nav-item">
            <i class="fas fa-home"></i>
            <span>Home</span>
        </a>
        <a href="studio.php" class="mobile-nav-item">
            <i class="fas fa-music"></i>
            <span>Studio</span>
        </a>
        <a href="virtual_instruments.php" class="mobile-nav-item">
            <i class="fas fa-guitar"></i>
            <span>Instruments</span>
        </a>
        <a href="dashboard.php" class="mobile-nav-item">
            <i class="fas fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </nav>
    
    <!-- Scripts -->
    <script>
        // Theme System
        class ThemeSystem {
            constructor() {
                this.currentTheme = 'dark';
                this.init();
            }
            
            init() {
                this.setupThemeSwitcher();
                this.setupThemeCards();
                this.loadSavedTheme();
            }
            
            setupThemeSwitcher() {
                const switcher = document.getElementById('theme-switcher');
                const button = switcher.querySelector('.theme-switcher-button');
                
                button.addEventListener('click', () => {
                    switcher.classList.toggle('active');
                });
                
                // Close dropdown when clicking outside
                document.addEventListener('click', (e) => {
                    if (!switcher.contains(e.target)) {
                        switcher.classList.remove('active');
                    }
                });
            }
            
            setupThemeCards() {
                const themeCards = document.querySelectorAll('.theme-card');
                
                themeCards.forEach(card => {
                    card.addEventListener('click', () => {
                        const theme = card.dataset.theme;
                        this.setTheme(theme);
                        
                        // Update active state
                        themeCards.forEach(c => c.classList.remove('active'));
                        card.classList.add('active');
                    });
                });
            }
            
            setTheme(themeName) {
                this.currentTheme = themeName;
                document.documentElement.setAttribute('data-theme', themeName);
                localStorage.setItem('selected-theme', themeName);
                
                // Update theme switcher button
                const button = document.querySelector('.theme-switcher-button');
                button.innerHTML = `<i class="fas fa-palette theme-switcher-icon"></i> ${themeName.charAt(0).toUpperCase() + themeName.slice(1)}`;
            }
            
            loadSavedTheme() {
                const savedTheme = localStorage.getItem('selected-theme');
                if (savedTheme) {
                    this.setTheme(savedTheme);
                    
                    // Update active card
                    const activeCard = document.querySelector(`[data-theme="${savedTheme}"]`);
                    if (activeCard) {
                        document.querySelectorAll('.theme-card').forEach(c => c.classList.remove('active'));
                        activeCard.classList.add('active');
                    }
                }
            }
        }
        
        // Mobile Menu
        class MobileMenu {
            constructor() {
                this.init();
            }
            
            init() {
                const toggle = document.getElementById('mobile-menu-toggle');
                const close = document.getElementById('mobile-menu-close');
                const overlay = document.getElementById('mobile-menu-overlay');
                
                toggle.addEventListener('click', () => {
                    overlay.classList.add('active');
                });
                
                close.addEventListener('click', () => {
                    overlay.classList.remove('active');
                });
                
                overlay.addEventListener('click', (e) => {
                    if (e.target === overlay) {
                        overlay.classList.remove('active');
                    }
                });
            }
        }
        
        // Tab System
        class TabSystem {
            constructor() {
                this.init();
            }
            
            init() {
                const tabButtons = document.querySelectorAll('.tab-button');
                const tabContents = document.querySelectorAll('.tab-content');
                
                tabButtons.forEach((button, index) => {
                    button.addEventListener('click', () => {
                        // Remove active class from all buttons and contents
                        tabButtons.forEach(btn => btn.classList.remove('active'));
                        tabContents.forEach(content => content.classList.remove('active'));
                        
                        // Add active class to clicked button and corresponding content
                        button.classList.add('active');
                        tabContents[index].classList.add('active');
                    });
                });
            }
        }
        
        // Accordion System
        class AccordionSystem {
            constructor() {
                this.init();
            }
            
            init() {
                const accordionHeaders = document.querySelectorAll('.accordion-header');
                
                accordionHeaders.forEach(header => {
                    header.addEventListener('click', () => {
                        const item = header.parentElement;
                        const isActive = item.classList.contains('active');
                        
                        // Close all accordion items
                        document.querySelectorAll('.accordion-item').forEach(accItem => {
                            accItem.classList.remove('active');
                        });
                        
                        // Open clicked item if it wasn't active
                        if (!isActive) {
                            item.classList.add('active');
                        }
                    });
                });
            }
        }
        
        // Dropdown System
        class DropdownSystem {
            constructor() {
                this.init();
            }
            
            init() {
                const dropdowns = document.querySelectorAll('.dropdown-container');
                
                dropdowns.forEach(dropdown => {
                    const trigger = dropdown.querySelector('.dropdown-trigger');
                    const menu = dropdown.querySelector('.dropdown-menu');
                    
                    trigger.addEventListener('click', () => {
                        dropdown.classList.toggle('active');
                    });
                    
                    // Close dropdown when clicking outside
                    document.addEventListener('click', (e) => {
                        if (!dropdown.contains(e.target)) {
                            dropdown.classList.remove('active');
                        }
                    });
                });
            }
        }
        
        // Initialize all systems
        document.addEventListener('DOMContentLoaded', () => {
            new ThemeSystem();
            new MobileMenu();
            new TabSystem();
            new AccordionSystem();
            new DropdownSystem();
        });
    </script>
</body>
</html>