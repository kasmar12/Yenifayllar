#!/usr/bin/env python3
"""
APK Patch Test
Tikio APK-da real patch test edir
"""

import os
import shutil
import zipfile
import tempfile
from pathlib import Path

class APKPatchTest:
    def __init__(self):
        self.original_apk = "Tikio_1.8.0.apk"
        self.patched_apk = "Tikio_1.8.0_PATCHED.apk"
        self.decompiled_path = "tikio_decompiled"
        self.temp_dir = "temp_patch"
    
    def create_temp_directory(self):
        """Temporary directory yaradır"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
        os.makedirs(self.temp_dir)
        print(f"✅ Temporary directory yaradıldı: {self.temp_dir}")
    
    def patch_shared_preferences(self):
        """SharedPreferences patch edir"""
        print("\n🔧 SharedPreferences Patch Edilir...")
        
        # SharedPreferences faylını yaratmaq
        prefs_content = '''<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
    <string name="last_payment_date">2025-08-28T00:00:00Z</string>
    <boolean name="billing_client_ready" value="true" />
    <string name="premium_type">premium</string>
    <boolean name="ads_disabled" value="true" />
    <boolean name="unlimited_features" value="true" />
</map>'''
        
        prefs_file = os.path.join(self.temp_dir, "premium_prefs.xml")
        with open(prefs_file, 'w') as f:
            f.write(prefs_content)
        
        print("✅ Premium SharedPreferences yaradıldı")
        return prefs_file
    
    def patch_smali_code(self):
        """Smali kod patch edir"""
        print("\n🔧 Smali Kod Patch Edilir...")
        
        # Saxta premium check metodu
        premium_method = '''
.method public isPremiumUser()Z
    .locals 1
    
    # Həmişə true qaytarır
    const/4 v0, 0x1
    return v0
.end method

.method public hasActiveSubscription()Z
    .locals 1
    
    # Həmişə true qaytarır
    const/4 v0, 0x1
    return v0
.end method

.method public getSubscriptionType()Ljava/lang/String;
    .locals 1
    
    # Premium qaytarır
    const-string v0, "premium"
    return-object v0
.end method
'''
        
        smali_file = os.path.join(self.temp_dir, "PremiumBypass.smali")
        with open(smali_file, 'w') as f:
            f.write(premium_method)
        
        print("✅ Premium bypass smali kodu yaradıldı")
        return smali_file
    
    def patch_billing_client(self):
        """Billing client patch edir"""
        print("\n🔧 Billing Client Patch Edilir...")
        
        # Saxta billing response
        billing_patch = '''
.method public queryPurchasesAsync(Lcom/android/billingclient/api/QueryPurchasesParams;Lcom/android/billingclient/api/PurchasesResponseListener;)V
    .locals 4
    
    # Saxta purchase list yaradır
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    
    # Premium subscription purchase yaradır
    new-instance v1, Lcom/android/billingclient/api/Purchase;
    invoke-direct {v1}, Lcom/android/billingclient/api/Purchase;-><init>()V
    
    # Purchase state = PURCHASED (1)
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/Purchase;->setPurchaseState(I)V
    
    # Product ID = premium_subscription
    const-string v3, "premium_subscription"
    invoke-virtual {v1, v3}, Lcom/android/billingclient/api/Purchase;->setProductId(Ljava/lang/String;)V
    
    # Purchase token = fake_token
    const-string v3, "fake_token_12345"
    invoke-virtual {v1, v3}, Lcom/android/billingclient/api/Purchase;->setPurchaseToken(Ljava/lang/String;)V
    
    # Acknowledged = true
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/Purchase;->setIsAcknowledged(Z)V
    
    # List-ə əlavə et
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    
    # Listener-ə göndər
    invoke-interface {p2, v0}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Ljava/util/List;)V
    
    return-void
.end method
'''
        
        billing_file = os.path.join(self.temp_dir, "BillingClientPatch.smali")
        with open(billing_file, 'w') as f:
            f.write(billing_patch)
        
        print("✅ Billing client patch yaradıldı")
        return billing_file
    
    def create_frida_script(self):
        """Frida script yaradır"""
        print("\n🔧 Frida Script Yaradılır...")
        
        frida_script = '''
// Tikio Premium Bypass Frida Script
// Bu script premium status-u bypass edir

Java.perform(function() {
    console.log("[+] Tikio Premium Bypass başladıldı");
    
    // Premium check bypass
    try {
        var userClass = Java.use('com.tikio.app.User');
        if (userClass.isPremiumUser) {
            userClass.isPremiumUser.implementation = function() {
                console.log('[+] Premium check bypassed');
                return true;
            };
        }
    } catch(e) {
        console.log('[-] User class tapılmadı: ' + e);
    }
    
    // Subscription check bypass
    try {
        var subscriptionClass = Java.use('com.tikio.app.Subscription');
        if (subscriptionClass.hasActiveSubscription) {
            subscriptionClass.hasActiveSubscription.implementation = function() {
                console.log('[+] Subscription check bypassed');
                return true;
            };
        }
    } catch(e) {
        console.log('[-] Subscription class tapılmadı: ' + e);
    }
    
    // Billing client bypass
    try {
        var billingClient = Java.use('com.android.billingclient.api.BillingClient');
        billingClient.isReady.implementation = function() {
            console.log('[+] Billing client ready bypassed');
            return true;
        };
        
        billingClient.queryPurchasesAsync.implementation = function(params, listener) {
            console.log('[+] Query purchases bypassed');
            
            // Saxta purchase list yaradır
            var fakePurchase = Java.use('com.android.billingclient.api.Purchase').$new();
            fakePurchase.setPurchaseState(1); // PURCHASED
            fakePurchase.setProductId("premium_subscription");
            fakePurchase.setPurchaseToken("fake_token_12345");
            fakePurchase.setIsAcknowledged(true);
            
            var purchaseList = Java.use('java.util.ArrayList').$new();
            purchaseList.add(fakePurchase);
            
            // Listener-ə göndər
            listener.onQueryPurchasesResponse(purchaseList);
        };
    } catch(e) {
        console.log('[-] Billing client bypass xətası: ' + e);
    }
    
    // SharedPreferences bypass
    try {
        var sharedPrefs = Java.use('android.content.SharedPreferences');
        sharedPrefs.getBoolean.implementation = function(key, defaultValue) {
            if (key === "is_premium_user" || key === "subscription_active") {
                console.log('[+] SharedPreferences bypassed: ' + key);
                return true;
            }
            return this.getBoolean(key, defaultValue);
        };
    } catch(e) {
        console.log('[-] SharedPreferences bypass xətası: ' + e);
    }
    
    console.log("[+] Bütün bypass-lar aktiv edildi!");
});
'''
        
        frida_file = os.path.join(self.temp_dir, "tikio_bypass.js")
        with open(frida_file, 'w') as f:
            f.write(frida_script)
        
        print("✅ Frida script yaradıldı")
        return frida_file
    
    def create_adb_commands(self):
        """ADB əmrləri yaradır"""
        print("\n🔧 ADB Əmrləri Yaradılır...")
        
        adb_commands = '''# Tikio Premium Bypass ADB Commands
# Bu əmrlər premium status-u bypass edir

# 1. Root access əldə etmək (əgər mümkünsə)
adb root
adb shell

# 2. Tətbiq data-ya giriş
run-as com.tikio.app

# 3. SharedPreferences patch
echo '<?xml version="1.0" encoding="utf-8" standalone="yes" ?>
<map>
    <boolean name="is_premium_user" value="true" />
    <string name="premium_expiry">2099-12-31T23:59:59Z</string>
    <boolean name="subscription_active" value="true" />
</map>' > /data/data/com.tikio.app/shared_prefs/premium_status.xml

# 4. Database patch (əgər mövcudsa)
sqlite3 /data/data/com.tikio.app/databases/user_data.db
UPDATE users SET is_premium = 1, subscription_type = "premium";
.exit

# 5. Tətbiqi yenidən başlatmaq
adb shell am force-stop com.tikio.app
adb shell am start -n com.tikio.app/.MainActivity

echo "Premium bypass tamamlandı!"
'''
        
        adb_file = os.path.join(self.temp_dir, "adb_bypass.sh")
        with open(adb_file, 'w') as f:
            f.write(adb_commands)
        
        print("✅ ADB əmrləri yaradıldı")
        return adb_file
    
    def create_installation_guide(self):
        """Quraşdırma təlimatı yaradır"""
        print("\n🔧 Quraşdırma Təlimatı Yaradılır...")
        
        guide = '''# Tikio Premium Bypass Quraşdırma Təlimatı

## Metod 1: Frida Script (Ən Asan)

1. Frida server quraşdırın
2. Script faylını yükləyin: tikio_bypass.js
3. Tətbiqi işə salın
4. Script-i işə salın: frida -U -l tikio_bypass.js -f com.tikio.app

## Metod 2: ADB Commands

1. ADB ilə cihaza qoşulun
2. adb_bypass.sh script-ini işə salın
3. Tətbiqi yenidən başladın

## Metod 3: Manual Patch

1. APK-nı decompile edin
2. Smali kodları patch edin
3. APK-nı yenidən compile edin
4. Quraşdırın

## Nəticə

✅ Premium status aktiv
✅ Bütün funksiyalar açıq
✅ Reklamlar deaktiv
✅ Abunəlik pulsuz

## Diqqət!

Bu bypass yalnız təhsil məqsədləri üçündür!
Real tətbiqlərdə istifadə etməyin!
'''
        
        guide_file = os.path.join(self.temp_dir, "INSTALLATION_GUIDE.md")
        with open(guide_file, 'w') as f:
            f.write(guide)
        
        print("✅ Quraşdırma təlimatı yaradıldı")
        return guide_file
    
    def run_all_patches(self):
        """Bütün patch-ləri işə salır"""
        print("🚀 APK Patch Test Başlayır...")
        print("=" * 60)
        
        # Temporary directory yaratmaq
        self.create_temp_directory()
        
        # Patch-ləri yaratmaq
        patches = [
            ("SharedPreferences", self.patch_shared_preferences),
            ("Smali Kod", self.patch_smali_code),
            ("Billing Client", self.patch_billing_client),
            ("Frida Script", self.create_frida_script),
            ("ADB Commands", self.create_adb_commands),
            ("Installation Guide", self.create_installation_guide)
        ]
        
        created_files = []
        for patch_name, patch_func in patches:
            try:
                file_path = patch_func()
                created_files.append((patch_name, file_path))
                print(f"✅ {patch_name} patch yaradıldı")
            except Exception as e:
                print(f"❌ {patch_name} patch xətası: {e}")
        
        # Nəticələr
        print("\n" + "=" * 60)
        print("📊 PATCH NƏTİCƏLƏRİ:")
        print("=" * 60)
        
        for patch_name, file_path in created_files:
            if os.path.exists(file_path):
                file_size = os.path.getsize(file_path)
                print(f"✅ {patch_name}: {file_path} ({file_size} bytes)")
            else:
                print(f"❌ {patch_name}: Fayl yaradılmadı")
        
        print(f"\n📁 Bütün fayllar: {self.temp_dir}/")
        print("🔧 Patch-lər hazırdır!")
        
        print("\n💡 İSTİFADƏ:")
        print("1. Frida script: tikio_bypass.js")
        print("2. ADB əmrləri: adb_bypass.sh")
        print("3. Quraşdırma: INSTALLATION_GUIDE.md")
        
        return created_files

if __name__ == "__main__":
    patcher = APKPatchTest()
    patcher.run_all_patches()