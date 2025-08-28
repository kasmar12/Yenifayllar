<?php
require_once 'config.php';
require_once 'database.php';

/**
 * Admin Panel System
 * Professional User Management & System Settings
 * 100% Original - Studio Quality
 */
class AdminPanel {
    private $db;
    private $adminId;
    
    public function __construct($adminId) {
        $this->db = Database::getInstance();
        $this->adminId = $adminId;
    }
    
    /**
     * Check if user is admin
     */
    public function isAdmin($userId) {
        try {
            $query = "SELECT role FROM users WHERE id = ?";
            $result = $this->db->fetch($query, [$userId]);
            
            return $result && $result['role'] === 'admin';
        } catch (Exception $e) {
            error_log("Admin Check Error: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Get system overview statistics
     */
    public function getSystemOverview() {
        try {
            $stats = [];
            
            // Total users
            $query = "SELECT COUNT(*) as total FROM users";
            $result = $this->db->fetch($query);
            $stats['total_users'] = $result['total'] ?? 0;
            
            // Active users (logged in last 30 days)
            $query = "SELECT COUNT(*) as total FROM users WHERE last_login >= DATE_SUB(NOW(), INTERVAL 30 DAY)";
            $result = $this->db->fetch($query);
            $stats['active_users'] = $result['total'] ?? 0;
            
            // New users this month
            $query = "SELECT COUNT(*) as total FROM users WHERE created_at >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
            $result = $this->db->fetch($query);
            $stats['new_users_month'] = $result['total'] ?? 0;
            
            // Total projects
            $query = "SELECT COUNT(*) as total FROM projects";
            $result = $this->db->fetch($query);
            $stats['total_projects'] = $result['total'] ?? 0;
            
            // Total audio files
            $query = "SELECT COUNT(*) as total FROM audio_files";
            $result = $this->db->fetch($query);
            $stats['total_audio_files'] = $result['total'] ?? 0;
            
            // Total AI generations
            $query = "SELECT COUNT(*) as total FROM ai_generations";
            $result = $this->db->fetch($query);
            $stats['total_ai_generations'] = $result['total'] ?? 0;
            
            // Total storage used
            $query = "SELECT SUM(file_size) as total FROM audio_files";
            $result = $this->db->fetch($query);
            $stats['total_storage_used'] = $result['total'] ?? 0;
            
            // System health
            $stats['system_health'] = $this->getSystemHealth();
            
            return [
                'success' => true,
                'data' => $stats
            ];
        } catch (Exception $e) {
            error_log("Get System Overview Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load system overview'
            ];
        }
    }
    
    /**
     * Get all users with pagination
     */
    public function getAllUsers($page = 1, $limit = 20, $search = '', $filter = '') {
        try {
            $offset = ($page - 1) * $limit;
            
            $whereConditions = ["1=1"];
            $params = [];
            
            if (!empty($search)) {
                $whereConditions[] = "(username LIKE ? OR email LIKE ? OR first_name LIKE ? OR last_name LIKE ?)";
                $params[] = "%$search%";
                $params[] = "%$search%";
                $params[] = "%$search%";
                $params[] = "%$search%";
            }
            
            if (!empty($filter)) {
                switch ($filter) {
                    case 'admin':
                        $whereConditions[] = "role = 'admin'";
                        break;
                    case 'premium':
                        $whereConditions[] = "subscription_type IN ('premium', 'pro', 'enterprise')";
                        break;
                    case 'active':
                        $whereConditions[] = "last_login >= DATE_SUB(NOW(), INTERVAL 30 DAY)";
                        break;
                    case 'inactive':
                        $whereConditions[] = "last_login < DATE_SUB(NOW(), INTERVAL 30 DAY)";
                        break;
                    case 'verified':
                        $whereConditions[] = "email_verified = 1";
                        break;
                    case 'unverified':
                        $whereConditions[] = "email_verified = 0";
                        break;
                }
            }
            
            $whereClause = implode(' AND ', $whereConditions);
            
            // Get total count
            $countQuery = "SELECT COUNT(*) as total FROM users WHERE $whereClause";
            $countResult = $this->db->fetch($countQuery, $params);
            $totalUsers = $countResult['total'];
            
            // Get users
            $query = "SELECT u.*, 
                             COUNT(p.id) as project_count,
                             COUNT(af.id) as audio_count,
                             SUM(af.file_size) as storage_used
                      FROM users u 
                      LEFT JOIN projects p ON u.id = p.user_id 
                      LEFT JOIN audio_files af ON u.id = af.user_id 
                      WHERE $whereClause 
                      GROUP BY u.id 
                      ORDER BY u.created_at DESC 
                      LIMIT ? OFFSET ?";
            
            $params[] = $limit;
            $params[] = $offset;
            
            $users = $this->db->fetchAll($query, $params);
            
            return [
                'success' => true,
                'data' => [
                    'users' => $users,
                    'pagination' => [
                        'current_page' => $page,
                        'total_pages' => ceil($totalUsers / $limit),
                        'total_users' => $totalUsers,
                        'per_page' => $limit
                    ]
                ]
            ];
        } catch (Exception $e) {
            error_log("Get All Users Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load users'
            ];
        }
    }
    
    /**
     * Get user details
     */
    public function getUserDetails($userId) {
        try {
            // Get user info
            $query = "SELECT * FROM users WHERE id = ?";
            $user = $this->db->fetch($query, [$userId]);
            
            if (!$user) {
                return [
                    'success' => false,
                    'message' => 'User not found'
                ];
            }
            
            // Get user projects
            $query = "SELECT * FROM projects WHERE user_id = ? ORDER BY created_at DESC LIMIT 10";
            $projects = $this->db->fetchAll($query, [$userId]);
            
            // Get user audio files
            $query = "SELECT * FROM audio_files WHERE user_id = ? ORDER BY created_at DESC LIMIT 10";
            $audioFiles = $this->db->fetchAll($query, [$userId]);
            
            // Get user AI generations
            $query = "SELECT * FROM ai_generations WHERE user_id = ? ORDER BY created_at DESC LIMIT 10";
            $aiGenerations = $this->db->fetchAll($query, [$userId]);
            
            // Get user settings
            $query = "SELECT * FROM user_settings WHERE user_id = ?";
            $userSettings = $this->db->fetch($query, [$userId]);
            
            return [
                'success' => true,
                'data' => [
                    'user' => $user,
                    'projects' => $projects,
                    'audio_files' => $audioFiles,
                    'ai_generations' => $aiGenerations,
                    'user_settings' => $userSettings
                ]
            ];
        } catch (Exception $e) {
            error_log("Get User Details Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load user details'
            ];
        }
    }
    
    /**
     * Update user role
     */
    public function updateUserRole($userId, $newRole) {
        try {
            if (!in_array($newRole, ['user', 'moderator', 'admin'])) {
                return [
                    'success' => false,
                    'message' => 'Invalid role'
                ];
            }
            
            $query = "UPDATE users SET role = ?, updated_at = NOW() WHERE id = ?";
            $result = $this->db->update($query, [$newRole, $userId]);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'User role updated successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update user role'
                ];
            }
        } catch (Exception $e) {
            error_log("Update User Role Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update user role'
            ];
        }
    }
    
    /**
     * Update user subscription
     */
    public function updateUserSubscription($userId, $subscriptionType, $expiresAt = null) {
        try {
            if (!in_array($subscriptionType, ['free', 'premium', 'pro', 'enterprise'])) {
                return [
                    'success' => false,
                    'message' => 'Invalid subscription type'
                ];
            }
            
            $query = "UPDATE users SET subscription_type = ?, subscription_expires = ?, updated_at = NOW() WHERE id = ?";
            $result = $this->db->update($query, [$subscriptionType, $expiresAt, $userId]);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'User subscription updated successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update user subscription'
                ];
            }
        } catch (Exception $e) {
            error_log("Update User Subscription Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update user subscription'
            ];
        }
    }
    
    /**
     * Suspend/unsuspend user
     */
    public function toggleUserSuspension($userId, $suspended = true) {
        try {
            $query = "UPDATE users SET is_suspended = ?, updated_at = NOW() WHERE id = ?";
            $result = $this->db->update($query, [$suspended ? 1 : 0, $userId]);
            
            if ($result) {
                $action = $suspended ? 'suspended' : 'unsuspended';
                return [
                    'success' => true,
                    'message' => "User $action successfully"
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update user suspension status'
                ];
            }
        } catch (Exception $e) {
            error_log("Toggle User Suspension Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update user suspension status'
            ];
        }
    }
    
    /**
     * Delete user
     */
    public function deleteUser($userId) {
        try {
            // Check if user exists
            $query = "SELECT id FROM users WHERE id = ?";
            $user = $this->db->fetch($query, [$userId]);
            
            if (!$user) {
                return [
                    'success' => false,
                    'message' => 'User not found'
                ];
            }
            
            // Delete user (cascade will handle related records)
            $query = "DELETE FROM users WHERE id = ?";
            $result = $this->db->delete($query, [$userId]);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'User deleted successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to delete user'
                ];
            }
        } catch (Exception $e) {
            error_log("Delete User Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to delete user'
            ];
        }
    }
    
    /**
     * Get system settings
     */
    public function getSystemSettings() {
        try {
            $query = "SELECT * FROM system_settings WHERE id = 1";
            $settings = $this->db->fetch($query);
            
            if (!$settings) {
                // Create default system settings
                $defaultSettings = [
                    'site_name' => APP_NAME,
                    'site_description' => 'Professional Music Creation Platform',
                    'maintenance_mode' => 0,
                    'registration_enabled' => 1,
                    'max_file_size' => 50 * 1024 * 1024, // 50 MB
                    'allowed_file_types' => 'wav,mp3,flac,ogg',
                    'ai_generation_limit_free' => 10,
                    'ai_generation_limit_premium' => 100,
                    'ai_generation_limit_pro' => 1000,
                    'storage_limit_free' => 100 * 1024 * 1024, // 100 MB
                    'storage_limit_premium' => 1 * 1024 * 1024 * 1024, // 1 GB
                    'storage_limit_pro' => 10 * 1024 * 1024 * 1024, // 10 GB
                    'email_notifications' => 1,
                    'analytics_enabled' => 1,
                    'backup_enabled' => 1,
                    'backup_frequency' => 'daily',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s')
                ];
                
                $query = "INSERT INTO system_settings (" . implode(', ', array_keys($defaultSettings)) . ") 
                          VALUES (" . str_repeat('?,', count($defaultSettings) - 1) . "?)";
                $this->db->insert($query, array_values($defaultSettings));
                
                $settings = $defaultSettings;
            }
            
            return [
                'success' => true,
                'data' => $settings
            ];
        } catch (Exception $e) {
            error_log("Get System Settings Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load system settings'
            ];
        }
    }
    
    /**
     * Update system settings
     */
    public function updateSystemSettings($settings) {
        try {
            $allowedFields = [
                'site_name', 'site_description', 'maintenance_mode', 'registration_enabled',
                'max_file_size', 'allowed_file_types', 'ai_generation_limit_free',
                'ai_generation_limit_premium', 'ai_generation_limit_pro',
                'storage_limit_free', 'storage_limit_premium', 'storage_limit_pro',
                'email_notifications', 'analytics_enabled', 'backup_enabled', 'backup_frequency'
            ];
            
            $updateFields = [];
            $params = [];
            
            foreach ($settings as $field => $value) {
                if (in_array($field, $allowedFields)) {
                    $updateFields[] = "$field = ?";
                    $params[] = $value;
                }
            }
            
            if (empty($updateFields)) {
                return [
                    'success' => false,
                    'message' => 'No valid fields to update'
                ];
            }
            
            $updateFields[] = "updated_at = NOW()";
            $params[] = 1; // ID for WHERE clause
            
            $query = "UPDATE system_settings SET " . implode(', ', $updateFields) . " WHERE id = ?";
            $result = $this->db->update($query, $params);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'System settings updated successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update system settings'
                ];
            }
        } catch (Exception $e) {
            error_log("Update System Settings Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update system settings'
            ];
        }
    }
    
    /**
     * Get system analytics
     */
    public function getSystemAnalytics($period = 'month') {
        try {
            $analytics = [];
            
            switch ($period) {
                case 'week':
                    $interval = 'INTERVAL 1 WEEK';
                    break;
                case 'month':
                    $interval = 'INTERVAL 1 MONTH';
                    break;
                case 'year':
                    $interval = 'INTERVAL 1 YEAR';
                    break;
                default:
                    $interval = 'INTERVAL 1 MONTH';
            }
            
            // User registrations
            $query = "SELECT DATE(created_at) as date, COUNT(*) as count 
                      FROM users 
                      WHERE created_at >= DATE_SUB(NOW(), $interval) 
                      GROUP BY DATE(created_at) 
                      ORDER BY date";
            $userRegistrations = $this->db->fetchAll($query);
            $analytics['user_registrations'] = $userRegistrations;
            
            // Project creations
            $query = "SELECT DATE(created_at) as date, COUNT(*) as count 
                      FROM projects 
                      WHERE created_at >= DATE_SUB(NOW(), $interval) 
                      GROUP BY DATE(created_at) 
                      ORDER BY date";
            $projectCreations = $this->db->fetchAll($query);
            $analytics['project_creations'] = $projectCreations;
            
            // AI generations
            $query = "SELECT DATE(created_at) as date, COUNT(*) as count 
                      FROM ai_generations 
                      WHERE created_at >= DATE_SUB(NOW(), $interval) 
                      GROUP BY DATE(created_at) 
                      ORDER BY date";
            $aiGenerations = $this->db->fetchAll($query);
            $analytics['ai_generations'] = $aiGenerations;
            
            // Storage usage
            $query = "SELECT DATE(created_at) as date, SUM(file_size) as total 
                      FROM audio_files 
                      WHERE created_at >= DATE_SUB(NOW(), $interval) 
                      GROUP BY DATE(created_at) 
                      ORDER BY date";
            $storageUsage = $this->db->fetchAll($query);
            $analytics['storage_usage'] = $storageUsage;
            
            // User activity by hour
            $query = "SELECT HOUR(last_login) as hour, COUNT(*) as count 
                      FROM users 
                      WHERE last_login >= DATE_SUB(NOW(), $interval) 
                      GROUP BY HOUR(last_login) 
                      ORDER BY hour";
            $userActivityByHour = $this->db->fetchAll($query);
            $analytics['user_activity_by_hour'] = $userActivityByHour;
            
            // Top users by activity
            $query = "SELECT u.username, 
                             COUNT(p.id) as project_count,
                             COUNT(af.id) as audio_count,
                             COUNT(ag.id) as ai_generation_count
                      FROM users u 
                      LEFT JOIN projects p ON u.id = p.user_id 
                      LEFT JOIN audio_files af ON u.id = af.user_id 
                      LEFT JOIN ai_generations ag ON u.id = ag.user_id 
                      WHERE u.created_at >= DATE_SUB(NOW(), $interval) 
                      GROUP BY u.id 
                      ORDER BY (project_count + audio_count + ai_generation_count) DESC 
                      LIMIT 10";
            $topUsers = $this->db->fetchAll($query);
            $analytics['top_users'] = $topUsers;
            
            return [
                'success' => true,
                'data' => $analytics
            ];
        } catch (Exception $e) {
            error_log("Get System Analytics Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load system analytics'
            ];
        }
    }
    
    /**
     * Get system health status
     */
    private function getSystemHealth() {
        try {
            $health = [
                'database' => 'healthy',
                'storage' => 'healthy',
                'performance' => 'healthy',
                'security' => 'healthy'
            ];
            
            // Check database connection
            try {
                $query = "SELECT 1";
                $this->db->fetch($query);
            } catch (Exception $e) {
                $health['database'] = 'unhealthy';
            }
            
            // Check storage usage
            $query = "SELECT SUM(file_size) as total FROM audio_files";
            $result = $this->db->fetch($query);
            $totalStorage = $result['total'] ?? 0;
            
            if ($totalStorage > 100 * 1024 * 1024 * 1024) { // 100 GB
                $health['storage'] = 'warning';
            }
            
            // Check for suspicious activity
            $query = "SELECT COUNT(*) as total FROM users WHERE failed_login_attempts > 5";
            $result = $this->db->fetch($query);
            $suspiciousUsers = $result['total'] ?? 0;
            
            if ($suspiciousUsers > 10) {
                $health['security'] = 'warning';
            }
            
            return $health;
        } catch (Exception $e) {
            return [
                'database' => 'unknown',
                'storage' => 'unknown',
                'performance' => 'unknown',
                'security' => 'unknown'
            ];
        }
    }
    
    /**
     * Create system backup
     */
    public function createSystemBackup() {
        try {
            $backupDir = 'backups/';
            if (!is_dir($backupDir)) {
                mkdir($backupDir, 0755, true);
            }
            
            $timestamp = date('Y-m-d_H-i-s');
            $backupFile = $backupDir . "backup_$timestamp.sql";
            
            // Export database
            $tables = ['users', 'projects', 'audio_files', 'playlists', 'ai_generations', 'user_settings'];
            $backupContent = '';
            
            foreach ($tables as $table) {
                $query = "SHOW CREATE TABLE $table";
                $result = $this->db->fetch($query);
                $backupContent .= "\n\n" . $result['Create Table'] . ";\n\n";
                
                $query = "SELECT * FROM $table";
                $rows = $this->db->fetchAll($query);
                
                foreach ($rows as $row) {
                    $columns = array_keys($row);
                    $values = array_map(function($value) {
                        return $value === null ? 'NULL' : "'" . addslashes($value) . "'";
                    }, array_values($row));
                    
                    $backupContent .= "INSERT INTO $table (" . implode(', ', $columns) . ") VALUES (" . implode(', ', $values) . ");\n";
                }
            }
            
            if (file_put_contents($backupFile, $backupContent)) {
                return [
                    'success' => true,
                    'data' => [
                        'backup_file' => $backupFile,
                        'size' => filesize($backupFile),
                        'timestamp' => $timestamp
                    ],
                    'message' => 'System backup created successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to create backup file'
                ];
            }
        } catch (Exception $e) {
            error_log("Create System Backup Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to create system backup'
            ];
        }
    }
    
    /**
     * Get system logs
     */
    public function getSystemLogs($page = 1, $limit = 50, $level = '') {
        try {
            $offset = ($page - 1) * $limit;
            
            $whereConditions = ["1=1"];
            $params = [];
            
            if (!empty($level)) {
                $whereConditions[] = "level = ?";
                $params[] = $level;
            }
            
            $whereClause = implode(' AND ', $whereConditions);
            
            // Get total count
            $countQuery = "SELECT COUNT(*) as total FROM system_logs WHERE $whereClause";
            $countResult = $this->db->fetch($countQuery, $params);
            $totalLogs = $countResult['total'];
            
            // Get logs
            $query = "SELECT * FROM system_logs WHERE $whereClause ORDER BY created_at DESC LIMIT ? OFFSET ?";
            $params[] = $limit;
            $params[] = $offset;
            
            $logs = $this->db->fetchAll($query, $params);
            
            return [
                'success' => true,
                'data' => [
                    'logs' => $logs,
                    'pagination' => [
                        'current_page' => $page,
                        'total_pages' => ceil($totalLogs / $limit),
                        'total_logs' => $totalLogs,
                        'per_page' => $limit
                    ]
                ]
            ];
        } catch (Exception $e) {
            error_log("Get System Logs Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load system logs'
            ];
        }
    }
}

// Helper function to get admin panel instance
function admin_panel($adminId) {
    return new AdminPanel($adminId);
}
?>