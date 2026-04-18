@echo off
title Clear Cash Ready Product
cd /d "%~dp0"
echo Clear Cash - Ready Product
echo.
echo This starts the full product from one URL:
echo http://localhost:56321
echo.
echo Requirements:
echo - Node.js installed
echo - MongoDB running
echo - cash-flow-backend\.env created from .env.example
echo.

if not exist "cash-flow-backend\.env" (
  echo Creating backend .env from .env.example...
  echo.
  copy "cash-flow-backend\.env.example" "cash-flow-backend\.env" >nul
  echo Created cash-flow-backend\.env
  echo You can edit MONGODB_URI later if your MongoDB uses a different URL.
  echo.
)

if not exist "cash-flow-backend\node_modules" (
  echo Installing backend dependencies...
  cd /d "%~dp0cash-flow-backend"
  call npm install
  cd /d "%~dp0"
)

if not exist "cash-flow-frontend\node_modules" (
  echo Installing frontend dependencies...
  cd /d "%~dp0cash-flow-frontend"
  call npm install
  cd /d "%~dp0"
)

echo Building frontend...
cd /d "%~dp0cash-flow-frontend"
call npm run build
if errorlevel 1 (
  echo Frontend build failed.
  pause
  exit /b 1
)

echo.
echo Starting backend and serving frontend...
cd /d "%~dp0cash-flow-backend"
set PORT=56321
set NODE_ENV=production
call npm start
pause
