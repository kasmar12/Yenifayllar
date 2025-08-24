<?php
// SMM Service Configuration
// Change these values to target different services

// API Configuration
$API_KEY = "your_api_key_here"; // Replace with your actual API key
$API_ENDPOINT = "https://api.portmanat.az/order"; // Replace with actual endpoint

// Payment Configuration
$PAYMENT_ENDPOINT = "https://payment.portmanat.az/pay"; // Portmanat.az payment endpoint
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

// Payment flow:
// 1. User fills form and submits
// 2. System calculates price and stores order in session
// 3. User is redirected to Portmanat.az payment page
// 4. After successful payment, user returns with payment_status=success
// 5. System completes the SMM order using stored session data
?>