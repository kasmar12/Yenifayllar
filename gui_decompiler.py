#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Android GUI PyC Decompiler
Tkinter ilə sadə interfeys (Android mühitində işləyir)
"""

import tkinter as tk
from tkinter import ttk, filedialog, messagebox, scrolledtext
import os
import sys
from pathlib import Path
from pyc_decompiler import PyCDecompiler
from advanced_decompiler import AdvancedPyCDecompiler

class AndroidPyCDecompilerGUI:
    """Android üçün PyC Decompiler GUI"""
    
    def __init__(self, root):
        self.root = root
        self.root.title("🔓 Android PyC Decompiler")
        self.root.geometry("800x600")
        
        # Decompiler instansları
        self.basic_decompiler = PyCDecompiler()
        self.advanced_decompiler = AdvancedPyCDecompiler()
        
        # Fayl dəyişənləri
        self.input_file = tk.StringVar()
        self.output_file = tk.StringVar()
        self.decompiler_type = tk.StringVar(value="basic")
        
        self.setup_ui()
        
    def setup_ui(self):
        """UI elementlərini yaradır"""
        # Ana frame
        main_frame = ttk.Frame(self.root, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Grid konfiqurasiyası
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(1, weight=1)
        
        # Başlıq
        title_label = ttk.Label(main_frame, text="🔓 Android Python 3.9 PyC Decompiler", 
                               font=("Arial", 16, "bold"))
        title_label.grid(row=0, column=0, columnspan=3, pady=(0, 20))
        
        # Fayl seçimi
        ttk.Label(main_frame, text="📁 Giriş PyC Faylı:").grid(row=1, column=0, sticky=tk.W, pady=5)
        ttk.Entry(main_frame, textvariable=self.input_file, width=50).grid(row=1, column=1, sticky=(tk.W, tk.E), padx=(5, 5))
        ttk.Button(main_frame, text="Seç", command=self.browse_input_file).grid(row=1, column=2)
        
        # Çıxış faylı
        ttk.Label(main_frame, text="💾 Çıxış Faylı:").grid(row=2, column=0, sticky=tk.W, pady=5)
        ttk.Entry(main_frame, textvariable=self.output_file, width=50).grid(row=2, column=1, sticky=(tk.W, tk.E), padx=(5, 5))
        ttk.Button(main_frame, text="Seç", command=self.browse_output_file).grid(row=2, column=2)
        
        # Decompiler növü
        ttk.Label(main_frame, text="🔧 Decompiler Növü:").grid(row=3, column=0, sticky=tk.W, pady=5)
        decompiler_frame = ttk.Frame(main_frame)
        decompiler_frame.grid(row=3, column=1, sticky=tk.W, padx=(5, 0))
        
        ttk.Radiobutton(decompiler_frame, text="Əsas", variable=self.decompiler_type, 
                       value="basic").pack(side=tk.LEFT, padx=(0, 10))
        ttk.Radiobutton(decompiler_frame, text="Təkmilləşdirilmiş", variable=self.decompiler_type, 
                       value="advanced").pack(side=tk.LEFT)
        
        # Deşifrə düyməsi
        decompile_button = ttk.Button(main_frame, text="🚀 Deşifrə Et", 
                                     command=self.decompile_file, style="Accent.TButton")
        decompile_button.grid(row=4, column=0, columnspan=3, pady=20)
        
        # Progress bar
        self.progress = ttk.Progressbar(main_frame, mode='indeterminate')
        self.progress.grid(row=5, column=0, columnspan=3, sticky=(tk.W, tk.E), pady=(0, 10))
        
        # Status label
        self.status_label = ttk.Label(main_frame, text="✅ Hazır", foreground="green")
        self.status_label.grid(row=6, column=0, columnspan=3, pady=(0, 10))
        
        # Nəticə mətn sahəsi
        ttk.Label(main_frame, text="📊 Nəticə:").grid(row=7, column=0, sticky=tk.W, pady=(10, 5))
        
        # Scrolled text widget
        self.result_text = scrolledtext.ScrolledText(main_frame, height=15, width=80)
        self.result_text.grid(row=8, column=0, columnspan=3, sticky=(tk.W, tk.E, tk.N, tk.S), pady=(0, 10))
        
        # Grid weight-ləri
        main_frame.rowconfigure(8, weight=1)
        
        # Alt düymələr
        button_frame = ttk.Frame(main_frame)
        button_frame.grid(row=9, column=0, columnspan=3, pady=(10, 0))
        
        ttk.Button(button_frame, text="🗑️ Təmizlə", command=self.clear_results).pack(side=tk.LEFT, padx=(0, 10))
        ttk.Button(button_frame, text="📋 Kopyala", command=self.copy_results).pack(side=tk.LEFT, padx=(0, 10))
        ttk.Button(button_frame, text="❌ Çıxış", command=self.root.quit).pack(side=tk.LEFT)
        
        # Fayl dəyişiklikləri üçün trace
        self.input_file.trace('w', self.on_input_file_change)
        
    def browse_input_file(self):
        """Giriş faylını seçir"""
        file_path = filedialog.askopenfilename(
            title="PyC Faylını Seç",
            filetypes=[
                ("Python bytecode", "*.pyc"),
                ("Python bytecode", "*.pyo"),
                ("Bütün fayllar", "*.*")
            ]
        )
        if file_path:
            self.input_file.set(file_path)
            
    def browse_output_file(self):
        """Çıxış faylını seçir"""
        file_path = filedialog.asksaveasfilename(
            title="Çıxış Faylını Saxla",
            defaultextension=".py",
            filetypes=[
                ("Python faylı", "*.py"),
                ("Mətn faylı", "*.txt"),
                ("Bütün fayllar", "*.*")
            ]
        )
        if file_path:
            self.output_file.set(file_path)
            
    def on_input_file_change(self, *args):
        """Giriş faylı dəyişdikdə avtomatik çıxış faylını təyin edir"""
        input_path = self.input_file.get()
        if input_path and not self.output_file.get():
            input_file = Path(input_path)
            if self.decompiler_type.get() == "advanced":
                output_name = input_file.with_suffix('.advanced_analysis.py').name
            else:
                output_name = input_file.with_suffix('.decompiled.py').name
            self.output_file.set(output_name)
            
    def decompile_file(self):
        """Faylı deşifrə edir"""
        input_path = self.input_file.get()
        output_path = self.output_file.get()
        
        if not input_path:
            messagebox.showerror("Xəta", "Zəhmət olmasa giriş faylını seçin!")
            return
            
        if not output_path:
            messagebox.showerror("Xəta", "Zəhmət olmasa çıxış faylını təyin edin!")
            return
            
        # UI-ı yenilə
        self.status_label.config(text="⏳ Deşifrə edilir...", foreground="blue")
        self.progress.start()
        self.result_text.delete(1.0, tk.END)
        
        try:
            # Decompiler seç
            if self.decompiler_type.get() == "advanced":
                decompiler = self.advanced_decompiler
                self.result_text.insert(tk.END, "🔓 Təkmilləşdirilmiş decompiler istifadə edilir...\n\n")
            else:
                decompiler = self.basic_decompiler
                self.result_text.insert(tk.END, "🔓 Əsas decompiler istifadə edilir...\n\n")
            
            # Deşifrə et
            success = decompiler.decompile_file(input_path, output_path)
            
            if success:
                self.status_label.config(text="✅ Uğurla tamamlandı!", foreground="green")
                self.result_text.insert(tk.END, f"🎉 Deşifrə uğurla tamamlandı!\n")
                self.result_text.insert(tk.END, f"📁 Çıxış faylı: {output_path}\n\n")
                
                # Çıxış faylının məzmununu oxu və göstər
                try:
                    with open(output_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                        self.result_text.insert(tk.END, "📄 Çıxış faylının məzmunu:\n")
                        self.result_text.insert(tk.END, "=" * 50 + "\n")
                        self.result_text.insert(tk.END, content)
                except Exception as e:
                    self.result_text.insert(tk.END, f"⚠️ Çıxış faylı oxuna bilmədi: {e}\n")
                    
            else:
                self.status_label.config(text="❌ Deşifrə uğursuz oldu!", foreground="red")
                self.result_text.insert(tk.END, "❌ Deşifrə uğursuz oldu!\n")
                self.result_text.insert(tk.END, "Zəhmət olmasa faylı və parametrləri yoxlayın.\n")
                
        except Exception as e:
            self.status_label.config(text="❌ Xəta baş verdi!", foreground="red")
            self.result_text.insert(tk.END, f"❌ Xəta baş verdi: {e}\n")
            messagebox.showerror("Xəta", f"Deşifrə zamanı xəta baş verdi:\n{e}")
            
        finally:
            self.progress.stop()
            
    def clear_results(self):
        """Nəticələri təmizləyir"""
        self.result_text.delete(1.0, tk.END)
        self.status_label.config(text="✅ Hazır", foreground="green")
        
    def copy_results(self):
        """Nəticələri kopyalayır"""
        try:
            content = self.result_text.get(1.0, tk.END)
            self.root.clipboard_clear()
            self.root.clipboard_append(content)
            messagebox.showinfo("Məlumat", "Nəticələr kopyalandı!")
        except Exception as e:
            messagebox.showerror("Xəta", f"Kopyalama xətası: {e}")

def check_dependencies():
    """Asılılıqları yoxlayır"""
    missing = []
    
    try:
        import tkinter
    except ImportError:
        missing.append("tkinter")
        
    try:
        from pyc_decompiler import PyCDecompiler
    except ImportError:
        missing.append("pyc_decompiler.py")
        
    try:
        from advanced_decompiler import AdvancedPyCDecompiler
    except ImportError:
        missing.append("advanced_decompiler.py")
        
    if missing:
        print("❌ Çatışmayan asılılıqlar:")
        for dep in missing:
            print(f"   - {dep}")
        print("\n📱 Android mühitində quraşdırma:")
        print("   # Termux")
        print("   pkg install python-tkinter")
        print("   # Pydroid3")
        print("   # Tkinter avtomatik quraşdırılıb")
        return False
        
    return True

def main():
    """Əsas funksiya"""
    print("🔓 Android GUI PyC Decompiler")
    print("=" * 40)
    
    # Asılılıqları yoxla
    if not check_dependencies():
        print("\n❌ Asılılıqlar çatışmır!")
        sys.exit(1)
    
    try:
        # Root window yarad
        root = tk.Tk()
        
        # GUI yarad
        app = AndroidPyCDecompilerGUI(root)
        
        # Window-u mərkəzdə yerləşdir
        root.update_idletasks()
        x = (root.winfo_screenwidth() // 2) - (root.winfo_width() // 2)
        y = (root.winfo_screenheight() // 2) - (root.winfo_height() // 2)
        root.geometry(f"+{x}+{y}")
        
        # GUI-ni başlat
        root.mainloop()
        
    except Exception as e:
        print(f"❌ GUI xətası: {e}")
        print("\n📱 Alternativ istifadə:")
        print("   python3 pyc_decompiler.py file.pyc")
        print("   python3 advanced_decompiler.py file.pyc")

if __name__ == "__main__":
    main()