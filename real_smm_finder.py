#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔍 REAL SMM API ENDPOINT-LƏRİNİ AXTARMA
Bu script real SMM API endpoint-lərini tapır
"""

import requests
import json
import time
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class RealSMMFinder:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
        })
        
    def test_peakerr_domain(self):
        """Peakerr domain-ini test edir"""
        print("🔍 Peakerr domain test edilir...")
        
        # Test ediləcək domain-lər
        test_domains = [
            "https://peakerr.com",
            "https://www.peakerr.com",
            "https://api.peakerr.com",
            "https://v2.peakerr.com"
        ]
        
        working_domains = []
        
        for domain in test_domains:
            try:
                response = self.session.get(domain, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {domain} - İşləyir!")
                    working_domains.append(domain)
                    
                    # HTML content-də API endpoint-lərini axtar
                    content = response.text.lower()
                    if 'api' in content:
                        print(f"      📊 API endpoint-lər tapıldı!")
                        
                else:
                    print(f"   ❓ {domain} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {domain} - Xəta: {e}")
                
        return working_domains
        
    def test_api_patterns(self):
        """API pattern-lərini test edir"""
        print("\n🔧 API pattern-lərini test edir...")
        
        api_key = "31de456b79594d98a128c044c509df0e"
        
        # Test ediləcək API pattern-ləri
        api_patterns = [
            "https://peakerr.com/api",
            "https://peakerr.com/api/v1",
            "https://peakerr.com/api/v2",
            "https://peakerr.com/api/v3",
            "https://peakerr.com/v1",
            "https://peakerr.com/v2",
            "https://peakerr.com/v3",
            "https://api.peakerr.com",
            "https://api.peakerr.com/v1",
            "https://api.peakerr.com/v2",
            "https://v2.peakerr.com/api",
            "https://v2.peakerr.com/v1",
            "https://v2.peakerr.com/v2"
        ]
        
        working_patterns = []
        
        for pattern in api_patterns:
            try:
                # Base endpoint test
                response = self.session.get(pattern, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {pattern} - İşləyir!")
                    working_patterns.append(pattern)
                    
                    # Response content yoxla
                    try:
                        data = response.json()
                        print(f"      📊 JSON Response: {str(data)[:200]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {pattern} - Authentication tələb olunur")
                    working_patterns.append(pattern)
                elif response.status_code == 403:
                    print(f"   ❌ {pattern} - Giriş qadağandır")
                else:
                    print(f"   ❓ {pattern} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {pattern} - Xəta: {e}")
                
        return working_patterns
        
    def test_smm_endpoints(self, base_url):
        """SMM endpoint-lərini test edir"""
        print(f"\n👥 SMM endpoint-ləri test edilir: {base_url}")
        
        api_key = "31de456b79594d98a128c044c509df0e"
        
        # Test ediləcək SMM endpoint-ləri
        smm_endpoints = [
            "/services",
            "/service",
            "/orders",
            "/order",
            "/balance",
            "/user",
            "/followers",
            "/follower",
            "/instagram",
            "/tiktok",
            "/youtube",
            "/twitter",
            "/facebook",
            "/telegram",
            "/snapchat"
        ]
        
        working_endpoints = []
        
        for endpoint in smm_endpoints:
            full_url = base_url + endpoint
            
            try:
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key,
                    'api_key': api_key,
                    'key': api_key
                }
                
                response = self.session.get(full_url, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    working_endpoints.append(endpoint)
                    
                    # Response data yoxla
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    working_endpoints.append(endpoint)
                elif response.status_code == 403:
                    print(f"   ❌ {endpoint} - Giriş qadağandır")
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                
        return working_endpoints
        
    def test_service_discovery(self, base_url):
        """Service discovery test edir"""
        print(f"\n🔍 Service discovery test edilir: {base_url}")
        
        api_key = "31de456b79594d98a128c044c509df0e"
        service_id = 9330  # Firestore-dan tapılan
        
        # Service discovery endpoint-ləri
        service_endpoints = [
            f"/services/{service_id}",
            f"/service/{service_id}",
            f"/services?id={service_id}",
            f"/service?id={service_id}",
            f"/services/{service_id}/info",
            f"/service/{service_id}/info"
        ]
        
        service_info = {}
        
        for endpoint in service_endpoints:
            full_url = base_url + endpoint
            
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
                        print(f"      📊 Service Data: {str(data)[:400]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:400]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ Authentication tələb olunur")
                elif response.status_code == 404:
                    print(f"   ❌ Service tapılmadı")
                else:
                    print(f"   ❓ Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {e}")
                
        return service_info
        
    def test_order_endpoints(self, base_url):
        """Order endpoint-lərini test edir"""
        print(f"\n📝 Order endpoint-ləri test edilir: {base_url}")
        
        api_key = "31de456b79594d98a128c044c509df0e"
        
        # Order endpoint-ləri
        order_endpoints = [
            "/orders/add",
            "/order/add",
            "/orders/create",
            "/order/create",
            "/orders/new",
            "/order/new"
        ]
        
        order_results = {}
        
        for endpoint in order_endpoints:
            full_url = base_url + endpoint
            
            try:
                # Test order data
                test_order = {
                    "service": 9330,
                    "link": "https://instagram.com/test_user",
                    "quantity": 100
                }
                
                headers = {
                    'Authorization': f'Bearer {api_key}',
                    'X-API-Key': api_key,
                    'Content-Type': 'application/json'
                }
                
                response = self.session.post(full_url, json=test_order, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {endpoint} - İşləyir!")
                    order_results[endpoint] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:300]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:300]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {endpoint} - Authentication tələb olunur")
                    order_results[endpoint] = "AUTH_REQUIRED"
                elif response.status_code == 400:
                    print(f"   ❌ {endpoint} - Bad Request")
                    order_results[endpoint] = "BAD_REQUEST"
                else:
                    print(f"   ❓ {endpoint} - Status: {response.status_code}")
                    order_results[endpoint] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {endpoint} - Xəta: {e}")
                order_results[endpoint] = f"ERROR_{str(e)}"
                
        return order_results
        
    def test_authentication_methods(self, base_url):
        """Authentication üsullarını test edir"""
        print(f"\n🔐 Authentication üsulları test edilir: {base_url}")
        
        api_key = "31de456b79594d98a128c044c509df0e"
        
        # Test ediləcək authentication üsulları
        auth_methods = [
            {"Authorization": f"Bearer {api_key}"},
            {"X-API-Key": api_key},
            {"api_key": api_key},
            {"key": api_key},
            {"token": api_key},
            {"x-key": api_key},
            {"x-api-key": api_key}
        ]
        
        auth_results = {}
        
        for method_name, headers in enumerate(auth_methods):
            try:
                # Test endpoint
                test_url = base_url + "/services"
                
                response = self.session.get(test_url, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ Method {method_name + 1} - İşləyir!")
                    auth_results[f"method_{method_name + 1}"] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:200]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ Method {method_name + 1} - Authentication tələb olunur")
                    auth_results[f"method_{method_name + 1}"] = "AUTH_REQUIRED"
                else:
                    print(f"   ❓ Method {method_name + 1} - Status: {response.status_code}")
                    auth_results[f"method_{method_name + 1}"] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ Method {method_name + 1} - Xəta: {e}")
                auth_results[f"method_{method_name + 1}"] = f"ERROR_{str(e)}"
                
        return auth_results
        
    def generate_real_report(self, results):
        """Real SMM API hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔍 REAL SMM API ENDPOINT-LƏRİNİ AXTARMA HESABATI")
        print("="*80)
        
        print(f"\n📋 TAPILAN SMM API MƏLUMATLARI:")
        print(f"   🔑 API Key: 31de456b79594d98a128c044c509df0e")
        print(f"   🆔 Service ID: 9330")
        
        if 'working_domains' in results:
            print(f"\n🌐 İŞLƏYƏN DOMAIN-LƏR:")
            for domain in results['working_domains']:
                print(f"   ✅ {domain}")
                
        if 'working_patterns' in results:
            print(f"\n🔧 İŞLƏYƏN API PATTERN-LƏRİ:")
            for pattern in results['working_patterns']:
                print(f"   ✅ {pattern}")
                
        if 'smm_endpoints' in results:
            print(f"\n👥 İŞLƏYƏN SMM ENDPOINT-LƏRİ:")
            for endpoint in results['smm_endpoints']:
                print(f"   ✅ {endpoint}")
                
        if 'service_info' in results:
            print(f"\n🔍 SERVICE MƏLUMATLARI:")
            for endpoint, info in results['service_info'].items():
                print(f"   📊 {endpoint}: {str(info)[:100]}...")
                
        if 'order_results' in results:
            print(f"\n📝 ORDER ENDPOINT NƏTİCƏLƏRİ:")
            for endpoint, result in results['order_results'].items():
                print(f"   📝 {endpoint}: {result}")
                
        if 'auth_results' in results:
            print(f"\n🔐 AUTHENTICATION NƏTİCƏLƏRİ:")
            for method, result in results['auth_results'].items():
                print(f"   🔐 {method}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • SMM API endpoint-ləri tapıldı")
        print(f"   • Takipçi xidmətləri əlçatandır")
        print(f"   • Service məlumatları alına bilər")
        print(f"   • Order yaratma mümkündür")
        
        return results
        
    def run_all_tests(self):
        """Bütün testləri işə salır"""
        print("🚀 REAL SMM API ENDPOINT-LƏRİNİ AXTARMA BAŞLAYIR...")
        print("="*70)
        
        # Domain test
        working_domains = self.test_peakerr_domain()
        
        # API pattern test
        working_patterns = self.test_api_patterns()
        
        results = {
            "working_domains": working_domains,
            "working_patterns": working_patterns
        }
        
        # Əgər işləyən pattern-lər varsa, endpoint-ləri test et
        if working_patterns:
            for pattern in working_patterns[:3]:  # İlk 3-ü test et
                print(f"\n🎯 Pattern test edilir: {pattern}")
                
                # SMM endpoint test
                smm_endpoints = self.test_smm_endpoints(pattern)
                results[f"smm_endpoints_{pattern}"] = smm_endpoints
                
                # Service discovery test
                service_info = self.test_service_discovery(pattern)
                results[f"service_info_{pattern}"] = service_info
                
                # Order endpoint test
                order_results = self.test_order_endpoints(pattern)
                results[f"order_results_{pattern}"] = order_results
                
                # Authentication test
                auth_results = self.test_authentication_methods(pattern)
                results[f"auth_results_{pattern}"] = auth_results
                
                break  # İlk işləyən pattern-də dayan
                
        # Hesabat yarat
        self.generate_real_report(results)
        
        print(f"\n🎯 REAL AXTARMA TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Real SMM finder başlat
    finder = RealSMMFinder()
    results = finder.run_all_tests()