@echo off
chcp 65001 > nul
color 0A
echo.
echo ════════════════════════════════════════════════════════════
echo         🔄 Quiz Tree - تحديث الملفات على GitHub
echo ════════════════════════════════════════════════════════════
echo.
echo Repository الحالي: rshodoskar-star/quiztree-page
echo.
echo ════════════════════════════════════════════════════════════
echo.

REM التحقق من Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Git غير مثبت!
    echo 📥 حمّله من: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git مثبت
echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 🔗 جاري الاتصال بـ GitHub...
echo.

REM إزالة remote القديم وإضافة الجديد
git remote remove origin 2>nul
git remote add origin https://github.com/rshodoskar-star/quiztree-page.git

echo ✅ تم الربط بالـ Repository
echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 📥 جاري سحب الملفات القديمة من GitHub...
echo.

git pull origin main --allow-unrelated-histories --no-edit

if %errorlevel% neq 0 (
    echo.
    echo ⚠️ فشل السحب - سنواصل بدون pull
    echo.
)

echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 📝 جاري إضافة التحديثات...
echo.

git add .
git commit -m "Update: Fixed design issues and improved Coming Soon page"

echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 🚀 جاري رفع الملفات المحدّثة...
echo.
echo ⚠️ قد يطلب منك تسجيل الدخول
echo.

git push -f origin main

if %errorlevel% equ 0 (
    echo.
    echo ════════════════════════════════════════════════════════════
    echo ✅ تم رفع التحديثات بنجاح!
    echo ════════════════════════════════════════════════════════════
    echo.
    echo 🌐 الصفحة متاحة على:
    echo    https://rshodoskar-star.github.io/quiztree-page/
    echo.
    echo ⏱️ التحديثات ستظهر خلال 1-2 دقيقة
    echo.
    echo ════════════════════════════════════════════════════════════
    echo.
    echo ✨ التحديثات المنفذة:
    echo    • إصلاح مشكلة max-height: 90vh
    echo    • إصلاح الأيقونات المفقودة
    echo    • إصلاح التصميم المقصوص من اليمين
    echo    • إضافة إرسال البريد إلى r.00@msn.com
    echo    • تحسين responsive design
    echo.
) else (
    echo.
    echo ════════════════════════════════════════════════════════════
    echo ❌ حدث خطأ في الرفع!
    echo ════════════════════════════════════════════════════════════
    echo.
    echo 💡 استخدم Personal Access Token بدلاً من Password:
    echo.
    echo 1. اذهب إلى: https://github.com/settings/tokens
    echo 2. اضغط "Generate new token" → "Generate new token (classic)"
    echo 3. اختر "repo" scope
    echo 4. انسخ الـ Token
    echo 5. استخدمه بدلاً من Password عند الطلب
    echo.
)

echo ════════════════════════════════════════════════════════════
echo.
pause
