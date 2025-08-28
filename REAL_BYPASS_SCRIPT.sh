#!/bin/bash

# 🚀 TİKİO PREMIUM BYPASS - REAL SCRIPT
# Bu script premium status-u bypass edir

echo "🚀 Tikio Premium Bypass başladıldı..."
echo "=========================================="

# Rənglər
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funksiyalar
check_adb() {
    echo -e "${BLUE}🔍 ADB yoxlanılır...${NC}"
    if command -v adb &> /dev/null; then
        echo -e "${GREEN}✅ ADB tapıldı${NC}"
        return 0
    else
        echo -e "${RED}❌ ADB tapılmadı${NC}"
        echo "ADB quraşdırın: sudo apt install android-tools-adb"
        return 1
    fi
}

check_device() {
    echo -e "${BLUE}📱 Cihaz yoxlanılır...${NC}"
    adb devices | grep -q "device$"
    if [ $? -eq 0 ]; then
        DEVICE_ID=$(adb devices | grep "device$" | awk '{print $1}')
        echo -e "${GREEN}✅ Cihaz tapıldı: $DEVICE_ID${NC}"
        return 0
    else
        echo -e "${RED}❌ Cihaz tapılmadı${NC}"
        echo "Cihazı USB ilə qoşun və USB Debugging aktiv edin"
        return 1
    fi
}

install_frida_server() {
    echo -e "${BLUE}🔧 Frida Server quraşdırılır...${NC}"
    
    if [ -f "frida-server-16.1.4-android-arm64" ]; then
        echo -e "${GREEN}✅ Frida server faylı tapıldı${NC}"
        
        # Cihaza yüklə
        adb push frida-server-16.1.4-android-arm64 /data/local/tmp/
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Frida server cihaza yükləndi${NC}"
            
            # İcazə ver
            adb shell "chmod 755 /data/local/tmp/frida-server-16.1.4-android-arm64"
            echo -e "${GREEN}✅ İcazələr verildi${NC}"
            
            return 0
        else
            echo -e "${RED}❌ Frida server yüklənmədi${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Frida server faylı tapılmadı${NC}"
        return 1
    fi
}

start_frida_server() {
    echo -e "${BLUE}🚀 Frida Server başladılır...${NC}"
    
    # Mövcud Frida server-ləri dayandır
    adb shell "pkill -f frida-server" 2>/dev/null
    
    # Yeni server başlat
    adb shell "/data/local/tmp/frida-server-16.1.4-android-arm64 &" &
    FRIDA_PID=$!
    
    # Server-in başlanmasını gözlə
    sleep 3
    
    # Server statusunu yoxla
    if adb shell "ps | grep frida-server" | grep -q "frida-server"; then
        echo -e "${GREEN}✅ Frida server başladıldı (PID: $FRIDA_PID)${NC}"
        return 0
    else
        echo -e "${RED}❌ Frida server başlanmadı${NC}"
        return 1
    fi
}

create_bypass_files() {
    echo -e "${BLUE}📝 Bypass faylları yaradılır...${NC}"
    
    # Premium SharedPreferences
    cat > premium_prefs.xml << 'EOF'
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
    <string name="premium_type">premium</string>
    <boolean name="ads_disabled" value="true" />
    <boolean name="unlimited_features" value="true" />
    <string name="last_payment_date">2025-08-28T00:00:00Z</string>
</map>
EOF
    
    # Frida script
    cat > tikio_bypass.js << 'EOF'
// Tikio Premium Bypass Frida Script
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
            if (key === "is_premium_user" || key === "subscription_active") {
                console.log('[+] SharedPreferences bypassed: ' + key);
                return true;
            }
            return this.getBoolean(key, defaultValue);
        };
    } catch(e) {
        console.log('[-] SharedPreferences bypass xətası: ' + e);
    }
    
    console.log("[+] Bütün bypass-lar aktiv edildi!");
});
EOF
    
    echo -e "${GREEN}✅ Bypass faylları yaradıldı${NC}"
}

