@echo off
chcp 65001 >nul
title نظام الخليج - نسخة تجريبية 7 أيام
echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║  🏛  نظام الخليج للخدمات الإدارية                  ║
echo ║      نسخة تجريبية مجانية — 7 أيام                  ║
echo ╠══════════════════════════════════════════════════════╣
echo ║  الحدود: 7 أيام + 20 معاملة + 15 عميل             ║
echo ╚══════════════════════════════════════════════════════╝
echo.
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ يرجى تثبيت Node.js من: https://nodejs.org
    pause
    exit
)
if not exist "node_modules\express" (
    echo 📦 جاري تثبيت المكتبات...
    npm install
)
timeout /t 2 /nobreak >nul
start "" "http://localhost:3001"
echo ✅ الديمو يعمل على: http://localhost:3001
echo اسم المستخدم: admin  ^|  كلمة المرور: admin
echo.
node server.js
pause
