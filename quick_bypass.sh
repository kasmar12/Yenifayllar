#!/bin/bash
# Quick bypass ADB commands

echo "🚀 Quick bypass başladıldı..."

# Premium status yarat
adb shell "run-as com.tikio.app mkdir -p /data/data/com.tikio.app/shared_prefs/"

echo '<?xml version="1.0" encoding="utf-8" standalone="yes" ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
</map>' > /tmp/premium_status.xml

adb push /tmp/premium_status.xml /sdcard/
adb shell "run-as com.tikio.app cp /sdcard/premium_status.xml /data/data/com.tikio.app/shared_prefs/premium_status.xml"

echo "✅ Premium status yaradıldı!"
echo "📱 Tətbiqi yenidən başladın"
