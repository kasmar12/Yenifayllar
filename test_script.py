#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Test skripti - PyC decompiler üçün
"""

def hello_world(name="Dünya"):
    """Salam verir"""
    message = f"Salam, {name}!"
    print(message)
    return message

def calculate_sum(a, b):
    """İki ədədi toplayır"""
    result = a + b
    print(f"{a} + {b} = {result}")
    return result

def main():
    """Əsas funksiya"""
    print("🔓 Test skripti başladıldı")
    
    # Funksiyaları çağır
    hello_world()
    hello_world("Android")
    
    # Hesablamalar
    total = calculate_sum(10, 20)
    print(f"Ümumi nəticə: {total}")
    
    # String-lər
    strings = ["Python", "Android", "Decompiler", "Test"]
    for s in strings:
        print(f"String: {s}")
    
    print("✅ Test tamamlandı!")

if __name__ == "__main__":
    main()