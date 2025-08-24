<?php
class Database {
    private $host = '127.0.0.1';  // localhost əvəzinə 127.0.0.1 istifadə edin
    private $port = 3306;         // MySQL port
    private $db_name = 'smm_panel';
    private $username = 'root';
    private $password = '';
    private $conn;

    public function getConnection() {
        $this->conn = null;
        try {
            // DSN string-də port və charset göstərin
            $dsn = "mysql:host=" . $this->host . ";port=" . $this->port . ";dbname=" . $this->db_name . ";charset=utf8mb4";
            
            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci"
            ];
            
            $this->conn = new PDO($dsn, $this->username, $this->password, $options);
            
        } catch(PDOException $exception) {
            // Daha detallı xəta məlumatı
            $error_msg = "Database connection failed: " . $exception->getMessage();
            error_log($error_msg);
            
            // Development mühitində xətanı göstərin
            if (defined('DEVELOPMENT_MODE') && DEVELOPMENT_MODE === true) {
                echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
                echo "<h4>Database Connection Error</h4>";
                echo "<p><strong>Error:</strong> " . $exception->getMessage() . "</p>";
                echo "<p><strong>Code:</strong> " . $exception->getCode() . "</p>";
                echo "<p><strong>File:</strong> " . $exception->getFile() . "</p>";
                echo "<p><strong>Line:</strong> " . $exception->getLine() . "</p>";
                echo "<hr>";
                echo "<h5>Connection Details:</h5>";
                echo "<ul>";
                echo "<li><strong>Host:</strong> " . $this->host . "</li>";
                echo "<li><strong>Port:</strong> " . $this->port . "</li>";
                echo "<li><strong>Database:</strong> " . $this->db_name . "</li>";
                echo "<li><strong>Username:</strong> " . $this->username . "</li>";
                echo "</ul>";
                echo "<h5>Quick Fixes:</h5>";
                echo "<ol>";
                echo "<li>MySQL servisinin işlədiyini yoxlayın: <code>sudo systemctl status mysql</code></li>";
                echo "<li>Database-in mövcud olduğunu yoxlayın: <code>mysql -u root -p -e 'SHOW DATABASES;'</code></li>";
                echo "<li>İstifadəçi adı və şifrəni yoxlayın</li>";
                echo "<li>Firewall tənzimləmələrini yoxlayın</li>";
                echo "</ol>";
                echo "</div>";
            } else {
                // Production mühitində sadə xəta mesajı
                echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
                echo "<h4>System Error</h4>";
                echo "<p>Database connection failed. Please contact administrator.</p>";
                echo "</div>";
            }
        }
        return $this->conn;
    }
    
    // Test connection method
    public function testConnection() {
        try {
            $conn = $this->getConnection();
            if ($conn) {
                return [
                    'status' => 'success',
                    'message' => 'Database connection successful',
                    'server_info' => $conn->getAttribute(PDO::ATTR_SERVER_VERSION)
                ];
            }
        } catch (Exception $e) {
            return [
                'status' => 'error',
                'message' => $e->getMessage()
            ];
        }
    }
}
?>