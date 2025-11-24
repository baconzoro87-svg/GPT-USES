#!/bin/bash
set -e

# start a simple HTTP server so Railway health checks see a working port
python3 -m http.server 6080 --directory /app 2>&1 &

# small delay to ensure server started
sleep 1

# run tmate in foreground so you can attach
exec tmate -F
