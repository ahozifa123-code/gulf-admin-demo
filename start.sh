#!/bin/bash
# نظام الخليج للخدمات الإدارية - Gulf Admin LAN Server

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║  🏛  نظام الخليج للخدمات الإدارية              ║"
echo "║      Gulf Admin Accounting System - LAN         ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js غير مثبّت! يرجى تحميله من: https://nodejs.org"
    exit 1
fi

# Install if needed
if [ ! -d "node_modules/express" ]; then
    echo "📦 جاري تثبيت المكتبات..."
    npm install
fi

# Get LAN IP
LAN_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "localhost")

echo "✅ السيرفر يعمل..."
echo "🖥  هذا الجهاز:      http://localhost:3000"
echo "🌐 الشبكة الداخلية:  http://$LAN_IP:3000"
echo ""
echo "لإيقاف السيرفر: اضغط Ctrl+C"
echo ""

# Open browser (Linux/Mac)
sleep 1
if command -v xdg-open &> /dev/null; then
    xdg-open "http://localhost:3000" &
elif command -v open &> /dev/null; then
    open "http://localhost:3000" &
fi

node server.js
