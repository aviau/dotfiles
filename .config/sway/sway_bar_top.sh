#!/usr/bin/env bash

set -e

keyboard_language=$(swaymsg -t get_inputs | jq '.[0]["xkb_active_layout_name"]' --raw-output)

current_date=$(date +'%Y-%m-%d %l:%M %p')

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

if [ $battery_status = "discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

echo "${keyboard_language} |" \
     "${battery_charge} ${battery_pluggedin} |" \
     "${current_date}"
