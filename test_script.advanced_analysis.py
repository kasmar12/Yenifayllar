# TƏKMİLLƏŞDİRİLMİŞ PYC ANALİZİ
============================================================

## ƏSAS MƏLUMATLAR
Fayl: test_script.py
Funksiya: <module>
Arqument sayı: 0
Lokal dəyişən sayı: 0
Stack ölçüsü: 2
Flags: 0

## CONSTANTS
 0: str          = '\nTest skripti - PyC decompiler üçün\n'
 1: code         = <code object hello_world at 0x7f78289b0d50, file "test_script.py", line 7>
 2: code         = <code object calculate_sum at 0x7f78287abe30, file "test_script.py", line 13>
 3: code         = <code object main at 0x7f7828a62d80, file "test_script.py", line 19>
 4: str          = '__main__'
 5: NoneType     = None
 6: tuple        = ('Dünya',)

## NAMES
 0: global_name  = __doc__
 1: global_name  = hello_world
 2: global_name  = calculate_sum
 3: global_name  = main
 4: global_name  = __name__

## BYTECODE FLOW
   0: LOAD_FROM_DICT_ENTRY 21248
   3: UNKNOWN_0
   4: POP_JUMP_IF_TRUE     21248
   7: UNKNOWN_6
   8: RETURN_VALUE
   9: POP_TOP
  10: BINARY_TRUE_DIVIDE
  11: UNKNOWN_0
  12: COMPARE_OP           29185
  15: POP_TOP
  16: RETURN_VALUE
  17: ROT_TWO
  18: BINARY_TRUE_DIVIDE
  19: UNKNOWN_0
  20: POP_JUMP_IF_TRUE     21250
  23: ROT_THREE
  24: BINARY_TRUE_DIVIDE
  25: UNKNOWN_0
  26: POP_JUMP_IF_TRUE     23555
  29: DUP_TOP
  30: RETURN_VALUE
  31: DUP_TOP
  32: INPLACE_DIVIDE
  33: POP_EXCEPT
  34: UNKNOWN_0
  35: UNKNOWN_0
  36: STORE_GLOBAL            8
  39: UNKNOWN_0
  40: UNPACK_SEQUENCE      8707
  43: UNKNOWN_0
  44: BEGIN_FINALLY
  45: UNKNOWN_0
  46: UNKNOWN_0
  47: UNKNOWN_0
  48: UNKNOWN_0
  49: UNKNOWN_0
  50: UNKNOWN_0
  51: UNKNOWN_0
  52: INPLACE_POWER
  53: UNKNOWN_0
  54: BUILD_SET            26373
  57: DUP_TOP_TWO

## PYTHON-A BƏNZƏR KOD
# Deşifrə edilmiş kod: <module>
# Fayl: test_script.py

# Constants:
# 0: '
Test skripti - PyC decompiler üçün
'
# 1: <code object hello_world at 0x7f78289b0d50, file "test_script.py", line 7>
# 2: <code object calculate_sum at 0x7f78287abe30, file "test_script.py", line 13>
# 3: <code object main at 0x7f7828a62d80, file "test_script.py", line 19>
# 4: '__main__'
# 5: None
# 6: ('Dünya',)

# Names:
# global_name: __doc__
# global_name: hello_world
# global_name: calculate_sum
# global_name: main
# global_name: __name__

# Təxmini kod:
# Bu hissə bytecode analizi əsasında yaradılıb
# Tam dəqiqlik təmin edilmir

# 8: RETURN_VALUE
# 16: RETURN_VALUE
# ... və 22 əlavə instruction