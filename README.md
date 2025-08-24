# SMM Sifariş və Ödəniş Sistemi - Portmanat.az API

Bu layihə, SMM (Social Media Marketing) sifarişləri vermək üçün **Portmanat.az Partners API** ilə tam inteqrasiya edilmiş sadə və mobil uyğun PHP veb səhifəsidir.

## ✨ Əsas Xüsusiyyətlər

- ✅ Mobil uyğun dizayn
- ✅ Form validasiyası
- ✅ **Portmanat.az Partners API** tam inteqrasiyası
- ✅ Azərbaycan dilində interfeys
- ✅ Asan xidmət dəyişdirmə
- ✅ Təhlükəsiz input sanitizasiyası
- ✅ Real-time qiymət hesablaması
- ✅ Ödəniş uğurlu olduqdan sonra SMM sifarişi tamamlama
- ✅ SSL təhlükəsizliyi

## 🔄 İş Axışı

1. **İstifadəçi link və miqdarı daxil edir** və təsdiq edir
2. **Sistem qiyməti hesablayır** və sifarişi sessiyada saxlayır
3. **Portmanat.az API-yə ödəniş sorğusu** göndərilir (`/api/payment`)
4. **İstifadəçi ödəniş səhifəsinə yönləndirilir**
5. **Ödəniş uğurlu olduqdan sonra** istifadəçi geri qayıdır
6. **Sistem SMM sifarişini tamamlayır** (`/api/order`) və nəticəni göstərir

## 🚀 Quraşdırma

1. Faylları veb serverinizə yükləyin
2. `config.php` faylında API məlumatlarını yeniləyin
3. Veb brauzerinizdə səhifəni açın

## ⚙️ Konfiqurasiya

### API Parametrləri (`config.php`)

```php
$API_KEY = "your_actual_api_key"; // Gerçək API açarınızı buraya yazın
$API_ENDPOINT = "https://partners.portmanat.az/api"; // Base API endpoint
$PAYMENT_ENDPOINT = "https://partners.portmanat.az/api/payment"; // Ödəniş endpoint
```

### Ödəniş Parametrləri

```php
$CURRENCY = "AZN"; // Ödəniş valyutası
$PRICE_PER_UNIT = 0.01; // Vahid başına qiymət (AZN)
```

### Xidmət Dəyişdirmə

Fərqli SMM xidməti üçün `config.php` faylında `$SERVICE_ID` dəyərini dəyişdirin:

```php
$SERVICE_ID = 124; // Instagram İzləyiciləri üçün
```

### Mövcud Xidmət ID-ləri

| ID | Xidmət Adı |
|----|------------|
| 123 | Instagram Bəyənmələri |
| 124 | Instagram İzləyiciləri |
| 125 | Instagram Şərhləri |
| 126 | YouTube Bəyənmələri |
| 127 | YouTube Abunəlikləri |
| 128 | TikTok Bəyənmələri |
| 129 | TikTok İzləyiciləri |
| 130 | Facebook Bəyənmələri |

## 🔗 Portmanat.az API Endpoint-ləri

Sistem aşağıdakı API endpoint-lərindən istifadə edir:

| Endpoint | Metod | Təsvir |
|----------|-------|---------|
| `/api/services` | GET | Mövcud xidmətləri almaq |
| `/api/balance` | GET | Hesab balansını almaq |
| `/api/payment` | POST | Ödəniş yaratmaq |
| `/api/order` | POST | Yeni sifariş yaratmaq |
| `/api/order/{id}` | GET | Sifariş statusunu almaq |

## 💰 Qiymət Hesablaması

Sistem avtomatik olaraq qiyməti hesablayır:
- **Vahid qiyməti**: 0.01 AZN (konfiqurasiyada dəyişdirilə bilər)
- **Ümumi qiymət**: Miqdar × Vahid qiyməti
- **Real-time hesablama**: JavaScript ilə dərhal yenilənir

## 📱 Mobil Uyğunluq

- Responsive dizayn
- Touch-friendly düymələr
- iOS zoom qarşısının alınması
- Mobil üçün optimallaşdırılmış padding və font ölçüləri

## 🔒 Təhlükəsizlik Xüsusiyyətləri

- Input sanitizasiyası
- XSS qorunması
- Form validasiyası
- Sessiya idarəetməsi
- API response handling
- SSL təhlükəsizliyi
- Bearer token autentifikasiyası

## 📋 Form Sahələri

- **Link**: URL daxiletməsi (məcburi, düzgün URL formatında olmalıdır)
- **Miqdar**: Rəqəm daxiletməsi (məcburi, 0-dan böyük olmalıdır)

