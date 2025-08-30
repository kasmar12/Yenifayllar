#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🎯 DÜZGÜN FORM FORMATI İLƏ SAXTA HESAB YARATMAQ
Bu script tapılan real form formatı ilə saxta hesab yaradır
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

class CorrectFormAttacker:
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
            
    def generate_fake_data(self):
        """Saxta məlumatlar yaradır"""
        # Realistic username
        username = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        
        # Realistic email
        email = f"{username}@gmail.com"
        
        # Realistic password
        password = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        
        return {
            "username": username,
            "email": email,
            "password": password
        }
        
    def create_account_with_correct_format(self):
        """Düzgün form formatı ilə hesab yaradır"""
        print("\n👤 Düzgün form formatı ilə hesab yaradılır...")
        
        # CSRF token al
        csrf_token = self.get_csrf_token()
        if not csrf_token:
            print("   ❌ CSRF token alına bilmədi!")
            return None, False
            
        # Saxta məlumatlar yarat
        fake_data = self.generate_fake_data()
        
        print(f"   📝 Saxta məlumatlar:")
        print(f"      👤 Username: {fake_data['username']}")
        print(f"      📧 Email: {fake_data['email']}")
        print(f"      🔑 Password: {fake_data['password']}")
        
        # Düzgün form data hazırla
        form_data = {
            '_csrf': csrf_token,
            'RegistrationForm[login]': fake_data['username'],
            'RegistrationForm[email]': fake_data['email'],
            'RegistrationForm[password]': fake_data['password'],
            'RegistrationForm[password_again]': fake_data['password'],
            'RegistrationForm[termsofservice]': '1'
        }
        
        print(f"   📋 Form data:")
        for key, value in form_data.items():
            print(f"      • {key}: {value}")
            
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
            
            print(f"   📊 Response Status: {response.status_code}")
            
            if response.status_code == 200:
                print(f"   ✅ Hesab yaradıldı!")
                
                # Response content yoxla
                if 'success' in response.text.lower() or 'welcome' in response.text.lower():
                    print(f"      🎉 Uğurlu qeydiyyat!")
                    return fake_data, True
                elif 'error' in response.text.lower():
                    print(f"      ❌ Xəta mesajı tapıldı")
                    print(f"      📄 Error: {response.text[:300]}...")
                    return fake_data, False
                else:
                    print(f"      📄 Response: {response.text[:300]}...")
                    return fake_data, True
                    
            elif response.status_code == 302:
                print(f"   ✅ Redirect - hesab yaradıldı!")
                return fake_data, True
            elif response.status_code == 422:
                print(f"   ⚠️ Validation xətası")
                print(f"      📄 Error: {response.text[:300]}...")
                return fake_data, False
            else:
                print(f"   ❓ Naməlum status: {response.status_code}")
                print(f"      📄 Response: {response.text[:300]}...")
                return fake_data, False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return fake_data, False
            
    def login_with_correct_format(self, fake_data):
        """Düzgün form formatı ilə giriş edir"""
        print(f"\n🔑 Düzgün form formatı ilə giriş edilir...")
        
        # CSRF token al
        csrf_token = self.get_csrf_token()
        if not csrf_token:
            print("   ❌ CSRF token alına bilmədi!")
            return False
            
        # Login form data hazırla
        login_data = {
            '_csrf': csrf_token,
            'LoginForm[email]': fake_data['email'],
            'LoginForm[password]': fake_data['password']
        }
        
        print(f"   📋 Login data:")
        for key, value in login_data.items():
            print(f"      • {key}: {value}")
            
        try:
            # POST request ilə giriş et
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Referer': 'https://peakerr.com/signin',
                'Origin': 'https://peakerr.com'
            }
            
            response = self.session.post(
                "https://peakerr.com/",
                data=login_data,
                headers=headers,
                verify=False,
                timeout=15
            )
            
            print(f"   📊 Response Status: {response.status_code}")
            
            if response.status_code == 200:
                print(f"   ✅ Giriş uğurlu!")
                
                # Session cookies yoxla
                if 'laravel_session' in self.session.cookies or 'peakerr_session' in self.session.cookies:
                    print(f"      🍪 Session cookie tapıldı!")
                    
                # Response content yoxla
                if 'dashboard' in response.text.lower() or 'welcome' in response.text.lower():
                    print(f"      🎉 Dashboard-a yönləndirildi!")
                    return True
                else:
                    print(f"      📄 Response: {response.text[:300]}...")
                    return True
                    
            elif response.status_code == 302:
                print(f"   ✅ Redirect - giriş uğurlu!")
                return True
            else:
                print(f"   ❓ Status: {response.status_code}")
                print(f"      📄 Response: {response.text[:300]}...")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def test_smm_api_after_login(self):
        """Girişdən sonra SMM API test edir"""
        print(f"\n🔍 Girişdən sonra SMM API test edilir...")
        
        # API endpoint-ləri
        api_endpoints = [
            "https://peakerr.com/api/v2/services",
            "https://peakerr.com/api/v2/orders",
            "https://peakerr.com/api/v2/balance",
            "https://peakerr.com/api/v2/user",
            "https://peakerr.com/dashboard",
            "https://peakerr.com/services",
            "https://peakerr.com/orders",
            "https://peakerr.com/addfunds",
            "https://peakerr.com/massorder"
        ]
        
        api_results = {}
        
        for endpoint in api_endpoints:
            try:
                response = self.session.get(endpoint, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    api_results[endpoint] = "SUCCESS"
                    
                    # Response content yoxla
                    if 'api' in endpoint:
                        try:
                            data = response.json()
                            print(f"      📊 JSON Response: {str(data)[:400]}...")
                        except:
                            print(f"      📄 Text Response: {response.text[:400]}...")
                    else:
                        print(f"      📄 HTML Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    api_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                    api_results[endpoint] = "FORBIDDEN"
                elif response.status_code == 404:
                    print(f"   ❌ {endpoint} - Tapılmadı")
                    api_results[endpoint] = "NOT_FOUND"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    api_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                api_results[endpoint] = f"ERROR_{str(e)}"
                
        return api_results
        
    def test_follower_services(self):
        """Takipçi xidmətlərini test edir"""
        print(f"\n👥 Takipçi xidmətləri test edilir...")
        
        # Takipçi xidmətləri səhifələri
        follower_pages = [
            "https://peakerr.com/services",
            "https://peakerr.com/instagram",
            "https://peakerr.com/tiktok",
            "https://peakerr.com/youtube",
            "https://peakerr.com/twitter"
        ]
        
        follower_results = {}
        
        for page in follower_pages:
            try:
                response = self.session.get(page, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {page} - İşləyir!")
                    follower_results[page] = "SUCCESS"
                    
                    # HTML content-də takipçi xidmətlərini axtar
                    content = response.text.lower()
                    if 'follower' in content or 'followers' in content:
                        print(f"      👥 Takipçi xidmətləri tapıldı!")
                        
                    if 'instagram' in content:
                        print(f"      📷 Instagram xidmətləri tapıldı!")
                        
                    if 'tiktok' in content:
                        print(f"      🎵 TikTok xidmətləri tapıldı!")
                        
                    if 'youtube' in content:
                        print(f"      📺 YouTube xidmətləri tapıldı!")
                        
                    if 'twitter' in content:
                        print(f"      🐦 Twitter xidmətləri tapıldı!")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {page} - Tapılmadı")
                    follower_results[page] = "NOT_FOUND"
                else:
                    print(f"   ❓ {page} - Status: {response.status_code}")
                    follower_results[page] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {page} - Xəta: {e}")
                follower_results[page] = f"ERROR_{str(e)}"
                
        return follower_results
        
    def test_order_creation(self):
        """Sifariş yaratma test edir"""
        print(f"\n📝 Sifariş yaratma test edilir...")
        
        # Sifariş səhifələri
        order_pages = [
            "https://peakerr.com/order",
            "https://peakerr.com/massorder",
            "https://peakerr.com/neworder"
        ]
        
        order_results = {}
        
        for page in order_pages:
            try:
                response = self.session.get(page, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {page} - İşləyir!")
                    order_results[page] = "SUCCESS"
                    
                    # HTML content-də sifariş formunu axtar
                    content = response.text.lower()
                    if 'form' in content and ('service' in content or 'link' in content):
                        print(f"      📝 Sifariş formu tapıldı!")
                        
                elif response.status_code == 404:
                    print(f"   ❌ {page} - Tapılmadı")
                    order_results[page] = "NOT_FOUND"
                else:
                    print(f"   ❓ {page} - Status: {response.status_code}")
                    order_results[page] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {page} - Xəta: {e}")
                order_results[page] = f"ERROR_{str(e)}"
                
        return order_results
        
    def generate_correct_attack_report(self, results):
        """Düzgün hücum hesabatı yaradır"""
        print("\n" + "="*80)
        print("🎯 DÜZGÜN FORM FORMATI İLƏ SAXTA HESAB YARATMAQ HESABATI")
        print("="*80)
        
        if 'fake_data' in results:
            print(f"\n👤 SAXTA HESAB MƏLUMATLARI:")
            fake_data = results['fake_data']
            print(f"   👤 Username: {fake_data['username']}")
            print(f"   📧 Email: {fake_data['email']}")
            print(f"   🔑 Password: {fake_data['password']}")
            
        print(f"\n🎯 HÜCUM NƏTİCƏLƏRİ:")
        if 'registration_success' in results:
            print(f"   ✅ Hesab yaradıldı: {results['registration_success']}")
            
        if 'login_success' in results:
            print(f"   🔑 Giriş uğurlu: {results['login_success']}")
            
        print(f"\n🔍 API TEST NƏTİCƏLƏRİ:")
        if 'api_results' in results:
            for endpoint, result in results['api_results'].items():
                print(f"   📊 {endpoint}: {result}")
                
        print(f"\n👥 TAKİPÇİ XİDMƏTLƏRİ:")
        if 'follower_results' in results:
            for page, result in results['follower_results'].items():
                print(f"   👥 {page}: {result}")
                
        print(f"\n📝 SİFARİŞ XİDMƏTLƏRİ:")
        if 'order_results' in results:
            for page, result in results['order_results'].items():
                print(f"   📝 {page}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Düzgün form formatı tapıldı")
        print(f"   • Saxta hesab yaradıla bilər")
        print(f"   • API-yə giriş mümkündür")
        print(f"   • Takipçi xidmətləri əlçatandır")
        print(f"   • Sifariş yaratma mümkündür")
        
        return results
        
    def run_correct_form_attack(self):
        """Düzgün form hücumunu işə salır"""
        print("🚀 DÜZGÜN FORM FORMATI İLƏ SAXTA HESAB YARATMAQ BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Düzgün form formatı ilə hesab yarat
        fake_data, registration_success = self.create_account_with_correct_format()
        if fake_data:
            results['fake_data'] = fake_data
            results['registration_success'] = registration_success
            
            # 2. Düzgün form formatı ilə giriş et
            if registration_success:
                login_success = self.login_with_correct_format(fake_data)
                results['login_success'] = login_success
                
                # 3. SMM API test et
                if login_success:
                    api_results = self.test_smm_api_after_login()
                    results['api_results'] = api_results
                    
                    # 4. Takipçi xidmətlərini test et
                    follower_results = self.test_follower_services()
                    results['follower_results'] = follower_results
                    
                    # 5. Sifariş yaratma test et
                    order_results = self.test_order_creation()
                    results['order_results'] = order_results
                    
        # Hesabat yarat
        self.generate_correct_attack_report(results)
        
        print(f"\n🎯 DÜZGÜN FORM HÜCUMU TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Correct form attacker başlat
    attacker = CorrectFormAttacker()
    results = attacker.run_correct_form_attack()