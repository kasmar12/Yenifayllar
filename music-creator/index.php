<?php
require_once 'includes/config.php';
require_once 'includes/auth.php';

$auth = auth();
$isLoggedIn = $auth->isLoggedIn();
$currentUser = $auth->getCurrentUser();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Create Music with AI</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
                <?php if ($isLoggedIn): ?>
                    <a href="user/dashboard.php" class="nav-link">
                        <i class="fas fa-home"></i>
                        Dashboard
                    </a>
                    <a href="user/projects.php" class="nav-link">
                        <i class="fas fa-folder"></i>
                        My Projects
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
                                <a href="user/profile.php">Profile</a>
                                <a href="user/settings.php">Settings</a>
                                <a href="user/logout.php">Logout</a>
                            </div>
                        </div>
                    </div>
                <?php else: ?>
                    <a href="user/login.php" class="nav-link">Login</a>
                    <a href="user/register.php" class="btn btn-primary">Sign Up</a>
                <?php endif; ?>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <main class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Create Music with <span class="gradient-text">AI</span>
                </h1>
                <p class="hero-subtitle">
                    Transform your ideas into beautiful melodies. Describe your music and let AI compose it for you.
                </p>
                
                <!-- AI Music Generation Form -->
                <div class="music-generator">
                    <div class="generator-container">
                        <div class="input-group">
                            <i class="fas fa-microphone"></i>
                            <textarea 
                                id="musicPrompt" 
                                placeholder="Describe your music... (e.g., 'A happy summer pop song with acoustic guitar and upbeat drums')"
                                rows="3"
                            ></textarea>
                        </div>
                        
                        <div class="generation-options">
                            <div class="option-group">
                                <label>Genre:</label>
                                <select id="genreSelect">
                                    <option value="pop">Pop</option>
                                    <option value="rock">Rock</option>
                                    <option value="jazz">Jazz</option>
                                    <option value="classical">Classical</option>
                                    <option value="electronic">Electronic</option>
                                    <option value="folk">Folk</option>
                                    <option value="hip-hop">Hip-Hop</option>
                                    <option value="country">Country</option>
                                </select>
                            </div>
                            
                            <div class="option-group">
                                <label>Mood:</label>
                                <select id="moodSelect">
                                    <option value="happy">Happy</option>
                                    <option value="sad">Sad</option>
                                    <option value="energetic">Energetic</option>
                                    <option value="calm">Calm</option>
                                    <option value="romantic">Romantic</option>
                                    <option value="mysterious">Mysterious</option>
                                </select>
                            </div>
                            
                            <div class="option-group">
                                <label>Tempo:</label>
                                <select id="tempoSelect">
                                    <option value="slow">Slow</option>
                                    <option value="medium">Medium</option>
                                    <option value="fast">Fast</option>
                                </select>
                            </div>
                        </div>
                        
                        <button id="generateBtn" class="btn btn-generate">
                            <i class="fas fa-magic"></i>
                            Generate Music
                        </button>
                    </div>
                </div>
                
                <!-- Recent Creations -->
                <div class="recent-creations">
                    <h3>Recent Creations</h3>
                    <div class="creations-grid">
                        <div class="creation-card">
                            <div class="card-image">
                                <i class="fas fa-music"></i>
                            </div>
                            <div class="card-content">
                                <h4>Summer Vibes</h4>
                                <p>Happy pop song</p>
                                <button class="btn btn-play">
                                    <i class="fas fa-play"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="creation-card">
                            <div class="card-image">
                                <i class="fas fa-music"></i>
                            </div>
                            <div class="card-content">
                                <h4>Night Jazz</h4>
                                <p>Smooth jazz</p>
                                <button class="btn btn-play">
                                    <i class="fas fa-play"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="creation-card">
                            <div class="card-image">
                                <i class="fas fa-music"></i>
                            </div>
                            <div class="card-content">
                                <h4>Electronic Dreams</h4>
                                <p>Ambient electronic</p>
                                <button class="btn btn-play">
                                    <i class="fas fa-play"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2>Why Choose MusicCreator?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <i class="fas fa-brain"></i>
                    <h3>AI-Powered</h3>
                    <p>Advanced AI algorithms create unique music based on your descriptions.</p>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-palette"></i>
                    <h3>Multiple Genres</h3>
                    <p>From pop to classical, jazz to electronic - create any style you want.</p>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-download"></i>
                    <h3>High Quality</h3>
                    <p>Download your creations in high-quality audio formats.</p>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-users"></i>
                    <h3>Collaborate</h3>
                    <p>Share your music and collaborate with other creators.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>MusicCreator</h4>
                    <p>Create, share, and discover amazing music with AI.</p>
                </div>
                
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <a href="#">About</a>
                    <a href="#">Pricing</a>
                    <a href="#">API</a>
                    <a href="#">Support</a>
                </div>
                
                <div class="footer-section">
                    <h4>Legal</h4>
                    <a href="#">Terms of Service</a>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Copyright</a>
                </div>
                
                <div class="footer-section">
                    <h4>Connect</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2024 MusicCreator. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="assets/js/main.js"></script>
</body>
</html>