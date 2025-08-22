-- SMM Panel Database Structure
-- Create database
CREATE DATABASE IF NOT EXISTS smm_panel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE smm_panel;

-- Users table (for admin only)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'admin',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Services table
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    api_service_id VARCHAR(100) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
    min_quantity INT NOT NULL DEFAULT 1,
    max_quantity INT NOT NULL DEFAULT 1000000,
    dripfeed BOOLEAN DEFAULT FALSE,
    refill BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50) UNIQUE NOT NULL,
    service_id INT NOT NULL,
    link VARCHAR(500) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,4) NOT NULL,
    total_price DECIMAL(10,4) NOT NULL,
    status ENUM('pending', 'processing', 'completed', 'canceled', 'refunded') DEFAULT 'pending',
    api_order_id VARCHAR(100),
    api_response TEXT,
    user_ip VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);

-- Settings table
CREATE TABLE settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default admin user (password: admin123)
INSERT INTO users (username, password, email, role) VALUES 
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@smmpanel.com', 'admin');

-- Insert default categories
INSERT INTO categories (name, slug, description, sort_order) VALUES 
('Instagram', 'instagram', 'Instagram services including followers, likes, and views', 1),
('TikTok', 'tiktok', 'TikTok services including followers, likes, and views', 2),
('YouTube', 'youtube', 'YouTube services including subscribers and views', 3),
('Twitter', 'twitter', 'Twitter services including followers and likes', 4),
('Facebook', 'facebook', 'Facebook services including page likes and post engagement', 5);

-- Insert default services
INSERT INTO services (category_id, api_service_id, name, description, price, min_quantity, max_quantity) VALUES 
(1, 'instagram_followers', 'Instagram Followers', 'High quality Instagram followers', 0.5000, 100, 100000),
(1, 'instagram_likes', 'Instagram Likes', 'Real Instagram likes for posts', 0.3000, 50, 50000),
(1, 'instagram_views', 'Instagram Views', 'Instagram video views', 0.2000, 100, 100000),
(2, 'tiktok_followers', 'TikTok Followers', 'Real TikTok followers', 0.8000, 100, 50000),
(2, 'tiktok_likes', 'TikTok Likes', 'TikTok video likes', 0.4000, 100, 100000),
(3, 'youtube_subscribers', 'YouTube Subscribers', 'Real YouTube subscribers', 2.5000, 100, 10000),
(3, 'youtube_views', 'YouTube Views', 'YouTube video views', 0.1000, 1000, 1000000);

-- Insert default settings
INSERT INTO settings (setting_key, setting_value, description) VALUES 
('smm_api_url', 'https://medyabayim.com/api/v2', 'SMM Provider API URL'),
('smm_api_key', 'YOUR_SMM_API_KEY', 'SMM Provider API Key'),
('aylive_api_key', '9556ddb32a7c865f06acf4f8950f64c5045ef2ab', 'AY.Live API Key for ad redirects'),
('site_name', 'SMM Panel', 'Website name'),
('site_description', 'Professional SMM Services', 'Website description'),
('currency', 'USD', 'Default currency'),
('timezone', 'UTC', 'Default timezone');

-- Create indexes for better performance
CREATE INDEX idx_orders_order_id ON orders(order_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);
CREATE INDEX idx_services_category_id ON services(category_id);
CREATE INDEX idx_services_api_service_id ON services(api_service_id);
CREATE INDEX idx_categories_slug ON categories(slug);