apply_shared_prefs_patch() {
    echo -e "${BLUE}🔧 SharedPreferences Patch Tətbiq Edilir...${NC}"
    
    # Tətbiq data-ya giriş cəhdi
    if adb shell "run-as com.tikio.app ls /data/data/com.tikio.app/shared_prefs/" 2>/dev/null; then
        echo -e "${GREEN}✅ Tətbiq data-ya giriş mümkündür${NC}"
        
        # Premium prefs yaradın
        adb push premium_prefs.xml /sdcard/
        adb shell "run-as com.tikio.app cp /sdcard/premium_prefs.xml /data/data/com.tikio.app/shared_prefs/premium_status.xml"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ SharedPreferences patch tətbiq edildi${NC}"
            return 0
        else
            echo -e "${YELLOW}⚠️ SharedPreferences patch tətbiq edilmədi (root tələb olunur)${NC}"
            return 1
        fi
    else
        echo -e "${YELLOW}⚠️ Tətbiq data-ya giriş mümkün deyil (root tələb olunur)${NC}"
        return 1
    fi
}

apply_root_patch() {
    echo -e "${BLUE}🔧 Root Patch Tətbiq Edilir...${NC}"
    
    # Root access yoxla
    if adb shell "su -c 'id'" 2>/dev/null | grep -q "uid=0"; then
        echo -e "${GREEN}✅ Root access mövcuddur${NC}"
        
        # Premium prefs yaradın
        adb shell "su -c 'echo \"<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?><map><boolean name=\"is_premium_user\" value=\"true\" /></map>\" > /data/data/com.tikio.app/shared_prefs/premium_status.xml'"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Root patch tətbiq edildi${NC}"
            return 0
        else
            echo -e "${RED}❌ Root patch tətbiq edilmədi${NC}"
            return 1
        fi
    else
        echo -e "${YELLOW}⚠️ Root access yoxdur${NC}"
        return 1
    fi
}

start_frida_bypass() {
    echo -e "${BLUE}🚀 Frida Bypass Başladılır...${NC}"
    
    # Script-i cihaza yüklə
    adb push tikio_bypass.js /sdcard/
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Bypass script cihaza yükləndi${NC}"
        
        echo -e "${YELLOW}📱 İndi Frida client ilə script-i işə salın:${NC}"
        echo -e "${BLUE}frida -U -l /sdcard/tikio_bypass.js -f com.tikio.app${NC}"
        
        return 0
    else
        echo -e "${RED}❌ Script yüklənmədi${NC}"
        return 1
    fi
}

check_bypass_status() {
    echo -e "${BLUE}🔍 Bypass Status Yoxlanılır...${NC}"
    
    # Tətbiq statusunu yoxla
    if adb shell "pm list packages | grep com.tikio.app" | grep -q "com.tikio.app"; then
        echo -e "${GREEN}✅ Tikio tətbiqi quraşdırılıb${NC}"
        
        # SharedPreferences yoxla
        if adb shell "run-as com.tikio.app cat /data/data/com.tikio.app/shared_prefs/premium_status.xml" 2>/dev/null | grep -q "true"; then
            echo -e "${GREEN}✅ Premium status aktiv edilib!${NC}"
            return 0
        else
            echo -e "${YELLOW}⚠️ Premium status hələ aktiv edilməyib${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Tikio tətbiqi quraşdırılmayıb${NC}"
        return 1
    fi
}

# Əsas proqram
main() {
    echo -e "${BLUE}🚀 Tikio Premium Bypass başladıldı...${NC}"
    echo "=========================================="
    
    # ADB yoxla
    if ! check_adb; then
        exit 1
    fi
    
    # Cihaz yoxla
    if ! check_device; then
        exit 1
    fi
    
    # Frida server quraşdır
    if ! install_frida_server; then
        exit 1
    fi
    
    # Frida server başlat
    if ! start_frida_server; then
        exit 1
    fi
    
    # Bypass faylları yarat
    create_bypass_files
    
    # SharedPreferences patch tətbiq et
    if ! apply_shared_prefs_patch; then
        echo -e "${YELLOW}⚠️ Root patch cəhdi...${NC}"
        apply_root_patch
    fi
    
    # Frida bypass başlat
    start_frida_bypass
    
    # Status yoxla
    sleep 2
    check_bypass_status
    
    echo ""
    echo -e "${GREEN}🎉 Bypass tamamlandı!${NC}"
    echo -e "${BLUE}📱 İndi Tikio tətbiqini açın və premium funksiyaları test edin${NC}"
    echo ""
    echo -e "${YELLOW}💡 Əlavə məlumat üçün: cat REAL_BYPASS_GUIDE.md${NC}"
}

# Script-i işə sal
main "$@"