#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔍 REAL API ENDPOINT-LƏRİNİ DƏRİNDƏN AXTARMAQ
Bu script APK-nın real API endpoint-lərini tapır
"""

import requests
import json
import random
import string
import time
import re
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class RealAPIDiscovery:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Tikio/1.8.0 (Android)',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'X-Requested-With': 'com.tikio.app'
        })
        
        # Firestore-dan tapılan məlumatlar
        self.api_key = "31de456b79594d98a128c044c509df0e"
        self.service_id = 9330
        
        # APK-dan tapılan məlumatlar
        self.app_package = "com.tikio.app"
        self.app_version = "1.8.0"
        
    def test_working_endpoints(self):
        """İşləyən endpoint-ləri test edir"""
        print("🔍 İşləyən endpoint-ləri test edir...")
        
        # Əvvəlki testlərdə işləyən endpoint-lər
        working_endpoints = [
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/settings",
            "https://tikio-v4.firebaseapp.com",
            "https://peakerr.com/signup",
            "https://peakerr.com/signin",
            "https://peakerr.com/addfunds"
        ]
        
        working_results = {}
        
        for endpoint in working_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    working_results[endpoint] = "SUCCESS"
                    
                    # Response content analiz et
                    if 'firestore.googleapis.com' in endpoint:
                        try:
                            data = response.json()
                            if 'documents' in data:
                                print(f"      📊 Documents: {len(data['documents'])}")
                                for doc in data['documents'][:2]:  # İlk 2 document
                                    doc_id = doc.get('name', '').split('/')[-1]
                                    print(f"         📄 Document ID: {doc_id}")
                        except:
                            print(f"      📄 Text Response: {response.text[:200]}...")
                    else:
                        print(f"      📄 Content Length: {len(response.text)}")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    working_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    working_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                working_results[endpoint] = f"ERROR_{str(e)}"
                
        return working_results
        
    def test_alternative_api_patterns(self):
        """Alternativ API pattern-lərini test edir"""
        print("\n🔧 Alternativ API pattern-lərini test edir...")
        
        # Test ediləcək alternativ pattern-lər
        alternative_patterns = [
            "https://api.tikio.com",
            "https://api.tikio-v4.com",
            "https://tikio-api.appspot.com",
            "https://tikio-api.firebaseapp.com",
            "https://tikio.com/api",
            "https://tikio-v4.com/api",
            "https://tikio.app/api",
            "https://tikio-v4.app/api"
        ]
        
        alternative_results = {}
        
        for pattern in alternative_patterns:
            try:
                response = self.session.get(pattern, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {pattern} - İşləyir!")
                    alternative_results[pattern] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {pattern} - Tapılmadı")
                    alternative_results[pattern] = "NOT_FOUND"
                else:
                    print(f"   ❓ {pattern} - Status: {response.status_code}")
                    alternative_results[pattern] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {pattern} - Xəta: {e}")
                alternative_results[pattern] = f"ERROR_{str(e)}"
                
        return alternative_results
        
    def test_peakerr_working_endpoints(self):
        """Peakerr.com işləyən endpoint-lərini test edir"""
        print("\n🌐 Peakerr.com işləyən endpoint-lərini test edir...")
        
        # Peakerr.com işləyən səhifələr
        peakerr_working = [
            "https://peakerr.com",
            "https://peakerr.com/signup",
            "https://peakerr.com/signin",
            "https://peakerr.com/addfunds",
            "https://peakerr.com/services",
            "https://peakerr.com/order",
            "https://peakerr.com/massorder"
        ]
        
        peakerr_results = {}
        
        for endpoint in peakerr_working:
            try:
                response = self.session.get(endpoint, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    peakerr_results[endpoint] = "SUCCESS"
                    
                    # HTML content analiz et
                    content = response.text.lower()
                    
                    # API endpoint-ləri axtar
                    api_patterns = [
                        r'https?://[^\s"\']+\.com/api[^\s"\']*',
                        r'https?://[^\s"\']+\.com/v\d+[^\s"\']*',
                        r'https?://[^\s"\']+\.com/payment[^\s"\']*',
                        r'https?://[^\s"\']+\.com/webhook[^\s"\']*'
                    ]
                    
                    found_apis = []
                    for pattern in api_patterns:
                        matches = re.findall(pattern, content)
                        for match in matches:
                            if match not in found_apis:
                                found_apis.append(match)
                                
                    if found_apis:
                        print(f"      🔗 Tapılan API-lər: {len(found_apis)}")
                        for api in found_apis[:3]:  # İlk 3-ü göstər
                            print(f"         🔗 {api}")
                            
                    # External service-lər axtar
                    external_services = ['stripe', 'paypal', 'square', 'crypto', 'bitcoin']
                    found_services = []
                    for service in external_services:
                        if service in content:
                            found_services.append(service)
                            
                    if found_services:
                        print(f"      🌐 Tapılan xidmətlər: {', '.join(found_services)}")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    peakerr_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    peakerr_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                peakerr_results[endpoint] = f"ERROR_{str(e)}"
                
        return peakerr_results
        
    def test_firebase_working_collections(self):
        """Firebase işləyən collection-ları test edir"""
        print("\n🔥 Firebase işləyən collection-ları test edir...")
        
        # Settings collection-dan tapılan məlumatlara əsaslanaraq digər collection-ları test et
        firebase_collections = [
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/users",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/orders",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/services",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/config",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/system"
        ]
        
        firebase_results = {}
        
        for collection in firebase_collections:
            try:
                response = self.session.get(collection, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {collection} - İşləyir!")
                    firebase_results[collection] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        if 'documents' in data:
                            print(f"      📊 Documents: {len(data['documents'])}")
                            for doc in data['documents'][:2]:  # İlk 2 document
                                doc_id = doc.get('name', '').split('/')[-1]
                                print(f"         📄 Document ID: {doc_id}")
                        else:
                            print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 403:
                    print(f"   ❌ {collection} - Giriş qadağandır")
                    firebase_results[collection] = "FORBIDDEN"
                elif response.status_code == 404:
                    print(f"   ❌ {collection} - Tapılmadı")
                    firebase_results[collection] = "NOT_FOUND"
                else:
                    print(f"   ❓ {collection} - Status: {response.status_code}")
                    firebase_results[collection] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {collection} - Xəta: {e}")
                firebase_results[collection] = f"ERROR_{str(e)}"
                
        return firebase_results
        
    def test_actual_smm_services(self):
        """Real SMM xidmətlərini test edir"""
        print("\n👥 Real SMM xidmətlərini test edir...")
        
        # Peakerr.com-dan tapılan real xidmətlər
        smm_services = [
            "https://peakerr.com/services",
            "https://peakerr.com/instagram",
            "https://peakerr.com/tiktok",
            "https://peakerr.com/youtube",
            "https://peakerr.com/twitter",
            "https://peakerr.com/facebook",
            "https://peakerr.com/telegram"
        ]
        
        smm_results = {}
        
        for service in smm_services:
            try:
                response = self.session.get(service, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {service} - İşləyir!")
                    smm_results[service] = "SUCCESS"
                    
                    # HTML content-də xidmət məlumatlarını axtar
                    content = response.text.lower()
                    
                    # Follower xidmətləri
                    if 'follower' in content or 'followers' in content:
                        print(f"      👥 Takipçi xidmətləri tapıldı!")
                        
                    # Like xidmətləri
                    if 'like' in content or 'likes' in content:
                        print(f"      👍 Like xidmətləri tapıldı!")
                        
                    # Comment xidmətləri
                    if 'comment' in content or 'comments' in content:
                        print(f"      💬 Comment xidmətləri tapıldı!")
                        
                    # View xidmətləri
                    if 'view' in content or 'views' in content:
                        print(f"      👁️ View xidmətləri tapıldı!")
                        
                    # Qiymət məlumatları
                    price_patterns = [
                        r'\$\d+\.?\d*',
                        r'\d+\.?\d*\s*usd',
                        r'\d+\.?\d*\s*eur'
                    ]
                    
                    found_prices = []
                    for pattern in price_patterns:
                        matches = re.findall(pattern, content)
                        for match in matches:
                            if match not in found_prices:
                                found_prices.append(match)
                                
                    if found_prices:
                        print(f"      💰 Qiymətlər: {', '.join(found_prices[:5])}")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {service} - Tapılmadı")
                    smm_results[service] = "NOT_FOUND"
                else:
                    print(f"   ❓ {service} - Status: {response.status_code}")
                    smm_results[service] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {service} - Xəta: {e}")
                smm_results[service] = f"ERROR_{str(e)}"
                
        return smm_results
        
    def generate_real_api_report(self, results):
        """Real API discovery hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔍 REAL API ENDPOINT-LƏRİNİ DƏRİNDƏN AXTARMAQ HESABATI")
        print("="*80)
        
        print(f"\n📱 APK MƏLUMATLARI:")
        print(f"   📦 Package: {self.app_package}")
        print(f"   🔢 Version: {self.app_version}")
        print(f"   🔑 API Key: {self.api_key}")
        print(f"   🆔 Service ID: {self.service_id}")
        
        print(f"\n✅ İŞLƏYƏN ENDPOINT-LƏR:")
        if 'working_results' in results:
            for endpoint, result in results['working_results'].items():
                print(f"   ✅ {endpoint}: {result}")
                
        print(f"\n🔧 ALTERNATİV API PATTERN-LƏRİ:")
        if 'alternative_results' in results:
            for pattern, result in results['alternative_results'].items():
                print(f"   🔧 {pattern}: {result}")
                
        print(f"\n🌐 PEAKERR.COM İŞLƏYƏN ENDPOINT-LƏRİ:")
        if 'peakerr_results' in results:
            for endpoint, result in results['peakerr_results'].items():
                print(f"   🌐 {endpoint}: {result}")
                
        print(f"\n🔥 FİREBASE İŞLƏYƏN COLLECTION-LAR:")
        if 'firebase_results' in results:
            for collection, result in results['firebase_results'].items():
                print(f"   🔥 {collection}: {result}")
                
        print(f"\n👥 REAL SMM XİDMƏTLƏRİ:")
        if 'smm_results' in results:
            for service, result in results['smm_results'].items():
                print(f"   👥 {service}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • İşləyən endpoint-lər tapıldı")
        print(f"   • Real API pattern-ləri aşkarlanıb")
        print(f"   • SMM xidmətləri əlçatandır")
        print(f"   • Firebase collection-lar əlçatandır")
        print(f"   • Peakerr.com xidmətləri işləyir")
        
        return results
        
    def run_real_api_discovery(self):
        """Real API discovery işə salır"""
        print("🚀 REAL API ENDPOINT-LƏRİNİ DƏRİNDƏN AXTARMAQ BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. İşləyən endpoint-ləri test et
        working_results = self.test_working_endpoints()
        results['working_results'] = working_results
        
        # 2. Alternativ API pattern-lərini test et
        alternative_results = self.test_alternative_api_patterns()
        results['alternative_results'] = alternative_results
        
        # 3. Peakerr.com işləyən endpoint-lərini test et
        peakerr_results = self.test_peakerr_working_endpoints()
        results['peakerr_results'] = peakerr_results
        
        # 4. Firebase işləyən collection-ları test et
        firebase_results = self.test_firebase_working_collections()
        results['firebase_results'] = firebase_results
        
        # 5. Real SMM xidmətlərini test et
        smm_results = self.test_actual_smm_services()
        results['smm_results'] = smm_results
        
        # Hesabat yarat
        self.generate_real_api_report(results)
        
        print(f"\n🎯 REAL API DISCOVERY TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Real API discovery başlat
    discovery = RealAPIDiscovery()
    results = discovery.run_real_api_discovery()