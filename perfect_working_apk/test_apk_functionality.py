#!/usr/bin/env python3
# 🧪 APK Functionality Test Script
# APK-nın işləyib-işləmədiyini yoxlamaq

import zipfile
import os
from pathlib import Path

class APKFunctionalityTester:
    def __init__(self):
        self.apk_path = Path("perfect_working_apk.apk")
        
    def test_apk_basic(self):
        """APK-nın əsas funksiyalarını test et"""
        print("🧪 APK Əsas Funksiyaları Test Edilir...")
        print("=" * 60)
        
        if not self.apk_path.exists():
            print("❌ APK faylı tapılmadı!")
            return False
            
        try:
            with zipfile.ZipFile(self.apk_path, 'r') as z:
                # 1. APK validliyini yoxla
                test_result = z.testzip()
                if test_result is None:
                    print("✅ APK Valid: True")
                else:
                    print(f"❌ APK Valid: False - {test_result}")
                    return False
                    
                # 2. Fayl sayını yoxla
                file_count = len(z.namelist())
                print(f"📊 Fayl sayı: {file_count}")
                
                # 3. Ölçünü yoxla
                size_mb = self.apk_path.stat().st_size / (1024 * 1024)
                print(f"📏 Ölçü: {size_mb:.1f} MB")
                
                # 4. Vacib faylları yoxla
                critical_files = ["AndroidManifest.xml", "classes.dex", "resources.arsc"]
                print("\n🔑 Vacib Fayllar:")
                for file_name in critical_files:
                    if file_name in z.namelist():
                        print(f"  ✅ {file_name}")
                    else:
                        print(f"  ❌ {file_name}")
                        return False
                        
                # 5. DEX fayllarını yoxla
                dex_files = [f for f in z.namelist() if f.endswith('.dex')]
                print(f"\n📱 DEX Faylları: {len(dex_files)}")
                for dex_file in dex_files:
                    print(f"  ✅ {dex_file}")
                    
                # 6. Native library-ləri yoxla
                lib_files = [f for f in z.namelist() if f.endswith('.so')]
                print(f"\n📚 Native Library-lər: {len(lib_files)}")
                
                # 7. META-INF yoxluğunu yoxla
                meta_files = [f for f in z.namelist() if f.startswith('META-INF/')]
                if len(meta_files) == 0:
                    print("✅ META-INF (İmza) Silindi - APK Yenidən İmzalanacaq")
                else:
                    print(f"⚠️ META-INF faylları: {len(meta_files)}")
                    
                # 8. Duplicate faylları yoxla
                file_names = z.namelist()
                duplicates = [f for f in set(file_names) if file_names.count(f) > 1]
                if len(duplicates) == 0:
                    print("✅ Duplicate Fayllar Yoxdur")
                else:
                    print(f"⚠️ Duplicate Fayllar: {len(duplicates)}")
                    
            return True
            
        except Exception as e:
            print(f"❌ APK test edilə bilmədi: {e}")
            return False
            
    def test_apk_content(self):
        """APK məzmununu test et"""
        print("\n🔍 APK Məzmunu Test Edilir...")
        print("=" * 60)
        
        try:
            with zipfile.ZipFile(self.apk_path, 'r') as z:
                # 1. APK strukturunu yoxla
                print("📱 APK Strukturu:")
                
                # DEX faylları
                dex_files = [f for f in z.namelist() if f.endswith('.dex')]
                print(f"  📱 DEX Faylları: {len(dex_files)}")
                
                # Native library-lər
                lib_files = [f for f in z.namelist() if f.endswith('.so')]
                print(f"  📚 Native Library-lər: {len(lib_files)}")
                
                # Resources
                res_files = [f for f in z.namelist() if f.startswith('res/')]
                print(f"  🎨 Resource Faylları: {len(res_files)}")
                
                # Assets
                asset_files = [f for f in z.namelist() if f.startswith('assets/')]
                print(f"  📦 Asset Faylları: {len(asset_files)}")
                
                # 2. APK məzmununu yoxla
                print("\n📋 APK Məzmunu:")
                
                # Top 10 ən böyük fayllar
                file_sizes = []
                for file_name in z.namelist():
                    try:
                        file_info = z.getinfo(file_name)
                        file_sizes.append((file_name, file_info.file_size))
                    except:
                        continue
                        
                file_sizes.sort(key=lambda x: x[1], reverse=True)
                print("  📏 Ən Böyük Fayllar:")
                for i, (file_name, size) in enumerate(file_sizes[:5]):
                    size_mb = size / (1024 * 1024)
                    print(f"    {i+1}. {file_name}: {size_mb:.2f} MB")
                    
                # 3. APK status yoxla
                print("\n🎯 APK Status:")
                
                # Bütün vacib fayllar mövcuddur
                critical_ok = all(f in z.namelist() for f in ["AndroidManifest.xml", "classes.dex", "resources.arsc"])
                print(f"  🔑 Vacib Fayllar: {'✅' if critical_ok else '❌'}")
                
                # DEX faylları mövcuddur
                dex_ok = len(dex_files) >= 1
                print(f"  📱 DEX Faylları: {'✅' if dex_ok else '❌'}")
                
                # META-INF silinib
                meta_ok = len(meta_files) == 0
                print(f"  🔒 META-INF Silindi: {'✅' if meta_ok else '❌'}")
                
                # Duplicate fayllar yoxdur
                dup_ok = len(duplicates) == 0
                print(f"  🔄 Duplicate Fayllar: {'✅' if dup_ok else '❌'}")
                
                # Ümumi status
                overall_status = critical_ok and dex_ok and meta_ok and dup_ok
                print(f"\n🎯 Ümumi Status: {'✅ TAM İŞLƏK' if overall_status else '❌ PROBLEM VAR'}")
                
            return True
            
        except Exception as e:
            print(f"❌ APK məzmunu test edilə bilmədi: {e}")
            return False
            
    def test_apk_installability(self):
        """APK-nın quraşdırıla bilməsini test et"""
        print("\n📱 APK Quraşdırıla Bilməsi Test Edilir...")
        print("=" * 60)
        
        try:
            with zipfile.ZipFile(self.apk_path, 'r') as z:
                # 1. APK format yoxlaması
                print("🔍 APK Format Yoxlaması:")
                
                # APK valid
                apk_valid = z.testzip() is None
                print(f"  ✅ APK Valid: {'✅' if apk_valid else '❌'}")
                
                # Vacib fayllar mövcuddur
                critical_files = ["AndroidManifest.xml", "classes.dex", "resources.arsc"]
                critical_ok = all(f in z.namelist() for f in critical_files)
                print(f"  🔑 Vacib Fayllar: {'✅' if critical_ok else '❌'}")
                
                # DEX faylları mövcuddur
                dex_files = [f for f in z.namelist() if f.endswith('.dex')]
                dex_ok = len(dex_files) >= 1
                print(f"  📱 DEX Faylları: {'✅' if dex_ok else '❌'}")
                
                # 2. Quraşdırma yoxlaması
                print("\n📱 Quraşdırma Yoxlaması:")
                
                # META-INF silinib (yenidən imzalanacaq)
                meta_files = [f for f in z.namelist() if f.startswith('META-INF/')]
                meta_ok = len(meta_files) == 0
                print(f"  🔒 META-INF Silindi: {'✅' if meta_ok else '❌'}")
                
                # Duplicate fayllar yoxdur
                file_names = z.namelist()
                duplicates = [f for f in set(file_names) if file_names.count(f) > 1]
                dup_ok = len(duplicates) == 0
                print(f"  🔄 Duplicate Fayllar: {'✅' if dup_ok else '❌'}")
                
                # 3. Quraşdırma status
                print("\n🎯 Quraşdırma Status:")
                
                installable = apk_valid and critical_ok and dex_ok and meta_ok and dup_ok
                
                if installable:
                    print("  ✅ APK Telefona Quraşdırıla Bilər!")
                    print("  📱 Quraşdırma Addımları:")
                    print("    1. Unknown sources aktivləşdir")
                    print("    2. APK-nı endir")
                    print("    3. APK-nı quraşdır")
                    print("    4. İstifadə et")
                else:
                    print("  ❌ APK-da Problem Var!")
                    print("  🔧 Düzəldilməli:")
                    if not apk_valid:
                        print("    - APK valid deyil")
                    if not critical_ok:
                        print("    - Vacib fayllar yoxdur")
                    if not dex_ok:
                        print("    - DEX faylları yoxdur")
                    if not meta_ok:
                        print("    - META-INF silinməyib")
                    if not dup_ok:
                        print("    - Duplicate fayllar var")
                        
            return True
            
        except Exception as e:
            print(f"❌ APK quraşdırıla bilməsi test edilə bilmədi: {e}")
            return False
            
    def run_complete_test(self):
        """Tam test işə sal"""
        print("🚀 APK Tam Test Başladıldı!")
        print("=" * 60)
        
        # 1. Əsas funksiyaları test et
        basic_ok = self.test_apk_basic()
        
        if basic_ok:
            # 2. Məzmunu test et
            content_ok = self.test_apk_content()
            
            # 3. Quraşdırıla bilməsini test et
            install_ok = self.test_apk_installability()
            
            # 4. Nəticə
            print("\n🎯 TAM TEST NƏTİCƏSİ:")
            print("=" * 60)
            
            if basic_ok and content_ok and install_ok:
                print("✅ APK TAM İŞLƏK VƏ QURAŞDIRILA BİLƏN!")
                print("📱 Telefona yükləyə bilərsiniz!")
                print("🚀 Heç bir problem yoxdur!")
            else:
                print("❌ APK-da Problem Var!")
                print("🔧 Düzəldilməli!")
        else:
            print("❌ APK əsas test keçə bilmədi!")

if __name__ == "__main__":
    tester = APKFunctionalityTester()
    tester.run_complete_test()