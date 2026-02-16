@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo カレントフォルダ: %cd%
echo.

REM まず npm start を試す（package.json がある場合）
if exist "package.json" (
  if exist "node_modules\serve" (
    echo [Node.js] serve で起動しています...
    echo.
    echo *** "Serving!" と表示されたらブラウザで http://localhost:3000 を開いてください ***
    echo *** このウィンドウを閉じるとサーバーが止まります ***
    echo.
    call npx serve -l 3000
    goto :eof
  )
)

REM npx serve を試す
where npx >nul 2>nul
if %errorlevel% equ 0 (
  echo [Node.js] npx serve で起動しています...
  echo.
  echo *** "Serving!" と表示されたらブラウザで http://localhost:3000 を開いてください ***
  echo.
  call npx --yes serve -l 3000
  goto :eof
)

REM Python を試す
where python >nul 2>nul
if %errorlevel% equ 0 (
  echo [Python] http.server で起動しています...
  echo.
  echo *** "port 3000" と表示されたらブラウザで http://localhost:3000 を開いてください ***
  echo.
  python -m http.server 3000
  goto :eof
)

echo.
echo エラー: Node.js も Python も見つかりませんでした。
echo.
echo 【確実な方法】Cursor のターミナルで以下を実行してください：
echo   npm install
echo   npm start
echo.
echo Node.js をインストール: https://nodejs.org/
echo.
pause
