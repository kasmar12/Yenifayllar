# 🚀 TİKİO PREMIUM BYPASS - INSTALLATION GUIDE

## 📱 **Tələblər**
- Android cihaz (5.1+)
- USB kabel
- USB Debugging aktiv
- ADB quraşdırılıb

## 🔧 **Addım 1: Cihazı Hazırla**
1. **Settings** → **About Phone** → **Build Number** (7 dəfə bas)
2. **Developer Options** → **USB Debugging** ✅
3. Cihazı USB ilə qoş
4. "Allow USB Debugging" ✅

## 🚀 **Addım 2: Bypass Tətbiq Et**
```bash
# Script-i işə sal
./adb_bypass.sh
```

## 🎯 **Addım 3: Frida Bypass (Əlavə)**
```bash
# Frida server-i başlat
adb push frida-server-16.1.4-android-arm64 /data/local/tmp/
adb shell "chmod +x /data/local/tmp/frida-server-16.1.4-android-arm64"
adb shell "/data/local/tmp/frida-server-16.1.4-android-arm64 &"

# Bypass script-i işə sal
frida -U -l tikio_bypass.js -f com.tikio.app
```

## ✅ **Uğurlu Bypass Göstəriciləri**
- Premium badge görünəcək
- Bütün premium funksiyalar açıq olacaq
- "Active Subscription" mesajı görünəcək
- Reklamlar görünməyəcək

## 🔒 **Təhlükəsizlik**
- Yalnız test məqsədilədir
- Real tətbiqdə istifadə etməyin
- Hesab ban ola bilər
