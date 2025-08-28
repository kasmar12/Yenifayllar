<?php
require_once 'config.php';
require_once 'database.php';

/**
 * User Dashboard System
 * Professional Project Management
 * 100% Original - Studio Quality
 */
class UserDashboard {
    private $db;
    private $userId;
    
    public function __construct($userId) {
        $this->db = Database::getInstance();
        $this->userId = $userId;
    }
    
    /**
     * Get user dashboard overview
     */
    public function getDashboardOverview() {
        try {
            $stats = $this->getUserStats();
            $recentProjects = $this->getRecentProjects(5);
            $recentCreations = $this->getRecentCreations(5);
            $storageUsage = $this->getStorageUsage();
            
            return [
                'success' => true,
                'data' => [
                    'stats' => $stats,
                    'recent_projects' => $recentProjects,
                    'recent_creations' => $recentCreations,
                    'storage_usage' => $storageUsage
                ]
            ];
        } catch (Exception $e) {
            error_log("Dashboard Overview Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load dashboard overview'
            ];
        }
    }
    
    /**
     * Get user statistics
     */
    private function getUserStats() {
        $stats = [];
        
        // Total projects
        $query = "SELECT COUNT(*) as total FROM projects WHERE user_id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['total_projects'] = $result['total'] ?? 0;
        
        // Total audio files
        $query = "SELECT COUNT(*) as total FROM audio_files WHERE user_id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['total_audio_files'] = $result['total'] ?? 0;
        
        // Total playlists
        $query = "SELECT COUNT(*) as total FROM playlists WHERE user_id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['total_playlists'] = $result['total'] ?? 0;
        
        // AI generations this month
        $query = "SELECT COUNT(*) as total FROM ai_generations 
                  WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['ai_generations_this_month'] = $result['total'] ?? 0;
        
        // Total AI generations
        $query = "SELECT COUNT(*) as total FROM ai_generations WHERE user_id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['total_ai_generations'] = $result['total'] ?? 0;
        
        // Credits remaining
        $query = "SELECT credits FROM users WHERE id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['credits_remaining'] = $result['credits'] ?? 0;
        
        // Subscription status
        $query = "SELECT subscription_type, subscription_expires FROM users WHERE id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        $stats['subscription_type'] = $result['subscription_type'] ?? 'free';
        $stats['subscription_expires'] = $result['subscription_expires'] ?? null;
        
        return $stats;
    }
    
    /**
     * Get recent projects
     */
    private function getRecentProjects($limit = 5) {
        $query = "SELECT p.*, COUNT(af.id) as audio_count 
                  FROM projects p 
                  LEFT JOIN audio_files af ON p.id = af.project_id 
                  WHERE p.user_id = ? 
                  GROUP BY p.id 
                  ORDER BY p.updated_at DESC 
                  LIMIT ?";
        
        return $this->db->fetchAll($query, [$this->userId, $limit]);
    }
    
    /**
     * Get recent creations
     */
    private function getRecentCreations($limit = 5) {
        $query = "SELECT af.*, p.title as project_title 
                  FROM audio_files af 
                  LEFT JOIN projects p ON af.project_id = p.id 
                  WHERE af.user_id = ? 
                  ORDER BY af.created_at DESC 
                  LIMIT ?";
        
        return $this->db->fetchAll($query, [$this->userId, $limit]);
    }
    
    /**
     * Get storage usage
     */
    private function getStorageUsage() {
        $query = "SELECT SUM(file_size) as total_size FROM audio_files WHERE user_id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        
        $totalSize = $result['total_size'] ?? 0;
        $maxStorage = $this->getMaxStorage();
        
        return [
            'used' => $totalSize,
            'max' => $maxStorage,
            'percentage' => $maxStorage > 0 ? ($totalSize / $maxStorage) * 100 : 0,
            'formatted_used' => $this->formatBytes($totalSize),
            'formatted_max' => $this->formatBytes($maxStorage)
        ];
    }
    
    /**
     * Get maximum storage based on subscription
     */
    private function getMaxStorage() {
        $query = "SELECT subscription_type FROM users WHERE id = ?";
        $result = $this->db->fetch($query, [$this->userId]);
        
        $subscriptionType = $result['subscription_type'] ?? 'free';
        
        switch ($subscriptionType) {
            case 'free':
                return 100 * 1024 * 1024; // 100 MB
            case 'premium':
                return 1 * 1024 * 1024 * 1024; // 1 GB
            case 'pro':
                return 10 * 1024 * 1024 * 1024; // 10 GB
            case 'enterprise':
                return 100 * 1024 * 1024 * 1024; // 100 GB
            default:
                return 100 * 1024 * 1024; // 100 MB
        }
    }
    
