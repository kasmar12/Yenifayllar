# SMM Sifariş və Ödəniş Sistemi

Bu layihə, SMM (Social Media Marketing) sifarişləri vermək üçün Portmanat.az ödəniş sistemi ilə inteqrasiya edilmiş sadə və mobil uyğun PHP veb səhifəsidir.

## ✨ Əsas Xüsusiyyətlər

- ✅ Mobil uyğun dizayn
- ✅ Form validasiyası
- ✅ Portmanat.az ödəniş sistemi inteqrasiyası
- ✅ Azərbaycan dilində interfeys
- ✅ Asan xidmət dəyişdirmə
- ✅ Təhlükəsiz input sanitizasiyası
- ✅ Real-time qiymət hesablaması
- ✅ Ödəniş uğurlu olduqdan sonra SMM sifarişi tamamlama

## 🔄 İş Axışı

1. **İstifadəçi formu doldurur** və təsdiq edir
2. **Sistem qiyməti hesablayır** və sifarişi sessiyada saxlayır
3. **İstifadəçi Portmanat.az ödəniş səhifəsinə yönləndirilir**
4. **Ödəniş uğurlu olduqdan sonra** istifadəçi geri qayıdır
5. **Sistem SMM sifarişini tamamlayır** və nəticəni göstərir

## 🚀 Quraşdırma

1. Faylları veb serverinizə yükləyin
2. `config.php` faylında API məlumatlarını yeniləyin
3. Veb brauzerinizdə səhifəni açın

## ⚙️ Konfiqurasiya

### API Parametrləri (`config.php`)

```php
$API_KEY = "your_actual_api_key"; // Gerçək API açarınızı buraya yazın
$API_ENDPOINT = "https://api.portmanat.az/order"; // Gerçək API endpoint-inizi yazın
$PAYMENT_ENDPOINT = "https://payment.portmanat.az/pay"; // Ödəniş endpoint-i
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

## 📋 Form Sahələri

- **İstifadəçi Adı**: Mətn daxiletməsi (məcburi)
- **Link**: URL daxiletməsi (məcburi, düzgün URL formatında olmalıdır)
- **Miqdar**: Rəqəm daxiletməsi (məcburi, 0-dan böyük olmalıdır)

## 🔗 API İnteqrasiyası

### Ödəniş Sonrası SMM Sifarişi

Sistem ödəniş uğurlu olduqdan sonra aşağıdakı məlumatları Portmanat.az API-sinə POST sorğusu kimi göndərir:

```json
{
    "service_id": 123,
    "username": "istifadəçi_adı",
    "link": "https://instagram.com/p/...",
    "quantity": 100
}
```

## ❌ Xəta İdarəetməsi

Sistem aşağıdakı xəta vəziyyətlərini idarə edir:

- Boş form sahələri
- Yanlış URL formatı
- Yanlış miqdar dəyəri
- API bağlantı xətaları
- API response xətaları
- Ödəniş xətaları

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

## 🧪 Test

Sistemin düzgün işləməsini yoxlamaq üçün `test.php` faylından istifadə edin:

1. `test.php` səhifəsini açın
2. Konfiqurasiya məlumatlarını yoxlayın
3. Sistem yoxlamalarını görün
4. API bağlantısını test edin

## 🔧 Sorun Həlli

### API Bağlantı Xətası
- API açarınızın düzgün olduğundan əmin olun
- API endpoint URL-ni yoxlayın
- Serverinizin xarici API-lərə giriş icazəsi olduğundan əmin olun

### Ödəniş Xətası
- Portmanat.az ödəniş parametrlərini yoxlayın
- Return və cancel URL-lərini yoxlayın
- API açarının ödəniş sistemi üçün də düzgün olduğundan əmin olun

### Form Göndərilmə Xətası
- PHP xəta loglarını yoxlayın
- Form validasiya mesajlarını oxuyun
- Server parametrlərini yoxlayın

## 📄 Lisenziya

Bu layihə açıq mənbə kodludur və şəxsi və ticarət istifadəsi üçün pulsuzdur.

## 🆘 Dəstək

Hər hansı problem yaşasanız, kod şərhlərini yoxlayın və ya developer ilə əlaqə saxlayın.

## 🔄 Yeniləmələr

### v2.0 - Ödəniş Sistemi Əlavə Edildi
- Portmanat.az ödəniş sistemi inteqrasiyası
- Real-time qiymət hesablaması
- Sessiya idarəetməsi
- Azərbaycan dili dəstəyi
- Təkmilləşdirilmiş təhlükəsizlik