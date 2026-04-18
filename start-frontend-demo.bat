@echo off
title Clear Cash Frontend
cd /d "%~dp0cash-flow-frontend"
set VITE_API_URL=http://localhost:56321
echo Starting Clear Cash frontend on http://localhost:5173
echo Backend expected at http://localhost:56321
echo Keep this window open while using the app.
echo.
if not exist node_modules (
  echo Installing frontend dependencies...
  call npm install
)
call npm run dev
pause
