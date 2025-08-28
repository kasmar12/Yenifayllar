#!/bin/bash
# Tikio Premium Bypass - ADB Edition

echo "🚀 Tikio Premium Bypass başlayır..."

# Cihazı yoxla
if ! adb devices | grep -q "device$"; then
    echo "❌ Cihaz qoşulmayıb!"
    echo "Cihazı USB ilə qoşun və USB Debugging aktiv edin"
    exit 1
fi

echo "✅ Cihaz qoşuldu"

# Premium status-u aktiv et
echo "👑 Premium status aktiv edilir..."

adb shell "run-as com.tikio.app mkdir -p shared_prefs"

# Premium status faylı yaradır
adb shell "run-as com.tikio.app echo '<?xml version=\"1.0\" encoding=\"utf-8\"?><map><boolean name=\"is_premium_user\" value=\"true\" /><boolean name=\"subscription_active\" value=\"true\" /><string name=\"expiry_date\">2099-12-31</string></map>' > shared_prefs/premium_status.xml"

# User preferences faylı yaradır
adb shell "run-as com.tikio.app echo '<?xml version=\"1.0\" encoding=\"utf-8\"?><map><boolean name=\"is_premium_user\" value=\"true\" /><boolean name=\"has_active_subscription\" value=\"true\" /><long name=\"subscription_start_date\">1735689600000</long></map>' > shared_prefs/user_preferences.xml"

# Premium config faylı yaradır
adb shell "run-as com.tikio.app echo '<?xml version=\"1.0\" encoding=\"utf-8\"?><map><boolean name=\"premium_enabled\" value=\"true\" /><boolean name=\"subscription_valid\" value=\"true\" /><string name=\"subscription_end_date\">2099-12-31</string></map>' > shared_prefs/premium_config.xml"

echo "✅ Premium status aktiv edildi"

# Tətbiqi yenidən başlat
echo "🔄 Tətbiq yenidən başladılır..."
adb shell "am force-stop com.tikio.app"
sleep 2
adb shell "am start -n com.tikio.app/.MainActivity"

echo "🎉 Bypass tamamlandı!"
echo "İndi premium funksiyaları pulsuz istifadə edə bilərsiniz!"
