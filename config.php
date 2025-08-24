<?php
// SMM Service Configuration
// Change these values to target different services

// API Configuration
$API_KEY = "your_api_key_here"; // Replace with your actual API key
$API_ENDPOINT = "https://api.portmanat.az/order"; // Replace with actual endpoint

// Service Configuration
// Change the SERVICE_ID to target different SMM services
$SERVICE_ID = 123; // Instagram Likes

// Service Names for different IDs (for reference)
$SERVICE_NAMES = [
    123 => "Instagram Beğenileri",
    124 => "Instagram Takipçileri", 
    125 => "Instagram Yorumları",
    126 => "YouTube Beğenileri",
    127 => "YouTube Aboneleri",
    128 => "TikTok Beğenileri",
    129 => "TikTok Takipçileri",
    130 => "Facebook Beğenileri"
];

// Get current service name
$CURRENT_SERVICE_NAME = $SERVICE_NAMES[$SERVICE_ID] ?? "Bilinmeyen Servis";

// Common service IDs for quick reference:
// 123 - Instagram Likes
// 124 - Instagram Followers  
// 125 - Instagram Comments
// 126 - YouTube Likes
// 127 - YouTube Subscribers
// 128 - TikTok Likes
// 129 - TikTok Followers
// 130 - Facebook Likes
?>