# Tikio Premium Bypass ADB Commands
# Bu əmrlər premium status-u bypass edir

# 1. Root access əldə etmək (əgər mümkünsə)
adb root
adb shell

# 2. Tətbiq data-ya giriş
run-as com.tikio.app

# 3. SharedPreferences patch
echo '<?xml version="1.0" encoding="utf-8" standalone="yes" ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
</map>' > /data/data/com.tikio.app/shared_prefs/premium_status.xml

# 4. Database patch (əgər mövcudsa)
sqlite3 /data/data/com.tikio.app/databases/user_data.db
UPDATE users SET is_premium = 1, subscription_type = "premium";
.exit

# 5. Tətbiqi yenidən başlatmaq
adb shell am force-stop com.tikio.app
adb shell am start -n com.tikio.app/.MainActivity

echo "Premium bypass tamamlandı!"
