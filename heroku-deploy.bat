@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ====================================
echo Heroku デプロイスクリプト
echo ====================================
echo.

echo [1/3] Herokuリモートを設定...
git remote remove heroku 2>nul
git remote add heroku https://git.heroku.com/yuki.git

echo.
echo [2/3] 変更をコミット...
git add .
git status

echo.
echo [3/3] Herokuにプッシュ...
echo ※ログインが必要な場合は、ブラウザが開きます
echo.
git push heroku main

echo.
echo ====================================
echo デプロイ完了！
echo アプリURL: https://yuki.herokuapp.com
echo ====================================
pause
