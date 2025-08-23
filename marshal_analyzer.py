#!/usr/bin/env python3
import marshal
import sys
import re

def analyze_marshal_data(filename):
    """Analyze the marshal data in the Facebook-1.py file"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== MARSHAL DATA ANALYSIS ===")
        
        # Find marshal.loads(b'...') pattern
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
        print(f"Marshal data length: {len(marshal_data)} characters")
        
        # Try to decode the marshal data
        try:
            # Convert the string representation back to bytes
            marshal_bytes = eval(f"b'{marshal_data}'")
            
            # Load the marshal data
            code_obj = marshal.loads(marshal_bytes)
            
            print("\n=== MARSHAL CODE OBJECT INFO ===")
            print(f"Type: {type(code_obj)}")
            print(f"Code object: {code_obj}")
            
            # Try to get more details about the code object
            if hasattr(code_obj, 'co_code'):
                print(f"\nBytecode length: {len(code_obj.co_code)}")
                print(f"First 100 bytes: {code_obj.co_code[:100]}")
            
            if hasattr(code_obj, 'co_names'):
                print(f"\nNames: {code_obj.co_names}")
            
            if hasattr(code_obj, 'co_consts'):
                print(f"\nConstants: {code_obj.co_consts}")
                
        except Exception as e:
            print(f"Error decoding marshal data: {e}")
            
            # Try alternative approach - extract raw bytes
            print("\n=== RAW BYTES ANALYSIS ===")
            try:
                # Find the actual bytes in the string
                bytes_pattern = r"\\x([0-9a-fA-F]{2})"
                bytes_matches = re.findall(bytes_pattern, marshal_data)
                
                if bytes_matches:
                    raw_bytes = bytes([int(b, 16) for b in bytes_matches])
                    print(f"Extracted {len(raw_bytes)} raw bytes")
                    
                    # Try to load as marshal
                    try:
                        code_obj = marshal.loads(raw_bytes)
                        print(f"Successfully loaded marshal object: {code_obj}")
                    except Exception as e2:
                        print(f"Failed to load as marshal: {e2}")
                        
            except Exception as e3:
                print(f"Error in raw bytes extraction: {e3}")
        
    except Exception as e:
        print(f"Error: {e}")

def main():
    analyze_marshal_data("Facebook-1.py")

if __name__ == "__main__":
    main()