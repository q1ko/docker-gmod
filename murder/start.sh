#!/bin/bash
set -e

SERVER_DIR="/gmod/server"
STEAMCMD="/usr/games/steamcmd"   # Correct for steamcmd/steamcmd image

# Default values (override with -e VAR=value)
APP_ID=4020
MAXPLAYERS=${MAXPLAYERS:-32}
MAP=${MAP:-gm_housewithgardenV2}
GAME_MODE=${GAME_MODE:-murder}
COLLECTION=${COLLECTION:-3561979695}

echo "=== Updating/Installing Garry's Mod server ==="
"$STEAMCMD" \
  +force_install_dir "$SERVER_DIR" \
  +login anonymous \
  +app_update "$APP_ID" validate \
  +quit

echo "=== Starting Garry's Mod Server ==="
cd "$SERVER_DIR"
exec ./srcds_run -game garrysmod \
    -console \
    +r_hunkalloclightmaps 0 \
    +maxplayers "$MAXPLAYERS" \
    +map "$MAP" \
    +gamemode "$GAME_MODE" \
    +host_workshop_collection "$COLLECTION"
