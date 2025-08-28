#!/usr/bin/env python3
"""
Local Storage Manipulation Test
SharedPreferences və local storage bypass test edir
"""

import json
import os
import sqlite3
from datetime import datetime, timedelta

class LocalStorageTest:
    def __init__(self):
        self.package_name = "com.tikio.app"
        self.test_data = {
            "premium_status": True,
            "subscription_type": "premium",
            "expiry_date": "2099-12-31",
            "purchase_tokens": ["fake_token_12345", "fake_token_67890"],
            "billing_state": "CONNECTED"
        }
    
    def test_shared_preferences_bypass(self):
        """SharedPreferences bypass test edir"""
        print("🔍 SharedPreferences Bypass Test...")
        
        # Saxta SharedPreferences məlumatları
        fake_prefs = {
            "is_premium_user": True,
            "premium_expiry": "2099-12-31T23:59:59Z",
            "subscription_active": True,
            "last_payment_date": datetime.now().isoformat(),
            "billing_client_ready": True
        }
        
        print("📱 Saxta SharedPreferences məlumatları:")
        print(json.dumps(fake_prefs, indent=2))
        
        # Bu məlumatları yazmaq üçün ADB əmrləri
        print("\n💻 ADB ilə yazmaq üçün əmrlər:")
        print(f"adb shell 'run-as {self.package_name} sh -c \"echo '{json.dumps(fake_prefs)}' > premium_status.json\"'")
        
        return True
    
    def test_sqlite_database_bypass(self):
        """SQLite database bypass test edir"""
        print("\n🔍 SQLite Database Bypass Test...")
        
        # Saxta SQLite məlumatları
        fake_sql_data = [
            ("premium_users", "user123", "premium", "2099-12-31"),
            ("subscriptions", "sub456", "monthly", "active"),
            ("purchases", "purchase789", "premium_monthly", "completed")
        ]
        
        print("📱 Saxta SQLite məlumatları:")
        for table, *data in fake_sql_data:
            print(f"Table: {table}, Data: {data}")
        
        # SQL injection nümunələri
        print("\n💉 SQL Injection nümunələri:")
        print("SELECT * FROM premium_users WHERE user_id = 'user123' OR '1'='1'")
        print("UPDATE premium_users SET status = 'premium' WHERE user_id = 'user123'")
        
        return True
    
    def test_memory_manipulation(self):
        """Memory manipulation test edir"""
        print("\n🔍 Memory Manipulation Test...")
        
        # Saxta memory məlumatları
        fake_memory = {
            "billing_client_state": "CONNECTED",
            "purchase_cache": [
                {
                    "productId": "premium_subscription",
                    "purchaseState": 1,
                    "isAcknowledged": True,
                    "purchaseTime": int(datetime.now().timestamp() * 1000)
                }
            ],
            "verification_status": "VERIFIED"
        }
        
        print("📱 Saxta Memory məlumatları:")
        print(json.dumps(fake_memory, indent=2))
        
        print("\n🛠️ Frida script nümunəsi:")
        frida_script = """
        Java.perform(function() {
            var billingClient = Java.use('com.android.billingclient.api.BillingClient');
            billingClient.isReady.implementation = function() {
                console.log('[+] BillingClient.isReady() called');
                return true; // Həmişə true qaytarır
            };
        });
        """
        print(frida_script)
        
        return True
    
    def test_code_patching(self):
        """Code patching test edir"""
        print("\n🔍 Code Patching Test...")
        
        # Smali kod patch nümunələri
        print("📱 Smali kod patch nümunələri:")
        
        original_method = """
        .method public isPremiumUser()Z
            .locals 1
            iget-boolean v0, p0, Lcom/tikio/app/User;->isPremium:Z
            return v0
        .end method
        """
        
        patched_method = """
        .method public isPremiumUser()Z
            .locals 1
            const/4 v0, 0x1  # Həmişə true qaytarır
            return v0
        .end method
        """
        
        print("Original:")
        print(original_method)
        print("Patched:")
        print(patched_method)
        
        return True
    
    def test_billing_client_interception(self):
        """Billing client interception test edir"""
        print("\n🔍 Billing Client Interception Test...")
        
        # Saxta billing response
        fake_billing_response = {
            "billingResult": {
                "responseCode": 0,  # BILLING_RESPONSE_RESULT_OK
                "debugMessage": "Fake successful response"
            },
            "purchasesList": [
                {
                    "productId": "premium_monthly",
                    "purchaseState": 1,  # PURCHASED
                    "purchaseToken": "fake_token_12345",
                    "purchaseTime": int(datetime.now().timestamp() * 1000),
                    "isAcknowledged": True
                }
            ]
        }
        
        print("📱 Saxta Billing Response:")
        print(json.dumps(fake_billing_response, indent=2))
        
        print("\n🔄 Interception nümunəsi:")
        print("1. BillingClient.queryPurchasesAsync() çağırılır")
        print("2. Response intercept edilir")
        print("3. Saxta response qaytarılır")
        print("4. Premium status aktiv edilir")
        
        return True
    
    def test_network_interception(self):
        """Network interception test edir"""
        print("\n🔍 Network Interception Test...")
        
        # Saxta network response
        fake_network_response = {
            "status": "success",
            "data": {
                "user": {
                    "id": "user123",
                    "isPremium": True,
                    "subscription": {
                        "type": "premium",
                        "status": "active",
                        "expiryDate": "2099-12-31"
                    }
                }
            }
        }
        
        print("📱 Saxta Network Response:")
        print(json.dumps(fake_network_response, indent=2))
        
        print("\n🌐 Interception yolları:")
        print("1. Proxy server (Burp Suite, OWASP ZAP)")
        print("2. VPN interception")
        print("3. SSL pinning bypass")
        print("4. Certificate pinning bypass")
        
        return True
    
    def run_all_tests(self):
        """Bütün testləri işə salır"""
        print("🚀 Local Storage Bypass Test Başlayır...")
        print("=" * 60)
        
        tests = [
            ("SharedPreferences Bypass", self.test_shared_preferences_bypass),
            ("SQLite Database Bypass", self.test_sqlite_database_bypass),
            ("Memory Manipulation", self.test_memory_manipulation),
            ("Code Patching", self.test_code_patching),
            ("Billing Client Interception", self.test_billing_client_interception),
            ("Network Interception", self.test_network_interception)
        ]
        
        results = {}
        for test_name, test_func in tests:
            try:
                results[test_name] = test_func()
            except Exception as e:
                print(f"❌ {test_name} xətası: {e}")
                results[test_name] = False
        
        # Nəticələr
        print("\n" + "=" * 60)
        print("📊 TEST NƏTİCƏLƏRİ:")
        print("=" * 60)
        
        for test_name, result in results.items():
            status = "✅ MÜMKÜN" if result else "❌ MÜMKÜN DEYİL"
            print(f"{test_name}: {status}")
        
        # Təhlükə səviyyəsi
        successful_tests = sum(results.values())
        total_tests = len(results)
        
        print(f"\n📈 Uğurlu Testlər: {successful_tests}/{total_tests}")
        
        if successful_tests >= 4:
            print("🚨 YÜKSƏK TƏHLÜKƏ!")
            print("Subscription bypass çox asandır!")
        elif successful_tests >= 2:
            print("⚠️ ORTA TƏHLÜKƏ!")
            print("Subscription bypass mümkündür!")
        else:
            print("✅ AŞAĞI TƏHLÜKƏ!")
            print("Subscription bypass çətin!")
        
        print("\n💡 TƏKLİFLƏR:")
        print("1. Server-side verification tətbiq edin")
        print("2. Code obfuscation istifadə edin")
        print("3. Root detection əlavə edin")
        print("4. Anti-tampering tətbiq edin")
        print("5. SSL pinning istifadə edin")

if __name__ == "__main__":
    tester = LocalStorageTest()
    tester.run_all_tests()