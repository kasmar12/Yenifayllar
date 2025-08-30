#!/usr/bin/env python3
# 🔒 SSL Bypass Test Script

import requests
import urllib3
import ssl
from urllib3.util.ssl_ import create_urllib3_context

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def test_ssl_bypass():
    print("🔒 SSL Bypass test edilir...")
    
    # Test URL-lər
    test_urls = [
        "https://tikio-v4.appspot.com",
        "https://firebaseapp.com",
        "https://googleapis.com",
        "https://www.example.com",
        "https://httpbin.org/get"
    ]
    
    # Custom SSL context (trust all)
    context = create_urllib3_context()
    context.check_hostname = False
    context.verify_mode = ssl.CERT_NONE
    
    for url in test_urls:
        try:
            print(f"\n🌐 Test edilir: {url}")
            
            # SSL bypass ilə request
            response = requests.get(url, verify=False, timeout=10)
            print(f"   ✅ Status: {response.status_code}")
            print(f"   📊 Content Length: {len(response.content)}")
            
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
    
    print("\n🎯 SSL bypass test tamamlandı!")

if __name__ == "__main__":
    test_ssl_bypass()
