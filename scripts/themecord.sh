#!/usr/bin/env bash

# RUN THIS SCRIPT RIGHT AFTER PYWAL TO PROPERLY APPLY COLORS!

confPath="/home/$USER/.config"

supportedClients=("Vencord" "vesktop")
availableClients=()

function print_client_err() {
    echo "[ERROR] No compatible clients detected!"
echo "In order to use this script you have to use compatible discord clients! Check out github page for more info https://github.com/danihek/Themecord"
    echo "Exitting..."
}

function print_dc_err() {
    echo "[ERROR] Cannot find discord-colors.css in wal cache folder."
    echo "Exitting..."
}

function print_filler_err() {
    echo "[ERROR] Cannot access themecordFiller.css content."
    echo "Exitting..."
}

for client in "${supportedClients[@]}"; do
    dc_path=~/.config/$client
    if test -d $(realpath "$dc_path"); then
        echo "[SUCCESS] $client DETECTED (path: $dc_path)"
        availableClients+=("$client")
        continue
    else
        echo "[FAILURE] $client not DETECTED (path: $dc_path)"
        continue
    fi
done

if [ -z "$availableClients" ]; then
    print_client_err
    exit
fi

walColorsPath="/home/$USER/.cache/wal/colors-discord.css"
if [ ! -f "$walColorsPath" ]; then
    print_dc_err
    exit
fi
echo "[INFO] colors-discord.css path: $walColorsPath"

for client in "${availableClients[@]}"; do
    themecordPath="/home/$USER/.config/$client/themes/Themecord.css"
    echo :root { > $themecordPath
    cat $walColorsPath | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done
    if [[ -v themecordFiller ]]; then
        echo $themecordFiller >> $themecordPath
    else
        themecordFillerPath="~/.config/$client/themes/ThemecordFiller.css.themecord"
        if test -f "$(realpath "$themecordFillerPath")"; then
            cat ~/.config/$client/themes/ThemecordFiller.css.themecord >> $themecordPath
        else
            print_filler_err
            exit
        fi
    fi
done
