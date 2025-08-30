#!/bin/bash

# 🚀 TİKİO QUICK BYPASS - SÜRƏTLİ VERSİYA
# Bu script premium status-u sürətli şəkildə bypass edir

echo "🚀 Tikio Quick Bypass başladıldı..."
echo "====================================="

# Rənglər
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Funksiyalar
quick_bypass() {
    echo -e "${BLUE}⚡ Sürətli Bypass Başladılır...${NC}"
    
    # 1. Premium SharedPreferences yarat
    echo -e "${BLUE}📝 Premium status yaradılır...${NC}"
    cat > premium_status.xml << 'EOF'
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
    <string name="premium_type">premium</string>
    <boolean name="ads_disabled" value="true" />
    <boolean name="unlimited_features" value="true" />
</map>
EOF
    
    # 2. Frida script yarat
    echo -e "${BLUE}📝 Frida script yaradılır...${NC}"
    cat > quick_bypass.js << 'EOF'
// Tikio Quick Bypass
Java.perform(function() {
    console.log("[+] Quick Bypass başladıldı");
    
    // Premium check bypass
    try {
        var userClass = Java.use('com.tikio.app.User');
        if (userClass.isPremiumUser) {
            userClass.isPremiumUser.implementation = function() {
                return true;
            };
        }
    } catch(e) {}
    
    // Billing client bypass
    try {
        var billingClient = Java.use('com.android.billingclient.api.BillingClient');
        billingClient.isReady.implementation = function() {
            return true;
        };
    } catch(e) {}
    
    console.log("[+] Quick bypass tamamlandı!");
});
EOF
    
    # 3. ADB commands yarat
    echo -e "${BLUE}📝 ADB commands yaradılır...${NC}"
    cat > quick_bypass.sh << 'EOF'
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
EOF
    
    chmod +x quick_bypass.sh
    
    echo -e "${GREEN}✅ Bütün fayllar yaradıldı!${NC}"
}

show_instructions() {
    echo ""
    echo -e "${BLUE}📋 QUICK BYPASS TƏLİMATI:${NC}"
    echo "====================================="
    echo ""
    echo -e "${YELLOW}1. Cihazı qoşun və USB Debugging aktiv edin${NC}"
    echo -e "${YELLOW}2. ADB qoşulmasını yoxlayın: adb devices${NC}"
    echo ""
    echo -e "${GREEN}Metod 1: Frida Script (Ən Asan)${NC}"
    echo "   - Frida server quraşdırın"
    echo "   - Script-i işə salın: frida -U -l quick_bypass.js -f com.tikio.app"
    echo ""
    echo -e "${GREEN}Metod 2: ADB Commands${NC}"
    echo "   - Script-i işə salın: ./quick_bypass.sh"
    echo ""
    echo -e "${GREEN}Metod 3: Manual Patch${NC}"
    echo "   - premium_status.xml faylını cihaza yükləyin"
    echo ""
    echo -e "${BLUE}📁 Yaradılan fayllar:${NC}"
    echo "   - premium_status.xml (Premium status)"
    echo "   - quick_bypass.js (Frida script)"
    echo "   - quick_bypass.sh (ADB commands)"
    echo ""
    echo -e "${YELLOW}💡 Əlavə məlumat üçün: cat STEP_BY_STEP_BYPASS.md${NC}"
}

# Əsas proqram
main() {
    echo -e "${BLUE}🚀 Tikio Quick Bypass başladıldı...${NC}"
    echo "====================================="
    
    # ADB yoxla
    if command -v adb &> /dev/null; then
        echo -e "${GREEN}✅ ADB tapıldı${NC}"
    else
        echo -e "${RED}❌ ADB tapılmadı${NC}"
        echo "ADB quraşdırın: sudo apt install android-tools-adb"
        exit 1
    fi
    
    # Cihaz yoxla
    if adb devices | grep -q "device$"; then
        DEVICE_ID=$(adb devices | grep "device$" | awk '{print $1}')
        echo -e "${GREEN}✅ Cihaz tapıldı: $DEVICE_ID${NC}"
    else
        echo -e "${YELLOW}⚠️ Cihaz tapılmadı${NC}"
        echo "Cihazı USB ilə qoşun və USB Debugging aktiv edin"
    fi
    
    # Quick bypass faylları yarat
    quick_bypass
    
    # Təlimatları göstər
    show_instructions
    
    echo ""
    echo -e "${GREEN}🎉 Quick bypass hazırdır!${NC}"
    echo -e "${BLUE}📱 İndi cihazınızı qoşun və bypass edin${NC}"
}

# Script-i işə sal
main "$@"