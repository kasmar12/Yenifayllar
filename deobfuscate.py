#!/usr/bin/env python3
import marshal
import sys

def deobfuscate_file(filename):
    """Deobfuscate the Facebook-1.py file by extracting marshal data"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("Original file content (first 500 chars):")
        print(content[:500])
        print("\n" + "="*50 + "\n")
        
        # Find marshal data
        marshal_start = content.find("marshal.loads(b'")
        if marshal_start == -1:
            print("No marshal data found!")
            return
        
        # Extract the marshal string
        marshal_start += len("marshal.loads(b'")
        marshal_end = content.find("')", marshal_start)
        if marshal_end == -1:
            print("Could not find end of marshal data!")
            return
        
        marshal_data = content[marshal_start:marshal_end]
        print(f"Found marshal data: {marshal_data[:100]}...")
        
        # Try to decode the marshal data
        try:
            # Convert the string representation back to bytes
            marshal_bytes = marshal_data.encode('latin1')
            
            # Load the marshal data
            code_obj = marshal.loads(marshal_bytes)
            
            print("Successfully loaded marshal data!")
            print(f"Code object: {code_obj}")
            
            # Try to disassemble
            import dis
            print("\nDisassembled code:")
            dis.dis(code_obj)
            
        except Exception as e:
            print(f"Error decoding marshal data: {e}")
            
            # Try alternative approach - extract the actual bytes
            print("\nTrying to extract actual bytes...")
            try:
                # Look for the actual byte string in the file
                with open(filename, 'rb') as f:
                    binary_content = f.read()
                
                # Find marshal.loads(b'...') pattern
                import re
                pattern = rb'marshal\.loads\(b\'([^\']+)\'\)'
                match = re.search(pattern, binary_content)
                
                if match:
                    marshal_bytes = match.group(1)
                    print(f"Found marshal bytes: {marshal_bytes[:100]}...")
                    
                    # Try to load it
                    code_obj = marshal.loads(marshal_bytes)
                    print("Successfully loaded marshal data from binary!")
                    
                    # Disassemble
                    import dis
                    print("\nDisassembled code:")
                    dis.dis(code_obj)
                    
            except Exception as e2:
                print(f"Alternative approach also failed: {e2}")
                
    except Exception as e:
        print(f"Error reading file: {e}")

if __name__ == "__main__":
    deobfuscate_file("Facebook-1.py")