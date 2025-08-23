#!/usr/bin/env python3
import marshal
import re

def simple_extract(filename):
    """Simple extraction of marshal data"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== SIMPLE EXTRACTION ===")
        
        # Find the marshal.loads(b'...') pattern
        start_marker = "marshal.loads(b'"
        end_marker = "')"
        
        start_pos = content.find(start_marker)
        if start_pos == -1:
            print("marshal.loads(b' not found!")
            return
        
        start_pos += len(start_marker)
        end_pos = content.find(end_marker, start_pos)
        
        if end_pos == -1:
            print("End marker not found!")
            return
        
        marshal_data = content[start_pos:end_pos]
        print(f"Found marshal data, length: {len(marshal_data)}")
        print(f"First 200 chars: {marshal_data[:200]}")
        
        # Try to load the marshal data
        try:
            marshal_bytes = marshal_data.encode('latin1')
            code_obj = marshal.loads(marshal_bytes)
            print(f"\nSuccessfully loaded marshal data!")
            print(f"Code object: {code_obj}")
            
            # Try to disassemble
            import dis
            print("\n=== DISASSEMBLED CODE ===")
            dis.dis(code_obj)
            
        except Exception as e:
            print(f"Error loading marshal data: {e}")
            
            # Try to save the marshal data to a file for inspection
            with open("extracted_marshal.bin", "wb") as f:
                f.write(marshal_data.encode('latin1'))
            print("Saved marshal data to extracted_marshal.bin")
            
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    simple_extract("Facebook-1.py")