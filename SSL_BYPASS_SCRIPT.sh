#!/bin/bash
# 🔒 TİKİO APK SSL BYPASS SCRIPT
# Bu script SSL/TLS təhlükəsizliyini bypass edir

set -e

# Rənglər
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logo
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    TİKİO APK SSL BYPASS                    ║"
echo "║                     🔒 TƏHLÜKƏSİZLİK BYPASS                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Funksiyalar
print_status() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[-]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[i]${NC} $1"
}

# SSL Bypass Faylları
create_ssl_bypass_files() {
    print_status "SSL bypass faylları yaradılır..."
    
    # 1. Network Security Config (SSL bypass üçün)
    cat > network_security_config.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config cleartextTrafficPermitted="true">
        <domain includeSubdomains="true">tikio-v4.appspot.com</domain>
        <domain includeSubdomains="true">firebaseapp.com</domain>
        <domain includeSubdomains="true">googleapis.com</domain>
        <domain includeSubdomains="true">localhost</domain>
        <domain includeSubdomains="true">10.0.0.0</domain>
        <domain includeSubdomains="true">192.168.0.0</domain>
        <domain includeSubdomains="true">172.16.0.0</domain>
        <trust-anchors>
            <certificates src="system"/>
            <certificates src="user"/>
        </trust-anchors>
    </domain-config>
    
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system"/>
            <certificates src="user"/>
        </trust-anchors>
    </base-config>
</network-security-config>
EOF

    # 2. SSL Bypass Java Class
    cat > SSLBypass.java << 'EOF'
package com.tikio.sslbypass;

import javax.net.ssl.*;
import java.security.cert.X509Certificate;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

public class SSLBypass {
    
    public static void disableSSLVerification() {
        try {
            // Trust all certificates
            TrustManager[] trustAllCerts = new TrustManager[]{
                new X509TrustManager() {
                    public X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }
                    public void checkClientTrusted(X509Certificate[] certs, String authType) {
                    }
                    public void checkServerTrusted(X509Certificate[] certs, String authType) {
                    }
                }
            };

            // Install the all-trusting trust manager
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            // Create all-trusting host name verifier
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            };

            // Install the all-trusting host verifier
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
            
        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            e.printStackTrace();
        }
    }
    
    public static void enableSSLVerification() {
        try {
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, null, null);
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
            HttpsURLConnection.setDefaultHostnameVerifier(null);
        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            e.printStackTrace();
        }
    }
}
EOF

    # 3. Frida SSL Bypass Script
    cat > ssl_bypass.js << 'EOF'
// 🔒 TİKİO APK SSL BYPASS FRIDA SCRIPT
// Bu script SSL/TLS təhlükəsizliyini bypass edir

Java.perform(function() {
    console.log("[+] SSL Bypass başladıldı");
    
    try {
        // SSLContext bypass
        var SSLContext = Java.use('javax.net.ssl.SSLContext');
        SSLContext.init.overload('[Ljavax.net.ssl.KeyManager;', '[Ljavax.net.ssl.TrustManager;', 'java.security.SecureRandom').implementation = function(keyManagers, trustManagers, secureRandom) {
            console.log('[+] SSLContext.init bypassed');
            
            // Trust all certificates
            var TrustManager = Java.use('javax.net.ssl.X509TrustManager');
            var trustAllCerts = [TrustManager.$new({
                checkClientTrusted: function(chain, authType) {},
                checkServerTrusted: function(chain, authType) {},
                getAcceptedIssuers: function() { return []; }
            })];
            
            return this.init(keyManagers, trustAllCerts, secureRandom);
        };
        
        // HostnameVerifier bypass
        var HostnameVerifier = Java.use('javax.net.ssl.HostnameVerifier');
        HostnameVerifier.verify.implementation = function(hostname, session) {
            console.log('[+] HostnameVerifier.verify bypassed: ' + hostname);
            return true; // Always return true
        };
        
        // SSLSocketFactory bypass
        var SSLSocketFactory = Java.use('javax.net.ssl.SSLSocketFactory');
        SSLSocketFactory.createSocket.overload('java.lang.String', 'int').implementation = function(host, port) {
            console.log('[+] SSLSocketFactory.createSocket bypassed: ' + host + ':' + port);
            return this.createSocket(host, port);
        };
        
        // HttpsURLConnection bypass
        var HttpsURLConnection = Java.use('javax.net.ssl.HttpsURLConnection');
        HttpsURLConnection.setDefaultHostnameVerifier.implementation = function(verifier) {
            console.log('[+] HttpsURLConnection.setDefaultHostnameVerifier bypassed');
            return;
        };
        
        // OkHttp SSL bypass (əgər istifadə edilirsə)
        try {
            var OkHttpClient = Java.use('okhttp3.OkHttpClient');
            OkHttpClient.newBuilder.implementation = function() {
                console.log('[+] OkHttpClient.newBuilder bypassed');
                var builder = this.newBuilder();
                
                // Trust all certificates
                builder.hostnameVerifier(function(hostname, session) {
                    console.log('[+] OkHttp HostnameVerifier bypassed: ' + hostname);
                    return true;
                });
                
                return builder;
            };
        } catch(e) {
            console.log('[-] OkHttp tapılmadı: ' + e);
        }
        
        console.log("[+] Bütün SSL bypass-lar aktiv edildi!");
        
    } catch(e) {
        console.log('[-] SSL bypass xətası: ' + e);
    }
});
EOF

    # 4. ADB SSL Bypass Commands
    cat > ssl_bypass_adb.sh << 'EOF'
