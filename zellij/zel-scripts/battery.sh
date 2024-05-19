#!/usr/bin/env bash

battery_status=$(acpi | awk '{print $3}')
battery_percentage=$(acpi | grep -oP '\d+%' | awk '{print $1}')

if [[ $battery_status == "Charging," ]]; then
    echo "#[fg=#d098c0]$battery_percentage"
else
    echo "#[fg=#a177b3]$battery_percentage"
fi
