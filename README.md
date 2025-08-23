# 🔓 Android Python 3.9 PyC Decompiler

Android cihazda Python 3.9 ilə marshal modulu ilə şifrələnmiş `.pyc` və ya bytecode fayllarını deşifrə etmək üçün tam həll.

## 📱 Dəstəklənən Mühitlər

- **Termux** (Android terminal emulyatoru)
- **Pydroid3** (Android Python IDE)
- **QPython** (Android Python)
- **Pythonista** (iOS - əlavə dəstək)

## 🚀 Quraşdırma

### Termux-da

```bash
# Paketləri yenilə
pkg update && pkg upgrade

# Python və lazımi paketləri quraşdır
pkg install python python-pip

# Tkinter quraşdır (GUI üçün)
pkg install python-tkinter

# Layihəni klonla və ya yüklə
cd /storage/emulated/0/Download
git clone <repository_url>
cd pyc-decompiler

# Asılılıqları yoxla
python3 -c "import marshal, dis, ast; print('✅ Bütün modullar mövcuddur')"
```

### Pydroid3-də

1. Pydroid3-ü Google Play Store-dan yüklə
2. Layihə fayllarını Android cihazına köçür
3. Pydroid3-də faylları aç

## 📁 Fayl Strukturu

```
pyc-decompiler/
├── pyc_decompiler.py          # Əsas decompiler
├── advanced_decompiler.py     # Təkmilləşdirilmiş decompiler
├── gui_decompiler.py         # GUI interfeys
├── test_script.py            # Test skripti
├── create_pyc.py             # .pyc yaradıcı
└── README.md                 # Bu fayl
```

## 🔧 İstifadə

### 1. Əsas Decompiler (CLI)

```bash
# Sadə deşifrə
python3 pyc_decompiler.py input.pyc

# Çıxış faylını təyin et
python3 pyc_decompiler.py input.pyc output.py

# Test
python3 pyc_decompiler.py test_script.pyc
```

### 2. Təkmilləşdirilmiş Decompiler

```bash
# Dərin analiz
python3 advanced_decompiler.py input.pyc

# Çıxış faylını təyin et
python3 advanced_decompiler.py input.pyc output.py

# Test
python3 advanced_decompiler.py test_script.pyc
```

### 3. GUI İnterfeys

```bash
# GUI başlat
python3 gui_decompiler.py
```

## 🧪 Test

### Test .pyc Faylı Yarat

```bash
# Test skriptini .pyc-ə çevir
python3 create_pyc.py

# Yaranan .pyc faylını deşifrə et
python3 pyc_decompiler.py test_script.pyc
python3 advanced_decompiler.py test_script.pyc
```

### Test Skripti

`test_script.py` faylında:
- Funksiyalar
- String-lər
- Hesablamalar
- Döngülər

## 📊 Çıxış Formatları

### Əsas Decompiler

```
# Deşifrə edilmiş PyC Faylı
# Orijinal fayl: test_script.py
# Funksiya adı: <module>
# Arqument sayı: 0
# Lokal dəyişən sayı: 0
==================================================

# TAPILAN STRING-LƏR:
# 1: "Salam, "
# 2: "Dünya"
# 3: "Salam, Dünya!"
# 4: "Python"
# 5: "Android"
# 6: "Decompiler"
# 7: "Test"

# BYTECODE DISASSEMBLY:
# Bu hissəni Python bytecode kimi işlətmək olar
🔍 BYTECODE DISASSEMBLY:
==================================================
```

### Təkmilləşdirilmiş Decompiler

