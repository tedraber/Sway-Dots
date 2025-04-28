#!/bin/bash

STATE_FILE="/tmp/waybar_battery_state"

# Toggle state on click
if [ "$1" == "toggle" ]; then
    if [ ! -f "$STATE_FILE" ]; then
        echo "percent" > "$STATE_FILE"
    fi

    CURRENT=$(cat "$STATE_FILE")
    if [ "$CURRENT" == "percent" ]; then
        echo "time" > "$STATE_FILE"
    else
        echo "percent" > "$STATE_FILE"
    fi
    exit 0
fi

# Default state
if [ ! -f "$STATE_FILE" ]; then
    echo "percent" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")
BAT_PATH="/sys/class/power_supply/BAT0"

if [ "$STATE" == "percent" ]; then
    PERCENT=$(cat "$BAT_PATH/capacity")
    echo "$PERCENT%"
else
    acpi -b | awk -F ', ' '{print $3}'
fi
