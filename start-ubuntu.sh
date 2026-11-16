#!/usr/bin/env bash
# УрокVR — запуск локального сервера на порту 8088 (Ubuntu/Debian/Linux)
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
PORT="${PORT:-8088}"
PY="$(command -v python3 || command -v python || true)"
if [ -z "$PY" ]; then
  echo "✗ Нужен Python 3: sudo apt-get install python3"; exit 1
fi
( sleep 1; xdg-open "http://localhost:$PORT" >/dev/null 2>&1 || true ) &
echo "────────────────────────────────────────────"
echo "  УрокVR →  http://localhost:$PORT"
echo "  Для VR/AR: откройте в браузере шлема (HTTPS)"
echo "  Остановка: Ctrl+C"
echo "────────────────────────────────────────────"
exec "$PY" -m http.server "$PORT" --bind 0.0.0.0
