#!/usr/bin/env python3
import marshal
import sys
import re

def decode_bytes_array(bytes_str):
    """Decode bytes([...]) arrays to readable strings"""
    try:
        # Find all bytes([...]) patterns
        pattern = r'bytes\(\[([^\]]+)\]\)\.decode\(\)'
        matches = re.findall(pattern, bytes_str)
        
        decoded = bytes_str
        for match in matches:
            # Convert the array to actual bytes
            numbers = [int(x.strip()) for x in match.split(',')]
            byte_array = bytes(numbers)
            decoded_string = byte_array.decode('utf-8')
            
            # Replace in the original string
            old_pattern = f"bytes([{match}]).decode()"
            decoded = decoded.replace(old_pattern, f"'{decoded_string}'")
        
        return decoded
    except Exception as e:
        print(f"Error decoding bytes arrays: {e}")
        return bytes_str

def extract_marshal_data(filename):
    """Extract marshal data from the obfuscated file"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== ORIGINAL FILE ANALYSIS ===")
        print("File size:", len(content), "characters")
        
        # Decode the bytes arrays first
        print("\n=== DECODING BYTES ARRAYS ===")
        decoded_content = decode_bytes_array(content)
        print("Decoded content (first 1000 chars):")
        print(decoded_content[:1000])
        
        # Find marshal data
        print("\n=== EXTRACTING MARSHAL DATA ===")
        marshal_pattern = r"marshal\.loads\(b'([^']+)'\)"
        marshal_matches = re.findall(marshal_pattern, content)
        
        if not marshal_matches:
            print("No marshal data found with regex!")
            return
        
        print(f"Found {len(marshal_matches)} marshal data blocks")
        
        for i, marshal_data in enumerate(marshal_matches):
            print(f"\n--- Marshal Block {i+1} ---")
            print(f"Length: {len(marshal_data)} characters")
            print(f"First 100 chars: {marshal_data[:100]}")
            
            try:
                # Convert to bytes and load
                marshal_bytes = marshal_data.encode('latin1')
                code_obj = marshal.loads(marshal_bytes)
                
                print(f"Successfully loaded marshal block {i+1}!")
                print(f"Code object: {code_obj}")
                
                # Try to get source code if possible
                try:
                    import ast
                    if hasattr(code_obj, 'co_code'):
                        print(f"Bytecode length: {len(code_obj.co_code)}")
                        
                        # Try to decompile
                        try:
                            import uncompyle6
                            source = uncompyle6.decompile_file(filename, marshal_data)
                            print(f"Decompiled source:\n{source}")
                        except ImportError:
                            print("uncompyle6 not available, trying dis module...")
                            import dis
                            dis.dis(code_obj)
                        except Exception as e:
                            print(f"Decompilation failed: {e}")
                            import dis
                            dis.dis(code_obj)
                            
                except Exception as e:
                    print(f"Error analyzing code object: {e}")
                    
            except Exception as e:
                print(f"Error loading marshal block {i+1}: {e}")
                
                # Try alternative encoding
                try:
                    marshal_bytes = marshal_data.encode('utf-8')
                    code_obj = marshal.loads(marshal_bytes)
                    print(f"Successfully loaded with UTF-8 encoding!")
                except:
                    print("UTF-8 encoding also failed")
        
    except Exception as e:
        print(f"Error processing file: {e}")

if __name__ == "__main__":
    extract_marshal_data("Facebook-1.py")