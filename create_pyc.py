#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Test skriptini .pyc faylına çevirir
"""

import py_compile
import os
from pathlib import Path

def create_pyc_file(source_file: str, output_dir: str = "."):
    """Python faylını .pyc faylına çevirir"""
    try:
        source_path = Path(source_file)
        if not source_path.exists():
            print(f"❌ Mənbə faylı tapılmadı: {source_file}")
            return False
            
        # Çıxış qovluğunu yarad
        output_path = Path(output_dir)
        output_path.mkdir(exist_ok=True)
        
        # .pyc faylını yarad
        py_compile.compile(
            source_file,
            cfile=output_path / f"{source_path.stem}.pyc",
            dfile=source_file,
            doraise=True
        )
        
        print(f"✅ .pyc faylı yaradıldı: {output_path / f'{source_path.stem}.pyc'}")
        return True
        
    except Exception as e:
        print(f"❌ .pyc yaratma xətası: {e}")
        return False

def main():
    """Əsas funksiya"""
    print("🔓 Test .pyc faylı yaradılır")
    print("=" * 40)
    
    # Test skriptini .pyc-ə çevir
    success = create_pyc_file("test_script.py", ".")
    
    if success:
        print("\n🎉 Test .pyc faylı hazırdır!")
        print("📱 İndi decompiler ilə test edə bilərsiniz:")
        print("   python3 pyc_decompiler.py test_script.pyc")
        print("   python3 advanced_decompiler.py test_script.pyc")
        print("   python3 gui_decompiler.py")
    else:
        print("\n❌ .pyc faylı yaradıla bilmədi!")

if __name__ == "__main__":
    main()