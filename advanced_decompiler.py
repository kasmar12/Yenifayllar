#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Təkmilləşdirilmiş Android Python 3.9 PyC Decompiler
Daha dərin bytecode analizi və kod yenidən qurma
"""

import marshal
import dis
import ast
import os
import sys
import re
from pathlib import Path
from typing import Optional, Union, Dict, Any, List, Tuple

class AdvancedPyCDecompiler:
    """Təkmilləşdirilmiş PyC decompiler"""
    
    def __init__(self):
        self.supported_versions = [(3, 9), (3, 8), (3, 7)]
        self.current_version = sys.version_info[:2]
        self.opcode_map = self._build_opcode_map()
        
    def _build_opcode_map(self) -> Dict[int, str]:
        """Opcode xəritəsini yaradır"""
        return {
            1: 'POP_TOP',
            2: 'ROT_TWO', 
            3: 'ROT_THREE',
            4: 'DUP_TOP',
            5: 'DUP_TOP_TWO',
            9: 'NOP',
            10: 'UNARY_POSITIVE',
            11: 'UNARY_NEGATIVE',
            12: 'UNARY_NOT',
            15: 'UNARY_INVERT',
            19: 'BINARY_POWER',
            20: 'BINARY_MULTIPLY',
            21: 'BINARY_MODULO',
            22: 'BINARY_ADD',
            23: 'BINARY_SUBTRACT',
            24: 'BINARY_SUBSCR',
            25: 'BINARY_FLOOR_DIVIDE',
            26: 'BINARY_TRUE_DIVIDE',
            27: 'BINARY_LSHIFT',
            28: 'BINARY_RSHIFT',
            29: 'BINARY_AND',
            30: 'BINARY_XOR',
            31: 'BINARY_OR',
            32: 'INPLACE_POWER',
            33: 'INPLACE_MULTIPLY',
            34: 'INPLACE_MODULO',
            35: 'INPLACE_ADD',
            36: 'INPLACE_SUBTRACT',
            37: 'INPLACE_FLOOR_DIVIDE',
            38: 'INPLACE_TRUE_DIVIDE',
            39: 'INPLACE_LSHIFT',
            40: 'INPLACE_RSHIFT',
            41: 'INPLACE_AND',
            42: 'INPLACE_XOR',
            43: 'INPLACE_OR',
            50: 'GET_AITER',
            51: 'GET_ANEXT',
            52: 'BEFORE_ASYNC_WITH',
            53: 'BEGIN_FINALLY',
            54: 'END_ASYNC_FOR',
            55: 'INPLACE_ADD',
            56: 'INPLACE_SUBTRACT',
            57: 'INPLACE_MULTIPLY',
            58: 'INPLACE_DIVIDE',
            59: 'INPLACE_MODULO',
            60: 'STORE_SUBSCR',
            61: 'DELETE_SUBSCR',
            62: 'BINARY_LSHIFT',
            63: 'BINARY_RSHIFT',
            64: 'BINARY_AND',
            65: 'BINARY_XOR',
            66: 'BINARY_OR',
            67: 'INPLACE_POWER',
            68: 'GET_ITER',
            69: 'GET_YIELD_FROM_ITER',
            70: 'PRINT_EXPR',
            71: 'LOAD_BUILD_CLASS',
            72: 'YIELD_FROM',
            73: 'GET_AWAITABLE',
            74: 'LOAD_ASSERTION_ERROR',
            75: 'INPLACE_LSHIFT',
            76: 'INPLACE_RSHIFT',
            77: 'INPLACE_AND',
            78: 'INPLACE_XOR',
            79: 'INPLACE_OR',
            80: 'LIST_APPEND',
            81: 'SET_ADD',
            82: 'MAP_ADD',
            83: 'RETURN_VALUE',
            84: 'IMPORT_STAR',
            85: 'SETUP_ANNOTATIONS',
            86: 'YIELD_VALUE',
            87: 'POP_BLOCK',
            88: 'POP_EXCEPT',
            89: 'HAVE_ARGUMENT',
            90: 'STORE_NAME',
            91: 'DELETE_NAME',
            92: 'UNPACK_SEQUENCE',
            93: 'FOR_ITER',
            94: 'UNPACK_EX',
            95: 'STORE_ATTR',
            96: 'DELETE_ATTR',
            97: 'STORE_GLOBAL',
            98: 'DELETE_GLOBAL',
            99: 'LOAD_CONST',
            100: 'LOAD_NAME',
            101: 'BUILD_TUPLE',
            102: 'BUILD_LIST',
            103: 'BUILD_SET',
            104: 'BUILD_MAP',
            105: 'LOAD_ATTR',
            106: 'COMPARE_OP',
            107: 'IMPORT_NAME',
            108: 'IMPORT_FROM',
            109: 'JUMP_FORWARD',
            110: 'JUMP_IF_FALSE_OR_POP',
            111: 'JUMP_IF_TRUE_OR_POP',
            112: 'JUMP_ABSOLUTE',
            113: 'POP_JUMP_IF_FALSE',
            114: 'POP_JUMP_IF_TRUE',
            115: 'LOAD_GLOBAL',
            116: 'SETUP_FINALLY',
            117: 'LOAD_FAST',
            118: 'STORE_FAST',
            119: 'DELETE_FAST',
            120: 'LOAD_CLOSURE',
            121: 'LOAD_DEREF',
            122: 'STORE_DEREF',
            123: 'DELETE_DEREF',
            124: 'RAISE_VARARGS',
            125: 'CALL_FUNCTION',
            126: 'MAKE_FUNCTION',
            127: 'BUILD_SLICE',
            128: 'LOAD_CLASSDEREF',
            130: 'EXTENDED_ARG',
            131: 'SETUP_WITH',
            132: 'EXTENDED_ARG',
            133: 'LIST_APPEND',
            134: 'SET_ADD',
            135: 'MAP_ADD',
            136: 'LOAD_CLASSDEREF',
            137: 'EXTENDED_ARG',
            138: 'SETUP_ASYNC_WITH',
            139: 'FORMAT_VALUE',
            140: 'BUILD_CONST_KEY_MAP',
            141: 'BUILD_STRING',
            142: 'LOAD_METHOD',
            143: 'CALL_METHOD',
            144: 'LIST_EXTEND',
            145: 'SET_UPDATE',
            146: 'DICT_MERGE',
            147: 'DICT_UPDATE',
            148: 'LOAD_FROM_DICT_ENTRY',
            149: 'LOAD_FROM_DICT_ENTRY',
            150: 'LOAD_FROM_DICT_ENTRY',
            151: 'LOAD_FROM_DICT_ENTRY',
            152: 'LOAD_FROM_DICT_ENTRY',
            153: 'LOAD_FROM_DICT_ENTRY',
            154: 'LOAD_FROM_DICT_ENTRY',
            155: 'LOAD_FROM_DICT_ENTRY',
            156: 'LOAD_FROM_DICT_ENTRY',
            157: 'LOAD_FROM_DICT_ENTRY',
            158: 'LOAD_FROM_DICT_ENTRY',
            159: 'LOAD_FROM_DICT_ENTRY',
            160: 'LOAD_FROM_DICT_ENTRY',
            161: 'LOAD_FROM_DICT_ENTRY',
            162: 'LOAD_FROM_DICT_ENTRY',
            163: 'LOAD_FROM_DICT_ENTRY',
            164: 'LOAD_FROM_DICT_ENTRY',
            165: 'LOAD_FROM_DICT_ENTRY',
            166: 'LOAD_FROM_DICT_ENTRY',
            167: 'LOAD_FROM_DICT_ENTRY',
            168: 'LOAD_FROM_DICT_ENTRY',
            169: 'LOAD_FROM_DICT_ENTRY',
            170: 'LOAD_FROM_DICT_ENTRY',
            171: 'LOAD_FROM_DICT_ENTRY',
            172: 'LOAD_FROM_DICT_ENTRY',
            173: 'LOAD_FROM_DICT_ENTRY',
            174: 'LOAD_FROM_DICT_ENTRY',
            175: 'LOAD_FROM_DICT_ENTRY',
            176: 'LOAD_FROM_DICT_ENTRY',
            177: 'LOAD_FROM_DICT_ENTRY',
            178: 'LOAD_FROM_DICT_ENTRY',
            179: 'LOAD_FROM_DICT_ENTRY',
            180: 'LOAD_FROM_DICT_ENTRY',
            181: 'LOAD_FROM_DICT_ENTRY',
            182: 'LOAD_FROM_DICT_ENTRY',
            183: 'LOAD_FROM_DICT_ENTRY',
            184: 'LOAD_FROM_DICT_ENTRY',
            185: 'LOAD_FROM_DICT_ENTRY',
            186: 'LOAD_FROM_DICT_ENTRY',
            187: 'LOAD_FROM_DICT_ENTRY',
            188: 'LOAD_FROM_DICT_ENTRY',
            189: 'LOAD_FROM_DICT_ENTRY',
            190: 'LOAD_FROM_DICT_ENTRY',
            191: 'LOAD_FROM_DICT_ENTRY',
            192: 'LOAD_FROM_DICT_ENTRY',
            193: 'LOAD_FROM_DICT_ENTRY',
            194: 'LOAD_FROM_DICT_ENTRY',
            195: 'LOAD_FROM_DICT_ENTRY',
            196: 'LOAD_FROM_DICT_ENTRY',
            197: 'LOAD_FROM_DICT_ENTRY',
            198: 'LOAD_FROM_DICT_ENTRY',
            199: 'LOAD_FROM_DICT_ENTRY',
            200: 'LOAD_FROM_DICT_ENTRY',
            201: 'LOAD_FROM_DICT_ENTRY',
            202: 'LOAD_FROM_DICT_ENTRY',
            203: 'LOAD_FROM_DICT_ENTRY',
            204: 'LOAD_FROM_DICT_ENTRY',
            205: 'LOAD_FROM_DICT_ENTRY',
            206: 'LOAD_FROM_DICT_ENTRY',
            207: 'LOAD_FROM_DICT_ENTRY',
            208: 'LOAD_FROM_DICT_ENTRY',
            209: 'LOAD_FROM_DICT_ENTRY',
            210: 'LOAD_FROM_DICT_ENTRY',
            211: 'LOAD_FROM_DICT_ENTRY',
            212: 'LOAD_FROM_DICT_ENTRY',
            213: 'LOAD_FROM_DICT_ENTRY',
            214: 'LOAD_FROM_DICT_ENTRY',
            215: 'LOAD_FROM_DICT_ENTRY',
            216: 'LOAD_FROM_DICT_ENTRY',
            217: 'LOAD_FROM_DICT_ENTRY',
            218: 'LOAD_FROM_DICT_ENTRY',
            219: 'LOAD_FROM_DICT_ENTRY',
            220: 'LOAD_FROM_DICT_ENTRY',
            221: 'LOAD_FROM_DICT_ENTRY',
            222: 'LOAD_FROM_DICT_ENTRY',
            223: 'LOAD_FROM_DICT_ENTRY',
            224: 'LOAD_FROM_DICT_ENTRY',
            225: 'LOAD_FROM_DICT_ENTRY',
            226: 'LOAD_FROM_DICT_ENTRY',
            227: 'LOAD_FROM_DICT_ENTRY',
            228: 'LOAD_FROM_DICT_ENTRY',
            229: 'LOAD_FROM_DICT_ENTRY',
            230: 'LOAD_FROM_DICT_ENTRY',
            231: 'LOAD_FROM_DICT_ENTRY',
            232: 'LOAD_FROM_DICT_ENTRY',
            233: 'LOAD_FROM_DICT_ENTRY',
            234: 'LOAD_FROM_DICT_ENTRY',
            235: 'LOAD_FROM_DICT_ENTRY',
            236: 'LOAD_FROM_DICT_ENTRY',
            237: 'LOAD_FROM_DICT_ENTRY',
            238: 'LOAD_FROM_DICT_ENTRY',
            239: 'LOAD_FROM_DICT_ENTRY',
            240: 'LOAD_FROM_DICT_ENTRY',
            241: 'LOAD_FROM_DICT_ENTRY',
            242: 'LOAD_FROM_DICT_ENTRY',
            243: 'LOAD_FROM_DICT_ENTRY',
            244: 'LOAD_FROM_DICT_ENTRY',
            245: 'LOAD_FROM_DICT_ENTRY',
            246: 'LOAD_FROM_DICT_ENTRY',
            247: 'LOAD_FROM_DICT_ENTRY',
            248: 'LOAD_FROM_DICT_ENTRY',
            249: 'LOAD_FROM_DICT_ENTRY',
            250: 'LOAD_FROM_DICT_ENTRY',
            251: 'LOAD_FROM_DICT_ENTRY',
            252: 'LOAD_FROM_DICT_ENTRY',
            253: 'LOAD_FROM_DICT_ENTRY',
            254: 'LOAD_FROM_DICT_ENTRY',
            255: 'LOAD_FROM_DICT_ENTRY'
        }
    
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
                
            with open(file_path, 'rb') as f:
                # Python 3.7+ üçün header formatı
                if self.current_version >= (3, 7):
                    magic = f.read(4)
                    timestamp = f.read(4)
                    size = f.read(4)
                    source_size = f.read(4)
                    
                    print(f"🔍 Magic: {magic.hex()}")
                    print(f"📅 Timestamp: {int.from_bytes(timestamp, 'little')}")
                    print(f"📏 Size: {int.from_bytes(size, 'little')}")
                    print(f"📄 Source size: {int.from_bytes(source_size, 'little')}")
                
                bytecode = f.read()
                print(f"✅ Bytecode oxundu: {len(bytecode)} byte")
                return bytecode
                
        except Exception as e:
            print(f"❌ Fayl oxuma xətası: {e}")
            return None
    
    def decompile_marshal(self, bytecode: bytes) -> Optional[Any]:
        """Marshal ilə şifrələnmiş bytecode-u deşifrə edir"""
        try:
            code_object = marshal.loads(bytecode)
            print(f"✅ Marshal deşifrə edildi: {type(code_object).__name__}")
            return code_object
            
        except Exception as e:
            print(f"❌ Marshal deşifrə xətası: {e}")
            return None
    
    def analyze_bytecode_structure(self, code_object) -> Dict[str, Any]:
        """Bytecode strukturunu dərin analiz edir"""
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
            print(f"   Stack ölçüsü: {info['co_stacksize']}")
            print(f"   Flags: {info['co_flags']}")
            
            return info
            
        except Exception as e:
            print(f"❌ Code object analiz xətası: {e}")
            return {}
    
    def extract_constants(self, code_object) -> List[Any]:
        """Code object-dən bütün constants-ları çıxarır"""
        constants = []
        try:
            for i, const in enumerate(code_object.co_consts):
                const_info = {
                    'index': i,
                    'type': type(const).__name__,
                    'value': const,
                    'repr': repr(const)
                }
                constants.append(const_info)
                
            print(f"📝 {len(constants)} constant tapıldı")
            return constants
            
        except Exception as e:
            print(f"❌ Constants çıxarma xətası: {e}")
            return []
    
    def extract_names(self, code_object) -> List[str]:
        """Code object-dən bütün names-ləri çıxarır"""
        names = []
        try:
            for i, name in enumerate(code_object.co_names):
                names.append({
                    'index': i,
                    'name': name,
                    'type': 'global_name'
                })
                
            for i, name in enumerate(code_object.co_varnames):
                names.append({
                    'index': i,
                    'name': name,
                    'type': 'local_var'
                })
                
            for i, name in enumerate(code_object.co_freevars):
                names.append({
                    'index': i,
                    'name': name,
                    'type': 'free_var'
                })
                
            print(f"📝 {len(names)} name tapıldı")
            return names
            
        except Exception as e:
            print(f"❌ Names çıxarma xətası: {e}")
            return []
    
    def analyze_bytecode_flow(self, code_object) -> List[Dict[str, Any]]:
        """Bytecode axınını analiz edir"""
        flow = []
        try:
            code = code_object.co_code
            i = 0
            
            while i < len(code):
                opcode = code[i]
                opname = self.opcode_map.get(opcode, f"UNKNOWN_{opcode}")
                
                instruction = {
                    'offset': i,
                    'opcode': opcode,
                    'opname': opname,
                    'arg': None,
                    'argval': None
                }
                
                # Argument varsa oxu
                if opcode >= 90:  # HAVE_ARGUMENT
                    arg = code[i + 1] + (code[i + 2] << 8)
                    instruction['arg'] = arg
                    
                    # Argument dəyərini tap
                    if opname == 'LOAD_CONST':
                        instruction['argval'] = code_object.co_consts[arg] if arg < len(code_object.co_consts) else None
                    elif opname == 'LOAD_NAME':
                        instruction['argval'] = code_object.co_names[arg] if arg < len(code_object.co_names) else None
                    elif opname == 'LOAD_FAST':
                        instruction['argval'] = code_object.co_varnames[arg] if arg < len(code_object.co_varnames) else None
                    elif opname == 'LOAD_GLOBAL':
                        instruction['argval'] = code_object.co_names[arg] if arg < len(code_object.co_names) else None
                    
                    i += 3
                else:
                    i += 1
                
                flow.append(instruction)
            
            print(f"📊 {len(flow)} instruction analiz edildi")
            return flow
            
        except Exception as e:
            print(f"❌ Bytecode flow analiz xətası: {e}")
            return []
    
    def generate_python_like_code(self, code_object, flow: List[Dict[str, Any]]) -> str:
        """Bytecode-dan Python-a bənzər kod yaradır"""
        try:
            lines = []
            lines.append(f"# Deşifrə edilmiş kod: {code_object.co_name}")
            lines.append(f"# Fayl: {code_object.co_filename}")
            lines.append("")
            
            # Funksiya başlanğıcı
            if code_object.co_name != '<module>':
                args = []
                for i in range(code_object.co_argcount):
                    if i < len(code_object.co_varnames):
                        args.append(code_object.co_varnames[i])
                
                lines.append(f"def {code_object.co_name}({', '.join(args)}):")
                indent = "    "
            else:
                indent = ""
            
            # Constants-ları əlavə et
            constants = self.extract_constants(code_object)
            if constants:
                lines.append(f"{indent}# Constants:")
                for const in constants:
                    if const['type'] == 'str':
                        lines.append(f"{indent}# {const['index']}: '{const['value']}'")
                    else:
                        lines.append(f"{indent}# {const['index']}: {const['repr']}")
                lines.append("")
            
            # Names-ləri əlavə et
            names = self.extract_names(code_object)
            if names:
                lines.append(f"{indent}# Names:")
                for name in names:
                    lines.append(f"{indent}# {name['type']}: {name['name']}")
                lines.append("")
            
            # Təxmini kod strukturunu yaradır
            lines.append(f"{indent}# Təxmini kod:")
            lines.append(f"{indent}# Bu hissə bytecode analizi əsasında yaradılıb")
            lines.append(f"{indent}# Tam dəqiqlik təmin edilmir")
            lines.append("")
            
            # Sadə instruction analizi
            for i, inst in enumerate(flow[:20]):  # İlk 20 instruction
                if inst['opname'] == 'LOAD_CONST':
                    if inst['argval'] is not None:
                        if isinstance(inst['argval'], str):
                            lines.append(f"{indent}# {inst['offset']}: LOAD_CONST '{inst['argval']}'")
                        else:
                            lines.append(f"{indent}# {inst['offset']}: LOAD_CONST {inst['argval']}")
                elif inst['opname'] == 'CALL_FUNCTION':
                    lines.append(f"{indent}# {inst['offset']}: CALL_FUNCTION({inst['arg']})")
                elif inst['opname'] == 'RETURN_VALUE':
                    lines.append(f"{indent}# {inst['offset']}: RETURN_VALUE")
                elif inst['opname'] == 'STORE_NAME':
                    if inst['argval'] is not None:
                        lines.append(f"{indent}# {inst['offset']}: STORE_NAME '{inst['argval']}'")
            
            if len(flow) > 20:
                lines.append(f"{indent}# ... və {len(flow) - 20} əlavə instruction")
            
            return "\n".join(lines)
            
        except Exception as e:
            print(f"❌ Python kod yaratma xətası: {e}")
            return f"# Kod yaratma xətası: {e}"
    
    def save_advanced_analysis(self, output_path: str, code_info: Dict[str, Any], 
                              constants: List[Any], names: List[Any], 
                              flow: List[Dict[str, Any]], python_code: str) -> bool:
        """Təkmilləşdirilmiş analizi fayla yazır"""
        try:
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write("# TƏKMİLLƏŞDİRİLMİŞ PYC ANALİZİ\n")
                f.write("=" * 60 + "\n\n")
                
                # Əsas məlumatlar
                f.write("## ƏSAS MƏLUMATLAR\n")
                f.write(f"Fayl: {code_info.get('co_filename', 'Unknown')}\n")
                f.write(f"Funksiya: {code_info.get('co_name', 'Unknown')}\n")
                f.write(f"Arqument sayı: {code_info.get('co_argcount', 0)}\n")
                f.write(f"Lokal dəyişən sayı: {code_info.get('co_nlocals', 0)}\n")
                f.write(f"Stack ölçüsü: {code_info.get('co_stacksize', 0)}\n")
                f.write(f"Flags: {code_info.get('co_flags', 0)}\n\n")
                
                # Constants
                f.write("## CONSTANTS\n")
                for const in constants:
                    f.write(f"{const['index']:2d}: {const['type']:12s} = {const['repr']}\n")
                f.write("\n")
                
                # Names
                f.write("## NAMES\n")
                for name in names:
                    f.write(f"{name['index']:2d}: {name['type']:12s} = {name['name']}\n")
                f.write("\n")
                
                # Bytecode flow
                f.write("## BYTECODE FLOW\n")
                for inst in flow[:50]:  # İlk 50 instruction
                    if inst['arg'] is not None:
                        f.write(f"{inst['offset']:4d}: {inst['opname']:20s} {inst['arg']:4d}")
                        if inst['argval'] is not None:
                            f.write(f" -> {inst['argval']}")
                        f.write("\n")
                    else:
                        f.write(f"{inst['offset']:4d}: {inst['opname']}\n")
                
                if len(flow) > 50:
                    f.write(f"... və {len(flow) - 50} əlavə instruction\n")
                f.write("\n")
                
                # Python-a bənzər kod
                f.write("## PYTHON-A BƏNZƏR KOD\n")
                f.write(python_code)
                
            print(f"✅ Təkmilləşdirilmiş analiz saxlanıldı: {output_path}")
            return True
            
        except Exception as e:
            print(f"❌ Fayl yazma xətası: {e}")
            return False
    
    def decompile_file(self, input_path: str, output_path: Optional[str] = None) -> bool:
        """Əsas deşifrə funksiyası"""
        print(f"🚀 Təkmilləşdirilmiş PyC analizi: {input_path}")
        print(f"🐍 Python versiyası: {'.'.join(map(str, self.current_version))}")
        
        # Uyğunluğu yoxla
        if not self.check_compatibility():
            print(f"⚠️  Python versiyası {self.current_version} dəstəklənmir")
        
        # PyC faylını oxu
        bytecode = self.read_pyc_file(input_path)
        if not bytecode:
            return False
        
        # Marshal ilə deşifrə et
        code_object = self.decompile_marshal(bytecode)
        if not code_object:
            return False
        
        # Code object-i analiz et
        code_info = self.analyze_bytecode_structure(code_object)
        if not code_info:
            return False
        
        # Constants və names çıxar
        constants = self.extract_constants(code_object)
        names = self.extract_names(code_object)
        
        # Bytecode flow analiz et
        flow = self.analyze_bytecode_flow(code_object)
        
        # Python-a bənzər kod yarad
        python_code = self.generate_python_like_code(code_object, flow)
        
        # Çıxış faylını təyin et
        if not output_path:
            input_file = Path(input_path)
            output_path = input_file.with_suffix('.advanced_analysis.py').name
        
        # Məlumatları saxla
        success = self.save_advanced_analysis(output_path, code_info, constants, names, flow, python_code)
        
        if success:
            print(f"\n🎉 Təkmilləşdirilmiş analiz tamamlandı!")
            print(f"📁 Çıxış faylı: {output_path}")
            print(f"📊 Tapılan constant sayı: {len(constants)}")
            print(f"📊 Tapılan name sayı: {len(names)}")
            print(f"📊 Analiz edilən instruction sayı: {len(flow)}")
        
        return success

def main():
    """Əsas funksiya"""
    print("🔓 Təkmilləşdirilmiş Android Python 3.9 PyC Decompiler")
    print("=" * 60)
    
    decompiler = AdvancedPyCDecompiler()
    
    if len(sys.argv) < 2:
        print("📖 İstifadə:")
        print(f"   python3 {sys.argv[0]} <input.pyc> [output.py]")
        print("\n📱 Android mühitində:")
        print("   # Termux")
        print("   python3 advanced_decompiler.py file.pyc")
        print("   # Pydroid3")
        print("   python advanced_decompiler.py file.pyc")
        return
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    # Deşifrə et
    success = decompiler.decompile_file(input_file, output_file)
    
    if success:
        print("\n✅ Uğurla tamamlandı!")
    else:
        print("\n❌ Analiz uğursuz oldu!")
        sys.exit(1)

if __name__ == "__main__":
    main()