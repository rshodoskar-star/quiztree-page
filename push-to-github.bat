@echo off
chcp 65001 > nul
color 0A
echo.
echo ════════════════════════════════════════════════════════════
echo            🚀 Quiz Tree - GitHub Push Helper
echo ════════════════════════════════════════════════════════════
echo.

REM التحقق من Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Git غير مثبت!
    echo.
    echo 📥 حمّل Git من: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git مثبت
echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 📝 أدخل اسم المستخدم الخاص بك في GitHub:
echo.

set /p GITHUB_USERNAME="اسم المستخدم: "

if "%GITHUB_USERNAME%"=="" (
    echo.
    echo ❌ يجب إدخال اسم المستخدم!
    pause
    exit /b 1
)

echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 🔗 جاري ربط Repository...
echo.

git remote remove origin 2>nul
git remote add origin https://github.com/%GITHUB_USERNAME%/quiztree-page.git

if %errorlevel% neq 0 (
    echo ❌ فشل الربط! تحقق من اسم المستخدم
    pause
    exit /b 1
)

echo ✅ تم الربط بنجاح!
echo.
echo ════════════════════════════════════════════════════════════
echo.
echo 🚀 جاري رفع الملفات إلى GitHub...
echo.
echo ⚠️ قد يطلب منك تسجيل الدخول
echo.

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ════════════════════════════════════════════════════════════
    echo ✅ تم رفع الملفات بنجاح!
    echo ════════════════════════════════════════════════════════════
    echo.
    echo 🌐 الآن فعّل GitHub Pages:
    echo.
    echo 1. اذهب إلى:
    echo    https://github.com/%GITHUB_USERNAME%/quiztree-page/settings/pages
    echo.
    echo 2. تحت "Source" اختر "main" branch
    echo.
    echo 3. اضغط "Save"
    echo.
    echo ════════════════════════════════════════════════════════════
    echo.
    echo 📍 الرابط النهائي:
    echo    https://%GITHUB_USERNAME%.github.io/quiztree-page/
    echo.
    echo ⏱️ الصفحة تحتاج 1-2 دقيقة للظهور
    echo.
) else (
    echo.
    echo ════════════════════════════════════════════════════════════
    echo ❌ حدث خطأ في الرفع!
    echo ════════════════════════════════════════════════════════════
    echo.
    echo يرجى التحقق من:
    echo   • تسجيل الدخول إلى GitHub
    echo   • إنشاء Repository باسم "quiztree-page"
    echo   • Repository يجب أن يكون فارغ
    echo.
    echo 💡 استخدم Personal Access Token بدلاً من Password
    echo    https://github.com/settings/tokens
    echo.
)

echo ════════════════════════════════════════════════════════════
echo.
pause
