#!/usr/bin/env python3
import re

def decode_bytes_arrays(content):
    """Decode all bytes([...]).decode() patterns in the content"""
    # Find all bytes([...]).decode() patterns
    pattern = r'bytes\(\[([^\]]+)\]\)\.decode\(\)'
    matches = re.findall(pattern, content)
    
    decoded_content = content
    
    for match in matches:
        try:
            # Convert the array to actual bytes
            numbers = [int(x.strip()) for x in match.split(',')]
            byte_array = bytes(numbers)
            decoded_string = byte_array.decode('utf-8')
            
            # Replace in the original string
            old_pattern = f"bytes([{match}]).decode()"
            decoded_content = decoded_content.replace(old_pattern, f"'{decoded_string}'")
            
            print(f"Decoded: {old_pattern} -> '{decoded_string}'")
            
        except Exception as e:
            print(f"Error decoding {match}: {e}")
    
    return decoded_content

def main():
    try:
        with open("Facebook-1.py", 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== DECODING BYTES ARRAYS ===")
        decoded_content = decode_bytes_arrays(content)
        
        print("\n=== DECODED CONTENT (first 2000 chars) ===")
        print(decoded_content[:2000])
        
        # Save decoded content
        with open("Facebook-1_decoded.py", 'w', encoding='utf-8') as f:
            f.write(decoded_content)
        
        print("\nDecoded content saved to Facebook-1_decoded.py")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()