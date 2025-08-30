#!/bin/bash
# 🛡️ Google加固 License Bypass Custom Patch Script
# APK-nı binary level-də patch etmək

APK_FILE="original_apk.apk"
WORKING_APK="working_apk.apk"

echo "Google加固 License Bypass Custom Patch başladıldı..."

# 1. APK-nı extract et
echo "APK extract edilir..."
unzip -q "$APK_FILE" -d temp_extract

# 2. DEX fayllarını patch et
echo "DEX faylları patch edilir..."
cd temp_extract

# Pairip license check bypass
echo "Pairip license check bypass edilir..."
sed -i 's/pairip\/licensecheck/fake\/licensecheck/g' classes*.dex

# LicenseActivity bypass
echo "LicenseActivity bypass edilir..."
sed -i 's/LicenseActivity/FakeLicenseActivity/g' classes*.dex

# LicenseClient bypass
echo "LicenseClient bypass edilir..."
sed -i 's/LicenseClient/FakeLicenseClient/g' classes*.dex

# Google Play Store check bypass
echo "Google Play Store check bypass edilir..."
sed -i 's/Google Play Store/Fake Play Store/g' classes*.dex

# Signature verification bypass
echo "Signature verification bypass edilir..."
sed -i 's/signature/fake_signature/g' classes*.dex

# License check exception bypass
echo "License check exception bypass edilir..."
sed -i 's/LicenseCheckException/FakeLicenseException/g' classes*.dex

# 3. APK-nı yenidən yarat
echo "Working APK yaradılır..."
cd ..
zip -r "$WORKING_APK" temp_extract/*

# 4. Təmizlik
echo "Təmizlik edilir..."
rm -rf temp_extract

echo "✅ Google加固 License Bypass Custom Patch tamamlandı!"
echo "Working APK: $WORKING_APK"