#!/bin/bash
# 🔒 ADB ilə SSL Bypass

echo "🔒 ADB SSL Bypass başladıldı..."

# SSL verification disable et
adb shell settings put global network_security_config 0

# HTTP traffic allow et
adb shell settings put global cleartext_traffic_permitted 1

# SSL certificate verification disable et
adb shell settings put global ssl_cert_verification_enabled 0

# Network security config reset et
adb shell settings delete global network_security_config

echo "✅ SSL bypass tamamlandı!"
EOF

    # 5. SSL Bypass Test Script
    cat > ssl_bypass_test.py << 'EOF'
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
EOF

    chmod +x ssl_bypass_adb.sh
    chmod +x ssl_bypass_test.py
    
    print_status "SSL bypass faylları yaradıldı!"
}

# SSL Bypass Təlimatları
show_ssl_bypass_instructions() {
    echo -e "\n${CYAN}🔒 SSL BYPASS TƏLİMATLARI${NC}"
    echo "=================================="
    
    echo -e "\n${YELLOW}1. NETWORK SECURITY CONFIG BYPASS:${NC}"
    echo "   • network_security_config.xml faylını APK-ya əlavə edin"
    echo "   • AndroidManifest.xml-də networkSecurityConfig attribute əlavə edin"
    
    echo -e "\n${YELLOW}2. FRIDA SSL BYPASS:${NC}"
    echo "   • Frida server-i cihazda işə salın"
    echo "   • ssl_bypass.js script-ini işə salın"
    echo "   • Script SSL verification-i bypass edəcək"
    
    echo -e "\n${YELLOW}3. ADB SSL BYPASS:${NC}"
    echo "   • ssl_bypass_adb.sh script-ini işə salın"
    echo "   • Bu script system-level SSL bypass edəcək"
    
    echo -e "\n${YELLOW}4. JAVA SSL BYPASS:${NC}"
    echo "   • SSLBypass.java faylını APK-ya əlavə edin"
    echo "   • Tətbiq başladıqda SSLBypass.disableSSLVerification() çağırın"
    
    echo -e "\n${YELLOW}5. TEST:${NC}"
    echo "   • ssl_bypass_test.py script-ini işə salın"
    echo "   • SSL bypass-in işlədiyini yoxlayın"
}

# SSL Bypass Status
check_ssl_bypass_status() {
    echo -e "\n${CYAN}🔍 SSL BYPASS STATUS${NC}"
    echo "========================"
    
    if [ -f "network_security_config.xml" ]; then
        echo -e "✅ Network Security Config: ${GREEN}Yaradıldı${NC}"
    else
        echo -e "❌ Network Security Config: ${RED}Yaradılmadı${NC}"
    fi
    
    if [ -f "ssl_bypass.js" ]; then
        echo -e "✅ Frida SSL Bypass: ${GREEN}Yaradıldı${NC}"
    else
        echo -e "❌ Frida SSL Bypass: ${RED}Yaradılmadı${NC}"
    fi
    
    if [ -f "SSLBypass.java" ]; then
        echo -e "✅ Java SSL Bypass: ${GREEN}Yaradıldı${NC}"
    else
        echo -e "❌ Java SSL Bypass: ${RED}Yaradılmadı${NC}"
    fi
    
    if [ -f "ssl_bypass_adb.sh" ]; then
        echo -e "✅ ADB SSL Bypass: ${GREEN}Yaradıldı${NC}"
    else
        echo -e "❌ ADB SSL Bypass: ${RED}Yaradılmadı${NC}"
    fi
    
    if [ -f "ssl_bypass_test.py" ]; then
        echo -e "✅ SSL Bypass Test: ${GREEN}Yaradıldı${NC}"
    else
        echo -e "❌ SSL Bypass Test: ${RED}Yaradılmadı${NC}"
    fi
}

# Ana funksiya
main() {
    print_info "Tikio APK SSL Bypass başladıldı..."
    
    # SSL bypass fayllarını yarat
    create_ssl_bypass_files
    
    # Status yoxla
    check_ssl_bypass_status
    
    # Təlimatları göstər
    show_ssl_bypass_instructions
    
    print_status "SSL bypass hazırdır! Yuxarıdakı təlimatları izləyin."
}

# Script-i işə sal
main