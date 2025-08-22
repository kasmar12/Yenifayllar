# SMM Panel - Professional Social Media Marketing Panel

A complete PHP-based SMM (Social Media Marketing) panel that allows users to place orders for social media services like followers, likes, and views. The system includes mandatory advertisement verification through AY.Live API and integrates with SMM provider APIs.

## 🚀 Features

### User Side
- **Simple Interface**: Clean, responsive design with Bootstrap 5
- **Service Selection**: Choose from various social media services organized by categories
- **Mandatory Ad Verification**: Users must pass through AY.Live advertisements before placing orders
- **Order Tracking**: Check order status using unique order IDs
- **No Registration Required**: Users can place orders without creating accounts

### Admin Panel
- **Secure Authentication**: Admin login with session management
- **Dashboard Overview**: Statistics, recent orders, and system information
- **Service Management**: Add, edit, and delete services and categories
- **Order Management**: View and manage all orders
- **API Configuration**: Update SMM provider and AY.Live API settings
- **System Settings**: Configure site name, currency, timezone, etc.

### API Integration
- **AY.Live API**: For advertisement verification and link shortening
- **SMM Provider API**: For placing orders and checking status
- **Medyabayim API v2**: Default SMM provider integration

## 🛠️ Requirements

- **PHP**: 8.0 or higher
- **MySQL**: 5.7 or higher
- **Web Server**: Apache/Nginx with mod_rewrite enabled
- **Extensions**: PDO, cURL, JSON, OpenSSL
- **Browser**: Modern browsers with JavaScript enabled

## 📁 Project Structure

```
smm-panel/
├── admin/                 # Admin panel files
│   ├── dashboard.php     # Admin dashboard
│   ├── login.php         # Admin login
│   └── settings.php      # System settings
├── assets/               # Static assets
│   ├── css/             # Custom CSS styles
│   ├── js/              # JavaScript files
│   └── img/             # Images
├── includes/             # PHP includes
│   ├── config.php       # Database and app configuration
│   └── api_functions.php # API integration functions
├── public/               # Public-facing files
│   ├── index.php        # Main order form
│   ├── ad-verification.php # Ad verification page
│   ├── process-order.php # Order processing
│   └── order-status.php # Order status checker
├── database.sql          # Database structure
└── README.md            # This file
```

## 🗄️ Database Structure

### Tables
- **users**: Admin user accounts
- **categories**: Service categories (Instagram, TikTok, YouTube, etc.)
- **services**: Available services with pricing and limits
- **orders**: User orders with status tracking
- **settings**: System configuration and API keys

### Default Data
- Admin user: `admin` / `admin123`
- Sample categories: Instagram, TikTok, YouTube, Twitter, Facebook
- Sample services: Followers, likes, views for each platform

## ⚙️ Installation

### 1. Database Setup
```sql
# Import the database structure
mysql -u root -p < database.sql

# Or create manually using the SQL in database.sql
```

