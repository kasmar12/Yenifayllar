<?php
/**
 * Portmanat API Konfiqurasiya Nümunəsi
 * 
 * Bu faylı kopyalayıb portmanat_config.php adı ilə yenidən adlandırın
 * və öz məlumatlarınızı daxil edin
 */

// Portmanat-dan aldığınız merchant ID
define('PORTMANAT_MERCHANT_ID', 'YOUR_MERCHANT_ID');

// Portmanat-dan aldığınız secret key
define('PORTMANAT_SECRET_KEY', 'YOUR_SECRET_KEY');

// Portmanat API URL (dəyişməyin)
define('PORTMANAT_API_URL', 'https://partners.portmanat.az/api');

// Callback URL (sizin domain-iniz)
define('PORTMANAT_CALLBACK_URL', 'https://yourdomain.com/callback_portmanat.php');

// Return URL (ödənişdən sonra istifadəçini yönləndirmək üçün)
define('PORTMANAT_RETURN_URL', 'https://yourdomain.com/payment_success.php');

/**
 * Portmanat API İstifadə Təlimatları:
 * 
 * 1. https://partners.portmanat.az saytına daxil olun
 * 2. Qeydiyyatdan keçin və merchant hesabı yaradın
 * 3. API bölməsindən merchant_id və secret_key alın
 * 4. Bu faylda yuxarıdakı məlumatları yeniləyin
 * 5. Faylı portmanat_config.php adı ilə saxlayın
 * 
 * API Endpoint-lər:
 * - /create-payment - Ödəniş yaratmaq
 * - /check-payment - Ödəniş statusunu yoxlamaq
 * - /payment-history - Ödəniş tarixçəsi
 * - /balance - Balans məlumatı
 * 
 * Callback Parametrləri:
 * - payment_id - Ödəniş ID
 * - order_id - Sifariş ID
 * - amount - Məbləğ
 * - status - Status (success, failed, pending)
 * - sign - İmza (verifikasiya üçün)
 * 
 * Status Dəyərləri:
 * - success - Uğurlu ödəniş
 * - failed - Uğursuz ödəniş
 * - pending - Gözləyən ödəniş
 * - cancelled - Ləğv edilmiş ödəniş
 * - expired - Vaxtı keçmiş ödəniş
 */

// Test üçün nümunə məlumatlar (production-da silin)
if (defined('DEVELOPMENT_MODE') && DEVELOPMENT_MODE === true) {
    // Test məlumatları
    define('PORTMANAT_TEST_MERCHANT_ID', 'test_merchant');
    define('PORTMANAT_TEST_SECRET_KEY', 'test_secret');
    
    echo "<!-- Test Mode Active - Using Test Credentials -->\n";
}
?>