## 🔗 API İnteqrasiyası

### Ödəniş Yaradılması

Sistem ödəniş yaratmaq üçün aşağıdakı məlumatları `/api/payment` endpoint-inə göndərir:

```json
{
    "amount": 1.00,
    "currency": "AZN",
    "description": "Instagram Bəyənmələri - 100 ədəd",
    "return_url": "https://yoursite.com/?payment_status=success",
    "cancel_url": "https://yoursite.com/",
    "order_id": "smm_64f8a1b2c3d4e",
    "service_id": 123,
    "link": "https://instagram.com/p/...",
    "quantity": 100
}
```

### SMM Sifarişi Tamamlama

Ödəniş uğurlu olduqdan sonra sistem aşağıdakı məlumatları `/api/order` endpoint-inə göndərir:

```json
{
    "service_id": 123,
    "link": "https://instagram.com/p/...",
    "quantity": 100,
    "total_price": 1.00
}
```

## ❌ Xəta İdarəetməsi

Sistem aşağıdakı xəta vəziyyətlərini idarə edir:

- Boş form sahələri
- Yanlış URL formatı
- Yanlış miqdar dəyəri
- API bağlantı xətaları
- cURL xətaları
- API response xətaları
- Ödəniş xətaları
- SSL xətaları

## 🎨 Fərdiləşdirmə

### CSS Stilləri

Bütün stillər `index.php` faylının `<style>` bölməsində təyin edilmişdir. Rəngləri, ölçüləri və düzəni asanlıqla dəyişdirə bilərsiniz.

### Mesajlar

Azərbaycan dilində mesajları `index.php` faylında tapa və dəyişdirə bilərsiniz.

### Qiymət Hesablaması

Qiymət hesablamasını `config.php` faylında `$PRICE_PER_UNIT` dəyərini dəyişdirərək yeniləyə bilərsiniz.

## 📋 Tələblər

- PHP 7.0 və ya yuxarı
- cURL extension
- Veb server (Apache, Nginx, və s.)
- Session dəstəyi
- SSL dəstəyi (tövsiyə olunur)

## 🧪 Test

Sistemin düzgün işləməsini yoxlamaq üçün `test.php` faylından istifadə edin:

1. `test.php` səhifəsini açın
2. Konfiqurasiya məlumatlarını yoxlayın
3. Sistem yoxlamalarını görün
4. Portmanat.az API bağlantısını test edin
5. Müxtəlif endpoint-ləri yoxlayın

## 🔧 Sorun Həlli

### API Bağlantı Xətası
- API açarınızın düzgün olduğundan əmin olun
- API endpoint URL-lərini yoxlayın
- Serverinizin xarici API-lərə giriş icazəsi olduğundan əmin olun
- SSL sertifikatlarını yoxlayın

### Ödəniş Xətası
- Portmanat.az API parametrlərini yoxlayın
- Return və cancel URL-lərini yoxlayın
- API açarının ödəniş sistemi üçün də düzgün olduğundan əmin olun
- cURL xətalarını yoxlayın

### Form Göndərilmə Xətası
- PHP xəta loglarını yoxlayın
- Form validasiya mesajlarını oxuyun
- Server parametrlərini yoxlayın
- Session dəstəyini yoxlayın

## 📄 Lisenziya

Bu layihə açıq mənbə kodludur və şəxsi və ticarət istifadəsi üçün pulsuzdur.

## 🆘 Dəstək

Hər hansı problem yaşasanız, kod şərhlərini yoxlayın və ya developer ilə əlaqə saxlayın.

## 🔄 Yeniləmələr

### v2.1 - Portmanat.az API Tam İnteqrasiyası
- Portmanat.az Partners API tam dəstəyi
- Müxtəlif API endpoint-ləri
- Təkmilləşdirilmiş xəta idarəetməsi
- SSL təhlükəsizliyi
- Bearer token autentifikasiyası

### v2.0 - Ödəniş Sistemi Əlavə Edildi
- Portmanat.az ödəniş sistemi inteqrasiyası
- Real-time qiymət hesablaması
- Sessiya idarəetməsi
- Azərbaycan dili dəstəyi
- Təkmilləşdirilmiş təhlükəsizlik

## 📚 Əlavə Məlumat

- **Portmanat.az API Sənədləri**: https://partners.portmanat.az/page/api
- **API Base URL**: https://partners.portmanat.az/api
- **Dəstək**: Portmanat.az dəstək komandası ilə əlaqə saxlayın