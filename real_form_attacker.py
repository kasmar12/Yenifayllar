#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔍 REAL FORM FORMATINI TAPMAQ VƏ SAXTA HESAB YARATMAQ
Bu script real form formatını tapır və saxta hesab yaradır
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

class RealFormAttacker:
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
        
    def analyze_signup_page(self):
        """Signup səhifəsini analiz edir"""
        print("🔍 Signup səhifəsi analiz edilir...")
        
        signup_url = "https://peakerr.com/signup"
        
        try:
            response = self.session.get(signup_url, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Signup səhifəsi yükləndi!")
                
                # HTML content analiz et
                content = response.text
                
                # CSRF token tap
                csrf_match = re.search(r'name="_token"\s+value="([^"]+)"', content)
                if csrf_match:
                    csrf_token = csrf_match.group(1)
                    print(f"      🔒 CSRF Token: {csrf_token[:20]}...")
                else:
                    csrf_token = None
                    print(f"      ⚠️ CSRF Token tapılmadı")
                    
                # Form action URL tap
                form_match = re.search(r'<form[^>]+action="([^"]+)"', content)
                if form_match:
                    form_action = form_match.group(1)
                    if form_action.startswith('/'):
                        form_action = "https://peakerr.com" + form_action
                    print(f"      📝 Form Action: {form_action}")
                else:
                    form_action = signup_url
                    print(f"      📝 Form Action: {form_action} (default)")
                    
                # Required fields tap
                required_fields = []
                field_patterns = [
                    r'name="([^"]+)"[^>]*required',
                    r'required[^>]*name="([^"]+)"',
                    r'<input[^>]+name="([^"]+)"[^>]*>'
                ]
                
                for pattern in field_patterns:
                    matches = re.findall(pattern, content)
                    for match in matches:
                        if match not in required_fields and match not in ['_token', 'submit']:
                            required_fields.append(match)
                            
                print(f"      📋 Tapılan fields: {required_fields}")
                
                # Form method tap
                method_match = re.search(r'<form[^>]+method="([^"]+)"', content)
                form_method = method_match.group(1).upper() if method_match else "POST"
                print(f"      📤 Form Method: {form_method}")
                
                return {
                    'csrf_token': csrf_token,
                    'form_action': form_action,
                    'required_fields': required_fields,
                    'form_method': form_method,
                    'content': content
                }
                
            else:
                print(f"   ❌ Signup səhifəsi yüklənə bilmədi: {response.status_code}")
                return None
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return None
            
    def analyze_login_page(self):
        """Login səhifəsini analiz edir"""
        print("\n🔑 Login səhifəsi analiz edilir...")
        
        login_url = "https://peakerr.com/signin"
        
        try:
            response = self.session.get(login_url, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Login səhifəsi yükləndi!")
                
                # HTML content analiz et
                content = response.text
                
                # CSRF token tap
                csrf_match = re.search(r'name="_token"\s+value="([^"]+)"', content)
                if csrf_match:
                    csrf_token = csrf_match.group(1)
                    print(f"      🔒 CSRF Token: {csrf_token[:20]}...")
                else:
                    csrf_token = None
                    print(f"      ⚠️ CSRF Token tapılmadı")
                    
                # Form action URL tap
                form_match = re.search(r'<form[^>]+action="([^"]+)"', content)
                if form_match:
                    form_action = form_match.group(1)
                    if form_action.startswith('/'):
                        form_action = "https://peakerr.com" + form_action
                    print(f"      📝 Form Action: {form_action}")
                else:
                    form_action = login_url
                    print(f"      📝 Form Action: {form_action} (default)")
                    
                return {
                    'csrf_token': csrf_token,
                    'form_action': form_action,
                    'content': content
                }
                
            else:
                print(f"   ❌ Login səhifəsi yüklənə bilmədi: {response.status_code}")
                return None
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return None
            
    def generate_realistic_fake_data(self):
        """Realistic saxta məlumatlar yaradır"""
        # Realistic username
        username = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        
        # Realistic email
        email = f"{username}@gmail.com"
        
        # Realistic password
        password = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        
        # Realistic phone
        phone = f"+1{random.randint(2000000000, 9999999999)}"
        
        # Realistic name
        first_names = ["John", "Jane", "Mike", "Sarah", "Alex", "Emma", "David", "Lisa", "Robert", "Mary"]
        last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]
        
        first_name = random.choice(first_names)
        last_name = random.choice(last_names)
        
        return {
            "username": username,
            "email": email,
            "password": password,
            "password_confirmation": password,
            "phone": phone,
            "first_name": first_name,
            "last_name": last_name,
            "full_name": f"{first_name} {last_name}",
            "country": "US",
            "city": "New York",
            "zip_code": f"{random.randint(10000, 99999)}"
        }
        
    def create_account_with_real_format(self, form_info):
        """Real form formatı ilə hesab yaradır"""
        print(f"\n👤 Real form formatı ilə hesab yaradılır...")
        
        fake_data = self.generate_realistic_fake_data()
        
        print(f"   📝 Saxta məlumatlar:")
        print(f"      👤 Username: {fake_data['username']}")
        print(f"      📧 Email: {fake_data['email']}")
        print(f"      🔑 Password: {fake_data['password']}")
        print(f"      📱 Phone: {fake_data['phone']}")
        print(f"      👨‍💼 Name: {fake_data['full_name']}")
        
        # Form data hazırla
        form_data = {}
        
        # CSRF token əlavə et
        if form_info['csrf_token']:
            form_data['_token'] = form_info['csrf_token']
            
        # Required fields əlavə et
        for field in form_info['required_fields']:
            if field in fake_data:
                form_data[field] = fake_data[field]
            elif field == 'email':
                form_data[field] = fake_data['email']
            elif field == 'password':
                form_data[field] = fake_data['password']
            elif field == 'name':
                form_data[field] = fake_data['full_name']
            else:
                form_data[field] = fake_data.get(field, 'test')
                
        # Common fields əlavə et
        common_fields = ['username', 'email', 'password', 'password_confirmation', 'phone', 'first_name', 'last_name']
        for field in common_fields:
            if field not in form_data and field in fake_data:
                form_data[field] = fake_data[field]
                
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
                form_info['form_action'], 
                data=form_data, 
                headers=headers, 
                verify=False, 
                timeout=15
            )
            
            print(f"   📊 Response Status: {response.status_code}")
            print(f"   📊 Response Headers: {dict(response.headers)}")
            
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
            
    def login_with_real_format(self, form_info, fake_data):
        """Real form formatı ilə giriş edir"""
        print(f"\n🔑 Real form formatı ilə giriş edilir...")
        
        # Form data hazırla
        form_data = {}
        
        # CSRF token əlavə et
        if form_info['csrf_token']:
            form_data['_token'] = form_info['csrf_token']
            
        # Login fields əlavə et
        form_data['email'] = fake_data['email']
        form_data['password'] = fake_data['password']
        form_data['remember'] = '1'
        
        print(f"   📋 Login data:")
        for key, value in form_data.items():
            print(f"      • {key}: {value}")
            
        try:
            # POST request ilə giriş et
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Referer': 'https://peakerr.com/signin',
                'Origin': 'https://peakerr.com'
            }
            
            response = self.session.post(
                form_info['form_action'], 
                data=form_data, 
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
            "https://peakerr.com/orders"
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
        
    def generate_real_attack_report(self, results):
        """Real hücum hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔍 REAL FORM FORMATINI TAPMAQ VƏ SAXTA HESAB YARATMAQ HESABATI")
        print("="*80)
        
        if 'signup_info' in results:
            print(f"\n📋 SIGNUP FORM MƏLUMATLARI:")
            signup_info = results['signup_info']
            print(f"   🔒 CSRF Token: {'Tapıldı' if signup_info['csrf_token'] else 'Tapılmadı'}")
            print(f"   📝 Form Action: {signup_info['form_action']}")
            print(f"   📤 Form Method: {signup_info['form_method']}")
            print(f"   📋 Required Fields: {', '.join(signup_info['required_fields'])}")
            
        if 'login_info' in results:
            print(f"\n🔑 LOGIN FORM MƏLUMATLARI:")
            login_info = results['login_info']
            print(f"   🔒 CSRF Token: {'Tapıldı' if login_info['csrf_token'] else 'Tapılmadı'}")
            print(f"   📝 Form Action: {login_info['form_action']}")
            
        if 'fake_data' in results:
            print(f"\n👤 SAXTA HESAB MƏLUMATLARI:")
            fake_data = results['fake_data']
            print(f"   👤 Username: {fake_data['username']}")
            print(f"   📧 Email: {fake_data['email']}")
            print(f"   🔑 Password: {fake_data['password']}")
            print(f"   📱 Phone: {fake_data['phone']}")
            print(f"   👨‍💼 Name: {fake_data['full_name']}")
            
        print(f"\n🎯 HÜCUM NƏTİCƏLƏRİ:")
        if 'registration_success' in results:
            print(f"   ✅ Hesab yaradıldı: {results['registration_success']}")
            
        if 'login_success' in results:
            print(f"   🔑 Giriş uğurlu: {results['login_success']}")
            
        print(f"\n🔍 API TEST NƏTİCƏLƏRİ:")
        if 'api_results' in results:
            for endpoint, result in results['api_results'].items():
                print(f"   📊 {endpoint}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Form formatı tapıldı")
        print(f"   • Saxta hesab yaradıla bilər")
        print(f"   • API-yə giriş mümkündür")
        print(f"   • Takipçi xidmətləri əlçatandır")
        
        return results
        
    def run_real_form_attack(self):
        """Real form hücumunu işə salır"""
        print("🚀 REAL FORM FORMATINI TAPMAQ VƏ SAXTA HESAB YARATMAQ BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Signup səhifəsini analiz et
        signup_info = self.analyze_signup_page()
        if signup_info:
            results['signup_info'] = signup_info
            
            # 2. Login səhifəsini analiz et
            login_info = self.analyze_login_page()
            if login_info:
                results['login_info'] = login_info
                
                # 3. Real form formatı ilə hesab yarat
                fake_data, registration_success = self.create_account_with_real_format(signup_info)
                results['fake_data'] = fake_data
                results['registration_success'] = registration_success
                
                # 4. Real form formatı ilə giriş et
                if registration_success:
                    login_success = self.login_with_real_format(login_info, fake_data)
                    results['login_success'] = login_success
                    
                    # 5. SMM API test et
                    if login_success:
                        api_results = self.test_smm_api_after_login()
                        results['api_results'] = api_results
                        
        # Hesabat yarat
        self.generate_real_attack_report(results)
        
        print(f"\n🎯 REAL FORM HÜCUMU TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Real form attacker başlat
    attacker = RealFormAttacker()
    results = attacker.run_real_form_attack()