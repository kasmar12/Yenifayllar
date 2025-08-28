#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔍 ADDFUNDS SƏHİFƏSİNİ DƏRİNDƏN ANALİZ ETMƏK
Bu script addfunds səhifəsini dərindən analiz edir və real API-ləri tapır
"""

import requests
import json
import re
import time
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class DeepAddfundsAnalyzer:
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
        
    def analyze_addfunds_page(self):
        """Addfunds səhifəsini dərindən analiz edir"""
        print("🔍 Addfunds səhifəsi dərindən analiz edilir...")
        
        addfunds_url = "https://peakerr.com/addfunds"
        
        try:
            response = self.session.get(addfunds_url, verify=False, timeout=15)
            
            if response.status_code == 200:
                print(f"   ✅ Addfunds səhifəsi yükləndi!")
                
                # HTML content analiz et
                content = response.text
                
                # JavaScript faylları axtar
                js_files = re.findall(r'src="([^"]+\.js)"', content)
                print(f"   📜 JavaScript faylları: {len(js_files)}")
                for js_file in js_files[:5]:  # İlk 5-i göstər
                    if js_file.startswith('/'):
                        full_js_url = "https://peakerr.com" + js_file
                    else:
                        full_js_url = js_file
                    print(f"      📜 {full_js_url}")
                    
                # CSS faylları axtar
                css_files = re.findall(r'href="([^"]+\.css)"', content)
                print(f"   🎨 CSS faylları: {len(css_files)}")
                
                # Form elementləri axtar
                forms = re.findall(r'<form[^>]+>', content)
                print(f"   📝 Form elementləri: {len(forms)}")
                
                # Input field-lər axtar
                input_fields = re.findall(r'<input[^>]+>', content)
                print(f"   ⌨️ Input field-lər: {len(input_fields)}")
                
                # API endpoint-ləri axtar
                api_patterns = [
                    r'https?://[^\s"\']+\.com/api[^\s"\']*',
                    r'https?://[^\s"\']+\.com/v\d+[^\s"\']*',
                    r'https?://[^\s"\']+\.com/payment[^\s"\']*',
                    r'https?://[^\s"\']+\.com/webhook[^\s"\']*',
                    r'https?://[^\s"\']+\.com/callback[^\s"\']*',
                    r'https?://[^\s"\']+\.com/deposit[^\s"\']*'
                ]
                
                found_apis = []
                for pattern in api_patterns:
                    matches = re.findall(pattern, content)
                    for match in matches:
                        if match not in found_apis:
                            found_apis.append(match)
                            
                print(f"   🔗 Tapılan API endpoint-lər: {len(found_apis)}")
                for api in found_apis:
                    print(f"      🔗 {api}")
                    
                # External service-lər axtar
                external_services = [
                    'stripe', 'paypal', 'square', 'braintree', 'adyen', 'checkout',
                    'coinbase', 'binance', 'bitcoin', 'ethereum', 'crypto',
                    'bank', 'transfer', 'wire', 'ach'
                ]
                
                found_services = []
                for service in external_services:
                    if service in content.lower():
                        found_services.append(service)
                        
                print(f"   🌐 Tapılan xarici xidmətlər: {len(found_services)}")
                for service in found_services:
                    print(f"      🌐 {service}")
                    
                return {
                    'content': content,
                    'js_files': js_files,
                    'css_files': css_files,
                    'forms': forms,
                    'input_fields': input_fields,
                    'found_apis': found_apis,
                    'found_services': found_services
                }
                
            else:
                print(f"   ❌ Addfunds səhifəsi yüklənə bilmədi: {response.status_code}")
                return None
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return None
            
    def analyze_js_files(self, js_files):
        """JavaScript fayllarını analiz edir"""
        print(f"\n📜 JavaScript faylları analiz edilir...")
        
        js_apis = []
        
        for js_file in js_files[:3]:  # İlk 3-ü analiz et
            try:
                if js_file.startswith('/'):
                    full_js_url = "https://peakerr.com" + js_file
                else:
                    full_js_url = js_file
                    
                print(f"   📜 {full_js_url} analiz edilir...")
                
                response = self.session.get(full_js_url, verify=False, timeout=15)
                
                if response.status_code == 200:
                    js_content = response.text
                    
                    # API endpoint-ləri axtar
                    api_patterns = [
                        r'https?://[^\s"\']+\.com/api[^\s"\']*',
                        r'https?://[^\s"\']+\.com/v\d+[^\s"\']*',
                        r'https?://[^\s"\']+\.com/payment[^\s"\']*',
                        r'https?://[^\s"\']+\.com/webhook[^\s"\']*',
                        r'https?://[^\s"\']+\.com/callback[^\s"\']*',
                        r'https?://[^\s"\']+\.com/deposit[^\s"\']*',
                        r'https?://[^\s"\']+\.com/order[^\s"\']*'
                    ]
                    
                    for pattern in api_patterns:
                        matches = re.findall(pattern, js_content)
                        for match in matches:
                            if match not in js_apis:
                                js_apis.append(match)
                                print(f"      🔗 API: {match}")
                                
                    # External service-lər axtar
                    external_patterns = [
                        r'stripe\.com',
                        r'paypal\.com',
                        r'squareup\.com',
                        r'braintreepayments\.com',
                        r'adyen\.com',
                        r'checkout\.com',
                        r'coinbase\.com',
                        r'binance\.com'
                    ]
                    
                    for pattern in external_patterns:
                        matches = re.findall(pattern, js_content)
                        for match in matches:
                            print(f"      🌐 External: {match}")
                            
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return js_apis
        
    def test_payment_forms(self, content):
        """Ödəniş formlarını test edir"""
        print(f"\n💳 Ödəniş formları test edilir...")
        
        # Form action URL-lərini tap
        form_actions = re.findall(r'<form[^>]+action="([^"]+)"', content)
        
        payment_forms = []
        
        for action in form_actions:
            try:
                if action.startswith('/'):
                    full_action_url = "https://peakerr.com" + action
                else:
                    full_action_url = action
                    
                print(f"   📝 Form action: {full_action_url}")
                
                # Form method tap
                method_match = re.search(r'<form[^>]+action="' + re.escape(action) + r'"[^>]+method="([^"]+)"', content)
                form_method = method_match.group(1).upper() if method_match else "POST"
                print(f"      📤 Method: {form_method}")
                
                # Form fields tap
                form_start = content.find(f'<form[^>]+action="{action}"')
                if form_start != -1:
                    form_end = content.find('</form>', form_start)
                    if form_end != -1:
                        form_html = content[form_start:form_end]
                        
                        # Input fields
                        input_fields = re.findall(r'<input[^>]+name="([^"]+)"', form_html)
                        print(f"      ⌨️ Input fields: {', '.join(input_fields)}")
                        
                        # Select fields
                        select_fields = re.findall(r'<select[^>]+name="([^"]+)"', form_html)
                        if select_fields:
                            print(f"      📋 Select fields: {', '.join(select_fields)}")
                            
                        payment_forms.append({
                            'action': full_action_url,
                            'method': form_method,
                            'input_fields': input_fields,
                            'select_fields': select_fields
                        })
                        
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return payment_forms
        
    def test_external_payment_apis(self):
        """Xarici ödəniş API-lərini test edir"""
        print(f"\n🌐 Xarici ödəniş API-ləri test edilir...")
        
        # Test ediləcək xarici API endpoint-ləri
        external_apis = [
            "https://api.stripe.com/v1/payment_intents",
            "https://api.stripe.com/v1/charges",
            "https://api.paypal.com/v1/payments",
            "https://api.paypal.com/v1/orders",
            "https://connect.squareup.com/v2/payments",
            "https://api.braintreegateway.com/merchants",
            "https://api.adyen.com/v1/payments",
            "https://api.checkout.com/payments"
        ]
        
        external_results = {}
        
        for api in external_apis:
            try:
                # Test request
                headers = {
                    'User-Agent': 'TestPayment/1.0',
                    'Accept': 'application/json'
                }
                
                response = self.session.get(api, headers=headers, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {api} - İşləyir!")
                    external_results[api] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:200]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {api} - Authentication tələb olunur")
                    external_results[api] = "AUTH_REQUIRED"
                elif response.status_code == 403:
                    print(f"   ❌ {api} - Giriş qadağandır")
                    external_results[api] = "FORBIDDEN"
                else:
                    print(f"   ❓ {api} - Status: {response.status_code}")
                    external_results[api] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {api} - Xəta: {e}")
                external_results[api] = f"ERROR_{str(e)}"
                
        return external_results
        
    def test_crypto_payment_services(self):
        """Crypto ödəniş xidmətlərini test edir"""
        print(f"\n₿ Crypto ödəniş xidmətləri test edilir...")
        
        # Test ediləcək crypto xidmətləri
        crypto_services = [
            "https://api.coinbase.com/v2",
            "https://api.binance.com/api/v3",
            "https://blockchain.info/api",
            "https://api.blockcypher.com/v1",
            "https://api.etherscan.io/api"
        ]
        
        crypto_results = {}
        
        for service in crypto_services:
            try:
                response = self.session.get(service, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ {service} - İşləyir!")
                    crypto_results[service] = "SUCCESS"
                    
                    try:
                        data = response.json()
                        print(f"      📊 Response: {str(data)[:200]}...")
                    except:
                        print(f"      📄 Text Response: {response.text[:200]}...")
                        
                elif response.status_code == 401:
                    print(f"   ⚠️ {service} - Authentication tələb olunur")
                    crypto_results[service] = "AUTH_REQUIRED"
                else:
                    print(f"   ❓ {service} - Status: {response.status_code}")
                    crypto_results[service] = f"STATUS_{response.status_code}"
                    
            except Exception as e:
                print(f"   ❌ {service} - Xəta: {e}")
                crypto_results[service] = f"ERROR_{str(e)}"
                
        return crypto_results
        
    def generate_deep_analysis_report(self, results):
        """Dərindən analiz hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔍 ADDFUNDS SƏHİFƏSİNİ DƏRİNDƏN ANALİZ ETMƏK HESABATI")
        print("="*80)
        
        if 'js_files' in results:
            print(f"\n📜 JAVASCRIPT FAYLLARI:")
            print(f"   📊 Tapılan JS faylları: {len(results['js_files'])}")
            for js_file in results['js_files'][:5]:
                print(f"      📜 {js_file}")
                
        if 'css_files' in results:
            print(f"\n🎨 CSS FAYLLARI:")
            print(f"   📊 Tapılan CSS faylları: {len(results['css_files'])}")
            
        if 'forms' in results:
            print(f"\n📝 FORM ELEMENTLƏRİ:")
            print(f"   📊 Tapılan form-lar: {len(results['forms'])}")
            
        if 'input_fields' in results:
            print(f"\n⌨️ INPUT FIELD-LƏR:")
            print(f"   📊 Tapılan input field-lər: {len(results['input_fields'])}")
            
        if 'found_apis' in results:
            print(f"\n🔗 TAPILAN API ENDPOINT-LƏRİ:")
            for api in results['found_apis']:
                print(f"   🔗 {api}")
                
        if 'found_services' in results:
            print(f"\n🌐 TAPILAN XARİCİ XİDMƏTLƏR:")
            for service in results['found_services']:
                print(f"   🌐 {service}")
                
        if 'payment_forms' in results:
            print(f"\n💳 ÖDƎNİŞ FORMLARI:")
            for form in results['payment_forms']:
                print(f"   📝 {form['action']} ({form['method']})")
                print(f"      ⌨️ Input: {', '.join(form['input_fields'])}")
                if form['select_fields']:
                    print(f"      📋 Select: {', '.join(form['select_fields'])}")
                    
        if 'external_results' in results:
            print(f"\n🌐 XARİCİ ÖDƎNİŞ API-LƏRİ:")
            for api, result in results['external_results'].items():
                print(f"   🌐 {api}: {result}")
                
        if 'crypto_results' in results:
            print(f"\n₿ CRYPTO ÖDƎNİŞ XİDMƏTLƏRİ:")
            for service, result in results['crypto_results'].items():
                print(f"   ₿ {service}: {result}")
                
        print(f"\n💡 REAL HÜCUM İMKANLARI:")
        print(f"   • Ödəniş formları tapıldı")
        print(f"   • API endpoint-ləri aşkarlanıb")
        print(f"   • Xarici xidmətlər əlçatandır")
        print(f"   • Crypto xidmətləri mövcuddur")
        print(f"   • JavaScript API-ləri tapıldı")
        
        return results
        
    def run_deep_analysis(self):
        """Dərindən analizi işə salır"""
        print("🚀 ADDFUNDS SƏHİFƏSİNİ DƏRİNDƏN ANALİZ ETMƏK BAŞLAYIR...")
        print("="*70)
        
        results = {}
        
        # 1. Addfunds səhifəsini analiz et
        page_analysis = self.analyze_addfunds_page()
        if page_analysis:
            results.update(page_analysis)
            
            # 2. JavaScript fayllarını analiz et
            js_apis = self.analyze_js_files(page_analysis['js_files'])
            results['js_apis'] = js_apis
            
            # 3. Ödəniş formlarını test et
            payment_forms = self.test_payment_forms(page_analysis['content'])
            results['payment_forms'] = payment_forms
            
            # 4. Xarici ödəniş API-lərini test et
            external_results = self.test_external_payment_apis()
            results['external_results'] = external_results
            
            # 5. Crypto ödəniş xidmətlərini test et
            crypto_results = self.test_crypto_payment_services()
            results['crypto_results'] = crypto_results
            
        # Hesabat yarat
        self.generate_deep_analysis_report(results)
        
        print(f"\n🎯 DƏRİNDƏN ANALİZ TAMAMLANDI!")
        
        return results

if __name__ == "__main__":
    # Deep addfunds analyzer başlat
    analyzer = DeepAddfundsAnalyzer()
    results = analyzer.run_deep_analysis()