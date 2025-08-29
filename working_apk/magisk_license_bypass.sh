#!/system/bin/sh
# 🛡️ Google加固 License Bypass Magisk Module
# Pairip license check və Google Play Store yönləndirməsini bypass etmək

MODDIR=${0%/*}
MODID=google_license_bypass

# Module info
echo "Google加固 License Bypass Module"
echo "Pairip license check və Google Play Store yönləndirməsini bypass edir"

# System files patch
if [ -f /system/lib64/libc.so ]; then
    echo "System library patch edilir..."
    # License check bypass
    sed -i 's/license_check/fake_license/g' /system/lib64/libc.so
fi

# App-specific patches
if [ -d /data/app ]; then
    echo "App-specific patches tətbiq edilir..."
    # License check bypass
    find /data/app -name "*.dex" -exec sed -i 's/pairip\/licensecheck/fake\/licensecheck/g' {} \;
    find /data/app -name "*.dex" -exec sed -i 's/LicenseActivity/FakeLicenseActivity/g' {} \;
    find /data/app -name "*.dex" -exec sed -i 's/LicenseClient/FakeLicenseClient/g' {} \;
fi

echo "Google加固 License Bypass tamamlandı!"
