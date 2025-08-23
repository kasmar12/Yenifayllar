#!/usr/bin/env python3
import re

def analyze_file_structure(filename):
    """Analyze the structure of the Facebook-1.py file"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        print("=== FILE STRUCTURE ANALYSIS ===")
        print(f"Total file size: {len(content)} characters")
        
        # Find all imports
        import_pattern = r'^import\s+(\w+)'
        imports = re.findall(import_pattern, content, re.MULTILINE)
        print(f"\nImports found: {imports}")
        
        # Find all function definitions
        function_pattern = r'^def\s+(\w+)\s*\('
        functions = re.findall(function_pattern, content, re.MULTILINE)
        print(f"Functions found: {functions}")
        
        # Find all class definitions
        class_pattern = r'^class\s+(\w+)'
        classes = re.findall(class_pattern, content, re.MULTILINE)
        print(f"Classes found: {classes}")
        
        # Find all string literals
        string_pattern = r'["\']([^"\']+)["\']'
        strings = re.findall(string_pattern, content)
        unique_strings = list(set(strings))
        print(f"\nUnique strings found (first 20): {unique_strings[:20]}")
        
        # Find all print statements
        print_pattern = r'print\s*\(([^)]+)\)'
        print_statements = re.findall(print_pattern, content)
        print(f"\nPrint statements found: {print_statements}")
        
        # Find all exec statements
        exec_pattern = r'exec\s*\(([^)]+)\)'
        exec_statements = re.findall(exec_pattern, content)
        print(f"Exec statements found: {exec_statements}")
        
        # Find all marshal.loads calls
        marshal_pattern = r'marshal\.loads\s*\(([^)]+)\)'
        marshal_calls = re.findall(marshal_pattern, content)
        print(f"Marshal.loads calls found: {len(marshal_calls)}")
        
        # Look for specific patterns that might indicate what the script does
        print("\n=== CONTENT ANALYSIS ===")
        
        # Check for Facebook-related content
        facebook_keywords = ['facebook', 'fb', 'login', 'password', 'email', 'user', 'account']
        for keyword in facebook_keywords:
            if keyword.lower() in content.lower():
                print(f"Found keyword: {keyword}")
        
        # Check for suspicious patterns
        suspicious_patterns = [
            r'requests\.get',
            r'requests\.post',
            r'urllib',
            r'socket',
            r'subprocess',
            r'os\.system',
            r'eval\s*\(',
            r'__import__'
        ]
        
        for pattern in suspicious_patterns:
            matches = re.findall(pattern, content, re.IGNORECASE)
            if matches:
                print(f"Found suspicious pattern '{pattern}': {len(matches)} occurrences")
        
        # Show first 1000 characters of readable content
        print("\n=== READABLE CONTENT (first 1000 chars) ===")
        readable_content = re.sub(r'\\x[0-9a-fA-F]{2}', '', content)
        readable_content = re.sub(r'\\[0-7]{3}', '', readable_content)
        print(readable_content[:1000])
        
    except Exception as e:
        print(f"Error: {e}")

def main():
    analyze_file_structure("Facebook-1.py")

if __name__ == "__main__":
    main()