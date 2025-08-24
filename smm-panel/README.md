# SMM Panel - Social Media Marketing Panel

Bu layihə Azərbaycan üçün hazırlanmış SMM (Social Media Marketing) panelidir. İstifadəçilər sosial media xidmətlərini sifariş edə, Portmanat.az vasitəsilə ödəniş edə və sifarişlər avtomatik olaraq SMM API-yə göndərilir.

## ✨ Xüsusiyyətlər

- **İstifadəçi qeydiyyatı olmadan** birbaşa sifariş
- **Portmanat.az** ilə təhlükəsiz ödəniş
- **Avtomatik SMM API** inteqrasiyası
- **Admin paneli** xidmətləri idarə etmək üçün
- **Real-time** sifariş statusu
- **Responsive dizayn** bütün cihazlarda

## 🚀 Quraşdırma

### 1. Tələblər

- PHP 7.4 və ya yuxarı
- MySQL 5.7 və ya yuxarı
- Apache/Nginx web server
- cURL extension
- PDO extension

### 2. Faylları yükləyin

```bash
git clone https://github.com/your-username/smm-panel.git
cd smm-panel
```

### 3. Database quraşdırın

```bash
mysql -u root -p < database.sql
```

### 4. Konfiqurasiya

#### Database konfiqurasiyası
`/config/database.php` faylını redaktə edin:

```php
private $host = 'localhost';
private $db_name = 'smm_panel';
private $username = 'your_db_username';
private $password = 'your_db_password';
```

#### Portmanat API konfiqurasiyası
`/config/portmanat_api.php` faylını redaktə edin:

```php
private $merchant_id = 'YOUR_MERCHANT_ID';
private $secret_key = 'YOUR_SECRET_KEY';
```

