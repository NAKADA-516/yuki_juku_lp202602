@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo Git を更新して GitHub にプッシュします...
echo.

git add .
git status
echo.
set /p msg="コミットメッセージ（Enterで「Update」）: "
if "%msg%"=="" set msg=Update
git commit -m "%msg%"
if errorlevel 1 (
  echo 変更がないか、エラーが発生しました。
  pause
  exit /b 1
)
git push origin main
echo.
echo 完了しました。
pause