```
# TƏKMİLLƏŞDİRİLMİŞ PYC ANALİZİ
============================================================

## ƏSAS MƏLUMATLAR
Fayl: test_script.py
Funksiya: <module>
Arqument sayı: 0
Lokal dəyişən sayı: 0
Stack ölçüsü: 3
Flags: 64

## CONSTANTS
 0: str         = 'Salam, '
 1: str         = 'Dünya'
 2: str         = 'Salam, Dünya!'
 3: str         = 'Python'
 4: str         = 'Android'
 5: str         = 'Decompiler'
 6: str         = 'Test'

## NAMES
 0: global_name = print
 1: global_name = hello_world
 2: global_name = calculate_sum
 3: global_name = main

## BYTECODE FLOW
   0: LOAD_CONST               0 -> Salam, 
   3: LOAD_CONST               1 -> Dünya
   6: LOAD_CONST               2 -> Salam, Dünya!
   9: LOAD_CONST               3 -> Python
  12: LOAD_CONST               4 -> Android
  15: LOAD_CONST               5 -> Decompiler
  18: LOAD_CONST               6 -> Test
  21: BUILD_LIST               7
  24: STORE_NAME              0 -> print
  27: STORE_NAME              1 -> hello_world
  30: STORE_NAME              2 -> calculate_sum
  33: STORE_NAME              3 -> main
  36: LOAD_NAME               3 -> main
  39: CALL_FUNCTION           0
  42: POP_TOP
  43: LOAD_CONST               7 -> None
  46: RETURN_VALUE

## PYTHON-A BƏNZƏR KOD
# Deşifrə edilmiş kod: <module>
# Fayl: test_script.py

# Constants:
# 0: 'Salam, '
# 1: 'Dünya'
# 2: 'Salam, Dünya!'
# 3: 'Python'
# 4: 'Android'
# 5: 'Decompiler'
# 6: 'Test'

# Names:
# global_name: print
# global_name: hello_world
# global_name: calculate_sum
# global_name: main

# Təxmini kod:
# Bu hissə bytecode analizi əsasında yaradılıb
# Tam dəqiqlik təmin edilmir

# 0: LOAD_CONST 'Salam, '
# 3: LOAD_CONST 'Dünya'
# 6: LOAD_CONST 'Salam, Dünya!'
# 9: LOAD_CONST 'Python'
# 12: LOAD_CONST 'Android'
# 15: LOAD_CONST 'Decompiler'
# 18: LOAD_CONST 'Test'
# 21: BUILD_LIST 7
# 24: STORE_NAME 'print'
# 27: STORE_NAME 'hello_world'
# 30: STORE_NAME 'calculate_sum'
# 33: STORE_NAME 'main'
# 36: LOAD_NAME 'main'
# 39: CALL_FUNCTION(0)
# 42: POP_TOP
# 43: LOAD_CONST None
# 46: RETURN_VALUE
```

## 🔒 Təhlükəsizlik

### Sandboxing

- Fayllar yalnız oxunur
- Sistem fayllarına daxil olunmur
- Offline işləyir
- Şəbəkə bağlantısı tələb olunmur

### Fayl Yoxlaması

- Yalnız `.pyc` və `.pyo` faylları
- Fayl ölçüsü limiti yoxdur
- Məzmun yoxlaması edilmir

## 🐛 Problemlər və Həllər

### Tkinter Xətası

```bash
# Termux-da
pkg install python-tkinter

# Alternativ - CLI istifadə et
python3 pyc_decompiler.py file.pyc
```

### Marshal Xətası

```bash
# Python versiyasını yoxla
python3 --version

# Python 3.7+ tələb olunur
pkg install python
```

### Fayl Oxuma Xətası

```bash
# Fayl mövcudluğunu yoxla
ls -la file.pyc

# İcazələri yoxla
chmod 644 file.pyc
```

## 📱 Android Xüsusiyyətləri

### Termux Optimizasiyası

```bash
# Performansı artır
export PYTHONOPTIMIZE=1

# Memory limiti
export PYTHONMALLOC=malloc
```

### Pydroid3 Optimizasiyası

- Settings > Interpreter > Python 3.9
- Settings > Memory > Increase heap size
- Settings > Performance > Enable optimizations

## 🔧 Təkmilləşdirmələr

### Gələcək Versiyalar

- [ ] Daha dərin kod analizi
- [ ] AST yenidən qurma
- [ ] Obfuscated kod dəstəyi
- [ ] Batch processing
- [ ] Plugin sistemi

### Mövcud Xüsusiyyətlər

- ✅ Marshal deşifrə
- ✅ Bytecode analiz
- ✅ String çıxarma
- ✅ Constants analiz
- ✅ Names analiz
- ✅ Flow analiz
- ✅ GUI interfeys
- ✅ CLI interfeys
- ✅ Android uyğunluğu
- ✅ Offline işləmə

## 📞 Dəstək

### Problemlər

1. Python versiyasını yoxlayın (3.7+)
2. Fayl icazələrini yoxlayın
3. Asılılıqları yoxlayın
4. Log-ları oxuyun

### Təlimatlar

- [Python 3.9 Quraşdırma](https://wiki.termux.com/wiki/Python)
- [Termux Tkinter](https://wiki.termux.com/wiki/Tkinter)
- [Pydroid3 Quraşdırma](https://play.google.com/store/apps/details?id=ru.iiec.pydroid3)

## 📄 Lisenziya

Bu layihə MIT lisenziyası altında yayımlanır.

## 🤝 Töhfə

Təkmilləşdirmələr üçün pull request göndərin.

---

**🔓 Android Python 3.9 PyC Decompiler** - Offline, təhlükəsiz və effektiv bytecode analizi üçün!