@echo off
title Clear Cash Backend
cd /d "%~dp0cash-flow-backend"
set PORT=56321
echo Starting Clear Cash backend on http://localhost:56321
echo Keep this window open while using the app.
echo.
if not exist node_modules (
  echo Installing backend dependencies...
  call npm install
)
call npm run dev
pause
