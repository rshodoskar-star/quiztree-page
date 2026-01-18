@echo off
color 0A
echo.
echo ================================================
echo    Quiz Tree - GitHub Update Script
echo ================================================
echo.
echo Repository: rshodoskar-star/quiztree-page
echo.
echo ================================================
echo.

REM Check if Git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo.
    echo Please download Git from: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo [OK] Git is installed
echo.
echo ================================================
echo.
echo [STEP 1] Connecting to GitHub...
echo.

REM Remove old remote and add new one
git remote remove origin 2>nul
git remote add origin https://github.com/rshodoskar-star/quiztree-page.git

echo [OK] Connected to repository
echo.
echo ================================================
echo.
echo [STEP 2] Pulling existing files from GitHub...
echo.

git pull origin main --allow-unrelated-histories --no-edit

if %errorlevel% neq 0 (
    echo.
    echo [WARNING] Pull failed - continuing without pull
    echo.
)

echo.
echo ================================================
echo.
echo [STEP 3] Adding updates...
echo.

git add .
git commit -m "Update: Fixed design issues and improved Coming Soon page"

echo.
echo ================================================
echo.
echo [STEP 4] Pushing updated files to GitHub...
echo.
echo NOTE: You may need to login to GitHub
echo.

git push -f origin main

if %errorlevel% equ 0 (
    echo.
    echo ================================================
    echo [SUCCESS] Files uploaded successfully!
    echo ================================================
    echo.
    echo Your page is available at:
    echo https://rshodoskar-star.github.io/quiztree-page/
    echo.
    echo Updates will appear in 1-2 minutes
    echo.
    echo ================================================
    echo.
    echo Updates applied:
    echo - Fixed max-height 90vh issue
    echo - Fixed missing icons
    echo - Fixed design cut-off on right side
    echo - Added email copy to r.00@msn.com
    echo - Improved responsive design
    echo.
) else (
    echo.
    echo ================================================
    echo [ERROR] Upload failed!
    echo ================================================
    echo.
    echo Please use Personal Access Token instead of password:
    echo.
    echo 1. Go to: https://github.com/settings/tokens
    echo 2. Click "Generate new token" - "Generate new token (classic)"
    echo 3. Select "repo" scope
    echo 4. Copy the token
    echo 5. Use it as password when prompted
    echo.
)

echo ================================================
echo.
pause
