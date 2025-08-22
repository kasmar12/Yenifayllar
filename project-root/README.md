# SMM Service Order System

A complete PHP web application for creating SMM (Social Media Marketing) service orders with ad verification flow.

## 🚀 Features

- **Clean Form Interface**: Modern, responsive design with Bootstrap
- **Service Selection**: Multiple SMM services (Instagram, TikTok, YouTube, etc.)
- **Ad Verification Flow**: Integration with AY.Live API for ad verification
- **SMM Panel Integration**: Automatic order creation via SMM Panel API
- **Error Handling**: Graceful error handling and user feedback
- **Security**: Input validation and sanitization

## 📁 Project Structure

```
/project-root
├── /public
│   ├── index.php          # Main form interface
│   ├── create-link.php    # AY.Live API integration
│   └── verify.php         # SMM Panel API integration
├── /includes
│   └── config.php         # API configuration
└── README.md              # This file
```

## 🛠️ Requirements

- PHP 7.4 or higher
- cURL extension enabled
- Web server (Apache/Nginx)
- Valid API keys for AY.Live and SMM Panel

## ⚙️ Installation

1. **Clone/Download** the project to your web server directory
2. **Configure API Keys** in `/includes/config.php`:
   ```php
   define("AYLIVE_API_KEY", "YOUR_ACTUAL_AYLIVE_API_KEY");
   define("SMM_API_KEY", "YOUR_ACTUAL_SMM_API_KEY");
   ```
3. **Update Domain** in config.php:
   ```php
   define("VERIFY_URL", "https://yourdomain.com/public/verify.php");
   ```
4. **Set Permissions** (if needed):
   ```bash
   chmod 755 /path/to/project-root
   ```

## 🔧 Configuration

### AY.Live API
- Get your API key from [ay.live](https://ay.live)
- Used for creating shortened ad verification links

### SMM Panel API
- Configure your SMM Panel API endpoint and key
- Used for creating actual service orders

## 📱 Usage Flow

1. **User fills form** on `index.php`
   - Username/Link input
   - Service selection dropdown
   - Quantity input

2. **Form submission** to `create-link.php`
   - Validates input data
   - Calls AY.Live API
   - Creates shortened ad link
   - Redirects user to ad

3. **After ad completion** → `verify.php`
   - Receives verification parameters
   - Calls SMM Panel API
   - Creates order
   - Shows success/error result

## 🎨 Customization

### Styling
- Modify CSS in each PHP file
- Replace Bootstrap with your preferred framework
- Update color schemes and layouts

### Services
- Add/remove services in `index.php` dropdown
- Update service IDs to match your SMM Panel

### API Integration
- Modify API endpoints in `config.php`
- Adjust request/response handling as needed

## 🔒 Security Considerations

- **Input Validation**: All user inputs are validated and sanitized
- **API Key Protection**: Store API keys securely, not in public directories
- **HTTPS**: Use HTTPS in production for secure data transmission
- **Rate Limiting**: Consider implementing rate limiting for production use

## 🐛 Troubleshooting

### Common Issues

1. **cURL Errors**
   - Ensure cURL extension is enabled
   - Check firewall/network restrictions

2. **API Errors**
   - Verify API keys are correct
   - Check API endpoint URLs
   - Ensure sufficient API credits

3. **File Permissions**
   - Check web server can read project files
   - Verify directory permissions

### Debug Mode

Add this to any PHP file for debugging:
```php
error_reporting(E_ALL);
ini_set('display_errors', 1);
```

## 📞 Support

For issues or questions:
1. Check the error messages displayed
2. Verify API configurations
3. Review server error logs
4. Test API endpoints independently

## 📄 License

This project is provided as-is for educational and commercial use.

## 🔄 Updates

- **v1.0**: Initial release with core functionality
- Bootstrap 5.3.0 integration
- Responsive design
- Complete error handling
- API integration examples

---

**Note**: Replace all placeholder API keys and URLs with your actual credentials before deploying to production.