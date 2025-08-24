# SMM Sipariş Sistemi

Bu proje, SMM (Social Media Marketing) siparişleri vermek üzere tasarlanmış basit ve mobil uyumlu bir PHP web sayfasıdır.

## Özellikler

- ✅ Mobil uyumlu tasarım
- ✅ Form validasyonu
- ✅ Portmanat.az API entegrasyonu
- ✅ Türkçe arayüz
- ✅ Kolay servis değiştirme
- ✅ Güvenli input sanitization

## Kurulum

1. Dosyaları web sunucunuza yükleyin
2. `config.php` dosyasındaki API bilgilerini güncelleyin
3. Web tarayıcınızda sayfayı açın

## Konfigürasyon

### API Ayarları (`config.php`)

```php
$API_KEY = "your_actual_api_key"; // Gerçek API anahtarınızı buraya yazın
$API_ENDPOINT = "https://api.portmanat.az/order"; // Gerçek API endpoint'inizi yazın
```

### Servis Değiştirme

Farklı bir SMM servisi için `config.php` dosyasındaki `$SERVICE_ID` değerini değiştirin:

```php
$SERVICE_ID = 124; // Instagram Takipçileri için
```

### Mevcut Servis ID'leri

| ID | Servis Adı |
|----|------------|
| 123 | Instagram Beğenileri |
| 124 | Instagram Takipçileri |
| 125 | Instagram Yorumları |
| 126 | YouTube Beğenileri |
| 127 | YouTube Aboneleri |
| 128 | TikTok Beğenileri |
| 129 | TikTok Takipçileri |
| 130 | Facebook Beğenileri |

## Kullanım

1. Kullanıcı adını girin
2. Hedef linki girin (örn: https://instagram.com/p/...)
3. Miktarı belirtin
4. "Sipariş Ver" butonuna tıklayın

## Form Alanları

- **Kullanıcı Adı**: Metin girişi (zorunlu)
- **Link**: URL girişi (zorunlu, geçerli URL formatında olmalı)
- **Miktar**: Sayı girişi (zorunlu, 0'dan büyük olmalı)

## API Entegrasyonu

Sistem, form gönderildiğinde aşağıdaki verileri Portmanat.az API'sine POST isteği olarak gönderir:

```json
{
    "service_id": 123,
    "username": "kullanici_adi",
    "link": "https://instagram.com/p/...",
    "quantity": 100
}
```

## Güvenlik Özellikleri

- Input sanitization
- XSS koruması
- Form validasyonu
- API response handling

## Mobil Uyumluluk

- Responsive tasarım
- Touch-friendly butonlar
- iOS zoom önleme
- Mobil optimize edilmiş padding ve font boyutları

## Hata Yönetimi

Sistem aşağıdaki hata durumlarını yönetir:

- Boş form alanları
- Geçersiz URL formatı
- Geçersiz miktar değeri
- API bağlantı hataları
- API response hataları

## Özelleştirme

### CSS Stilleri

Tüm stiller `index.php` dosyasının `<style>` bölümünde tanımlanmıştır. Renkleri, boyutları ve düzeni kolayca değiştirebilirsiniz.

### Mesajlar

Türkçe mesajları `index.php` dosyasında bulabilir ve değiştirebilirsiniz.

## Gereksinimler

- PHP 7.0 veya üzeri
- cURL extension
- Web sunucusu (Apache, Nginx, vb.)

## Sorun Giderme

### API Bağlantı Hatası
- API anahtarınızın doğru olduğundan emin olun
- API endpoint URL'sini kontrol edin
- Sunucunuzun dış API'lere erişim izni olduğundan emin olun

### Form Gönderim Hatası
- PHP hata loglarını kontrol edin
- Form validasyon mesajlarını okuyun
- Sunucu ayarlarını kontrol edin

## Lisans

Bu proje açık kaynak kodludur ve kişisel ve ticari kullanım için serbesttir.

## Destek

Herhangi bir sorun yaşarsanız, kod yorumlarını kontrol edin veya geliştirici ile iletişime geçin.