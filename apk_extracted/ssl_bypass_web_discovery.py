#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Tikio APK SSL Bypass və Web Sayt Discovery
Bu script APK fayllarında SSL bypass imkanları və real web saytları axtarır
"""

import os
import re
import json
from pathlib import Path
from urllib.parse import urlparse

class SSLBypassWebDiscovery:
    def __init__(self, apk_dir):
        self.apk_dir = Path(apk_dir)
        self.results = {}
        
    def search_ssl_tls_keywords(self):
        """SSL/TLS açar sözlərini axtarır"""
        print("🔒 SSL/TLS açar sözləri axtarılır...")
        
        ssl_keywords = [
            'ssl', 'tls', 'https', 'http', 'certificate', 'trustmanager',
            'x509', 'keystore', 'sslsocket', 'sslexception', 'certificateexception',
            'trustmanagerfactory', 'keymanager', 'keymanagerfactory'
        ]
        
        found_ssl = {}
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for keyword in ssl_keywords:
                            matches = re.findall(rf'\b{keyword}\w*\b', content, re.IGNORECASE)
                            if matches:
                                found_ssl[f"{dex_file}:{keyword}"] = len(matches)
                                
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['ssl_keywords'] = found_ssl
        print(f"   🔒 Tapılan SSL/TLS açar sözlər: {len(found_ssl)}")
        
    def search_web_urls(self):
        """Web URL-lərini axtarır"""
        print("🌐 Web URL-ləri axtarılır...")
        
        url_patterns = [
            r'https?://[^\s<>"\']+',
            r'http://[^\s<>"\']+',
            r'www\.[^\s<>"\']+',
            r'[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'
        ]
        
        found_urls = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in url_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            found_urls.extend(matches)
                            
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        # URL-ləri təmizlə və təkrarlanmaları sil
        clean_urls = []
        for url in found_urls:
            if url.startswith('http'):
                clean_urls.append(url)
            elif '.' in url and len(url) > 5:
                clean_urls.append(f"https://{url}")
                
        # Təkrarlanmaları sil
        clean_urls = list(set(clean_urls))
        
        self.results['web_urls'] = clean_urls
        print(f"   🌐 Tapılan web URL-lər: {len(clean_urls)}")
        
    def search_firebase_domains(self):
        """Firebase domain-lərini axtarır"""
        print("🔥 Firebase domain-ləri axtarılır...")
        
        firebase_patterns = [
            r'tikio-v4',
            r'firebase\.google\.com',
            r'googleapis\.com',
            r'appspot\.com',
            r'firebaseapp\.com'
        ]
        
        firebase_domains = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in firebase_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            firebase_domains.extend(matches)
                            
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['firebase_domains'] = list(set(firebase_domains))
        print(f"   🔥 Firebase domain-lər: {len(self.results['firebase_domains'])}")
        
    def search_ssl_bypass_vulnerabilities(self):
        """SSL bypass vulnerability-lərini axtarır"""
        print("⚠️ SSL bypass vulnerability-ləri axtarılır...")
        
        bypass_patterns = [
            r'TrustManagerFactory',
            r'X509TrustManager',
            r'SSLContext',
            r'SSLSocketFactory',
            r'HostnameVerifier',
            r'ALLOW_ALL_HOSTNAME_VERIFIER',
            r'TrustAllCerts',
            r'acceptAllCerts',
            r'checkServerTrusted',
            r'checkClientTrusted'
        ]
        
        bypass_vulns = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in bypass_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            if matches:
                                bypass_vulns.append(f"{dex_file}:{pattern}")
                                
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['ssl_bypass_vulns'] = bypass_vulns
        print(f"   ⚠️ SSL bypass vulnerability-lər: {len(bypass_vulns)}")
        
    def search_network_security_config(self):
        """Network security config fayllarını axtarır"""
        print("🛡️ Network security config axtarılır...")
        
        security_configs = []
        
        # Network security config XML fayllarını axtar
        xml_files = list(self.apk_dir.glob('**/*.xml'))
        for xml_file in xml_files:
            try:
                with open(xml_file, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if 'network-security-config' in content or 'domain-config' in content:
                        security_configs.append(str(xml_file))
            except Exception as e:
                continue
                
        self.results['network_security_configs'] = security_configs
        print(f"   🛡️ Network security config faylları: {len(security_configs)}")
        
    def search_api_endpoints(self):
        """API endpoint-lərini axtarır"""
        print("🔌 API endpoint-ləri axtarılır...")
        
        api_patterns = [
            r'https?://[^\s<>"\']*/api/[^\s<>"\']*',
            r'https?://[^\s<>"\']*/v[0-9]+/[^\s<>"\']*',
            r'https?://[^\s<>"\']*/rest/[^\s<>"\']*',
            r'https?://[^\s<>"\']*/graphql',
            r'https?://[^\s<>"\']*/endpoint/[^\s<>"\']*'
        ]
        
        api_endpoints = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in api_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            api_endpoints.extend(matches)
                            
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['api_endpoints'] = list(set(api_endpoints))
        print(f"   🔌 API endpoint-lər: {len(self.results['api_endpoints'])}")
        
    def categorize_urls(self):
        """URL-ləri kateqoriyalara bölür"""
        print("📊 URL-lər kateqoriyalara bölünür...")
        
        categories = {
            'firebase': [],
            'google_services': [],
            'social_media': [],
            'payment': [],
            'analytics': [],
            'other': []
        }
        
        for url in self.results.get('web_urls', []):
            if 'firebase' in url or 'tikio' in url or 'appspot' in url:
                categories['firebase'].append(url)
            elif 'googleapis' in url or 'google.com' in url:
                categories['google_services'].append(url)
            elif 'facebook' in url or 'twitter' in url or 'linkedin' in url:
                categories['social_media'].append(url)
            elif 'paypal' in url or 'stripe' in url:
                categories['payment'].append(url)
            elif 'analytics' in url or 'tracking' in url:
                categories['analytics'].append(url)
            else:
                categories['other'].append(url)
                
        self.results['url_categories'] = categories
        print(f"   📊 URL kateqoriyaları yaradıldı")
        
    def generate_ssl_bypass_report(self):
        """SSL bypass hesabatı yaradır"""
        print("📊 SSL bypass hesabatı yaradılır...")
        
        report = {
            'summary': {
                'total_ssl_keywords': len(self.results.get('ssl_keywords', {})),
                'total_web_urls': len(self.results.get('web_urls', [])),
                'total_firebase_domains': len(self.results.get('firebase_domains', [])),
                'total_ssl_bypass_vulns': len(self.results.get('ssl_bypass_vulns', [])),
                'total_network_security_configs': len(self.results.get('network_security_configs', [])),
                'total_api_endpoints': len(self.results.get('api_endpoints', []))
            },
            'ssl_bypass_likelihood': 'Orta',
            'recommended_actions': []
        }
        
        # SSL bypass ehtimalını hesabla
        total_vulns = len(self.results.get('ssl_bypass_vulns', []))
        total_configs = len(self.results.get('network_security_configs', []))
        
        if total_vulns >= 5 or total_configs == 0:
            report['ssl_bypass_likelihood'] = 'Yüksək'
            report['recommended_actions'].append('SSL bypass mümkün ola bilər')
        elif total_vulns >= 2:
            report['ssl_bypass_likelihood'] = 'Orta'
            report['recommended_actions'].append('SSL bypass ehtimalı var')
        else:
            report['ssl_bypass_likelihood'] = 'Aşağı'
            report['recommended_actions'].append('SSL bypass ehtimalı azdır')
            
        # Network security config yoxdursa
        if total_configs == 0:
            report['recommended_actions'].append('Network security config yoxdur - SSL bypass asan ola bilər')
            
        self.results['report'] = report
        
        print(f"   📊 SSL bypass ehtimalı: {report['ssl_bypass_likelihood']}")
        
    def run_all_searches(self):
        """Bütün axtarışları işlədir"""
        print("🚀 SSL Bypass və Web Sayt Axtarışı Başlayır...")
        print("=" * 60)
        
        self.search_ssl_tls_keywords()
        self.search_web_urls()
        self.search_firebase_domains()
        self.search_ssl_bypass_vulnerabilities()
        self.search_network_security_config()
        self.search_api_endpoints()
        self.categorize_urls()
        self.generate_ssl_bypass_report()
        
        print("=" * 60)
        print("✅ Bütün axtarışlar tamamlandı!")
        
        return self.results
        
    def save_results(self, filename='ssl_bypass_web_results.json'):
        """Nəticələri fayla yazır"""
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(self.results, f, indent=2, ensure_ascii=False)
        print(f"💾 Nəticələr {filename} faylına yazıldı")
        
    def print_summary(self):
        """Nəticələrin xülasəsini göstərir"""
        print("\n" + "=" * 70)
        print("🔒 TİKİO APK SSL BYPASS VƏ WEB SAYT AXTARMA NƏTİCƏLƏRİ")
        print("=" * 70)
        
        # Summary
        if 'report' in self.results:
            summary = self.results['report']['summary']
            print(f"\n📊 ÜMUMİ NƏTİCƏLƏR:")
            print(f"   🔒 SSL/TLS açar sözlər: {summary['total_ssl_keywords']}")
            print(f"   🌐 Web URL-lər: {summary['total_web_urls']}")
            print(f"   🔥 Firebase domain-lər: {summary['total_firebase_domains']}")
            print(f"   ⚠️ SSL bypass vulnerability-lər: {summary['total_ssl_bypass_vulns']}")
            print(f"   🛡️ Network security config: {summary['total_network_security_configs']}")
            print(f"   🔌 API endpoint-lər: {summary['total_api_endpoints']}")
            
            print(f"\n🎯 SSL BYPASS EHTİMALI: {self.results['report']['ssl_bypass_likelihood']}")
            
            print(f"\n💡 TÖVSİYƏ OLUNAN ƏMƏLİYYATLAR:")
            for action in self.results['report']['recommended_actions']:
                print(f"   • {action}")
                
        # SSL bypass vulnerabilities
        if self.results.get('ssl_bypass_vulns'):
            print(f"\n⚠️ TAPILAN SSL BYPASS VULNERABILITY-LƏRİ:")
            for vuln in self.results['ssl_bypass_vulns']:
                print(f"   • {vuln}")
                
        # Web URLs by category
        if self.results.get('url_categories'):
            print(f"\n🌐 TAPILAN WEB SAYTLAR (Kateqoriyalara görə):")
            
            for category, urls in self.results['url_categories'].items():
                if urls:
                    print(f"\n   📂 {category.upper()}:")
                    for url in urls[:10]:  # İlk 10-u göstər
                        print(f"      • {url}")
                    if len(urls) > 10:
                        print(f"      ... və {len(urls) - 10} ədəd daha")
                        
        # Firebase domains
        if self.results.get('firebase_domains'):
            print(f"\n🔥 FIREBASE DOMAIN-LƏRİ:")
            for domain in self.results['firebase_domains']:
                print(f"   • {domain}")
                
        # API endpoints
        if self.results.get('api_endpoints'):
            print(f"\n🔌 API ENDPOINT-LƏRİ:")
            for endpoint in self.results['api_endpoints'][:10]:  # İlk 10-u göstər
                print(f"   • {endpoint}")
            if len(self.results['api_endpoints']) > 10:
                print(f"   ... və {len(self.results['api_endpoints']) - 10} ədəd daha")

if __name__ == "__main__":
    # APK extract edilmiş qovluğu
    apk_dir = "."
    
    # SSL bypass və web sayt axtarışı başlat
    discoverer = SSLBypassWebDiscovery(apk_dir)
    results = discoverer.run_all_searches()
    
    # Nəticələri yaz və göstər
    discoverer.save_results()
    discoverer.print_summary()