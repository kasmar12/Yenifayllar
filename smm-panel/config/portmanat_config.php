<?php
/**
 * Portmanat API Konfiqurasiyası
 * 
 * Bu faylda Portmanat API məlumatlarını daxil edin
 */

// Portmanat-dan aldığınız merchant ID
define('PORTMANAT_MERCHANT_ID', '195');

// Portmanat-dan aldığınız secret key
define('PORTMANAT_SECRET_KEY', '7708346a');

// Portmanat API URL (dəyişməyin)
define('PORTMANAT_API_URL', 'https://partners.portmanat.az/api');

// Callback URL (sizin domain-iniz)
define('PORTMANAT_CALLBACK_URL', 'http://localhost/smm-panel/public/callback_portmanat.php');

// Return URL (ödənişdən sonra istifadəçini yönləndirmək üçün)
define('PORTMANAT_RETURN_URL', 'http://localhost/smm-panel/public/payment_success.php');

// Development mode (test üçün true edin)
define('DEVELOPMENT_MODE', false);

// Test üçün nümunə məlumatlar (production-da false edin)
if (DEVELOPMENT_MODE === true) {
    // Test məlumatları
    define('PORTMANAT_TEST_MERCHANT_ID', 'test_merchant');
    define('PORTMANAT_TEST_SECRET_KEY', 'test_secret');
    
    // Test üçün echo etməyin
    // echo "<!-- Test Mode Active - Using Test Credentials -->\n";
}
?>