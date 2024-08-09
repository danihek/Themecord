#!/usr/bin/env bash

# RUN THIS SCRIPT RIGHT AFTER PYWAL TO PROPERLY APPLY COLORS!

confPath="/home/$USER/.config"

clientType=""
supportedClients=("Vencord" "vesktop")

function print_client_err() {
    echo "No compatible clients detected!"
echo "In order to use this script you have to use compatible discord clients! Check out github page for more info https://github.com/danihek/Themecord"
    echo "Exitting..."
}

function print_dc_err() {
    echo "Cannot find discord-colors.css in wal cache folder."
    echo "Exitting..."
}

for client in "${supportedClients[@]}"; do
    dc_path=~/.config/$client
    if test -d $(realpath "$dc_path"); then
        clientType="$client"
        echo "[SUCCESS] $client DETECTED (path: $dc_path)"
        break
    else
        echo "[FAILURE] $client not DETECTED (path: $dc_path)"
        continue
    fi
done

if [ -z "$clientType" ]; then
    print_client_err
    exit
fi

walColorsPath="/home/$USER/.cache/wal/colors-discord.css"

if [ ! -f "$walColorsPath" ]; then
    print_dc_err
    exit
fi

themecordPath="/home/$USER/.config/$clientType/themes/Themecord.css"

echo :root { > $themecordPath

cat $walColorsPath | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done

cat ~/.config/$clientType/themes/ThemecordFiller.css.themecord >> $themecordPath
