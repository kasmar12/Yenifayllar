<?php
require_once 'includes/config.php';
require_once 'includes/auth.php';
require_once 'includes/user_dashboard.php';

// Check if user is logged in
$auth = new Auth();
if (!$auth->isLoggedIn()) {
    header('Location: user/login.php');
    exit;
}

$currentUser = $auth->getCurrentUser();
$dashboard = user_dashboard($currentUser['id']);

// Get dashboard data
$overview = $dashboard->getDashboardOverview();
$userSettings = $dashboard->getUserSettings();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - <?php echo APP_NAME; ?></title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="assets/css/modern_interface.css">
    <link rel="stylesheet" href="assets/css/mobile_optimization.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
    <style>
        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: var(--spacing-3xl) 0;
        }
        
        .dashboard-header {
            background: var(--secondary-bg);
            border-radius: var(--radius-xl);
            padding: var(--spacing-2xl);
            margin-bottom: var(--spacing-2xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .dashboard-welcome {
            margin-bottom: var(--spacing-xl);
        }
        
        .dashboard-welcome h1 {
            font-size: 2.5rem;
            margin-bottom: var(--spacing-sm);
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .dashboard-welcome p {
            color: var(--secondary-text);
            font-size: 1.1rem;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-lg);
        }
        
        .stat-card {
            background: var(--tertiary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all var(--transition-fast);
        }
        
        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            background: var(--accent-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto var(--spacing-md);
            font-size: 1.5rem;
            color: var(--primary-text);
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-text);
            margin-bottom: var(--spacing-sm);
        }
        
        .stat-label {
            color: var(--secondary-text);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .dashboard-sections {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: var(--spacing-2xl);
        }
        
        .dashboard-main {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xl);
        }
        
        .dashboard-sidebar {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xl);
        }
        
        .section-card {
            background: var(--secondary-bg);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
        }
        
        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--primary-text);
        }
        
        .section-action {
            color: var(--accent-text);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .project-item {
            background: var(--tertiary-bg);
            border-radius: var(--radius-md);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-md);
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: all var(--transition-fast);
        }
        
        .project-item:hover {
            background: var(--accent-bg);
            border-color: rgba(0, 212, 255, 0.3);
        }
        
        .project-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-md);
        }
        
        .project-info h3 {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary-text);
            margin-bottom: var(--spacing-xs);
        }
        
        .project-meta {
            display: flex;
            gap: var(--spacing-md);
            font-size: 0.85rem;
            color: var(--secondary-text);
        }
        
        .project-actions {
            display: flex;
            gap: var(--spacing-sm);
        }
        
        .project-btn {
            background: none;
            border: none;
            color: var(--secondary-text);
            cursor: pointer;
            padding: var(--spacing-sm);
            border-radius: var(--radius-sm);
            transition: all var(--transition-fast);
            min-height: var(--touch-target-min);
            min-width: var(--touch-target-min);
        }
        
        .project-btn:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--primary-text);
        }
        
        .project-btn.primary {
            background: var(--accent-gradient);
            color: var(--primary-text);
        }
        
        .project-btn.primary:hover {
            transform: scale(1.05);
        }
        
        .storage-bar {
            background: var(--accent-bg);
            border-radius: var(--radius-full);
            height: 8px;
            margin: var(--spacing-md) 0;
            overflow: hidden;
        }
        
        .storage-fill {
            height: 100%;
            background: var(--accent-gradient);
            border-radius: var(--radius-full);
            transition: width var(--transition-normal);
        }
        
        .storage-info {
            display: flex;
            justify-content: space-between;
            font-size: 0.9rem;
            color: var(--secondary-text);
        }
        
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: var(--spacing-md);
        }
        
        .quick-action {
            background: var(--tertiary-bg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-md);
            padding: var(--spacing-lg);
            text-align: center;
            text-decoration: none;
            color: var(--primary-text);
            transition: all var(--transition-fast);
            min-height: var(--touch-target-ideal);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        
        .quick-action:hover {
            background: var(--accent-bg);
            border-color: var(--accent-text);
            transform: translateY(-2px);
        }
        
        .quick-action-icon {
            font-size: 1.5rem;
            color: var(--accent-text);
            margin-bottom: var(--spacing-sm);
        }
        
        .quick-action-text {
            font-size: 0.85rem;
            font-weight: 500;
        }
        
        .recent-activity {
            max-height: 400px;
            overflow-y: auto;
        }
        
        .activity-item {
            display: flex;
            align-items: center;
            padding: var(--spacing-md);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            background: var(--accent-bg);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: var(--spacing-md);
            font-size: 1rem;
            color: var(--accent-text);
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-text {
            color: var(--primary-text);
            font-size: 0.9rem;
            margin-bottom: var(--spacing-xs);
        }
        
        .activity-time {
            color: var(--secondary-text);
            font-size: 0.8rem;
        }
        
        .mobile-nav {
            display: none;
        }
        
        .mobile-header {
            display: none;
        }
        
        @media (max-width: 991px) {
            .dashboard-sections {
                grid-template-columns: 1fr;
            }
            
            .mobile-nav {
                display: block;
            }
            
            .mobile-header {
                display: flex;
            }
            
            .dashboard-container {
                padding: calc(60px + var(--spacing-lg)) var(--spacing-md) calc(80px + var(--spacing-lg));
            }
        }
        
        @media (max-width: 767px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .dashboard-welcome h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Mobile Header -->
    <header class="mobile-header">
        <div class="mobile-header-brand"><?php echo APP_NAME; ?></div>
        <button class="mobile-header-menu" id="mobile-menu-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </header>
    
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay" id="mobile-menu-overlay">
        <div class="mobile-menu" id="mobile-menu">
            <div class="mobile-menu-header">
                <span>Menu</span>
                <button class="mobile-menu-close" id="mobile-menu-close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <ul class="mobile-menu-list">
                <li class="mobile-menu-item">
                    <a href="dashboard.php" class="mobile-menu-link">
                        <i class="fas fa-tachometer-alt mobile-menu-icon"></i>
                        Dashboard
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="studio.php" class="mobile-menu-link">
                        <i class="fas fa-music mobile-menu-icon"></i>
                        Studio
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="virtual_instruments.php" class="mobile-menu-link">
                        <i class="fas fa-piano mobile-menu-icon"></i>
                        Instruments
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="index.php" class="mobile-menu-link">
                        <i class="fas fa-home mobile-menu-icon"></i>
                        Home
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="user/logout.php" class="mobile-menu-link">
                        <i class="fas fa-sign-out-alt mobile-menu-icon"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="container">
        <!-- Dashboard Container -->
        <div class="dashboard-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <div class="dashboard-welcome">
                    <h1>Welcome back, <?php echo htmlspecialchars($currentUser['username']); ?>! 🎵</h1>
                    <p>Here's what's happening with your music projects today</p>
                </div>
                
                <!-- Stats Grid -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-folder-music"></i>
                        </div>
                        <div class="stat-value"><?php echo $overview['success'] ? $overview['data']['stats']['total_projects'] : 0; ?></div>
                        <div class="stat-label">Total Projects</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-music"></i>
                        </div>
                        <div class="stat-value"><?php echo $overview['success'] ? $overview['data']['stats']['total_audio_files'] : 0; ?></div>
                        <div class="stat-label">Audio Files</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-list-music"></i>
                        </div>
                        <div class="stat-value"><?php echo $overview['success'] ? $overview['data']['stats']['total_playlists'] : 0; ?></div>
                        <div class="stat-label">Playlists</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-robot"></i>
                        </div>
                        <div class="stat-value"><?php echo $overview['success'] ? $overview['data']['stats']['ai_generations_this_month'] : 0; ?></div>
                        <div class="stat-label">AI Generations</div>
                    </div>
                </div>
            </div>
            
            <!-- Dashboard Sections -->
            <div class="dashboard-sections">
                <!-- Main Content -->
                <div class="dashboard-main">
                    <!-- Recent Projects -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">Recent Projects</h2>
                            <a href="#" class="section-action">View All</a>
                        </div>
                        
                        <div class="recent-projects">
                            <?php if ($overview['success'] && !empty($overview['data']['recent_projects'])): ?>
                                <?php foreach ($overview['data']['recent_projects'] as $project): ?>
                                    <div class="project-item">
                                        <div class="project-header">
                                            <div class="project-info">
                                                <h3><?php echo htmlspecialchars($project['title']); ?></h3>
                                                <div class="project-meta">
                                                    <span><i class="fas fa-clock"></i> <?php echo date('M j, Y', strtotime($project['updated_at'])); ?></span>
                                                    <span><i class="fas fa-music"></i> <?php echo $project['audio_count']; ?> tracks</span>
                                                    <?php if ($project['genre']): ?>
                                                        <span><i class="fas fa-tag"></i> <?php echo htmlspecialchars($project['genre']); ?></span>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                            <div class="project-actions">
                                                <button class="project-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="project-btn" title="Delete">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                                <a href="studio.php?project=<?php echo $project['id']; ?>" class="project-btn primary" title="Open in Studio">
                                                    <i class="fas fa-external-link-alt"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <div class="project-item">
                                    <div class="project-header">
                                        <div class="project-info">
                                            <h3>No projects yet</h3>
                                            <p>Start creating your first music project!</p>
                                        </div>
                                        <a href="studio.php" class="project-btn primary">
                                            <i class="fas fa-plus"></i> Create Project
                                        </a>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    
                    <!-- Recent Creations -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">Recent Creations</h2>
                            <a href="#" class="section-action">View All</a>
                        </div>
                        
                        <div class="recent-creations">
                            <?php if ($overview['success'] && !empty($overview['data']['recent_creations'])): ?>
                                <?php foreach ($overview['data']['recent_creations'] as $creation): ?>
                                    <div class="project-item">
                                        <div class="project-header">
                                            <div class="project-info">
                                                <h3><?php echo htmlspecialchars($creation['filename']); ?></h3>
                                                <div class="project-meta">
                                                    <span><i class="fas fa-clock"></i> <?php echo date('M j, Y', strtotime($creation['created_at'])); ?></span>
                                                    <span><i class="fas fa-folder"></i> <?php echo htmlspecialchars($creation['project_title'] ?? 'No Project'); ?></span>
                                                    <span><i class="fas fa-file-audio"></i> <?php echo strtoupper($creation['file_type']); ?></span>
                                                </div>
                                            </div>
                                            <div class="project-actions">
                                                <button class="project-btn" title="Play">
                                                    <i class="fas fa-play"></i>
                                                </button>
                                                <button class="project-btn" title="Download">
                                                    <i class="fas fa-download"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <div class="project-item">
                                    <div class="project-header">
                                        <div class="project-info">
                                            <h3>No creations yet</h3>
                                            <p>Start making music to see your creations here!</p>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                
                <!-- Sidebar -->
                <div class="dashboard-sidebar">
                    <!-- Quick Actions -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">Quick Actions</h2>
                        </div>
                        
                        <div class="quick-actions">
                            <a href="studio.php" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-plus"></i>
                                </div>
                                <div class="quick-action-text">New Project</div>
                            </a>
                            
                            <a href="virtual_instruments.php" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-piano"></i>
                                </div>
                                <div class="quick-action-text">Instruments</div>
                            </a>
                            
                            <a href="#" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-robot"></i>
                                </div>
                                <div class="quick-action-text">AI Generate</div>
                            </a>
                            
                            <a href="#" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-upload"></i>
                                </div>
                                <div class="quick-action-text">Upload Audio</div>
                            </a>
                        </div>
                    </div>
                    
                    <!-- Storage Usage -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">Storage Usage</h2>
                        </div>
                        
                        <?php if ($overview['success']): ?>
                            <?php $storage = $overview['data']['storage_usage']; ?>
                            <div class="storage-bar">
                                <div class="storage-fill" style="width: <?php echo min(100, $storage['percentage']); ?>%"></div>
                            </div>
                            <div class="storage-info">
                                <span><?php echo $storage['formatted_used']; ?> used</span>
                                <span><?php echo $storage['formatted_max']; ?> total</span>
                            </div>
                            <p style="margin-top: var(--spacing-md); font-size: 0.9rem; color: var(--secondary-text);">
                                <?php if ($storage['percentage'] > 80): ?>
                                    ⚠️ Storage almost full
                                <?php elseif ($storage['percentage'] > 60): ?>
                                    ℹ️ Storage usage moderate
                                <?php else: ?>
                                    ✅ Plenty of storage available
                                <?php endif; ?>
                            </p>
                        <?php else: ?>
                            <p>Storage information unavailable</p>
                        <?php endif; ?>
                    </div>
                    
                    <!-- Recent Activity -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">Recent Activity</h2>
                        </div>
                        
                        <div class="recent-activity">
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-plus"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">Created new project "Summer Vibes"</div>
                                    <div class="activity-time">2 hours ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-music"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">Generated AI music with Piano</div>
                                    <div class="activity-time">4 hours ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-upload"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">Uploaded "guitar_solo.wav"</div>
                                    <div class="activity-time">1 day ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-edit"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">Updated project "Rock Anthem"</div>
                                    <div class="activity-time">2 days ago</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Mobile Navigation -->
    <nav class="mobile-nav">
        <ul class="mobile-nav-list">
            <li class="mobile-nav-item">
                <a href="dashboard.php" class="mobile-nav-link active">
                    <i class="fas fa-tachometer-alt mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Dashboard</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="studio.php" class="mobile-nav-link">
                    <i class="fas fa-music mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Studio</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="virtual_instruments.php" class="mobile-nav-link">
                    <i class="fas fa-piano mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Instruments</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="index.php" class="mobile-nav-link">
                    <i class="fas fa-home mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Home</span>
                </a>
            </li>
        </ul>
    </nav>
    
    <!-- Scripts -->
    <script>
        // Mobile Menu Toggle
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.getElementById('mobile-menu-toggle');
            const menuOverlay = document.getElementById('mobile-menu-overlay');
            const mobileMenu = document.getElementById('mobile-menu');
            const menuClose = document.getElementById('mobile-menu-close');
            
            menuToggle.addEventListener('click', function() {
                menuOverlay.classList.add('active');
                mobileMenu.classList.add('active');
            });
            
            menuClose.addEventListener('click', function() {
                menuOverlay.classList.remove('active');
                mobileMenu.classList.remove('active');
            });
            
            menuOverlay.addEventListener('click', function(e) {
                if (e.target === menuOverlay) {
                    menuOverlay.classList.remove('active');
                    mobileMenu.classList.remove('active');
                }
            });
        });
        
        // Project Actions
        document.addEventListener('DOMContentLoaded', function() {
            // Edit project
            document.querySelectorAll('.project-btn[title="Edit"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const projectItem = this.closest('.project-item');
                    const projectTitle = projectItem.querySelector('h3').textContent;
                    console.log('Edit project:', projectTitle);
                    // TODO: Implement edit functionality
                });
            });
            
            // Delete project
            document.querySelectorAll('.project-btn[title="Delete"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const projectItem = this.closest('.project-item');
                    const projectTitle = projectItem.querySelector('h3').textContent;
                    
                    if (confirm(`Are you sure you want to delete "${projectTitle}"?`)) {
                        console.log('Delete project:', projectTitle);
                        // TODO: Implement delete functionality
                    }
                });
            });
            
            // Play audio
            document.querySelectorAll('.project-btn[title="Play"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const projectItem = this.closest('.project-item');
                    const audioTitle = projectItem.querySelector('h3').textContent;
                    console.log('Play audio:', audioTitle);
                    // TODO: Implement audio playback
                });
            });
            
            // Download audio
            document.querySelectorAll('.project-btn[title="Download"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const projectItem = this.closest('.project-item');
                    const audioTitle = projectItem.querySelector('h3').textContent;
                    console.log('Download audio:', audioTitle);
                    // TODO: Implement download functionality
                });
            });
        });
        
        // Quick Actions
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.quick-action').forEach(action => {
                action.addEventListener('click', function(e) {
                    // Let the link handle navigation
                    console.log('Quick action clicked:', this.querySelector('.quick-action-text').textContent);
                });
            });
        });
    </script>
</body>
</html>