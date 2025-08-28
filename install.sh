#!/bin/bash

# SSL Pinning Bypass Frida Script - Avtomatik Quraşdırma
# Bu script Frida və lazımi alətləri avtomatik quraşdırır

echo "🔧 SSL Pinning Bypass Frida Script Quraşdırılır..."
echo "=================================================="

# Rəng kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Python yoxlanılır
if command -v python3 &> /dev/null; then
    echo -e "${GREEN}✓ Python3 tapıldı${NC}"
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    echo -e "${GREEN}✓ Python tapıldı${NC}"
    PYTHON_CMD="python"
else
    echo -e "${RED}✗ Python tapılmadı! Zəhmət olmasa Python quraşdırın.${NC}"
    exit 1
fi

# pip yoxlanılır
if command -v pip3 &> /dev/null; then
    echo -e "${GREEN}✓ pip3 tapıldı${NC}"
    PIP_CMD="pip3"
elif command -v pip &> /dev/null; then
    echo -e "${GREEN}✓ pip tapıldı${NC}"
    PIP_CMD="pip"
else
    echo -e "${RED}✗ pip tapılmadı! Zəhmət olmasa pip quraşdırın.${NC}"
    exit 1
fi

# ADB yoxlanılır
if command -v adb &> /dev/null; then
    echo -e "${GREEN}✓ ADB tapıldı${NC}"
else
    echo -e "${YELLOW}⚠ ADB tapılmadı. Android SDK quraşdırın.${NC}"
fi

# Frida quraşdırılır
echo -e "${BLUE}📦 Frida quraşdırılır...${NC}"
$PIP_CMD install frida-tools frida

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Frida uğurla quraşdırıldı${NC}"
else
    echo -e "${RED}✗ Frida quraşdırılmasında xəta baş verdi${NC}"
    exit 1
fi

# Əlavə Python paketləri
echo -e "${BLUE}📦 Əlavə paketlər quraşdırılır...${NC}"
$PIP_CMD install -r requirements.txt

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Əlavə paketlər uğurla quraşdırıldı${NC}"
else
    echo -e "${YELLOW}⚠ Bəzi paketlər quraşdırıla bilmədi${NC}"
fi

# Frida versiyası yoxlanılır
echo -e "${BLUE}🔍 Frida versiyası yoxlanılır...${NC}"
FRIDA_VERSION=$($PYTHON_CMD -c "import frida; print(frida.__version__)" 2>/dev/null)

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Frida versiyası: $FRIDA_VERSION${NC}"
else
    echo -e "${RED}✗ Frida versiyası müəyyən edilə bilmədi${NC}"
fi

# Test scripti yaradılır
echo -e "${BLUE}📝 Test scripti yaradılır...${NC}"
cat > test_frida.py << 'EOF'
#!/usr/bin/env python3
import frida
import sys

def on_message(message, data):
    print("[*] {0}".format(message['payload']))

def main():
    try:
        # Frida server-ə qoşulmağa çalışırıq
        device = frida.get_usb_device()
        print("✓ USB cihaz tapıldı")
        
        # Cihaz məlumatları
        print(f"✓ Cihaz: {device.name}")
        print(f"✓ Platform: {device.platform}")
        print(f"✓ Architecture: {device.arch}")
        
        print("✓ Frida uğurla işləyir!")
        
    except frida.ServerNotRunningError:
        print("⚠ Frida server işləmir. Zəhmət olmasa server-i başladın.")
    except frida.ProcessNotFoundError:
        print("⚠ Heç bir USB cihaz tapılmadı.")
    except Exception as e:
        print(f"✗ Xəta: {e}")

if __name__ == "__main__":
    main()
EOF

chmod +x test_frida.py
echo -e "${GREEN}✓ Test scripti yaradıldı${NC}"

# Quraşdırma tamamlandı
echo ""
echo -e "${GREEN}🎉 Quraşdırma tamamlandı!${NC}"
echo "=================================================="
echo ""
echo -e "${BLUE}📱 Android cihazınızı USB ilə qoşun və root olun${NC}"
echo -e "${BLUE}🚀 Frida server-i başladın: adb shell && su && /data/local/tmp/frida-server -t 0${NC}"
echo -e "${BLUE}🧪 Test edin: python3 test_frida.py${NC}"
echo -e "${BLUE}📖 İstifadə: frida -U -f com.package.name -l ssl_bypass.js${NC}"
echo ""
echo -e "${YELLOW}⚠ Xatırlatma: Bu alətlər yalnız öz tətbiqlərinizi test etmək üçün istifadə edin!${NC}"
echo ""