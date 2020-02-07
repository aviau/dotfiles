#!/usr/bin/env bash

set -e

keyboard_language=$(swaymsg -t get_inputs | jq '.[0]["xkb_active_layout_name"]' --raw-output)

current_day=$(date +'%d %b')
current_time=$(date +'%l:%M %p')

blood_glucose=$(/home/aviau/bin/bloodglucose)

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

if [ $battery_status = "discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

echo "network_down network_up |" \
     "💧 ${blood_glucose} mmol/L |" \
     "cpu usage |" \
     "📅 ${current_day} |" \
     "⌚ ${current_time} " \
