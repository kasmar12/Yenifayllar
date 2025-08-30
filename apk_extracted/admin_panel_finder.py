#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Tikio APK Admin Panel Finder
Bu script APK fayllarında admin panel və console məlumatlarını axtarır
"""

import os
import re
import json
from pathlib import Path

class AdminPanelFinder:
    def __init__(self, apk_dir):
        self.apk_dir = Path(apk_dir)
        self.results = {}
        
    def search_admin_keywords(self):
        """Admin açar sözlərini axtarır"""
        print("🔍 Admin açar sözləri axtarılır...")
        
        admin_keywords = [
            'admin', 'panel', 'dashboard', 'console', 'portal',
            'moderator', 'superuser', 'management', 'control'
        ]
        
        found_keywords = {}
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for keyword in admin_keywords:
                            matches = re.findall(rf'\b{keyword}\w*\b', content, re.IGNORECASE)
                            if matches:
                                found_keywords[f"{dex_file}:{keyword}"] = len(matches)
                                
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['admin_keywords'] = found_keywords
        print(f"   🔑 Tapılan admin açar sözlər: {len(found_keywords)}")
        
    def search_firebase_console(self):
        """Firebase console məlumatlarını axtarır"""
        print("🔥 Firebase console məlumatları axtarılır...")
        
        firebase_patterns = [
            r'firebase.*console',
            r'google.*console',
            r'play.*console',
            r'project.*console',
            r'admin.*console'
        ]
        
        firebase_found = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in firebase_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            firebase_found.extend(matches)
                            
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['firebase_console'] = firebase_found
        print(f"   🔥 Firebase console açar sözlər: {len(firebase_found)}")
        
    def search_admin_operations(self):
        """Admin operation açar sözlərini axtarır"""
        print("⚙️ Admin operation açar sözləri axtarılır...")
        
        admin_ops = [
            'ADMIN_ONLY_OPERATION',
            'DM_ADMIN_BLOCKED',
            'DM_ADMIN_PENDING_APPROVAL',
            'DeviceManagementAdminBlocked',
            'DeviceManagementAdminPendingApproval',
            'ERROR_ADMIN_RESTRICTED_OPERATION'
        ]
        
        found_ops = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for op in admin_ops:
                            if op in content:
                                found_ops.append(f"{dex_file}:{op}")
                                
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['admin_operations'] = found_ops
        print(f"   ⚙️ Admin operation açar sözlər: {len(found_ops)}")
        
    def search_admin_urls(self):
        """Admin URL və endpoint-lərini axtarır"""
        print("🌐 Admin URL və endpoint-lər axtarılır...")
        
        url_patterns = [
            r'https?://[^\s<>"\']*admin[^\s<>"\']*',
            r'https?://[^\s<>"\']*console[^\s<>"\']*',
            r'https?://[^\s<>"\']*panel[^\s<>"\']*',
            r'https?://[^\s<>"\']*portal[^\s<>"\']*',
            r'https?://[^\s<>"\']*dashboard[^\s<>"\']*'
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
                    
        self.results['admin_urls'] = found_urls
        print(f"   🌐 Admin URL-lər: {len(found_urls)}")
        
    def search_firebase_project_info(self):
        """Firebase project məlumatlarını axtarır"""
        print("🏗️ Firebase project məlumatları axtarılır...")
        
        project_patterns = [
            r'tikio-v4',
            r'firebase.*project',
            r'project.*firebase',
            r'google.*cloud.*project'
        ]
        
        project_info = {}
        
        # billing.properties faylında project məlumatlarını axtar
        billing_props = self.apk_dir / 'billing.properties'
        if billing_props.exists():
            try:
                with open(billing_props, 'r') as f:
                    content = f.read()
                    project_info['billing_properties'] = content
            except Exception as e:
                print(f"   ❌ billing.properties oxunmadı: {e}")
                
        # Firebase properties fayllarında project məlumatlarını axtar
        firebase_props = list(self.apk_dir.glob('firebase-*.properties'))
        for prop_file in firebase_props:
            try:
                with open(prop_file, 'r') as f:
                    content = f.read()
                    project_info[str(prop_file)] = content
            except Exception as e:
                print(f"   ❌ {prop_file} oxunmadı: {e}")
                
        self.results['firebase_project'] = project_info
        print(f"   🏗️ Firebase project faylları: {len(project_info)}")
        
    def search_admin_classes(self):
        """Admin class və method açar sözlərini axtarır"""
        print("🔧 Admin class və method açar sözləri axtarılır...")
        
        class_patterns = [
            r'class.*Admin',
            r'class.*admin',
            r'Admin.*class',
            r'admin.*class',
            r'public.*admin',
            r'private.*admin'
        ]
        
        found_classes = []
        
        for dex_file in ['classes.dex', 'classes2.dex', 'classes3.dex']:
            dex_path = self.apk_dir / dex_file
            if dex_path.exists():
                try:
                    with open(dex_path, 'rb') as f:
                        content = f.read().decode('utf-8', errors='ignore')
                        
                        for pattern in class_patterns:
                            matches = re.findall(pattern, content, re.IGNORECASE)
                            found_classes.extend(matches)
                            
                except Exception as e:
                    print(f"   ❌ {dex_file} oxunmadı: {e}")
                    
        self.results['admin_classes'] = found_classes
        print(f"   🔧 Admin class açar sözlər: {len(found_classes)}")
        
    def generate_admin_panel_report(self):
        """Admin panel hesabatı yaradır"""
        print("📊 Admin panel hesabatı yaradılır...")
        
        report = {
            'summary': {
                'total_admin_keywords': len(self.results.get('admin_keywords', {})),
                'total_admin_operations': len(self.results.get('admin_operations', [])),
                'total_admin_urls': len(self.results.get('admin_urls', [])),
                'total_firebase_console': len(self.results.get('firebase_console', [])),
                'total_admin_classes': len(self.results.get('admin_classes', []))
            },
            'admin_panel_likelihood': 'Orta',
            'recommended_actions': []
        }
        
        # Admin panel ehtimalını hesabla
        total_findings = sum(report['summary'].values())
        
        if total_findings >= 10:
            report['admin_panel_likelihood'] = 'Yüksək'
            report['recommended_actions'].append('Admin panel mövcud ola bilər')
        elif total_findings >= 5:
            report['admin_panel_likelihood'] = 'Orta'
            report['recommended_actions'].append('Admin funksiyaları mövcud ola bilər')
        else:
            report['admin_panel_likelihood'] = 'Aşağı'
            report['recommended_actions'].append('Admin funksiyaları azdır')
            
        # Firebase console məlumatları varsa
        if self.results.get('firebase_console'):
            report['recommended_actions'].append('Firebase console-də admin panel yoxlayın')
            
        # Admin URL-lər varsa
        if self.results.get('admin_urls'):
            report['recommended_actions'].append('Tapılan admin URL-lərini test edin')
            
        self.results['report'] = report
        
        print(f"   📊 Admin panel ehtimalı: {report['admin_panel_likelihood']}")
        
    def run_all_searches(self):
        """Bütün axtarışları işlədir"""
        print("🚀 Admin Panel Axtarışı Başlayır...")
        print("=" * 50)
        
        self.search_admin_keywords()
        self.search_firebase_console()
        self.search_admin_operations()
        self.search_admin_urls()
        self.search_firebase_project_info()
        self.search_admin_classes()
        self.generate_admin_panel_report()
        
        print("=" * 50)
        print("✅ Bütün axtarışlar tamamlandı!")
        
        return self.results
        
    def save_results(self, filename='admin_panel_results.json'):
        """Nəticələri fayla yazır"""
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(self.results, f, indent=2, ensure_ascii=False)
        print(f"💾 Nəticələr {filename} faylına yazıldı")
        
    def print_summary(self):
        """Nəticələrin xülasəsini göstərir"""
        print("\n" + "=" * 60)
        print("🔍 TİKİO APK ADMIN PANEL AXTARMA NƏTİCƏLƏRİ")
        print("=" * 60)
        
        # Summary
        if 'report' in self.results:
            summary = self.results['report']['summary']
            print(f"\n📊 ÜMUMİ NƏTİCƏLƏR:")
            print(f"   🔑 Admin açar sözlər: {summary['total_admin_keywords']}")
            print(f"   ⚙️ Admin operation-lər: {summary['total_admin_operations']}")
            print(f"   🌐 Admin URL-lər: {summary['total_admin_urls']}")
            print(f"   🔥 Firebase console: {summary['total_firebase_console']}")
            print(f"   🔧 Admin class-lər: {summary['total_admin_classes']}")
            
            print(f"\n🎯 ADMIN PANEL EHTİMALI: {self.results['report']['admin_panel_likelihood']}")
            
            print(f"\n💡 TÖVSİYƏ OLUNAN ƏMƏLİYYATLAR:")
            for action in self.results['report']['recommended_actions']:
                print(f"   • {action}")
                
        # Admin operations
        if self.results.get('admin_operations'):
            print(f"\n⚙️ TAPILAN ADMIN OPERATION-LƏR:")
            for op in self.results['admin_operations']:
                print(f"   • {op}")
                
        # Admin URLs
        if self.results.get('admin_urls'):
            print(f"\n🌐 TAPILAN ADMIN URL-LƏR:")
            for url in self.results['admin_urls']:
                print(f"   • {url}")
                
        # Firebase console
        if self.results.get('firebase_console'):
            print(f"\n🔥 FIREBASE CONSOLE AÇAR SÖZLƏRİ:")
            for console in self.results['firebase_console']:
                print(f"   • {console}")

if __name__ == "__main__":
    # APK extract edilmiş qovluğu
    apk_dir = "."
    
    # Admin panel axtarışı başlat
    finder = AdminPanelFinder(apk_dir)
    results = finder.run_all_searches()
    
    # Nəticələri yaz və göstər
    finder.save_results()
    finder.print_summary()