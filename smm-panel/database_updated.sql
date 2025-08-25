-- Updated SMM Panel Database Structure
-- Date: 2024-12-01
-- Version: 2.0 (Fixed status columns)

-- Create database
CREATE DATABASE IF NOT EXISTS smm_panel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE smm_panel;

-- Create users table (for admin authentication)
CREATE TABLE IF NOT EXISTS `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(50) NOT NULL UNIQUE,
    `password` varchar(255) NOT NULL,
    `role` enum('admin','user') NOT NULL DEFAULT 'user',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create categories table
CREATE TABLE `categories` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `description` text,
    `status` enum('active','inactive') NOT NULL DEFAULT 'active',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create services table
CREATE TABLE `services` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `category_id` int(11) NOT NULL,
    `api_service_id` int(11) NOT NULL,
    `name` varchar(200) NOT NULL,
    `description` text,
    `price` decimal(10,4) NOT NULL,
    `min_quantity` int(11) NOT NULL DEFAULT 1,
    `max_quantity` int(11) NOT NULL DEFAULT 10000,
    `status` enum('active','inactive') NOT NULL DEFAULT 'active',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `category_id` (`category_id`),
    CONSTRAINT `fk_services_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create orders table
CREATE TABLE `orders` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `order_id` varchar(50) NOT NULL UNIQUE,
    `service_id` int(11) NOT NULL,
    `link` varchar(500) NOT NULL,
    `quantity` int(11) NOT NULL,
    `price` decimal(10,4) NOT NULL,
    `status` enum('pending','processing','completed','cancelled','error') NOT NULL DEFAULT 'pending',
    `smm_order_id` varchar(100),
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `service_id` (`service_id`),
    CONSTRAINT `fk_orders_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create settings table
CREATE TABLE IF NOT EXISTS `settings` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `setting_key` varchar(100) NOT NULL UNIQUE,
    `setting_value` text NOT NULL,
    `description` text,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default admin user (password: admin123)
INSERT IGNORE INTO `users` (`username`, `password`, `role`) VALUES 
('admin', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin');

-- Insert default categories
INSERT INTO `categories` (`name`, `description`, `status`) VALUES 
('Instagram', 'Instagram services including followers, likes, and views', 'active'),
('TikTok', 'TikTok services including followers, likes, and views', 'active'),
('YouTube', 'YouTube services including subscribers, views, and likes', 'active');

-- Insert default services
INSERT INTO `services` (`category_id`, `api_service_id`, `name`, `description`, `price`, `min_quantity`, `max_quantity`, `status`) VALUES 
(1, 1, 'Instagram Followers', 'Real Instagram followers', 2.0000, 100, 10000, 'active'),
(1, 2, 'Instagram Likes', 'Real Instagram likes', 1.0000, 50, 5000, 'active'),
(1, 3, 'Instagram Views', 'Real Instagram views', 0.5000, 100, 10000, 'active'),
(2, 4, 'TikTok Followers', 'Real TikTok followers', 1.5000, 100, 10000, 'active'),
(2, 5, 'TikTok Likes', 'Real TikTok likes', 0.8000, 100, 10000, 'active'),
(3, 6, 'YouTube Subscribers', 'Real YouTube subscribers', 5.0000, 100, 1000, 'active');

-- Insert default settings
INSERT IGNORE INTO `settings` (`setting_key`, `setting_value`, `description`) VALUES 
('smm_api_url', 'https://medyabayim.com/api/v2', 'SMM Panel API URL'),
('smm_api_key', 'your_api_key_here', 'SMM Panel API Key'),
('shrinkme_api_key', '42921b191cac14ebf135b63cb91bbba5a5adebfb', 'ShrinkMe.io API Key');