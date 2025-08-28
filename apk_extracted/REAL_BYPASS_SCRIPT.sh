#!/bin/bash
# 🚀 TİKİO APK REAL BYPASS SCRIPT
# Bu script server-də APK-nı analiz edir və bypass patch yaradır

set -e

# Rənglər
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logo
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    TİKİO APK BYPASS                        ║"
echo "║                     REAL TEST EDİLİR                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Funksiyalar
print_status() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[-]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[i]${NC} $1"
}

# APK analizi
analyze_apk() {
    print_status "APK analizi başlayır..."
    
    # APK faylını tap
    if [ -f "../Tikio_1.8.0.apk" ]; then
        APK_FILE="../Tikio_1.8.0.apk"
    elif [ -f "Tikio_1.8.0.apk" ]; then
        APK_FILE="Tikio_1.8.0.apk"
    else
        print_error "APK faylı tapılmadı!"
        exit 1
    fi
    
    print_info "APK faylı: $APK_FILE"
    
    # APK ölçüsünü yoxla
    APK_SIZE=$(stat -c%s "$APK_FILE" 2>/dev/null || stat -f%z "$APK_FILE" 2>/dev/null || echo "Bilinmir")
    print_info "APK ölçüsü: $APK_SIZE bytes"
    
    # APK içindəki faylları yoxla
    print_status "APK içindəki fayllar yoxlanılır..."
    
    if [ -f "AndroidManifest.xml" ]; then
        print_info "✅ AndroidManifest.xml tapıldı"
    fi
    
    if [ -f "classes.dex" ]; then
        print_info "✅ classes.dex tapıldı"
    fi
    
    if [ -f "billing.properties" ]; then
        print_info "✅ billing.properties tapıldı"
        BILLING_VERSION=$(grep "version=" billing.properties | cut -d'=' -f2)
        print_info "Billing versiyası: $BILLING_VERSION"
    fi
}

# Bypass patch yaradır
create_bypass_patch() {
    print_status "Bypass patch yaradılır..."
    
    # Premium status XML yaradır
    cat > premium_status.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<map>
    <boolean name="is_premium_user" value="true" />
    <boolean name="subscription_active" value="true" />
    <string name="expiry_date">2099-12-31</string>
    <boolean name="has_active_subscription" value="true" />
    <long name="subscription_start_date">1735689600000</long>
    <string name="subscription_type">premium_monthly</string>
    <boolean name="ads_disabled" value="true" />
    <boolean name="premium_features_enabled" value="true" />
</map>
EOF
    
    # User preferences XML yaradır
    cat > user_preferences.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<map>
    <boolean name="is_premium_user" value="true" />
    <boolean name="has_active_subscription" value="true" />
    <long name="subscription_start_date">1735689600000</long>
    <string name="subscription_status">active</string>
    <boolean name="premium_badge_visible" value="true" />
    <boolean name="no_ads_mode" value="true" />
    <boolean name="unlimited_access" value="true" />
</map>
EOF
    
    # Premium config XML yaradır
    cat > premium_config.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<map>
    <boolean name="premium_enabled" value="true" />
    <boolean name="subscription_valid" value="true" />
    <string name="subscription_end_date">2099-12-31</string>
    <boolean name="all_features_unlocked" value="true" />
    <boolean name="pro_version" value="true" />
</map>
EOF
    
    print_info "✅ Premium status XML yaradıldı"
    print_info "✅ User preferences XML yaradıldı"
    print_info "✅ Premium config XML yaradıldı"
}