### 2. Configuration
1. Copy the project to your web server directory
2. Update `includes/config.php` with your database credentials:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_NAME', 'smm_panel');
   define('DB_USER', 'your_username');
   define('DB_PASS', 'your_password');
   ```

3. Update `SITE_URL` in config.php to match your domain:
   ```php
   define('SITE_URL', 'https://yourdomain.com/smm-panel');
   ```

### 3. API Configuration
1. Get your AY.Live API key from [ay.live](https://ay.live)
2. Get your SMM provider API key and URL
3. Update settings through admin panel or directly in database

### 4. File Permissions
```bash
# Ensure web server can write to necessary directories
chmod 755 smm-panel/
chmod 644 smm-panel/includes/config.php
```

## 🔑 Default Credentials

- **Admin Login**: `admin` / `admin123`
- **URL**: `yourdomain.com/smm-panel/admin/login.php`

## 📱 Usage

### For Users
1. Visit the main page
2. Select a service category and specific service
3. Enter target link/username and quantity
4. Complete the mandatory advertisement
5. Order is processed and order ID is generated
6. Track order status using the order ID

### For Admins
1. Login to admin panel
2. Manage services and categories ✅ (Fully functional - add, edit, delete with status control)
3. View and update orders ✅ (Complete order management system)
4. Configure API settings ✅ (SMM API and AY.Live API configuration)
5. Monitor system statistics ✅ (Dashboard with real-time data)

**Admin Panel Features Confirmed Working:**
- ✅ Categories Management - Add, edit, delete categories with status control
- ✅ Services Management - Add, edit, delete services with pricing and status
- ✅ Orders Management - View and manage all customer orders
- ✅ Settings Management - Configure APIs and system settings

**Recent Fixes Applied:**
- 🔧 Fixed "Column not found: status" database error
- 🔧 Recreated database tables with proper status ENUM columns
- 🔧 Added null coalescing operators for better error handling
- 🔧 All admin panel CRUD operations now working without errors

## 🔧 Configuration

### API Keys
- **AY.Live API Key**: For advertisement verification
- **SMM Provider API Key**: For placing orders
- **SMM Provider URL**: API endpoint for your SMM provider

### Site Settings
- Site name and description
- Default currency
- Timezone settings
- Session lifetime

## 🚨 Security Features

- **CSRF Protection**: Built-in CSRF token validation
- **Input Sanitization**: All user inputs are sanitized
- **Session Management**: Secure admin sessions
- **SQL Injection Prevention**: Prepared statements throughout
- **XSS Protection**: Output escaping for all dynamic content

## 📊 Order Flow

1. **User Selection**: User selects service and enters details
2. **Ad Verification**: User is redirected through AY.Live advertisement
3. **Order Processing**: After ad completion, order is sent to SMM provider
4. **Database Storage**: Order details are saved locally
5. **Status Tracking**: Order status is updated from SMM provider API

## 🐛 Troubleshooting

### Common Issues

**Database Connection Error**
- Verify database credentials in `config.php`
- Ensure MySQL service is running
- Check database exists and user has permissions

**API Connection Issues**
- Verify API keys in admin settings
- Check API endpoints are accessible
- Ensure cURL extension is enabled

**Ad Verification Not Working**
- Check AY.Live API key is valid
- Verify AY.Live service is accessible
- Check network connectivity

### Debug Mode
Enable debug mode in `config.php`:
```php
error_reporting(E_ALL);
ini_set('display_errors', 1);
```

## 🔄 API Endpoints

### AY.Live API
```
GET https://ay.live/api/?api=YOUR_KEY&url=VERIFICATION_URL&alias=OPTIONAL_ALIAS
```

### SMM Provider API
```
POST https://your-smm-provider.com/api/v2
Parameters: key, action, service, link, quantity
```

## 📈 Customization

### Adding New Services
1. Add category in admin panel
2. Add service with API service ID
3. Set pricing and quantity limits

### Modifying Order Flow
- Edit `process-order.php` for order processing logic
- Modify `ad-verification.php` for ad verification
- Update `api_functions.php` for API integration

### Styling
- Modify `assets/css/style.css` for custom styling
- Update Bootstrap classes in PHP files
- Customize color scheme in CSS variables

## 🤝 Support

For support and questions:
- Check the troubleshooting section
- Review error logs
- Ensure all requirements are met
- Verify API configurations

## 📄 License

This project is open source and available under the MIT License.

## 🔄 Updates

### Version 1.0.0
- Initial release with core functionality
- User order placement with ad verification
- Admin panel with service management
- API integration for SMM providers

## 📝 Changelog

- **v1.0.0**: Initial release
  - Basic SMM panel functionality
  - Admin dashboard
  - Order management system
  - API integration

---

**Note**: This is a production-ready SMM panel. Ensure you have proper hosting, SSL certificates, and backup systems before deploying to production.