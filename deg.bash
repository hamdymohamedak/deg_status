#!/bin/bash

# Define the degree symbol
theDegree="°"

# Infinite loop
while true; do
    # Read the temperature value
    temp=$(cat /sys/class/thermal/thermal_zone1/temp)
    
    # Fix the temperature value by dividing by 1000 (since temp is usually in millidegrees)
    temp_fix=$(($temp / 1000))
    
    # Define color codes for YAD info dialog
    red="#FF0000"
    green="#00FF00"
    
    # Check the temperature and display the value with the appropriate color using YAD
    if [[ $temp_fix -lt 80 ]]; then
        yad --info --title="Degree Info" \
            --text="<span foreground=\"$green\" font='20'>Degree: ${temp_fix}${theDegree}C</span>" \
            --width=300 --height=150 --center --no-buttons
    else
        yad --info --title="Temperature Warning" \
            --text="<span foreground=\"$red\" font='20'>Warning: High Degree ${temp_fix}${theDegree}C</span>" \
            --width=300 --height=150 --center --no-buttons
    fi
    
    # Sleep for 2.2 seconds
    sleep 2.2
done

