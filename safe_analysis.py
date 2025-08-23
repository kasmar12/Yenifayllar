#!/usr/bin/env python3
import re
import base64

def safe_analyze_facebook_script(filename):
    """Safely analyze the Facebook-1.py script without executing it"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== SAFE ANALYSIS OF FACEBOOK-1.PY ===")
        print(f"File size: {len(content)} characters")
        
        # Extract the readable parts
        print("\n=== READABLE CODE STRUCTURE ===")
        
        # Find the version check
        version_check = re.search(r'PYTHON_VERSION.*?!=.*?3\.9', content, re.DOTALL)
        if version_check:
            print("✓ Python 3.9 version check found")
        
        # Find the marshal.loads call
        marshal_call = re.search(r'exec\(marshal\.loads\(b\'(.*?)\'\)\)', content, re.DOTALL)
        if marshal_call:
            print("✓ Marshal obfuscated code found")
            marshal_data = marshal_call.group(1)
            print(f"  Marshal data length: {len(marshal_data)} characters")
        
        # Look for specific patterns that indicate what the script does
        print("\n=== FUNCTIONALITY INDICATORS ===")
        
        # Check for Facebook account creation indicators
        account_creation_indicators = [
            'Create Account',
            'Done Create Account',
            'profile.php',
            'facebook.com'
        ]
        
        for indicator in account_creation_indicators:
            if indicator in content:
                print(f"✓ Found: {indicator}")
        
        # Check for suspicious network activity patterns
        network_patterns = [
            r'requests\.',
            r'urllib',
            r'http',
            r'www\.',
            r'\.com',
            r'\.org',
            r'\.net'
        ]
        
        for pattern in network_patterns:
            matches = re.findall(pattern, content, re.IGNORECASE)
            if matches:
                print(f"⚠ Network activity pattern: {pattern} ({len(matches)} occurrences)")
        
        # Check for data collection patterns
        data_patterns = [
            r'password',
            r'email',
            r'username',
            r'login',
            r'account',
            r'profile'
        ]
        
        for pattern in data_patterns:
            if re.search(pattern, content, re.IGNORECASE):
                print(f"⚠ Data collection pattern: {pattern}")
        
        # Check for obfuscation techniques
        obfuscation_patterns = [
            r'bytes\(\[.*?\]\)\.decode\(\)',
            r'marshal\.loads',
            r'exec\(',
            r'\\x[0-9a-fA-F]{2}',
            r'\\[0-7]{3}'
        ]
        
        print("\n=== OBFUSCATION TECHNIQUES ===")
        for pattern in obfuscation_patterns:
            matches = re.findall(pattern, content)
            if matches:
                print(f"✓ Obfuscation technique: {pattern} ({len(matches)} occurrences)")
        
        # Extract any readable strings that might reveal the purpose
        print("\n=== READABLE STRINGS ===")
        
        # Remove escape sequences to find readable text
        clean_content = content.replace('\\x00', '').replace('\\x', '')
        clean_content = re.sub(r'\\[0-7]{3}', '', clean_content)
        
        # Find strings that look like messages or URLs
        readable_strings = re.findall(r'[A-Za-z0-9\s\-_\.\/\?=&\+\%]+', clean_content)
        
        # Filter for meaningful strings
        meaningful_strings = []
        for s in readable_strings:
            if len(s) > 10 and any(word in s.lower() for word in ['facebook', 'account', 'create', 'done', 'profile', 'www']):
                meaningful_strings.append(s)
        
        for s in set(meaningful_strings):
            print(f"  {s}")
        
        # Summary
        print("\n=== SECURITY ASSESSMENT ===")
        print("⚠ This script appears to be a heavily obfuscated Facebook account creation tool")
        print("⚠ It uses multiple obfuscation techniques including:")
        print("  - Marshal bytecode obfuscation")
        print("  - Byte array encoding")
        print("  - Exec statements with obfuscated code")
        print("⚠ The script likely performs automated Facebook account creation")
        print("⚠ It may collect user credentials and personal information")
        print("⚠ DO NOT execute this script without proper security analysis")
        
    except Exception as e:
        print(f"Error during analysis: {e}")

def main():
    safe_analyze_facebook_script("Facebook-1.py")

if __name__ == "__main__":
    main()