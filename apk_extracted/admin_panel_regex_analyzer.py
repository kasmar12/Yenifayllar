#!/usr/bin/env python3
# 👑 Admin Panel Regex Analiz Script
# Tapılan admin panel-ləri: /admin, /admin/users, /admin/orders, /admin/services, /admin/settings

import requests
import re
import json
from urllib.parse import urljoin, urlparse

class AdminPanelRegexAnalyzer:
    def __init__(self):
        self.base_url = "https://peakerr.com"
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1'
        })
        
    def analyze_admin_panels(self):
        print("👑 Admin Panel Regex Analiz Başladıldı!")
        print(f"🌐 Base URL: {self.base_url}")
        print("=" * 60)
        
        # 1. Ana Admin Panel Analizi
        self.analyze_main_admin()
        
        # 2. Users Admin Panel Analizi
        self.analyze_users_admin()
        
        # 3. Orders Admin Panel Analizi
        self.analyze_orders_admin()
        
        # 4. Services Admin Panel Analizi
        self.analyze_services_admin()
        
        # 5. Settings Admin Panel Analizi
        self.analyze_settings_admin()
        
        # 6. Admin Panel-dən API Endpoint-ləri Tap
        self.extract_api_endpoints()
        
        # 7. Admin Panel-dən Sensitive Məlumatları Tap
        self.extract_sensitive_data()
        
        print("\n🎯 Admin Panel Analiz Tamamlandı!")

    def analyze_main_admin(self):
        print("\n1️⃣ Ana Admin Panel Analizi (/admin)...")
        
        try:
            response = self.session.get(f"{self.base_url}/admin", timeout=10)
            if response.status_code == 200:
                print(f"   ✅ Status: {response.status_code}")
                print(f"   📊 Content Length: {len(response.content)} bytes")
                
                # Title tap
                title_match = re.search(r'<title[^>]*>(.*?)</title>', response.text, re.IGNORECASE)
                if title_match:
                    print(f"   📋 Title: {title_match.group(1).strip()}")
                
                # Meta tags tap
                meta_tags = re.findall(r'<meta[^>]+>', response.text)
                print(f"   🏷️ Meta Tags: {len(meta_tags)}")
                for i, meta in enumerate(meta_tags[:5]):  # İlk 5-i göstər
                    name_match = re.search(r'name=["\']([^"\']+)["\']', meta)
                    content_match = re.search(r'content=["\']([^"\']+)["\']', meta)
                    if name_match and content_match:
                        print(f"      {name_match.group(1)}: {content_match.group(1)}")
                
                # Form-ları tap
                forms = re.findall(r'<form[^>]*>', response.text)
                print(f"   📝 Forms: {len(forms)}")
                for i, form in enumerate(forms[:3]):  # İlk 3-ü göstər
                    action_match = re.search(r'action=["\']([^"\']*)["\']', form)
                    method_match = re.search(r'method=["\']([^"\']*)["\']', form)
                    action = action_match.group(1) if action_match else 'No action'
                    method = method_match.group(1) if method_match else 'GET'
                    print(f"      Form {i+1}: {method} -> {action}")
                
                # JavaScript fayllarını tap
                scripts = re.findall(r'<script[^>]*src=["\']([^"\']+)["\'][^>]*>', response.text)
                print(f"   📜 External Scripts: {len(scripts)}")
                for script in scripts[:3]:  # İlk 3-ü göstər
                    print(f"      Script: {script}")
                
                # CSS fayllarını tap
                stylesheets = re.findall(r'<link[^>]*rel=["\']stylesheet["\'][^>]*href=["\']([^"\']+)["\'][^>]*>', response.text)
                print(f"   🎨 Stylesheets: {len(stylesheets)}")
                for css in stylesheets[:3]:  # İlk 3-ü göstər
                    print(f"      CSS: {css}")
                
                # Admin links tap
                admin_links = re.findall(r'href=["\']([^"\']*admin[^"\']*)["\']', response.text)
                print(f"   🔗 Admin Links: {len(admin_links)}")
                for link in admin_links[:5]:  # İlk 5-i göstər
                    print(f"      {link}")
                    
            else:
                print(f"   ❌ Status: {response.status_code}")
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")

    def analyze_users_admin(self):
        print("\n2️⃣ Users Admin Panel Analizi (/admin/users)...")
        
        try:
            response = self.session.get(f"{self.base_url}/admin/users", timeout=10)
            if response.status_code == 200:
                print(f"   ✅ Status: {response.status_code}")
                print(f"   📊 Content Length: {len(response.content)} bytes")
                
                # Title tap
                title_match = re.search(r'<title[^>]*>(.*?)</title>', response.text, re.IGNORECASE)
                if title_match:
                    print(f"   📋 Title: {title_match.group(1).strip()}")
                
                # Table-ları tap
                tables = re.findall(r'<table[^>]*>', response.text)
                print(f"   📊 Tables: {len(tables)}")
                
                # User data-ları tap
                user_rows = re.findall(r'<tr[^>]*>.*?</tr>', response.text, re.DOTALL)
                print(f"   👥 User Rows: {len(user_rows)}")
                
                # Form-ları tap
                forms = re.findall(r'<form[^>]*>', response.text)
                print(f"   📝 Forms: {len(forms)}")
                for i, form in enumerate(forms[:3]):
                    action_match = re.search(r'action=["\']([^"\']*)["\']', form)
                    method_match = re.search(r'method=["\']([^"\']*)["\']', form)
                    action = action_match.group(1) if action_match else 'No action'
                    method = method_match.group(1) if method_match else 'GET'
                    print(f"      Form {i+1}: {method} -> {action}")
                
                # JavaScript-də user data tap
                if re.search(r'user', response.text, re.IGNORECASE):
                    print(f"   📜 User-related content found")
                        
            else:
                print(f"   ❌ Status: {response.status_code}")
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")

    def analyze_orders_admin(self):
        print("\n3️⃣ Orders Admin Panel Analizi (/admin/orders)...")
        
        try:
            response = self.session.get(f"{self.base_url}/admin/orders", timeout=10)
            if response.status_code == 200:
                print(f"   ✅ Status: {response.status_code}")
                print(f"   📊 Content Length: {len(response.content)} bytes")
                
                # Title tap
                title_match = re.search(r'<title[^>]*>(.*?)</title>', response.text, re.IGNORECASE)
                if title_match:
                    print(f"   📋 Title: {title_match.group(1).strip()}")
                
                # Table-ları tap
                tables = re.findall(r'<table[^>]*>', response.text)
                print(f"   📊 Tables: {len(tables)}")
                
                # Order data-ları tap
                order_rows = re.findall(r'<tr[^>]*>.*?</tr>', response.text, re.DOTALL)
                print(f"   📦 Order Rows: {len(order_rows)}")
                
                # Form-ları tap
                forms = re.findall(r'<form[^>]*>', response.text)
                print(f"   📝 Forms: {len(forms)}")
                for i, form in enumerate(forms[:3]):
                    action_match = re.search(r'action=["\']([^"\']*)["\']', form)
                    method_match = re.search(r'method=["\']([^"\']*)["\']', form)
                    action = action_match.group(1) if action_match else 'No action'
                    method = method_match.group(1) if method_match else 'GET'
                    print(f"      Form {i+1}: {method} -> {action}")
                
                # JavaScript-də order data tap
                if re.search(r'order', response.text, re.IGNORECASE):
                    print(f"   📜 Order-related content found")
                        
            else:
                print(f"   ❌ Status: {response.status_code}")
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")

    def analyze_services_admin(self):
        print("\n4️⃣ Services Admin Panel Analizi (/admin/services)...")
        
        try:
            response = self.session.get(f"{self.base_url}/admin/services", timeout=10)
            if response.status_code == 200:
                print(f"   ✅ Status: {response.status_code}")
                print(f"   📊 Content Length: {len(response.content)} bytes")
                
                # Title tap
                title_match = re.search(r'<title[^>]*>(.*?)</title>', response.text, re.IGNORECASE)
                if title_match:
                    print(f"   📋 Title: {title_match.group(1).strip()}")
                
                # Table-ları tap
                tables = re.findall(r'<table[^>]*>', response.text)
                print(f"   📊 Tables: {len(tables)}")
                
                # Service data-ları tap
                service_rows = re.findall(r'<tr[^>]*>.*?</tr>', response.text, re.DOTALL)
                print(f"   🛍️ Service Rows: {len(service_rows)}")
                
                # Form-ları tap
                forms = re.findall(r'<form[^>]*>', response.text)
                print(f"   📝 Forms: {len(forms)}")
                for i, form in enumerate(forms[:3]):
                    action_match = re.search(r'action=["\']([^"\']*)["\']', form)
                    method_match = re.search(r'method=["\']([^"\']*)["\']', form)
                    action = action_match.group(1) if action_match else 'No action'
                    method = method_match.group(1) if method_match else 'GET'
                    print(f"      Form {i+1}: {method} -> {action}")
                
                # JavaScript-də service data tap
                if re.search(r'service', response.text, re.IGNORECASE):
                    print(f"   📜 Service-related content found")
                        
            else:
                print(f"   ❌ Status: {response.status_code}")
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")

    def analyze_settings_admin(self):
        print("\n5️⃣ Settings Admin Panel Analizi (/admin/settings)...")
        
        try:
            response = self.session.get(f"{self.base_url}/admin/settings", timeout=10)
            if response.status_code == 200:
                print(f"   ✅ Status: {response.status_code}")
                print(f"   📊 Content Length: {len(response.content)} bytes")
                
                # Title tap
                title_match = re.search(r'<title[^>]*>(.*?)</title>', response.text, re.IGNORECASE)
                if title_match:
                    print(f"   📋 Title: {title_match.group(1).strip()}")
                
                # Form-ları tap
                forms = re.findall(r'<form[^>]*>', response.text)
                print(f"   📝 Forms: {len(forms)}")
                for i, form in enumerate(forms[:3]):
                    action_match = re.search(r'action=["\']([^"\']*)["\']', form)
                    method_match = re.search(r'method=["\']([^"\']*)["\']', form)
                    action = action_match.group(1) if action_match else 'No action'
                    method = method_match.group(1) if method_match else 'GET'
                    print(f"      Form {i+1}: {method} -> {action}")
                
                # Input fields tap
                inputs = re.findall(r'<input[^>]*>', response.text)
                print(f"   ⌨️ Input Fields: {len(inputs)}")
                for i, inp in enumerate(inputs[:5]):  # İlk 5-i göstər
                    type_match = re.search(r'type=["\']([^"\']*)["\']', inp)
                    name_match = re.search(r'name=["\']([^"\']*)["\']', inp)
                    value_match = re.search(r'value=["\']([^"\']*)["\']', inp)
                    input_type = type_match.group(1) if type_match else 'text'
                    input_name = name_match.group(1) if name_match else 'No name'
                    input_value = value_match.group(1) if value_match else 'No value'
                    print(f"      Input {i+1}: {input_type} - {input_name} = {input_value}")
                
                # JavaScript-də settings data tap
                if re.search(r'setting', response.text, re.IGNORECASE):
                    print(f"   📜 Settings-related content found")
                        
            else:
                print(f"   ❌ Status: {response.status_code}")
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")

    def extract_api_endpoints(self):
        print("\n6️⃣ Admin Panel-dən API Endpoint-ləri Tapılır...")
        
        admin_pages = [
            "/admin",
            "/admin/users", 
            "/admin/orders",
            "/admin/services",
            "/admin/settings"
        ]
        
        found_endpoints = set()
        
        for page in admin_pages:
            try:
                response = self.session.get(f"{self.base_url}{page}", timeout=10)
                if response.status_code == 200:
                    # JavaScript-də API endpoint-ləri tap
                    api_patterns = [
                        r'["\'](/api/[^"\']+)["\']',
                        r'["\'](/v\d+/[^"\']+)["\']',
                        r'["\'](/rest/[^"\']+)["\']',
                        r'["\'](/graphql[^"\']*)["\']',
                        r'fetch\(["\']([^"\']+)["\']',
                        r'ajax\(["\']([^"\']+)["\']',
                        r'\.post\(["\']([^"\']+)["\']',
                        r'\.get\(["\']([^"\']+)["\']'
                    ]
                    
                    for pattern in api_patterns:
                        matches = re.findall(pattern, response.text)
                        for match in matches:
                            if match.startswith('/') and 'admin' not in match:
                                found_endpoints.add(match)
                                
            except Exception as e:
                print(f"   ❌ {page}: Xəta - {e}")
        
        if found_endpoints:
            print(f"   🔗 Tapılan API Endpoint-ləri: {len(found_endpoints)}")
            for endpoint in sorted(found_endpoints):
                print(f"      {endpoint}")
        else:
            print("   ❌ API endpoint tapılmadı")

    def extract_sensitive_data(self):
        print("\n7️⃣ Admin Panel-dən Sensitive Məlumatlar Tapılır...")
        
        admin_pages = [
            "/admin",
            "/admin/users", 
            "/admin/orders",
            "/admin/services",
            "/admin/settings"
        ]
        
        sensitive_patterns = [
            r'api_key["\']?\s*[:=]\s*["\']([^"\']{20,})["\']',
            r'token["\']?\s*[:=]\s*["\']([^"\']{20,})["\']',
            r'secret["\']?\s*[:=]\s*["\']([^"\']{20,})["\']',
            r'password["\']?\s*[:=]\s*["\']([^"\']{8,})["\']',
            r'email["\']?\s*[:=]\s*["\']([^@\s]+@[^@\s]+\.[^@\s]+)["\']',
            r'phone["\']?\s*[:=]\s*["\']([+\d\s\-\(\)]{10,})["\']',
            r'ip["\']?\s*[:=]\s*["\'](\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})["\']',
            r'url["\']?\s*[:=]\s*["\'](https?://[^"\']+)["\']',
            r'database["\']?\s*[:=]\s*["\']([^"\']+)["\']',
            r'host["\']?\s*[:=]\s*["\']([^"\']+)["\']'
        ]
        
        found_data = {}
        
        for page in admin_pages:
            try:
                response = self.session.get(f"{self.base_url}{page}", timeout=10)
                if response.status_code == 200:
                    page_data = {}
                    
                    for pattern in sensitive_patterns:
                        matches = re.findall(pattern, response.text, re.IGNORECASE)
                        if matches:
                            page_data[pattern.split('[')[0]] = matches
                    
                    if page_data:
                        found_data[page] = page_data
                        
            except Exception as e:
                print(f"   ❌ {page}: Xəta - {e}")
        
        if found_data:
            print(f"   🔍 Tapılan Sensitive Məlumatlar: {len(found_data)} səhifədə")
            for page, data in found_data.items():
                print(f"\n      📄 {page}:")
                for data_type, values in data.items():
                    print(f"         {data_type}: {len(values)} tapıldı")
                    for value in values[:3]:  # İlk 3-ü göstər
                        print(f"            {value[:50]}...")
        else:
            print("   ❌ Sensitive məlumat tapılmadı")

if __name__ == "__main__":
    analyzer = AdminPanelRegexAnalyzer()
    analyzer.analyze_admin_panels()