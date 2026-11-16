#!/usr/bin/env bash
# УрокVR — macOS (шаг тот же, что на Ubuntu)
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
PORT="${PORT:-8088}"
( sleep 1; open "http://localhost:$PORT" >/dev/null 2>&1 || true ) &
echo "УрокVR →  http://localhost:$PORT  (Ctrl+C — стоп)"
exec python3 -m http.server "$PORT" --bind 0.0.0.0
