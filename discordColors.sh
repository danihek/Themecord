#!/bin/bash

if [[ "touch /home/$USER/.config/BetterDiscord/themes" == *"cannot"* ]]; then
    echo "BetterDiscord not detected"
elif [[ "touch /home/$USER/.config/Vencord/themes" == *"cannot"* ]]; then
    echo "Vencord not detected"
    echo "In order to use this script you have to install BetterDiscord or Vencord"
    echo "Exitting..."
    exit
fi

walColorsPath="/home/$USER/.cache/wal/colors-discord.css"
themecordPath="/home/$USER/.config/Vencord/themes/Themecord.css"

echo :root { > $themecordPath

cat $walColorsPath | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done

cat ~/.config/Vencord/themes/ThemecordFiller.css.themecord >> $themecordPath 
