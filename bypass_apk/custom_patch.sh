#!/bin/bash
# 🛡️ Google加固 Custom Patch Script
# APK-nı binary level-də patch etmək

APK_FILE="original_apk.apk"
CLEAN_APK="clean_apk.apk"

echo "Google加固 Custom Patch başladıldı..."

# 1. APK-nı extract et
echo "APK extract edilir..."
unzip -q "$APK_FILE" -d temp_extract

# 2. DEX fayllarını patch et
echo "DEX faylları patch edilir..."
cd temp_extract

# ContentProtection bypass
echo "ContentProtection bypass edilir..."
sed -i 's/ContentProtection/ContentProtectionDisabled/g' classes*.dex

# CrashShield bypass  
echo "CrashShield bypass edilir..."
sed -i 's/CrashShield/CrashShieldDisabled/g' classes*.dex

# EncryptUtil bypass
echo "EncryptUtil bypass edilir..."
sed -i 's/EncryptUtil/EncryptUtilDisabled/g' classes*.dex

# Anti-Debug bypass
echo "Anti-Debug bypass edilir..."
sed -i 's/debugger_connected/not_debugger/g' classes*.dex

# Root Detection bypass
echo "Root Detection bypass edilir..."
sed -i 's/\/su/\/not_su/g' classes*.dex
sed -i 's/\/magisk/\/not_magisk/g' classes*.dex

# 3. APK-nı yenidən yarat
echo "Clean APK yaradılır..."
cd ..
zip -r "$CLEAN_APK" temp_extract/*

# 4. Təmizlik
echo "Təmizlik edilir..."
rm -rf temp_extract

echo "✅ Google加固 Custom Patch tamamlandı!"
echo "Clean APK: $CLEAN_APK"
