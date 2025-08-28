# SSL Pinning Bypass Frida Script

Bu repository Android tətbiqlərində SSL pinning-i bypass etmək üçün Frida scriptlərini ehtiva edir.

## ⚠️ Təhlükə

**Bu script yalnız öz tətbiqlərinizi test etmək üçün istifadə edin!** Başqalarının tətbiqlərini pozmaq qanunsuzdur və hüquqi problemlərə səbəb ola bilər.

## 🚀 Xüsusiyyətlər

- **X509TrustManager Bypass** - SSL sertifikat yoxlamasını bypass edir
- **HostnameVerifier Bypass** - Hostname yoxlamasını bypass edir
- **OkHttp SSL Pinning Bypass** - OkHttp kitabxanasında SSL pinning-i bypass edir
- **Network Security Config Bypass** - Android təhlükəsizlik konfiqurasiyasını bypass edir
- **TrustManagerFactory Bypass** - TrustManager yaradılmasını bypass edir
- **SSLSocketFactory Bypass** - SSL socket yaradılmasını bypass edir

## 📋 Tələblər

- Rootlu Android cihaz
- Frida Server
- NetHunter (seçimli)
- ADB (Android Debug Bridge)

## 🔧 Quraşdırma

### 1. Frida Server Quraşdırma

```bash
# Frida server-i yükləyin
wget https://github.com/frida/frida/releases/latest/download/frida-server-*-android-arm64.xz

# Extract edin
xz -d frida-server-*-android-arm64.xz

# ADB ilə cihaza köçürün
adb push frida-server-*-android-arm64 /data/local/tmp/frida-server

# İcazə verin
adb shell "chmod 755 /data/local/tmp/frida-server"

# Root olun və server-i başladın
adb shell
su
/data/local/tmp/frida-server -t 0
```

### 2. Frida Client Quraşdırma

```bash
# Python ilə Frida client quraşdırın
pip install frida-tools

# Və ya npm ilə
npm install -g frida-tools
```

## 🎯 İstifadə

### Əsas İstifadə

```bash
# Tətbiqi işə salın və scripti yükləyin
frida -U -f com.package.name -l ssl_bypass.js

# Və ya işləyən tətbiqə qoşulun
frida -U -n "Tətbiq Adı" -l ssl_bypass.js
```

### Script Parametrləri

```bash
# -U: USB cihazı
# -f: Tətbiq paket adı
# -l: Script faylı
# -n: Tətbiq adı
# --no-pause: Tətbiqi dayandırmadan
```

## 📱 Test Edilən Tətbiqlər

- Banking tətbiqləri
- Social media tətbiqləri
- E-commerce tətbiqləri
- Gaming tətbiqləri
- Enterprise tətbiqləri

## 🔍 SSL Pinning Növləri

### 1. **Native SSL Pinning**
- `X509TrustManager` implementasiyası
- `SSLContext` konfiqurasiyası
- Custom `TrustManager` yaradılması

### 2. **OkHttp SSL Pinning**
- `CertificatePinner` istifadəsi
- SHA-256 hash yoxlaması
- Public key pinning

### 3. **Network Security Config**
- `network_security_config.xml` faylı
- Certificate transparency
- Cleartext traffic

### 4. **Custom Implementation**
- Native kod (C/C++)
- JNI istifadəsi
- Obfuscated kod

## 🛠️ Troubleshooting

### Problem: "Java.perform is not a function"
**Həll:** Script Java.perform() funksiyasından əvvəl işə düşür. setTimeout() istifadə edin.

### Problem: "Class not found"
**Həll:** Tətbiq həmin sinifi istifadə etmir. Try-catch blokunda saxlayın.

### Problem: "Permission denied"
**Həll:** Root icazəsi lazımdır. `su` əmri ilə root olun.

### Problem: "Device not found"
**Həll:** ADB qoşulmasını yoxlayın: `adb devices`

## 📊 Performance

- **Memory Usage:** ~5-10MB
- **CPU Usage:** Minimal
- **Battery Impact:** Çox az
- **Network Impact:** Yoxdur

## 🔒 Təhlükəsizlik

### Tövsiyə edilən tədbirlər:

1. **Test mühitində** istifadə edin
2. **Production** mühitində istifadə etməyin
3. **VPN** istifadə edin
4. **Firewall** aktivləşdirin
5. **Regular updates** edin

### Qadağan edilən:

1. **Başqalarının tətbiqlərini** pozmaq
2. **Commercial** məqsədlərlə istifadə
3. **Malicious** məqsədlərlə istifadə
4. **Law enforcement** bypass

## 📚 Əlavə Resurslar

- [Frida Documentation](https://frida.re/docs/)
- [Android Security](https://source.android.com/security)
- [SSL Pinning Guide](https://owasp.org/www-community/controls/Certificate_and_Public_Key_Pinning)
- [Mobile Security Testing Guide](https://owasp.org/www-project-mobile-security-testing-guide/)

## 🤝 Töhfə

Bu layihəyə töhfə vermək istəyirsinizsə:

1. Fork edin
2. Feature branch yaradın
3. Commit edin
4. Pull request göndərin

## 📄 Lisenziya

Bu layihə MIT lisenziyası altında yayımlanır. Ətraflı məlumat üçün [LICENSE](LICENSE) faylına baxın.

## ⚡ Sürətli Başlanğıc

```bash
# Repository-ni klonlayın
git clone https://github.com/username/ssl-pinning-bypass.git
cd ssl-pinning-bypass

# Scripti test edin
frida -U -f com.example.app -l ssl_bypass.js
```

## 🆘 Dəstək

Əgər problem yaşayırsınızsa:

1. [Issues](https://github.com/username/ssl-pinning-bypass/issues) bölməsində axtarın
2. Yeni issue yaradın
3. [Discussions](https://github.com/username/ssl-pinning-bypass/discussions) bölməsində sual verin

---

**⚠️ Xatırlatma:** Bu alətlər yalnız təhlükəsizlik tədqiqatları və öz tətbiqlərinizi test etmək üçün istifadə edilməlidir!