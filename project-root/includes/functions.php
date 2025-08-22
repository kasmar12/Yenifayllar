<?php
/**
 * Common utility functions
 */

/**
 * Sanitize input data
 * @param string $data Input data
 * @return string Sanitized data
 */
function sanitizeInput($data) {
    return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
}

/**
 * Format service name for display
 * @param string $serviceId Service ID
 * @return string Formatted service name
 */
function formatServiceName($serviceId) {
    return ucwords(str_replace(['_', '-'], ' ', $serviceId));
}

/**
 * Get service category from service ID
 * @param string $serviceId Service ID
 * @return string Category name
 */
function getServiceCategory($serviceId) {
    $parts = explode('_', $serviceId);
    return ucfirst($parts[0] ?? 'Unknown');
}
?>