    /**
     * Get user projects with pagination
     */
    public function getUserProjects($page = 1, $limit = 10, $search = '', $filter = '') {
        try {
            $offset = ($page - 1) * $limit;
            
            $whereConditions = ["p.user_id = ?"];
            $params = [$this->userId];
            
            if (!empty($search)) {
                $whereConditions[] = "(p.title LIKE ? OR p.description LIKE ?)";
                $params[] = "%$search%";
                $params[] = "%$search%";
            }
            
            if (!empty($filter)) {
                switch ($filter) {
                    case 'recent':
                        $whereConditions[] = "p.updated_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)";
                        break;
                    case 'favorites':
                        $whereConditions[] = "p.is_favorite = 1";
                        break;
                    case 'completed':
                        $whereConditions[] = "p.status = 'completed'";
                        break;
                    case 'draft':
                        $whereConditions[] = "p.status = 'draft'";
                        break;
                }
            }
            
            $whereClause = implode(' AND ', $whereConditions);
            
            // Get total count
            $countQuery = "SELECT COUNT(*) as total FROM projects p WHERE $whereClause";
            $countResult = $this->db->fetch($countQuery, $params);
            $totalProjects = $countResult['total'];
            
            // Get projects
            $query = "SELECT p.*, 
                             COUNT(af.id) as audio_count,
                             SUM(af.file_size) as total_size
                      FROM projects p 
                      LEFT JOIN audio_files af ON p.id = af.project_id 
                      WHERE $whereClause 
                      GROUP BY p.id 
                      ORDER BY p.updated_at DESC 
                      LIMIT ? OFFSET ?";
            
            $params[] = $limit;
            $params[] = $offset;
            
            $projects = $this->db->fetchAll($query, $params);
            
            return [
                'success' => true,
                'data' => [
                    'projects' => $projects,
                    'pagination' => [
                        'current_page' => $page,
                        'total_pages' => ceil($totalProjects / $limit),
                        'total_projects' => $totalProjects,
                        'per_page' => $limit
                    ]
                ]
            ];
        } catch (Exception $e) {
            error_log("Get User Projects Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load projects'
            ];
        }
    }
    
    /**
     * Get project details
     */
    public function getProjectDetails($projectId) {
        try {
            // Get project info
            $query = "SELECT * FROM projects WHERE id = ? AND user_id = ?";
            $project = $this->db->fetch($query, [$projectId, $this->userId]);
            
            if (!$project) {
                return [
                    'success' => false,
                    'message' => 'Project not found'
                ];
            }
            
            // Get project audio files
            $query = "SELECT * FROM audio_files WHERE project_id = ? ORDER BY created_at ASC";
            $audioFiles = $this->db->fetchAll($query, [$projectId]);
            
            // Get project playlists
            $query = "SELECT p.* FROM playlists p 
                      INNER JOIN playlist_projects pp ON p.id = pp.playlist_id 
                      WHERE pp.project_id = ?";
            $playlists = $this->db->fetchAll($query, [$projectId]);
            
            return [
                'success' => true,
                'data' => [
                    'project' => $project,
                    'audio_files' => $audioFiles,
                    'playlists' => $playlists
                ]
            ];
        } catch (Exception $e) {
            error_log("Get Project Details Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load project details'
            ];
        }
    }
    
    /**
     * Create new project
     */
    public function createProject($title, $description = '', $genre = '', $tempo = 120, $key = 'C') {
        try {
            $query = "INSERT INTO projects (user_id, title, description, genre, tempo, key, status, created_at, updated_at) 
                      VALUES (?, ?, ?, ?, ?, ?, 'draft', NOW(), NOW())";
            
            $projectId = $this->db->insert($query, [
                $this->userId, $title, $description, $genre, $tempo, $key
            ]);
            
            if ($projectId) {
                return [
                    'success' => true,
                    'data' => [
                        'project_id' => $projectId,
                        'message' => 'Project created successfully'
                    ]
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to create project'
                ];
            }
        } catch (Exception $e) {
            error_log("Create Project Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to create project'
            ];
        }
    }
    
