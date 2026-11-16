@echo off
chcp 65001 >nul
cd /d %~dp0
set PORT=8088
set PY=
where python3 >nul 2>nul && set PY=python3
if not defined PY (where python >nul 2>nul && set PY=python)
if not defined PY (where py >nul 2>nul && set PY=py -3)
if not defined PY (
  echo ✗ Нужен Python 3: https://www.python.org/downloads/
  pause
  exit /b 1
)
start "" http://localhost:%PORT%
echo УрокVR: http://localhost:%PORT%   (остановка: Ctrl+C)
%PY% -m http.server %PORT% --bind 0.0.0.0
pause
