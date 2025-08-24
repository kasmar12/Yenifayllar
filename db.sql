-- SMM Panel Database Schema
-- Create database and orders table

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS smm_panel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the database
USE smm_panel;

-- Create orders table
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL COMMENT 'Unique order identifier',
  `link` varchar(500) NOT NULL COMMENT 'Link or username for SMM service',
  `quantity` int(11) NOT NULL COMMENT 'Quantity of services ordered',
  `amount` decimal(10,2) NOT NULL COMMENT 'Order amount in AZN',
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending' COMMENT 'Order status',
  `smm_response` text COMMENT 'Response from SMM API',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Order creation timestamp',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SMM Panel Orders Table';

-- Insert sample data for testing (optional)
-- INSERT INTO `orders` (`order_id`, `link`, `quantity`, `amount`, `status`) VALUES 
-- ('TEST001', 'https://instagram.com/testuser', 1000, 25.00, 'pending');