@echo off
chcp 65001 >nul
title نظام الخليج للخدمات الإدارية - Gulf Admin LAN Server
echo.
echo ╔══════════════════════════════════════════════════╗
echo ║  🏛  نظام الخليج للخدمات الإدارية              ║
echo ║      Gulf Admin Accounting System - LAN         ║
echo ╠══════════════════════════════════════════════════╣
echo ║  جاري تشغيل السيرفر...                          ║
echo ╚══════════════════════════════════════════════════╝
echo.

:: Check Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js غير مثبّت!
    echo.
    echo يرجى تحميله من: https://nodejs.org
    echo ثم أعد تشغيل هذا الملف
    pause
    exit
)

:: Install packages if needed
if not exist "node_modules\express" (
    echo 📦 جاري تثبيت المكتبات لأول مرة...
    npm install
    echo.
)

:: Open browser after delay
start "" timeout /t 2 /nobreak >nul
start "" "http://localhost:3000"

:: Start server
echo ✅ السيرفر يعمل - لا تغلق هذه النافذة
echo.
node server.js

pause