    /**
     * Update project
     */
    public function updateProject($projectId, $data) {
        try {
            $allowedFields = ['title', 'description', 'genre', 'tempo', 'key', 'status', 'is_favorite'];
            $updateFields = [];
            $params = [];
            
            foreach ($data as $field => $value) {
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
            $params[] = $projectId;
            $params[] = $this->userId;
            
            $query = "UPDATE projects SET " . implode(', ', $updateFields) . " WHERE id = ? AND user_id = ?";
            $result = $this->db->update($query, $params);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'Project updated successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update project'
                ];
            }
        } catch (Exception $e) {
            error_log("Update Project Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update project'
            ];
        }
    }
    
    /**
     * Delete project
     */
    public function deleteProject($projectId) {
        try {
            // Check if project belongs to user
            $query = "SELECT id FROM projects WHERE id = ? AND user_id = ?";
            $project = $this->db->fetch($query, [$projectId, $this->userId]);
            
            if (!$project) {
                return [
                    'success' => false,
                    'message' => 'Project not found'
                ];
            }
            
            // Delete project (cascade will handle related records)
            $query = "DELETE FROM projects WHERE id = ? AND user_id = ?";
            $result = $this->db->delete($query, [$projectId, $this->userId]);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'Project deleted successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to delete project'
                ];
            }
        } catch (Exception $e) {
            error_log("Delete Project Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to delete project'
            ];
        }
    }
    
    /**
     * Get user playlists
     */
    public function getUserPlaylists($page = 1, $limit = 10) {
        try {
            $offset = ($page - 1) * $limit;
            
            // Get total count
            $countQuery = "SELECT COUNT(*) as total FROM playlists WHERE user_id = ?";
            $countResult = $this->db->fetch($countQuery, [$this->userId]);
            $totalPlaylists = $countResult['total'];
            
            // Get playlists
            $query = "SELECT p.*, 
                             COUNT(pp.project_id) as project_count
                      FROM playlists p 
                      LEFT JOIN playlist_projects pp ON p.id = pp.playlist_id 
                      WHERE p.user_id = ? 
                      GROUP BY p.id 
                      ORDER BY p.updated_at DESC 
                      LIMIT ? OFFSET ?";
            
            $playlists = $this->db->fetchAll($query, [$this->userId, $limit, $offset]);
            
            return [
                'success' => true,
                'data' => [
                    'playlists' => $playlists,
                    'pagination' => [
                        'current_page' => $page,
                        'total_pages' => ceil($totalPlaylists / $limit),
                        'total_playlists' => $totalPlaylists,
                        'per_page' => $limit
                    ]
                ]
            ];
        } catch (Exception $e) {
            error_log("Get User Playlists Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load playlists'
            ];
        }
    }
    
    /**
     * Create playlist
     */
    public function createPlaylist($name, $description = '') {
        try {
            $query = "INSERT INTO playlists (user_id, name, description, created_at, updated_at) 
                      VALUES (?, ?, ?, NOW(), NOW())";
            
            $playlistId = $this->db->insert($query, [$this->userId, $name, $description]);
            
            if ($playlistId) {
                return [
                    'success' => true,
                    'data' => [
                        'playlist_id' => $playlistId,
                        'message' => 'Playlist created successfully'
                    ]
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to create playlist'
                ];
            }
        } catch (Exception $e) {
            error_log("Create Playlist Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to create playlist'
            ];
        }
    }
    
    /**
     * Add project to playlist
     */
    public function addProjectToPlaylist($playlistId, $projectId) {
        try {
            // Check if playlist belongs to user
            $query = "SELECT id FROM playlists WHERE id = ? AND user_id = ?";
            $playlist = $this->db->fetch($query, [$playlistId, $this->userId]);
            
            if (!$playlist) {
                return [
                    'success' => false,
                    'message' => 'Playlist not found'
                ];
            }
            
            // Check if project is already in playlist
            $query = "SELECT id FROM playlist_projects WHERE playlist_id = ? AND project_id = ?";
            $existing = $this->db->fetch($query, [$playlistId, $projectId]);
            
            if ($existing) {
                return [
                    'success' => false,
                    'message' => 'Project already in playlist'
                ];
            }
            
            // Add project to playlist
            $query = "INSERT INTO playlist_projects (playlist_id, project_id, added_at) VALUES (?, ?, NOW())";
            $result = $this->db->insert($query, [$playlistId, $projectId]);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'Project added to playlist successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to add project to playlist'
                ];
            }
        } catch (Exception $e) {
            error_log("Add Project to Playlist Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to add project to playlist'
            ];
        }
    }
    
    /**
     * Get user analytics
     */
    public function getUserAnalytics($period = 'month') {
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
            
            // Projects created
            $query = "SELECT COUNT(*) as total FROM projects 
                      WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), $interval)";
            $result = $this->db->fetch($query, [$this->userId]);
            $analytics['projects_created'] = $result['total'] ?? 0;
            
            // Audio files created
            $query = "SELECT COUNT(*) as total FROM audio_files 
                      WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), $interval)";
            $result = $this->db->fetch($query, [$this->userId]);
            $analytics['audio_files_created'] = $result['total'] ?? 0;
            
            // AI generations
            $query = "SELECT COUNT(*) as total FROM ai_generations 
                      WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), $interval)";
            $result = $this->db->fetch($query, [$this->userId]);
            $analytics['ai_generations'] = $result['total'] ?? 0;
            
            // Storage used
            $query = "SELECT SUM(file_size) as total FROM audio_files 
                      WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), $interval)";
            $result = $this->db->fetch($query, [$this->userId]);
            $analytics['storage_used'] = $result['total'] ?? 0;
            
            // Daily activity (last 7 days)
            $query = "SELECT DATE(created_at) as date, COUNT(*) as count 
                      FROM (
                          SELECT created_at FROM projects WHERE user_id = ? 
                          UNION ALL 
                          SELECT created_at FROM audio_files WHERE user_id = ? 
                          UNION ALL 
                          SELECT created_at FROM ai_generations WHERE user_id = ?
                      ) activity 
                      WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                      GROUP BY DATE(created_at) 
                      ORDER BY date";
            
            $dailyActivity = $this->db->fetchAll($query, [$this->userId, $this->userId, $this->userId]);
            $analytics['daily_activity'] = $dailyActivity;
            
            return [
                'success' => true,
                'data' => $analytics
            ];
        } catch (Exception $e) {
            error_log("Get User Analytics Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load analytics'
            ];
        }
    }
    
    /**
     * Get user settings
     */
    public function getUserSettings() {
        try {
            $query = "SELECT * FROM user_settings WHERE user_id = ?";
            $settings = $this->db->fetch($query, [$this->userId]);
            
            if (!$settings) {
                // Create default settings
                $defaultSettings = [
                    'user_id' => $this->userId,
                    'theme' => 'dark',
                    'language' => 'en',
                    'notifications' => 1,
                    'auto_save' => 1,
                    'default_tempo' => 120,
                    'default_key' => 'C',
                    'default_time_signature' => '4/4',
                    'audio_quality' => 'high',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s')
                ];
                
                $query = "INSERT INTO user_settings (" . implode(', ', array_keys($defaultSettings)) . ") 
                          VALUES (" . str_repeat('?,', count($defaultSettings) - 1) . "?)";
                $this->db->insert($query, array_values($defaultSettings));
                
                $settings = $defaultSettings;
            }
            
            return [
                'success' => true,
                'data' => $settings
            ];
        } catch (Exception $e) {
            error_log("Get User Settings Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to load user settings'
            ];
        }
    }
    
    /**
     * Update user settings
     */
    public function updateUserSettings($settings) {
        try {
            $allowedFields = [
                'theme', 'language', 'notifications', 'auto_save', 
                'default_tempo', 'default_key', 'default_time_signature', 'audio_quality'
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
            $params[] = $this->userId;
            
            $query = "UPDATE user_settings SET " . implode(', ', $updateFields) . " WHERE user_id = ?";
            $result = $this->db->update($query, $params);
            
            if ($result) {
                return [
                    'success' => true,
                    'message' => 'Settings updated successfully'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Failed to update settings'
                ];
            }
        } catch (Exception $e) {
            error_log("Update User Settings Error: " . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to update settings'
            ];
        }
    }
    
    /**
     * Format bytes to human readable format
     */
    private function formatBytes($bytes, $precision = 2) {
        $units = ['B', 'KB', 'MB', 'GB', 'TB'];
        
        for ($i = 0; $bytes > 1024 && $i < count($units) - 1; $i++) {
            $bytes /= 1024;
        }
        
        return round($bytes, $precision) . ' ' . $units[$i];
    }
}

// Helper function to get user dashboard instance
function user_dashboard($userId) {
    return new UserDashboard($userId);
}
?>