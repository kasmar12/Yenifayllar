<?php
// Development mode aktiv edin
define('DEVELOPMENT_MODE', true);

echo "<h1>Database Connection Test</h1>";
echo "<hr>";

// Test database connection
require_once 'config/database.php';

$database = new Database();

echo "<h3>Testing Database Connection...</h3>";

try {
    $db = $database->getConnection();
    
    if ($db) {
        echo "<div style='background: #d4edda; border: 1px solid #c3e6cb; color: #155724; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h4>✅ Database Connection Successful!</h4>";
        echo "<p><strong>Message:</strong> Connection established successfully</p>";
        echo "<p><strong>MySQL Version:</strong> " . $db->getAttribute(PDO::ATTR_SERVER_VERSION) . "</p>";
        echo "</div>";
        
        // Test if database exists and has tables
        $query = "SHOW TABLES";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
        
        if (empty($tables)) {
            echo "<div style='background: #fff3cd; border: 1px solid #ffeaa7; color: #856404; padding: 15px; margin: 20px; border-radius: 5px;'>";
            echo "<h4>⚠️ Database is empty</h4>";
            echo "<p>No tables found. Please run the database.sql file to create tables.</p>";
            echo "<code>mysql -u root -p -h 192.168.100.184 -P 3306 smmaz2025 < database.sql</code>";
            echo "</div>";
        } else {
            echo "<div style='background: #d1ecf1; border: 1px solid #bee5eb; color: #0c5460; padding: 15px; margin: 20px; border-radius: 5px;'>";
            echo "<h4>📊 Database Tables Found:</h4>";
            echo "<ul>";
            foreach ($tables as $table) {
                echo "<li>" . htmlspecialchars($table) . "</li>";
            }
            echo "</ul>";
            echo "</div>";
        }
        
    } else {
        echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
        echo "<h4>❌ Database Connection Failed</h4>";
        echo "<p>Connection object is null</p>";
        echo "</div>";
    }
    
} catch (Exception $e) {
    echo "<div style='background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; padding: 15px; margin: 20px; border-radius: 5px;'>";
    echo "<h4>❌ Exception Occurred</h4>";
    echo "<p><strong>Error:</strong> " . $e->getMessage() . "</p>";
    echo "</div>";
}

echo "<hr>";

// System information
echo "<h3>System Information</h3>";
echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";
echo "<ul>";
echo "<li><strong>PHP Version:</strong> " . phpversion() . "</li>";
echo "<li><strong>OS:</strong> " . php_uname() . "</li>";
echo "<li><strong>Server Software:</strong> " . ($_SERVER['SERVER_SOFTWARE'] ?? 'Unknown') . "</li>";
echo "<li><strong>Document Root:</strong> " . ($_SERVER['DOCUMENT_ROOT'] ?? 'Unknown') . "</li>";
echo "<li><strong>Current Directory:</strong> " . getcwd() . "</li>";
echo "</ul>";
echo "</div>";

// Check PHP extensions
echo "<h3>PHP Extensions Check</h3>";
echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";
$required_extensions = ['pdo', 'pdo_mysql', 'curl', 'json'];
echo "<ul>";
foreach ($required_extensions as $ext) {
    if (extension_loaded($ext)) {
        echo "<li>✅ " . $ext . " - Loaded</li>";
    } else {
        echo "<li>❌ " . $ext . " - Not loaded</li>";
    }
}
echo "</ul>";
echo "</div>";

// MySQL connection test with different methods
echo "<h3>MySQL Connection Test (Alternative Methods)</h3>";
echo "<div style='background: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin: 20px; border-radius: 5px;'>";

// Test with mysqli
if (extension_loaded('mysqli')) {
    echo "<h4>Testing with mysqli:</h4>";
    try {
        $mysqli = new mysqli('192.168.100.184', 'root', 'root', 'smmaz2025', 3306);
        if ($mysqli->connect_error) {
            echo "<p>❌ mysqli connection failed: " . $mysqli->connect_error . "</p>";
        } else {
            echo "<p>✅ mysqli connection successful!</p>";
            echo "<p><strong>Server info:</strong> " . $mysqli->server_info . "</p>";
            $mysqli->close();
        }
    } catch (Exception $e) {
        echo "<p>❌ mysqli exception: " . $e->getMessage() . "</p>";
    }
} else {
    echo "<p>❌ mysqli extension not loaded</p>";
}

// Test with mysql command line
echo "<h4>Testing MySQL Command Line:</h4>";
echo "<p>Run this command in terminal:</p>";
echo "<code>mysql -u root -p -h 192.168.100.184 -P 3306 -e 'SELECT VERSION();'</code>";

echo "</div>";

echo "<hr>";
echo "<p><a href='public/index.php'>← Back to main page</a></p>";
?>