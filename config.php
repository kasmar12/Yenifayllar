<?php
// Portmanat.az API Configuration
// Based on official API documentation: https://partners.portmanat.az/page/api

// API Configuration
$API_KEY = "your_api_key_here"; // Replace with your actual API key
$API_ENDPOINT = "https://partners.portmanat.az/api"; // Base API endpoint

// Payment Configuration
$PAYMENT_ENDPOINT = "https://partners.portmanat.az/api/payment"; // Payment endpoint
$CURRENCY = "AZN"; // Currency for payments
$PRICE_PER_UNIT = 0.01; // Price per unit in AZN

// Service Configuration
// Change the SERVICE_ID to target different SMM services
$SERVICE_ID = 123; // Instagram Likes

// Service Names for different IDs (for reference)
$SERVICE_NAMES = [
    123 => "Instagram Bəyənmələri",
    124 => "Instagram İzləyiciləri", 
    125 => "Instagram Şərhləri",
    126 => "YouTube Bəyənmələri",
    127 => "YouTube Abunəlikləri",
    128 => "TikTok Bəyənmələri",
    129 => "TikTok İzləyiciləri",
    130 => "Facebook Bəyənmələri"
];

// Get current service name
$CURRENT_SERVICE_NAME = $SERVICE_NAMES[$SERVICE_ID] ?? "Bilinməyən Xidmət";

// Common service IDs for quick reference:
// 123 - Instagram Likes
// 124 - Instagram Followers  
// 125 - Instagram Comments
// 126 - YouTube Likes
// 127 - YouTube Subscribers
// 128 - TikTok Likes
// 129 - TikTok Followers
// 130 - Facebook Likes

// API Endpoints based on documentation:
// - POST /api/order - Create new order
// - GET /api/order/{id} - Get order status
// - POST /api/payment - Create payment
// - GET /api/services - Get available services
// - GET /api/balance - Get account balance

// Possible redirect URL fields from API response:
// - payment_url - Main payment redirect URL
// - redirect_url - Alternative redirect URL
// - url - Generic redirect URL
// - checkout_url - Checkout page URL
// - payment_page - Payment page URL

// Payment flow:
// 1. User fills form with link and quantity
// 2. System creates payment via /api/payment
// 3. User is redirected to payment page
// 4. After successful payment, user returns with payment_status=success
// 5. System completes the SMM order using /api/order
?>