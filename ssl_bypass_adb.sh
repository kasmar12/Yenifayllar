#!/bin/bash
# 🔒 ADB ilə SSL Bypass

echo "🔒 ADB SSL Bypass başladıldı..."

# SSL verification disable et
adb shell settings put global network_security_config 0

# HTTP traffic allow et
adb shell settings put global cleartext_traffic_permitted 1

# SSL certificate verification disable et
adb shell settings put global ssl_cert_verification_enabled 0

# Network security config reset et
adb shell settings delete global network_security_config

echo "✅ SSL bypass tamamlandı!"
