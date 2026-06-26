#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

detect_running_gw_prefix() {
    local pid prefix
    for pid in $(pgrep -x Gw.exe 2>/dev/null || pgrep -x gw.exe 2>/dev/null); do
        prefix=$(tr '\0' '\n' < "/proc/${pid}/environ" 2>/dev/null | sed -n 's/^WINEPREFIX=//p' | head -1)
        if [[ -n "$prefix" ]]; then
            echo "$prefix"
            return 0
        fi
    done
    return 1
}

if [[ -z "${WINEPREFIX:-}" ]]; then
    if detected_prefix="$(detect_running_gw_prefix)"; then
        WINEPREFIX="$detected_prefix"
    else
        WINEPREFIX="${HOME}/GAME/Prefixes/GWMain"
    fi
fi

AUTOIT="${AUTOIT:-$HOME/.wine/drive_c/Program Files (x86)/AutoIt3/AutoIt3.exe}"
SCRIPT="${SCRIPT:-$SCRIPT_DIR/MasterVanquisher.au3}"
GW_DIR="${GW_DIR:-$HOME/GAME/GWMain/Guild Wars}"
LAUNCH_GW="${LAUNCH_GW:-0}"
EXTERNAL_LAUNCHER="${EXTERNAL_LAUNCHER:-$HOME/GAME/Launchers/start_vanquisher.sh}"

APP_DIR="${SCRIPT_DIR}/app"

sync_wine_prefix() {
    mkdir -p "${APP_DIR}/Config"
    local _ini="${APP_DIR}/Config/Vanquisher.ini"
    if [[ ! -f "$_ini" ]]; then
        cat > "$_ini" <<EOF
[Character]
LastName=

[Wine]
Prefix=${WINEPREFIX}
EOF
        return
    fi

    if grep -q '^Prefix=' "$_ini" 2>/dev/null; then
        sed -i "s|^Prefix=.*|Prefix=${WINEPREFIX}|" "$_ini"
    elif grep -q '^\[Wine\]' "$_ini"; then
        sed -i "/^\[Wine\]/a Prefix=${WINEPREFIX}" "$_ini"
    else
        printf '\n[Wine]\nPrefix=%s\n' "$WINEPREFIX" >> "$_ini"
    fi
}

if [[ -x "$EXTERNAL_LAUNCHER" ]]; then
    export WINEPREFIX AUTOIT SCRIPT GW_DIR LAUNCH_GW
    exec "$EXTERNAL_LAUNCHER" "$@"
fi

if [[ ! -f "$AUTOIT" ]]; then
    echo "AutoIt not found: $AUTOIT" >&2
    echo "Set AUTOIT to your AutoIt3.exe path." >&2
    exit 1
fi

if [[ ! -f "$SCRIPT" ]]; then
    echo "Script not found: $SCRIPT" >&2
    exit 1
fi

export WINEPREFIX
sync_wine_prefix

if [[ "$LAUNCH_GW" == "1" ]]; then
    if [[ ! -d "$GW_DIR" ]]; then
        echo "Guild Wars directory not found: $GW_DIR" >&2
        exit 1
    fi
    cd "$GW_DIR"
    wine "Gw.exe" -dx8 -mce &
    sleep 15
fi

exec wine "$AUTOIT" /ErrorStdOut "$SCRIPT" "$@"
