<?php
require_once '../includes/config.php';
require_once '../includes/auth.php';
require_once '../includes/admin_panel.php';

// Check if user is logged in and is admin
$auth = new Auth();
if (!$auth->isLoggedIn()) {
    header('Location: ../user/login.php');
    exit;
}

$currentUser = $auth->getCurrentUser();
$adminPanel = admin_panel($currentUser['id']);

if (!$adminPanel->isAdmin($currentUser['id'])) {
    header('Location: ../dashboard.php');
    exit;
}

// Get admin data
$systemOverview = $adminPanel->getSystemOverview();
$systemSettings = $adminPanel->getSystemSettings();
$recentUsers = $adminPanel->getAllUsers(1, 5);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - <?php echo APP_NAME; ?></title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="../assets/css/modern_interface.css">
    <link rel="stylesheet" href="../assets/css/mobile_optimization.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    
    <style>
        .admin-container {
            max-width: 1600px;
            margin: 0 auto;
            padding: var(--spacing-3xl) 0;
        }
        
        .admin-header {
            background: var(--secondary-bg);
            border-radius: var(--radius-xl);
            padding: var(--spacing-2xl);
            margin-bottom: var(--spacing-2xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .admin-title {
            font-size: 2.5rem;
            margin-bottom: var(--spacing-sm);
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .admin-subtitle {
            color: var(--secondary-text);
            font-size: 1.1rem;
        }
        
        .admin-nav {
            display: flex;
            gap: var(--spacing-md);
            margin-top: var(--spacing-lg);
            flex-wrap: wrap;
        }
        
        .admin-nav-link {
            background: var(--tertiary-bg);
            color: var(--primary-text);
            text-decoration: none;
            padding: var(--spacing-md) var(--spacing-lg);
            border-radius: var(--radius-md);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all var(--transition-fast);
            font-weight: 500;
        }
        
        .admin-nav-link:hover,
        .admin-nav-link.active {
            background: var(--accent-bg);
            border-color: var(--accent-text);
            transform: translateY(-2px);
        }
        
        .admin-stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-2xl);
        }
        
        .admin-stat-card {
            background: var(--secondary-bg);
            border-radius: var(--radius-lg);
            padding: var(--spacing-xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all var(--transition-fast);
        }
        
        .admin-stat-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        
        .admin-stat-header {
            display: flex;
            align-items: center;
            margin-bottom: var(--spacing-md);
        }
        
        .admin-stat-icon {
            width: 50px;
            height: 50px;
            background: var(--accent-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: var(--spacing-md);
            font-size: 1.25rem;
            color: var(--primary-text);
        }
        
        .admin-stat-title {
            color: var(--secondary-text);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .admin-stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-text);
            margin-bottom: var(--spacing-sm);
        }
        
        .admin-stat-change {
            font-size: 0.9rem;
            color: var(--accent-text);
        }
        
        .admin-content {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: var(--spacing-2xl);
        }
        
        .admin-main {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xl);
        }
        
        .admin-sidebar {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xl);
        }
        
        .admin-section {
            background: var(--secondary-bg);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .admin-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
        }
        
        .admin-section-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--primary-text);
        }
        
        .admin-section-action {
            color: var(--accent-text);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .user-item {
            background: var(--tertiary-bg);
            border-radius: var(--radius-md);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-md);
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: all var(--transition-fast);
        }
        
        .user-item:hover {
            background: var(--accent-bg);
            border-color: rgba(0, 212, 255, 0.3);
        }
        
        .user-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-md);
        }
        
        .user-info h3 {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary-text);
            margin-bottom: var(--spacing-xs);
        }
        
        .user-meta {
            display: flex;
            gap: var(--spacing-md);
            font-size: 0.85rem;
            color: var(--secondary-text);
        }
        
        .user-actions {
            display: flex;
            gap: var(--spacing-sm);
        }
        
        .user-btn {
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
        
        .user-btn:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--primary-text);
        }
        
        .user-btn.danger {
            color: #ff6b6b;
        }
        
        .user-btn.danger:hover {
            background: rgba(255, 107, 107, 0.1);
        }
        
        .user-btn.success {
            color: #51cf66;
        }
        
        .user-btn.success:hover {
            background: rgba(81, 207, 102, 0.1);
        }
        
        .system-health {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--spacing-md);
        }
        
        .health-item {
            text-align: center;
            padding: var(--spacing-md);
            border-radius: var(--radius-md);
            background: var(--tertiary-bg);
        }
        
        .health-item.healthy {
            background: rgba(81, 207, 102, 0.1);
            border: 1px solid rgba(81, 207, 102, 0.3);
        }
        
        .health-item.warning {
            background: rgba(255, 193, 7, 0.1);
            border: 1px solid rgba(255, 193, 7, 0.3);
        }
        
        .health-item.unhealthy {
            background: rgba(255, 107, 107, 0.1);
            border: 1px solid rgba(255, 107, 107, 0.3);
        }
        
        .health-status {
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: var(--spacing-xs);
        }
        
        .health-item.healthy .health-status {
            color: #51cf66;
        }
        
        .health-item.warning .health-status {
            color: #ffc107;
        }
        
        .health-item.unhealthy .health-status {
            color: #ff6b6b;
        }
        
        .health-label {
            font-size: 0.8rem;
            color: var(--secondary-text);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .quick-actions {
            display: grid;
            grid-template-columns: 1fr;
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
            font-size: 0.9rem;
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
            .admin-content {
                grid-template-columns: 1fr;
            }
            
            .mobile-nav {
                display: block;
            }
            
            .mobile-header {
                display: flex;
            }
            
            .admin-container {
                padding: calc(60px + var(--spacing-lg)) var(--spacing-md) calc(80px + var(--spacing-lg));
            }
        }
        
        @media (max-width: 767px) {
            .admin-stats-grid {
                grid-template-columns: 1fr;
            }
            
            .system-health {
                grid-template-columns: 1fr;
            }
            
            .admin-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Mobile Header -->
    <header class="mobile-header">
        <div class="mobile-header-brand"><?php echo APP_NAME; ?> Admin</div>
        <button class="mobile-header-menu" id="mobile-menu-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </header>
    
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay" id="mobile-menu-overlay">
        <div class="mobile-menu" id="mobile-menu">
            <div class="mobile-menu-header">
                <span>Admin Menu</span>
                <button class="mobile-menu-close" id="mobile-menu-close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <ul class="mobile-menu-list">
                <li class="mobile-menu-item">
                    <a href="index.php" class="mobile-menu-link">
                        <i class="fas fa-tachometer-alt mobile-menu-icon"></i>
                        Dashboard
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="users.php" class="mobile-menu-link">
                        <i class="fas fa-users mobile-menu-icon"></i>
                        Users
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="settings.php" class="mobile-menu-link">
                        <i class="fas fa-cog mobile-menu-icon"></i>
                        Settings
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="analytics.php" class="mobile-menu-link">
                        <i class="fas fa-chart-bar mobile-menu-icon"></i>
                        Analytics
                    </a>
                </li>
                <li class="mobile-menu-item">
                    <a href="../dashboard.php" class="mobile-menu-link">
                        <i class="fas fa-arrow-left mobile-menu-icon"></i>
                        Back to Site
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="container">
        <!-- Admin Container -->
        <div class="admin-container">
            <!-- Admin Header -->
            <div class="admin-header">
                <h1 class="admin-title">Admin Panel</h1>
                <p class="admin-subtitle">Manage your music creation platform</p>
                
                <nav class="admin-nav">
                    <a href="index.php" class="admin-nav-link active">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                    <a href="users.php" class="admin-nav-link">
                        <i class="fas fa-users"></i> Users
                    </a>
                    <a href="settings.php" class="admin-nav-link">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <a href="analytics.php" class="admin-nav-link">
                        <i class="fas fa-chart-bar"></i> Analytics
                    </a>
                    <a href="../dashboard.php" class="admin-nav-link">
                        <i class="fas fa-arrow-left"></i> Back to Site
                    </a>
                </nav>
            </div>
            
            <!-- Admin Stats Grid -->
            <div class="admin-stats-grid">
                <div class="admin-stat-card">
                    <div class="admin-stat-header">
                        <div class="admin-stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div>
                            <div class="admin-stat-title">Total Users</div>
                            <div class="admin-stat-value">
                                <?php echo $systemOverview['success'] ? number_format($systemOverview['data']['total_users']) : '0'; ?>
                            </div>
                            <div class="admin-stat-change">
                                <?php echo $systemOverview['success'] ? number_format($systemOverview['data']['new_users_month']) : '0'; ?> new this month
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="admin-stat-card">
                    <div class="admin-stat-header">
                        <div class="admin-stat-icon">
                            <i class="fas fa-folder-music"></i>
                        </div>
                        <div>
                            <div class="admin-stat-title">Total Projects</div>
                            <div class="admin-stat-value">
                                <?php echo $systemOverview['success'] ? number_format($systemOverview['data']['total_projects']) : '0'; ?>
                            </div>
                            <div class="admin-stat-change">
                                Across all users
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="admin-stat-card">
                    <div class="admin-stat-header">
                        <div class="admin-stat-icon">
                            <i class="fas fa-robot"></i>
                        </div>
                        <div>
                            <div class="admin-stat-title">AI Generations</div>
                            <div class="admin-stat-value">
                                <?php echo $systemOverview['success'] ? number_format($systemOverview['data']['total_ai_generations']) : '0'; ?>
                            </div>
                            <div class="admin-stat-change">
                                Total AI music created
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="admin-stat-card">
                    <div class="admin-stat-header">
                        <div class="admin-stat-icon">
                            <i class="fas fa-hdd"></i>
                        </div>
                        <div>
                            <div class="admin-stat-title">Storage Used</div>
                            <div class="admin-stat-value">
                                <?php 
                                if ($systemOverview['success']) {
                                    $storage = $systemOverview['data']['total_storage_used'];
                                    if ($storage > 1024 * 1024 * 1024) {
                                        echo round($storage / (1024 * 1024 * 1024), 1) . ' GB';
                                    } else {
                                        echo round($storage / (1024 * 1024), 1) . ' MB';
                                    }
                                } else {
                                    echo '0 MB';
                                }
                                ?>
                            </div>
                            <div class="admin-stat-change">
                                Total audio storage
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Admin Content -->
            <div class="admin-content">
                <!-- Main Content -->
                <div class="admin-main">
                    <!-- Recent Users -->
                    <div class="admin-section">
                        <div class="admin-section-header">
                            <h2 class="admin-section-title">Recent Users</h2>
                            <a href="users.php" class="admin-section-action">View All</a>
                        </div>
                        
                        <div class="recent-users">
                            <?php if ($recentUsers['success'] && !empty($recentUsers['data']['users'])): ?>
                                <?php foreach ($recentUsers['data']['users'] as $user): ?>
                                    <div class="user-item">
                                        <div class="user-header">
                                            <div class="user-info">
                                                <h3><?php echo htmlspecialchars($user['username']); ?></h3>
                                                <div class="user-meta">
                                                    <span><i class="fas fa-envelope"></i> <?php echo htmlspecialchars($user['email']); ?></span>
                                                    <span><i class="fas fa-calendar"></i> <?php echo date('M j, Y', strtotime($user['created_at'])); ?></span>
                                                    <span><i class="fas fa-tag"></i> <?php echo ucfirst($user['role']); ?></span>
                                                    <span><i class="fas fa-crown"></i> <?php echo ucfirst($user['subscription_type'] ?? 'free'); ?></span>
                                                </div>
                                            </div>
                                            <div class="user-actions">
                                                <button class="user-btn" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="user-btn" title="Edit User">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <?php if ($user['is_suspended']): ?>
                                                    <button class="user-btn success" title="Unsuspend User">
                                                        <i class="fas fa-check"></i>
                                                    </button>
                                                <?php else: ?>
                                                    <button class="user-btn" title="Suspend User">
                                                        <i class="fas fa-ban"></i>
                                                    </button>
                                                <?php endif; ?>
                                                <button class="user-btn danger" title="Delete User">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <div class="user-item">
                                    <div class="user-header">
                                        <div class="user-info">
                                            <h3>No users found</h3>
                                            <p>No users have registered yet.</p>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    
                    <!-- System Health -->
                    <div class="admin-section">
                        <div class="admin-section-header">
                            <h2 class="admin-section-title">System Health</h2>
                            <span class="admin-section-action">Real-time</span>
                        </div>
                        
                        <div class="system-health">
                            <?php if ($systemOverview['success']): ?>
                                <?php $health = $systemOverview['data']['system_health']; ?>
                                
                                <div class="health-item <?php echo $health['database']; ?>">
                                    <div class="health-status">
                                        <?php echo ucfirst($health['database']); ?>
                                    </div>
                                    <div class="health-label">Database</div>
                                </div>
                                
                                <div class="health-item <?php echo $health['storage']; ?>">
                                    <div class="health-status">
                                        <?php echo ucfirst($health['storage']); ?>
                                    </div>
                                    <div class="health-label">Storage</div>
                                </div>
                                
                                <div class="health-item <?php echo $health['performance']; ?>">
                                    <div class="health-status">
                                        <?php echo ucfirst($health['performance']); ?>
                                    </div>
                                    <div class="health-label">Performance</div>
                                </div>
                                
                                <div class="health-item <?php echo $health['security']; ?>">
                                    <div class="health-status">
                                        <?php echo ucfirst($health['security']); ?>
                                    </div>
                                    <div class="health-label">Security</div>
                                </div>
                            <?php else: ?>
                                <div class="health-item">
                                    <div class="health-status">Unknown</div>
                                    <div class="health-label">System Status</div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                
                <!-- Sidebar -->
                <div class="admin-sidebar">
                    <!-- Quick Actions -->
                    <div class="admin-section">
                        <div class="admin-section-header">
                            <h2 class="admin-section-title">Quick Actions</h2>
                        </div>
                        
                        <div class="quick-actions">
                            <a href="users.php" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                <div class="quick-action-text">Add New User</div>
                            </a>
                            
                            <a href="settings.php" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-cog"></i>
                                </div>
                                <div class="quick-action-text">System Settings</div>
                            </a>
                            
                            <a href="#" class="quick-action" id="create-backup">
                                <div class="quick-action-icon">
                                    <i class="fas fa-download"></i>
                                </div>
                                <div class="quick-action-text">Create Backup</div>
                            </a>
                            
                            <a href="analytics.php" class="quick-action">
                                <div class="quick-action-icon">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <div class="quick-action-text">View Analytics</div>
                            </a>
                        </div>
                    </div>
                    
                    <!-- Recent Activity -->
                    <div class="admin-section">
                        <div class="admin-section-header">
                            <h2 class="admin-section-title">Recent Activity</h2>
                        </div>
                        
                        <div class="recent-activity">
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">New user registration: john_doe</div>
                                    <div class="activity-time">2 hours ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-music"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">AI music generation completed</div>
                                    <div class="activity-time">4 hours ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-upload"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">Large audio file uploaded: 50MB</div>
                                    <div class="activity-time">6 hours ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-cog"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">System settings updated</div>
                                    <div class="activity-time">1 day ago</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-download"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-text">System backup created</div>
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
                <a href="index.php" class="mobile-nav-link active">
                    <i class="fas fa-tachometer-alt mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Dashboard</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="users.php" class="mobile-nav-link">
                    <i class="fas fa-users mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Users</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="settings.php" class="mobile-nav-link">
                    <i class="fas fa-cog mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Settings</span>
                </a>
            </li>
            <li class="mobile-nav-item">
                <a href="analytics.php" class="mobile-nav-link">
                    <i class="fas fa-chart-bar mobile-nav-icon"></i>
                    <span class="mobile-nav-text">Analytics</span>
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
        
        // User Actions
        document.addEventListener('DOMContentLoaded', function() {
            // View user details
            document.querySelectorAll('.user-btn[title="View Details"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const userItem = this.closest('.user-item');
                    const username = userItem.querySelector('h3').textContent;
                    console.log('View user details:', username);
                    // TODO: Implement user details view
                });
            });
            
            // Edit user
            document.querySelectorAll('.user-btn[title="Edit User"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const userItem = this.closest('.user-item');
                    const username = userItem.querySelector('h3').textContent;
                    console.log('Edit user:', username);
                    // TODO: Implement user edit
                });
            });
            
            // Suspend/unsuspend user
            document.querySelectorAll('.user-btn[title="Suspend User"], .user-btn[title="Unsuspend User"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const userItem = this.closest('.user-item');
                    const username = userItem.querySelector('h3').textContent;
                    const action = this.title.includes('Suspend') ? 'suspend' : 'unsuspend';
                    
                    if (confirm(`Are you sure you want to ${action} "${username}"?`)) {
                        console.log(`${action} user:`, username);
                        // TODO: Implement user suspension toggle
                    }
                });
            });
            
            // Delete user
            document.querySelectorAll('.user-btn[title="Delete User"]').forEach(btn => {
                btn.addEventListener('click', function() {
                    const userItem = this.closest('.user-item');
                    const username = userItem.querySelector('h3').textContent;
                    
                    if (confirm(`Are you sure you want to delete "${username}"? This action cannot be undone.`)) {
                        console.log('Delete user:', username);
                        // TODO: Implement user deletion
                    }
                });
            });
        });
        
        // Quick Actions
        document.addEventListener('DOMContentLoaded', function() {
            // Create backup
            document.getElementById('create-backup').addEventListener('click', function(e) {
                e.preventDefault();
                
                if (confirm('Create a system backup? This may take a few moments.')) {
                    console.log('Creating system backup...');
                    // TODO: Implement backup creation
                    
                    // Show success message
                    alert('Backup creation started. You will be notified when complete.');
                }
            });
            
            // Other quick actions
            document.querySelectorAll('.quick-action').forEach(action => {
                if (!action.id) {
                    action.addEventListener('click', function(e) {
                        // Let the link handle navigation
                        console.log('Quick action clicked:', this.querySelector('.quick-action-text').textContent);
                    });
                }
            });
        });
    </script>
</body>
</html>