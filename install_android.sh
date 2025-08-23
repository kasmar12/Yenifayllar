#!/bin/bash
# Android Termux üçün PyC Decompiler quraşdırma skripti

echo "🔓 Android Python 3.9 PyC Decompiler Quraşdırılır"
echo "=================================================="

# Rənglər
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funksiyalar
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Sistem yoxlaması
check_system() {
    print_status "Sistem yoxlanılır..."
    
    if ! command -v pkg &> /dev/null; then
        print_error "Bu skript yalnız Termux-da işləyir!"
        exit 1
    fi
    
    print_success "Termux aşkar edildi"
}

# Paketləri yenilə
update_packages() {
    print_status "Paketlər yenilənir..."
    
    pkg update -y
    if [ $? -eq 0 ]; then
        print_success "Paketlər yeniləndi"
    else
        print_warning "Paket yeniləmə xətası, davam edilir..."
    fi
}

# Python quraşdır
install_python() {
    print_status "Python quraşdırılır..."
    
    if command -v python3 &> /dev/null; then
        print_success "Python3 artıq quraşdırılıb"
        python3 --version
    else
        pkg install python -y
        if [ $? -eq 0 ]; then
            print_success "Python quraşdırıldı"
            python3 --version
        else
            print_error "Python quraşdırıla bilmədi!"
            exit 1
        fi
    fi
}

# Tkinter quraşdır
install_tkinter() {
    print_status "Tkinter quraşdırılır..."
    
    pkg install python-tkinter -y
    if [ $? -eq 0 ]; then
        print_success "Tkinter quraşdırıldı"
    else
        print_warning "Tkinter quraşdırıla bilmədi, GUI işləməyəcək"
    fi
}

# Pip quraşdır
install_pip() {
    print_status "Pip quraşdırılır..."
    
    if command -v pip3 &> /dev/null; then
        print_success "Pip3 artıq quraşdırılıb"
    else
        pkg install python-pip -y
        if [ $? -eq 0 ]; then
            print_success "Pip3 quraşdırıldı"
        else
            print_warning "Pip3 quraşdırıla bilmədi"
        fi
    fi
}

# Asılılıqları yoxla
check_dependencies() {
    print_status "Python asılılıqları yoxlanılır..."
    
    python3 -c "
import sys
print(f'Python versiyası: {sys.version}')
print(f'Python yolu: {sys.executable}')

try:
    import marshal
    print('✅ marshal modulu mövcuddur')
except ImportError:
    print('❌ marshal modulu tapılmadı')

try:
    import dis
    print('✅ dis modulu mövcuddur')
except ImportError:
    print('❌ dis modulu tapılmadı')

try:
    import ast
    print('✅ ast modulu mövcuddur')
except ImportError:
    print('❌ ast modulu tapılmadı')

try:
    import tkinter
    print('✅ tkinter modulu mövcuddur')
except ImportError:
    print('❌ tkinter modulu tapılmadı')

try:
    from pathlib import Path
    print('✅ pathlib modulu mövcuddur')
except ImportError:
    print('❌ pathlib modulu tapılmadı')
"
}

# Test skriptini yarad
create_test_files() {
    print_status "Test faylları yaradılır..."
    
    # Test .pyc faylı yarat
    if [ -f "test_script.py" ]; then
        python3 create_pyc.py
        if [ $? -eq 0 ]; then
            print_success "Test .pyc faylı yaradıldı"
        else
            print_warning "Test .pyc faylı yaradıla bilmədi"
        fi
    else
        print_warning "test_script.py tapılmadı, test .pyc yaradıla bilmədi"
    fi
}

# Decompiler test et
test_decompiler() {
    print_status "Decompiler test edilir..."
    
    if [ -f "test_script.pyc" ]; then
        echo "--- Əsas Decompiler Test ---"
        python3 pyc_decompiler.py test_script.pyc
        
        echo -e "\n--- Təkmilləşdirilmiş Decompiler Test ---"
        python3 advanced_decompiler.py test_script.pyc
        
        print_success "Decompiler test edildi"
    else
        print_warning "test_script.pyc tapılmadı, test edilə bilmədi"
    fi
}

# İstifadə təlimatı
show_usage() {
    echo -e "\n${GREEN}🎉 Quraşdırma tamamlandı!${NC}"
    echo -e "\n${BLUE}📱 İstifadə:${NC}"
    echo "   # Əsas decompiler"
    echo "   python3 pyc_decompiler.py file.pyc"
    echo ""
    echo "   # Təkmilləşdirilmiş decompiler"
    echo "   python3 advanced_decompiler.py file.pyc"
    echo ""
    echo "   # GUI interfeys (Tkinter varsa)"
    echo "   python3 gui_decompiler.py"
    echo ""
    echo "   # Test"
    echo "   python3 create_pyc.py"
    echo "   python3 pyc_decompiler.py test_script.pyc"
    echo ""
    echo -e "${YELLOW}📚 Ətraflı məlumat üçün README.md faylını oxuyun${NC}"
}

# Ana quraşdırma
main() {
    echo "🚀 Android PyC Decompiler quraşdırılır..."
    echo "Bu proses bir neçə dəqiqə çəkə bilər..."
    echo ""
    
    check_system
    update_packages
    install_python
    install_tkinter
    install_pip
    check_dependencies
    create_test_files
    test_decompiler
    show_usage
}

# Skripti işə sal
main "$@"