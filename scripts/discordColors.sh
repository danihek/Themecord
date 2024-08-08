#!/bin/bash

# RUN THIS SCRIPT RIGHT AFTER PYWAL TO PROPERLY APPLY COLORS!

confPath="/home/$USER/.config"

clientType="" # Vencord, Vesktop
VENCORD="Vencord"
VESKTOP="Vesktop"

if [[ "$confPath/$VENCORD" == *"cannot"* ]]; then 
    if [[ "$confPath/$VESKTOP" == *"cannot"* ]]; then
        echo "No compatible clients detected!"
        echo "In order to use this script you have to use compatible discord clients! Check out github page."
        echo "Exitting..."
        exit
    else
        clientType=$VESKTOP
    fi
else
    clientType=$VENCORD
fi

walColorsPath="/home/$USER/.cache/wal/colors-discord.css"
themecordPath="/home/$USER/.config/$clientType/themes/Themecord.css"

echo :root { > $themecordPath

cat $walColorsPath | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done

cat ~/.config/$clientType/themes/ThemecordFiller.css.themecord >> $themecordPath
