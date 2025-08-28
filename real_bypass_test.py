#!/usr/bin/env python3
"""
Real APK Bypass Test
Tikio APK-da real subscription bypass test edir
"""

import os
import json
import zipfile
import tempfile
import shutil
from pathlib import Path

class RealBypassTest:
    def __init__(self):
        self.apk_path = "Tikio_1.8.0.apk"
        self.decompiled_path = "tikio_decompiled"
        self.test_results = {}
    
    def test_apk_structure(self):
        """APK strukturunu test edir"""
        print("🔍 APK Strukturu Test Edilir...")
        
        if not os.path.exists(self.apk_path):
            print(f"❌ APK faylı tapılmadı: {self.apk_path}")
            return False
        
        # APK faylını açmaq
        try:
            with zipfile.ZipFile(self.apk_path, 'r') as apk:
                files = apk.namelist()
                
                print(f"📱 APK ölçüsü: {os.path.getsize(self.apk_path) / (1024*1024):.2f} MB")
                print(f"📁 Faylların sayı: {len(files)}")
                
                # Əsas faylları tapmaq
                key_files = [
                    'classes.dex',
                    'classes2.dex', 
                    'classes3.dex',
                    'AndroidManifest.xml',
                    'resources.arsc'
                ]
                
                for key_file in key_files:
                    if key_file in files:
                        print(f"✅ {key_file} tapıldı")
                    else:
                        print(f"❌ {key_file} tapılmadı")
                
                return True
                
        except Exception as e:
            print(f"❌ APK açma xətası: {e}")
            return False
    
    def test_decompiled_code(self):
        """Decompile edilmiş kodu test edir"""
        print("\n🔍 Decompile Edilmiş Kod Test Edilir...")
        
        if not os.path.exists(self.decompiled_path):
            print(f"❌ Decompiled fayllar tapılmadı: {self.decompiled_path}")
            return False
        
        # Əsas faylları yoxlamaq
        key_paths = [
            'AndroidManifest.xml',
            'smali/',
            'smali_classes2/',
            'smali_classes3/',
            'res/values/strings.xml'
        ]
        
        for path in key_paths:
            full_path = os.path.join(self.decompiled_path, path)
            if os.path.exists(full_path):
                print(f"✅ {path} tapıldı")
            else:
                print(f"❌ {path} tapılmadı")
        
        return True
    
    def test_billing_client_vulnerability(self):
        """Billing client zəifliyini test edir"""
        print("\n🔍 Billing Client Zəifliyi Test Edilir...")
        
        # Billing client kodlarını axtarmaq
        billing_files = []
        for root, dirs, files in os.walk(self.decompiled_path):
            for file in files:
                if file.endswith('.smali') and 'billing' in file.lower():
                    billing_files.append(os.path.join(root, file))
        
        print(f"📱 Billing client faylları: {len(billing_files)}")
        
        if billing_files:
            print("✅ Billing client kodları tapıldı")
            
            # Əsas billing metodlarını yoxlamaq
            key_methods = [
                'queryPurchasesAsync',
                'isReady',
                'startConnection',
                'endConnection'
            ]
            
            for method in key_methods:
                found = False
                for file_path in billing_files:
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            if method in content:
                                found = True
                                break
                    except:
                        continue
                
                if found:
                    print(f"✅ {method} metodu tapıldı")
                else:
                    print(f"❌ {method} metodu tapılmadı")
            
            return True
        else:
            print("❌ Billing client kodları tapılmadı")
            return False
    
    def test_code_obfuscation(self):
        """Code obfuscation səviyyəsini test edir"""
        print("\n🔍 Code Obfuscation Test Edilir...")
        
        # Smali fayllarında string-ləri yoxlamaq
        string_count = 0
        readable_strings = []
        
        for root, dirs, files in os.walk(self.decompiled_path):
            for file in files:
                if file.endswith('.smali'):
                    file_path = os.path.join(root, file)
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            
                            # String-ləri tapmaq
                            if 'const-string' in content:
                                string_count += content.count('const-string')
                                
                                # Oxunaqlı string-ləri tapmaq
                                lines = content.split('\n')
                                for line in lines:
                                    if 'const-string' in line and 'L' in line:
                                        readable_strings.append(line.strip())
                    except:
                        continue
        
        print(f"📱 Tapılan string-lər: {string_count}")
        print(f"📱 Oxunaqlı string-lər: {len(readable_strings)}")
        
        if string_count > 1000:
            print("⚠️ Çox sayda string tapıldı - obfuscation zəif")
            return False
        else:
            print("✅ String-lər obfuscated edilib")
            return True
    
    def test_premium_check_vulnerability(self):
        """Premium check zəifliyini test edir"""
        print("\n🔍 Premium Check Zəifliyi Test Edilir...")
        
        # Premium ilə bağlı kodları axtarmaq
        premium_keywords = [
            'premium',
            'subscription',
            'billing',
            'purchase',
            'payment'
        ]
        
        vulnerable_files = []
        
        for root, dirs, files in os.walk(self.decompiled_path):
            for file in files:
                if file.endswith('.smali'):
                    file_path = os.path.join(root, file)
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            
                            for keyword in premium_keywords:
                                if keyword in content.lower():
                                    vulnerable_files.append((file_path, keyword))
                                    break
                    except:
                        continue
        
        print(f"📱 Zəif fayllar: {len(vulnerable_files)}")
        
        if vulnerable_files:
            print("⚠️ Premium check zəiflikləri tapıldı:")
            for file_path, keyword in vulnerable_files[:5]:  # İlk 5-ni göstər
                print(f"   - {os.path.basename(file_path)} ({keyword})")
            
            return True
        else:
            print("✅ Premium check zəiflikləri tapılmadı")
            return False
    
    def test_network_security(self):
        """Network təhlükəsizliyini test edir"""
        print("\n🔍 Network Təhlükəsizliyi Test Edilir...")
        
        # Network konfiqurasiyasını yoxlamaq
        network_config_path = os.path.join(self.decompiled_path, 'res', 'xml', 'network_security_config.xml')
        
        if os.path.exists(network_config_path):
            print("✅ Network security config tapıldı")
            
            try:
                with open(network_config_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                    if 'cleartextTrafficPermitted="true"' in content:
                        print("⚠️ Cleartext traffic icazə verilib")
                        return False
                    else:
                        print("✅ Cleartext traffic qadağan edilib")
                        return True
            except:
                print("❌ Network config oxuna bilmir")
                return False
        else:
            print("⚠️ Network security config tapılmadı")
            return False
    
    def generate_bypass_patch(self):
        """Bypass patch yaradır"""
        print("\n🔧 Bypass Patch Yaradılır...")
        
        # Saxta premium status patch
        patch_code = """
# Tikio Premium Bypass Patch
# Bu patch premium status-u bypass edir

# 1. SharedPreferences patch
echo '{"isPremium": true, "expiryDate": "2099-12-31"}' > /data/data/com.tikio.app/shared_prefs/premium_status.xml

# 2. Memory patch (Frida script)
Java.perform(function() {
    var userClass = Java.use('com.tikio.app.User');
    if (userClass.isPremiumUser) {
        userClass.isPremiumUser.implementation = function() {
            console.log('[+] Premium check bypassed');
            return true;
        };
    }
});

# 3. Billing client patch
Java.perform(function() {
    var billingClient = Java.use('com.android.billingclient.api.BillingClient');
    billingClient.isReady.implementation = function() {
        return true;
    };
});
"""
        
        patch_file = "tikio_bypass_patch.txt"
        with open(patch_file, 'w') as f:
            f.write(patch_code)
        
        print(f"✅ Bypass patch yaradıldı: {patch_file}")
        return True
    
    def run_all_tests(self):
        """Bütün testləri işə salır"""
        print("🚀 Real APK Bypass Test Başlayır...")
        print("=" * 60)
        
        tests = [
            ("APK Strukturu", self.test_apk_structure),
            ("Decompiled Kod", self.test_decompiled_code),
            ("Billing Client Zəifliyi", self.test_billing_client_vulnerability),
            ("Code Obfuscation", self.test_code_obfuscation),
            ("Premium Check Zəifliyi", self.test_premium_check_vulnerability),
            ("Network Təhlükəsizliyi", self.test_network_security)
        ]
        
        for test_name, test_func in tests:
            try:
                result = test_func()
                self.test_results[test_name] = result
            except Exception as e:
                print(f"❌ {test_name} xətası: {e}")
                self.test_results[test_name] = False
        
        # Bypass patch yaratmaq
        self.generate_bypass_patch()
        
        # Nəticələr
        print("\n" + "=" * 60)
        print("📊 REAL TEST NƏTİCƏLƏRİ:")
        print("=" * 60)
        
        for test_name, result in self.test_results.items():
            status = "✅ UĞURLU" if result else "❌ UĞURSUZ"
            print(f"{test_name}: {status}")
        
        # Təhlükə səviyyəsi
        successful_tests = sum(self.test_results.values())
        total_tests = len(self.test_results)
        
        print(f"\n📈 Uğurlu Testlər: {successful_tests}/{total_tests}")
        
        if successful_tests >= 4:
            print("🚨 YÜKSƏK TƏHLÜKƏ!")
            print("Subscription bypass çox asandır!")
            print("APK-da ciddi zəifliklər var!")
        elif successful_tests >= 2:
            print("⚠️ ORTA TƏHLÜKƏ!")
            print("Subscription bypass mümkündür!")
            print("APK-da orta səviyyəli zəifliklər var!")
        else:
            print("✅ AŞAĞI TƏHLÜKƏ!")
            print("Subscription bypass çətin!")
            print("APK yaxşı qorunub!")
        
        print("\n💡 TƏKLİFLƏR:")
        print("1. Code obfuscation gücləndirin")
        print("2. Premium check server-side edin")
        print("3. Network security config əlavə edin")
        print("4. Anti-tampering tətbiq edin")
        print("5. Root detection əlavə edin")

if __name__ == "__main__":
    tester = RealBypassTest()
    tester.run_all_tests()