**Portmanat API məlumatlarını almaq üçün:**
1. [https://partners.portmanat.az](https://partners.portmanat.az) saytına daxil olun
2. Qeydiyyatdan keçin və merchant hesabı yaradın
3. API bölməsindən `merchant_id` və `secret_key` alın
4. Bu məlumatları konfiqurasiya faylında yeniləyin

#### SMM API konfiqurasiyası
`/config/smm_api.php` faylını redaktə edin:

```php
private $api_url = 'https://your-smm-api.com/api';
private $api_key = 'YOUR_SMM_API_KEY';
```

### 5. Web server konfiqurasiyası

#### Apache (.htaccess)
```apache
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php [QSA,L]
```

#### Nginx
```nginx
location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```

### 6. Admin giriş

- URL: `/admin/login.php`
- İstifadəçi adı: `admin`
- Şifrə: `admin123`

**⚠️ Təhlükəsizlik üçün admin şifrəsini dəyişdirin!**

## 📁 Fayl strukturu

```
smm-panel/
├── config/
│   ├── database.php                    # Database konfiqurasiyası
│   ├── portmanat_api.php              # Portmanat API sinifləri
│   ├── portmanat_config_example.php   # Portmanat konfiqurasiya nümunəsi
│   └── smm_api.php                    # SMM API konfiqurasiyası
├── public/
│   ├── index.php                      # Ana səhifə
│   ├── checkout.php                   # Ödəniş səhifəsi
│   ├── callback_portmanat.php        # Portmanat callback
│   └── .htaccess                     # Apache konfiqurasiyası
├── admin/
│   ├── login.php                      # Admin giriş
│   ├── services.php                   # Xidmətlər idarəetməsi
│   ├── orders.php                     # Sifarişlər idarəetməsi
│   ├── payments.php                   # Ödənişlər idarəetməsi
│   ├── settings.php                   # Tənzimləmələr
│   └── logout.php                     # Çıxış
├── logs/
│   └── orders_log.txt                 # Sifariş logları
├── database.sql                       # Database sxemi
└── README.md                          # Bu fayl
```

## 🔧 İstifadə

### 1. Ana səhifə
- İstifadəçilər mövcud xidmətləri görə bilər
- Xidmət seçib link və miqdar daxil edə bilər
- Qiymət avtomatik hesablanır

### 2. Ödəniş prosesi
- Sifariş yaradıldıqdan sonra Portmanat ödəniş səhifəsinə yönləndirilir
- Ödəniş təsdiqləndikdən sonra sifariş avtomatik SMM API-yə göndərilir

### 3. Admin paneli
- Xidmətləri əlavə etmək, redaktə etmək və silmək
- Sifarişləri izləmək
- Ödəniş tarixçəsini görmək
- API tənzimləmələrini idarə etmək
- Portmanat API test etmək

## 🔒 Təhlükəsizlik

- **SQL Injection** qorunması (PDO prepared statements)
- **XSS** qorunması (htmlspecialchars)
- **CSRF** qorunması (session-based)
- **Signature verification** Portmanat callback-lər üçün
- **MD5 hash** imza yoxlaması

## 📊 Database sxemi

### Services table
- `id` - Unikal ID
- `name` - Xidmət adı
- `description` - Xidmət təsviri
- `min_amount` - Minimum miqdar
- `max_amount` - Maksimum miqdar
- `price_per_1k` - 1000 ədəd üçün qiymət
- `api_service_id` - SMM API-də xidmət ID-si

### Orders table
- `id` - Sifariş ID
- `service_id` - Xidmət ID (foreign key)
- `link` - Sosial media linki
- `amount` - Miqdar
- `price` - Ümumi qiymət
- `status` - Sifariş statusu
- `api_order_id` - SMM API-də sifariş ID-si

### Payments table
- `id` - Ödəniş ID
- `transaction_id` - Portmanat transaction ID
- `amount` - Məbləğ
- `status` - Ödəniş statusu

## 🔗 Portmanat API İnteqrasiyası

### API Endpoint-lər
- **Create Payment**: `/api/create-payment`
- **Check Payment**: `/api/check-payment`
- **Payment History**: `/api/payment-history`
- **Balance**: `/api/balance`

### Callback Parametrləri
```json
{
  "payment_id": "12345",
  "order_id": "67890",
  "amount": "25.50",
  "status": "success",
  "sign": "md5_hash_signature"
}
```

### Status Dəyərləri
- `success` - Uğurlu ödəniş
- `failed` - Uğursuz ödəniş
- `pending` - Gözləyən ödəniş
- `cancelled` - Ləğv edilmiş ödəniş
- `expired` - Vaxtı keçmiş ödəniş

## 🚨 Xəta həlli

### Ümumi problemlər

1. **Database bağlantı xətası**
   - Database məlumatlarını yoxlayın
   - MySQL servisinin işlədiyini təsdiqləyin

2. **Portmanat callback xətası**
   - Secret key-in düzgün olduğunu yoxlayın
   - Callback URL-in düzgün olduğunu təsdiqləyin
   - Admin panelində "Portmanat API Test Et" düyməsini basın

3. **SMM API xətası**
   - API URL və key-in düzgün olduğunu yoxlayın
   - API servisinin işlədiyini təsdiqləyin

### Log faylları
Bütün xətalar `/logs/orders_log.txt` faylında qeyd olunur.

## 🔄 Yeniləmələr

### v1.1.0
- Portmanat.az rəsmi API inteqrasiyası
- Təkmilləşdirilmiş callback handler
- Admin panelində API test funksiyası
- Daha yaxşı xəta idarəetməsi

### v1.0.0
- İlk buraxılış
- Əsas funksionallıq
- Admin paneli
- Portmanat inteqrasiyası

## 📞 Dəstək

Əgər hər hansı problem yaranırsa:

1. GitHub Issues bölməsində problem yaradın
2. Log fayllarını yoxlayın
3. Database bağlantısını test edin
4. Admin panelində Portmanat API test edin

## 📄 Lisenziya

Bu layihə MIT lisenziyası altında buraxılıb.

## 🤝 Töhfə

Layihəyə töhfə vermək istəyirsinizsə:

1. Fork edin
2. Feature branch yaradın
3. Commit edin
4. Pull request göndərin

---

**Qeyd:** Bu layihə təhsil məqsədləri üçün hazırlanıb. Production mühitində istifadə etməzdən əvvəl təhlükəsizlik testləri aparın.