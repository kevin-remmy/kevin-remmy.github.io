#!/usr/bin/env bash

HOSTNAME="$(hostname -A | cut -f 1 -d ' ')"
ADDRESS="$(hostname -I | cut -f 1 -d ' ')"
PORT="13131"

echo "Launching server on port $PORT at $HOSTNAME ($ADDRESS)"

hugo server \
  --buildFuture \
  --baseURL "http://$HOSTNAME:$PORT/" \
  --bind "$ADDRESS" \
  --port "$PORT"
