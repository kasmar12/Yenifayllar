#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Tikio APK Real Bypass Test - Server Edition
Bu script APK fayllarını analiz edir və real bypass imkanlarını yoxlayır
"""

import os
import re
import json
import subprocess
from pathlib import Path

class TikioAPKBypassTester:
    def __init__(self, apk_dir):
        self.apk_dir = Path(apk_dir)
        self.results = {}
        
    def test_apk_structure(self):
        """APK strukturunu test edir"""
        print("🔍 APK Strukturu Test Edilir...")
        
        # Əsas faylları yoxla
        essential_files = [
            'AndroidManifest.xml',
            'classes.dex',
            'classes2.dex', 
            'classes3.dex',
            'billing.properties',
            'resources.arsc'
        ]
        
        found_files = []
        for file in essential_files:
            if (self.apk_dir / file).exists():
                found_files.append(file)
                
        self.results['apk_structure'] = {
            'status': '✅ Tamam' if len(found_files) == len(essential_files) else '⚠️ Qismən',
            'found_files': found_files,
            'missing_files': [f for f in essential_files if f not in found_files]
        }
        
        print(f"   📁 Tapılan fayllar: {len(found_files)}/{len(essential_files)}")
        
    def test_billing_implementation(self):
        """Billing implementasiyasını test edir"""
        print("💳 Billing Implementasiyası Test Edilir...")
        
        # Billing properties yoxla
        billing_props = self.apk_dir / 'billing.properties'
        if billing_props.exists():
            with open(billing_props, 'r') as f:
                content = f.read()
                version_match = re.search(r'version=(\d+\.\d+\.\d+)', content)
                version = version_match.group(1) if version_match else 'Bilinmir'
        else:
            version = 'Tapılmadı'
            
        # DEX fayllarında billing açar sözlərini axtar
        billing_keywords = ['BillingClient', 'purchase', 'subscription', 'billing']
        billing_found = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    result = subprocess.run(
                        ['strings', str(dex_path)],
                        capture_output=True, text=True, timeout=30
                    )
                    if result.returncode == 0:
                        for keyword in billing_keywords:
                            if keyword.lower() in result.stdout.lower():
                                billing_found.append(f"{dex_file}:{keyword}")
                except:
                    pass
                    
        self.results['billing_implementation'] = {
            'status': '✅ Aktiv' if billing_found else '❌ Tapılmadı',
            'version': version,
            'found_keywords': billing_found,
            'vulnerability_level': 'Yüksək' if billing_found else 'Aşağı'
        }
        
        print(f"   🔧 Billing versiyası: {version}")
        print(f"   🔑 Tapılan açar sözlər: {len(billing_found)}")
        
    def test_premium_checks(self):
        """Premium yoxlamalarını test edir"""
        print("👑 Premium Yoxlamaları Test Edilir...")
        
        premium_keywords = [
            'premium', 'subscription', 'isPremium', 'hasSubscription',
            'premium_user', 'subscription_active', 'is_premium'
        ]
        
        premium_found = []
        
        # Bütün DEX fayllarında axtar
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    result = subprocess.run(
                        ['strings', str(dex_path)],
                        capture_output=True, text=True, timeout=30
                    )
                    if result.returncode == 0:
                        for keyword in premium_keywords:
                            if keyword.lower() in result.stdout.lower():
                                premium_found.append(f"{dex_file}:{keyword}")
                except:
                    pass
                    
        # SharedPreferences və database açar sözlərini axtar
        storage_keywords = ['SharedPreferences', 'SQLite', 'database', 'getBoolean', 'getString']
        storage_found = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    result = subprocess.run(
                        ['strings', str(dex_path)],
                        capture_output=True, text=True, timeout=30
                    )
                    if result.returncode == 0:
                        for keyword in storage_keywords:
                            if keyword in result.stdout:
                                storage_found.append(f"{dex_file}:{keyword}")
                except:
                    pass
                    
        self.results['premium_checks'] = {
            'status': '✅ Tapıldı' if premium_found else '❌ Tapılmadı',
            'premium_keywords': premium_found,
            'storage_keywords': storage_found,
            'bypass_difficulty': 'Asan' if premium_found and storage_found else 'Çətin'
        }
        
        print(f"   🔍 Premium açar sözlər: {len(premium_found)}")
        print(f"   💾 Storage açar sözlər: {len(storage_found)}")
        
    def test_network_security(self):
        """Şəbəkə təhlükəsizliyini test edir"""
        print("🌐 Şəbəkə Təhlükəsizliyi Test Edilir...")
        
        # Network security config yoxla
        network_config = self.apk_dir / 'res' / 'xml' / 'network_security_config.xml'
        has_network_config = network_config.exists()
        
        # SSL pinning açar sözlərini axtar
        ssl_keywords = ['SSL', 'TLS', 'certificate', 'pinning', 'X509TrustManager']
        ssl_found = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    result = subprocess.run(
                        ['strings', str(dex_path)],
                        capture_output=True, text=True, timeout=30
                    )
                    if result.returncode == 0:
                        for keyword in ssl_keywords:
                            if keyword in result.stdout:
                                ssl_found.append(f"{dex_file}:{keyword}")
                except:
                    pass
                    
        self.results['network_security'] = {
            'status': '⚠️ Zəif' if not has_network_config else '✅ Güclü',
            'has_network_config': has_network_config,
            'ssl_keywords': ssl_found,
            'interception_possibility': 'Yüksək' if not ssl_found else 'Aşağı'
        }
        
        print(f"   🔒 Network config: {'✅ Var' if has_network_config else '❌ Yoxdur'}")
        print(f"   🔐 SSL açar sözlər: {len(ssl_found)}")
        
    def test_code_obfuscation(self):
        """Kod obfuskasiyasını test edir"""
        print("🔒 Kod Obfuskasiyası Test Edilir...")
        
        # DEX fayllarında readable string-ləri yoxla
        readable_strings = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    result = subprocess.run(
                        ['strings', str(dex_path)],
                        capture_output=True, text=True, timeout=30
                    )
                    if result.returncode == 0:
                        # Readable string-ləri say
                        lines = result.stdout.split('\n')
                        readable = [line for line in lines if len(line) > 5 and line.isprintable()]
                        readable_strings.extend(readable[:100])  # İlk 100-ü götür
                except:
                    pass
                    
        # Obfuskasiya səviyyəsini təyin et
        if len(readable_strings) > 1000:
            obfuscation_level = 'Zəif'
        elif len(readable_strings) > 500:
            obfuscation_level = 'Orta'
        else:
            obfuscation_level = 'Güclü'
            
        self.results['code_obfuscation'] = {
            'status': '⚠️ Zəif' if obfuscation_level == 'Zəif' else '✅ Güclü',
            'obfuscation_level': obfuscation_level,
            'readable_strings_count': len(readable_strings),
            'reverse_engineering_difficulty': 'Asan' if obfuscation_level == 'Zəif' else 'Çətin'
        }
        
        print(f"   🔍 Obfuskasiya səviyyəsi: {obfuscation_level}")
        print(f"   📝 Readable string-lər: {len(readable_strings)}")
        
    def generate_bypass_strategy(self):
        """Bypass strategiyası yaradır"""
        print("🎯 Bypass Strategiyası Yaradılır...")
        
        strategy = {
            'overall_risk': 'Yüksək',
            'recommended_methods': [],
            'difficulty': 'Asan',
            'estimated_time': '5-10 dəqiqə'
        }
        
        # Risk səviyyəsini hesabla
        risk_score = 0
        
        if self.results.get('billing_implementation', {}).get('vulnerability_level') == 'Yüksək':
            risk_score += 3
            
        if self.results.get('premium_checks', {}).get('bypass_difficulty') == 'Asan':
            risk_score += 2
            
        if self.results.get('network_security', {}).get('interception_possibility') == 'Yüksək':
            risk_score += 2
            
        if self.results.get('code_obfuscation', {}).get('reverse_engineering_difficulty') == 'Asan':
            risk_score += 1
            
        # Risk səviyyəsini təyin et
        if risk_score >= 6:
            strategy['overall_risk'] = 'Kritik'
            strategy['difficulty'] = 'Çox Asan'
            strategy['estimated_time'] = '2-5 dəqiqə'
        elif risk_score >= 4:
            strategy['overall_risk'] = 'Yüksək'
            strategy['difficulty'] = 'Asan'
            strategy['estimated_time'] = '5-10 dəqiqə'
        elif risk_score >= 2:
            strategy['overall_risk'] = 'Orta'
            strategy['difficulty'] = 'Orta'
            strategy['estimated_time'] = '15-30 dəqiqə'
        else:
            strategy['overall_risk'] = 'Aşağı'
            strategy['difficulty'] = 'Çətin'
            strategy['estimated_time'] = '1+ saat'
            
        # Tövsiyə olunan metodları əlavə et
        if self.results.get('premium_checks', {}).get('storage_keywords'):
            strategy['recommended_methods'].append('SharedPreferences Manipulation')
            
        if self.results.get('billing_implementation', {}).get('found_keywords'):
            strategy['recommended_methods'].append('Billing Client Interception')
            
        if self.results.get('network_security', {}).get('interception_possibility') == 'Yüksək':
            strategy['recommended_methods'].append('Network Traffic Interception')
            
        if self.results.get('code_obfuscation', {}).get('reverse_engineering_difficulty') == 'Asan':
            strategy['recommended_methods'].append('Code Patching')
            
        self.results['bypass_strategy'] = strategy
        
        print(f"   ⚠️ Ümumi risk: {strategy['overall_risk']}")
        print(f"   🎯 Çətinlik: {strategy['difficulty']}")
        print(f"   ⏱️ Təxmini vaxt: {strategy['estimated_time']}")
        
    def run_all_tests(self):
        """Bütün testləri işlədir"""
        print("🚀 Tikio APK Real Bypass Test Başlayır...")
        print("=" * 50)
        
        self.test_apk_structure()
        self.test_billing_implementation()
        self.test_premium_checks()
        self.test_network_security()
        self.test_code_obfuscation()
        self.generate_bypass_strategy()
        
        print("=" * 50)
        print("✅ Bütün testlər tamamlandı!")
        
        return self.results
        
    def save_results(self, filename='tikio_bypass_results.json'):
        """Nəticələri fayla yazır"""
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(self.results, f, indent=2, ensure_ascii=False)
        print(f"💾 Nəticələr {filename} faylına yazıldı")
        
    def print_summary(self):
        """Nəticələrin xülasəsini göstərir"""
        print("\n" + "=" * 60)
        print("🎯 TİKİO APK BYPASS TEST NƏTİCƏLƏRİ")
        print("=" * 60)
        
        for test_name, result in self.results.items():
            if isinstance(result, dict):
                status = result.get('status', '❓ Bilinmir')
                print(f"\n📋 {test_name.replace('_', ' ').title()}: {status}")
                
                for key, value in result.items():
                    if key != 'status':
                        if isinstance(value, list):
                            print(f"   {key}: {len(value)} element")
                        else:
                            print(f"   {key}: {value}")
                            
        # Bypass strategiyası
        if 'bypass_strategy' in self.results:
            strategy = self.results['bypass_strategy']
            print(f"\n🎯 BYPASS STRATEGİYASI:")
            print(f"   ⚠️ Risk Səviyyəsi: {strategy['overall_risk']}")
            print(f"   🎯 Çətinlik: {strategy['difficulty']}")
            print(f"   ⏱️ Təxmini Vaxt: {strategy['estimated_time']}")
            print(f"   🔧 Tövsiyə Olunan Metodlar:")
            for method in strategy['recommended_methods']:
                print(f"      • {method}")

if __name__ == "__main__":
    # APK extract edilmiş qovluğu
    apk_dir = "."
    
    # Test başlat
    tester = TikioAPKBypassTester(apk_dir)
    results = tester.run_all_tests()
    
    # Nəticələri yaz və göstər
    tester.save_results()
    tester.print_summary()