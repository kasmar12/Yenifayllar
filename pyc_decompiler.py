#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Android Python 3.9 PyC Decompiler
Marshal modulu ilə şifrələnmiş .pyc fayllarını deşifrə edir
Termux və Pydroid3 mühitində işləyir
"""

import marshal
import dis
import ast
import os
import sys
from pathlib import Path
from typing import Optional, Union, Dict, Any

class PyCDecompiler:
    """PyC fayllarını deşifrə edən əsas sinif"""
    
    def __init__(self):
        self.supported_versions = [(3, 9), (3, 8), (3, 7)]
        self.current_version = sys.version_info[:2]
        
    def check_compatibility(self) -> bool:
        """Python versiyasının uyğunluğunu yoxlayır"""
        return self.current_version in self.supported_versions
    
    def read_pyc_file(self, file_path: Union[str, Path]) -> Optional[bytes]:
        """PyC faylını oxuyur və bytecode-u qaytarır"""
        try:
            file_path = Path(file_path)
            if not file_path.exists():
                print(f"❌ Fayl tapılmadı: {file_path}")
                return None
                
            if not file_path.suffix.lower() in ['.pyc', '.pyo']:
                print(f"⚠️  Fayl uzantısı .pyc və ya .pyo deyil: {file_path.suffix}")
                
            with open(file_path, 'rb') as f:
                # Python 3.7+ üçün header formatı
                if self.current_version >= (3, 7):
                    # Magic number (4 byte)
                    magic = f.read(4)
                    # Timestamp (4 byte) 
                    timestamp = f.read(4)
                    # Size (4 byte) - Python 3.3+
                    size = f.read(4)
                    # Source size (4 byte) - Python 3.7+
                    source_size = f.read(4)
                    
                    print(f"🔍 Magic: {magic.hex()}")
                    print(f"📅 Timestamp: {int.from_bytes(timestamp, 'little')}")
                    print(f"📏 Size: {int.from_bytes(size, 'little')}")
                    print(f"📄 Source size: {int.from_bytes(source_size, 'little')}")
                
                # Bytecode-u oxu
                bytecode = f.read()
                print(f"✅ Bytecode oxundu: {len(bytecode)} byte")
                return bytecode
                
        except Exception as e:
            print(f"❌ Fayl oxuma xətası: {e}")
            return None
    
    def decompile_marshal(self, bytecode: bytes) -> Optional[Any]:
        """Marshal ilə şifrələnmiş bytecode-u deşifrə edir"""
        try:
            # Marshal ilə deşifrə et
            code_object = marshal.loads(bytecode)
            print(f"✅ Marshal deşifrə edildi: {type(code_object).__name__}")
            return code_object
            
        except Exception as e:
            print(f"❌ Marshal deşifrə xətası: {e}")
            return None
    
    def analyze_code_object(self, code_object) -> Dict[str, Any]:
        """Code object-i analiz edir"""
        try:
            info = {
                'co_name': getattr(code_object, 'co_name', 'Unknown'),
                'co_filename': getattr(code_object, 'co_filename', 'Unknown'),
                'co_argcount': getattr(code_object, 'co_argcount', 0),
                'co_kwonlyargcount': getattr(code_object, 'co_kwonlyargcount', 0),
                'co_nlocals': getattr(code_object, 'co_nlocals', 0),
                'co_stacksize': getattr(code_object, 'co_stacksize', 0),
                'co_flags': getattr(code_object, 'co_flags', 0),
                'co_code': getattr(code_object, 'co_code', b''),
                'co_consts': getattr(code_object, 'co_consts', ()),
                'co_names': getattr(code_object, 'co_names', ()),
                'co_varnames': getattr(code_object, 'co_varnames', ()),
                'co_freevars': getattr(code_object, 'co_freevars', ()),
                'co_cellvars': getattr(code_object, 'co_cellvars', ()),
            }
            
            print(f"📊 Code object analiz edildi:")
            print(f"   Ad: {info['co_name']}")
            print(f"   Fayl: {info['co_filename']}")
            print(f"   Arqument sayı: {info['co_argcount']}")
            print(f"   Lokal dəyişən sayı: {info['co_nlocals']}")
            
            return info
            
        except Exception as e:
            print(f"❌ Code object analiz xətası: {e}")
            return {}
    
    def disassemble_bytecode(self, code_object) -> str:
        """Bytecode-u disassemble edir"""
        try:
            output = []
            output.append("🔍 BYTECODE DISASSEMBLY:")
            output.append("=" * 50)
            
            # Disassemble et
            dis.dis(code_object)
            
            return "\n".join(output)
            
        except Exception as e:
            print(f"❌ Disassembly xətası: {e}")
            return f"Disassembly xətası: {e}"
    
    def extract_strings(self, code_object) -> list:
        """Code object-dən string-ləri çıxarır"""
        strings = []
        try:
            # Constants-dan string-ləri tap
            for const in code_object.co_consts:
                if isinstance(const, str):
                    strings.append(const)
                elif isinstance(const, bytes):
                    try:
                        strings.append(const.decode('utf-8'))
                    except:
                        strings.append(str(const))
            
            # Names-dan string-ləri tap
            for name in code_object.co_names:
                if isinstance(name, str):
                    strings.append(name)
                    
            print(f"📝 {len(strings)} string tapıldı")
            return strings
            
        except Exception as e:
            print(f"❌ String çıxarma xətası: {e}")
            return []
    
    def save_decompiled_info(self, output_path: str, code_info: Dict[str, Any], 
                            strings: list, disassembly: str) -> bool:
        """Deşifrə edilmiş məlumatları fayla yazır"""
        try:
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write("# Deşifrə edilmiş PyC Faylı\n")
                f.write(f"# Orijinal fayl: {code_info.get('co_filename', 'Unknown')}\n")
                f.write(f"# Funksiya adı: {code_info.get('co_name', 'Unknown')}\n")
                f.write(f"# Arqument sayı: {code_info.get('co_argcount', 0)}\n")
                f.write(f"# Lokal dəyişən sayı: {code_info.get('co_nlocals', 0)}\n")
                f.write("=" * 50 + "\n\n")
                
                # String-ləri yaz
                if strings:
                    f.write("# TAPILAN STRING-LƏR:\n")
                    for i, s in enumerate(strings, 1):
                        f.write(f'# {i}: "{s}"\n')
                    f.write("\n")
                
                # Disassembly yaz
                f.write("# BYTECODE DISASSEMBLY:\n")
                f.write("# Bu hissəni Python bytecode kimi işlətmək olar\n")
                f.write(disassembly)
                
            print(f"✅ Məlumatlar saxlanıldı: {output_path}")
            return True
            
        except Exception as e:
            print(f"❌ Fayl yazma xətası: {e}")
            return False
    
    def decompile_file(self, input_path: str, output_path: Optional[str] = None) -> bool:
        """Əsas deşifrə funksiyası"""
        print(f"🚀 PyC faylı deşifrə edilir: {input_path}")
        print(f"🐍 Python versiyası: {'.'.join(map(str, self.current_version))}")
        
        # Uyğunluğu yoxla
        if not self.check_compatibility():
            print(f"⚠️  Python versiyası {self.current_version} dəstəklənmir")
            print(f"   Dəstəklənən versiyalar: {', '.join(f'{v[0]}.{v[1]}' for v in self.supported_versions)}")
        
        # PyC faylını oxu
        bytecode = self.read_pyc_file(input_path)
        if not bytecode:
            return False
        
        # Marshal ilə deşifrə et
        code_object = self.decompile_marshal(bytecode)
        if not code_object:
            return False
        
        # Code object-i analiz et
        code_info = self.analyze_code_object(code_object)
        if not code_info:
            return False
        
        # String-ləri çıxar
        strings = self.extract_strings(code_object)
        
        # Bytecode-u disassemble et
        disassembly = self.disassemble_bytecode(code_object)
        
        # Çıxış faylını təyin et
        if not output_path:
            input_file = Path(input_path)
            output_path = input_file.with_suffix('.decompiled.py').name
        
        # Məlumatları saxla
        success = self.save_decompiled_info(output_path, code_info, strings, disassembly)
        
        if success:
            print(f"\n🎉 Deşifrə tamamlandı!")
            print(f"📁 Çıxış faylı: {output_path}")
            print(f"📊 Tapılan string sayı: {len(strings)}")
        
        return success

def main():
    """Əsas funksiya"""
    print("🔓 Android Python 3.9 PyC Decompiler")
    print("=" * 50)
    
    decompiler = PyCDecompiler()
    
    if len(sys.argv) < 2:
        print("📖 İstifadə:")
        print(f"   python3 {sys.argv[0]} <input.pyc> [output.py]")
        print("\n📱 Android mühitində:")
        print("   # Termux")
        print("   python3 pyc_decompiler.py file.pyc")
        print("   # Pydroid3")
        print("   python pyc_decompiler.py file.pyc")
        return
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    # Deşifrə et
    success = decompiler.decompile_file(input_file, output_file)
    
    if success:
        print("\n✅ Uğurla tamamlandı!")
    else:
        print("\n❌ Deşifrə uğursuz oldu!")
        sys.exit(1)

if __name__ == "__main__":
    main()