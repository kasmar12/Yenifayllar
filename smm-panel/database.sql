-- SMM Panel Database Schema
-- Create database
CREATE DATABASE IF NOT EXISTS smmaz2025 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE smmaz2025;

-- Services table
CREATE TABLE services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  min_amount INT NOT NULL,
  max_amount INT NOT NULL,
  price_per_1k DECIMAL(10,2) NOT NULL,
  api_service_id VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_id INT NOT NULL,
  link VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) DEFAULT 'pending',
  api_order_id VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);

-- Settings table
CREATE TABLE settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  api_url VARCHAR(255),
  api_key VARCHAR(255),
  secret_key VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Payments table
CREATE TABLE payments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  transaction_id VARCHAR(100),
  amount DECIMAL(10,2),
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample services
INSERT INTO services (name, description, min_amount, max_amount, price_per_1k, api_service_id) VALUES
('Instagram Followers', 'Instagram izləyiciləri əlavə edin', 100, 10000, 2.50, 'ig_followers'),
('Instagram Likes', 'Instagram postlarına bəyənmə', 50, 5000, 1.80, 'ig_likes'),
('TikTok Views', 'TikTok videolarına baxış', 1000, 100000, 0.50, 'tt_views'),
('TikTok Followers', 'TikTok izləyiciləri', 100, 5000, 3.20, 'tt_followers'),
('Telegram Members', 'Telegram qrup üzvləri', 100, 2000, 4.00, 'tg_members'),
('YouTube Views', 'YouTube videolarına baxış', 1000, 50000, 0.80, 'yt_views'),
('YouTube Subscribers', 'YouTube abunəçiləri', 100, 1000, 5.50, 'yt_subs'),
('Facebook Page Likes', 'Facebook səhifə bəyənmələri', 100, 5000, 2.20, 'fb_likes');

-- Insert default settings
INSERT INTO settings (api_url, api_key, secret_key) VALUES
('https://your-smm-api.com/api', 'YOUR_SMM_API_KEY', 'YOUR_SECRET_KEY');

-- Create indexes for better performance
CREATE INDEX idx_orders_service_id ON orders(service_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);
CREATE INDEX idx_payments_transaction_id ON payments(transaction_id);
CREATE INDEX idx_payments_status ON payments(status);