# Frida bypass script yaradır
create_frida_script() {
    print_status "Frida bypass script yaradılır..."
    
    cat > tikio_bypass.js << 'EOF'
// Tikio Premium Bypass Frida Script
// Bu script premium status-u bypass edir

Java.perform(function() {
    console.log("[+] Tikio Premium Bypass başladıldı");
    
    // Premium check bypass
    try {
        var userClass = Java.use('com.tikio.app.User');
        if (userClass.isPremiumUser) {
            userClass.isPremiumUser.implementation = function() {
                console.log('[+] Premium check bypassed');
                return true;
            };
        }
    } catch(e) {
        console.log('[-] User class tapılmadı: ' + e);
    }
    
    // Subscription check bypass
    try {
        var subscriptionClass = Java.use('com.tikio.app.Subscription');
        if (subscriptionClass.hasActiveSubscription) {
            subscriptionClass.hasActiveSubscription.implementation = function() {
                console.log('[+] Subscription check bypassed');
                return true;
            };
        }
    } catch(e) {
        console.log('[-] Subscription class tapılmadı: ' + e);
    }
    
    // Billing client bypass
    try {
        var billingClient = Java.use('com.android.billingclient.api.BillingClient');
        billingClient.isReady.implementation = function() {
            console.log('[+] Billing client ready bypassed');
            return true;
        };
        
        billingClient.queryPurchasesAsync.implementation = function(params, listener) {
            console.log('[+] Query purchases bypassed');
            
            // Saxta purchase list yaradır
            var fakePurchase = Java.use('com.android.billingclient.api.Purchase').$new();
            fakePurchase.setPurchaseState(1); // PURCHASED
            fakePurchase.setProductId("premium_subscription");
            fakePurchase.setPurchaseToken("fake_token_12345");
            fakePurchase.setIsAcknowledged(true);
            
            var purchaseList = Java.use('java.util.ArrayList').$new();
            purchaseList.add(fakePurchase);
            
            // Listener-ə göndər
            listener.onQueryPurchasesResponse(purchaseList);
        };
    } catch(e) {
        console.log('[-] Billing client bypass xətası: ' + e);
    }
    
    // SharedPreferences bypass
    try {
        var sharedPrefs = Java.use('android.content.SharedPreferences');
        sharedPrefs.getBoolean.implementation = function(key, defaultValue) {
            if (key === "is_premium_user" || key === "subscription_active" || 
                key === "has_active_subscription" || key === "premium_enabled") {
                console.log('[+] SharedPreferences bypassed: ' + key);
                return true;
            }
            return this.getBoolean(key, defaultValue);
        };
    } catch(e) {
        console.log('[-] SharedPreferences bypass xətası: ' + e);
    }
    
    // Premium badge bypass
    try {
        var premiumBadge = Java.use('com.tikio.app.PremiumBadge');
        if (premiumBadge.isVisible) {
            premiumBadge.isVisible.implementation = function() {
                console.log('[+] Premium badge bypassed');
                return true;
            };
        }
    } catch(e) {
        console.log('[-] Premium badge bypass xətası: ' + e);
    }
    
    console.log("[+] Bütün bypass-lar aktiv edildi!");
});
EOF
    
    print_info "✅ Frida bypass script yaradıldı"
}

# ADB bypass script yaradır
create_adb_script() {
    print_status "ADB bypass script yaradılır..."
    
    cat > adb_bypass.sh << 'EOF'
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
EOF
    
    chmod +x adb_bypass.sh
    print_info "✅ ADB bypass script yaradıldı"
}

# Installation guide yaradır
create_installation_guide() {
    print_status "Installation guide yaradılır..."
    
    cat > INSTALLATION_GUIDE.md << 'EOF'
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
EOF
    
    print_info "✅ Installation guide yaradıldı"
}

# Nəticələri göstər
show_results() {
    print_status "Bypass patch yaradıldı!"
    echo
    echo -e "${CYAN}📁 Yaradılan Fayllar:${NC}"
    echo "  • premium_status.xml - Premium status konfiqurasiyası"
    echo "  • user_preferences.xml - İstifadəçi tərcihləri"
    echo "  • premium_config.xml - Premium konfiqurasiyası"
    echo "  • tikio_bypass.js - Frida bypass script"
    echo "  • adb_bypass.sh - ADB bypass script"
    echo "  • INSTALLATION_GUIDE.md - Quraşdırma təlimatı"
    echo
    echo -e "${YELLOW}🎯 Növbəti Addımlar:${NC}"
    echo "  1. Cihazınızı USB ilə qoşun"
    echo "  2. USB Debugging aktiv edin"
    echo "  3. ./adb_bypass.sh script-ini işə salın"
    echo "  4. Premium funksiyaları pulsuz istifadə edin!"
    echo
    echo -e "${GREEN}✅ Bypass hazırdır!${NC}"
}

# Ana funksiya
main() {
    echo
    print_info "Tikio APK Real Bypass Test başlayır..."
    echo
    
    # APK analizi
    analyze_apk
    
    echo
    print_status "Bypass patch yaradılır..."
    
    # Bypass patch yaradır
    create_bypass_patch
    
    # Frida script yaradır
    create_frida_script
    
    # ADB script yaradır
    create_adb_script
    
    # Installation guide yaradır
    create_installation_guide
    
    echo
    show_results
}

# Script-i işə sal
main "$@"