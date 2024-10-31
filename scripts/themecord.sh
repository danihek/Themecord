#!/usr/bin/env bash

# RUN THIS SCRIPT RIGHT AFTER PYWAL TO PROPERLY APPLY COLORS!

confPath="/home/$USER/.config"
supportedClients=("Vencord" "vesktop")
availableClients=()
generatedColors="wal" # default option is pywal
colorsPath=""

show_help() {
    echo "Usage: themecord [OPTION]"
    echo "Discord theme will always match your wallpaper! "
    echo
    echo
    echo "Options:"
    echo "  -h            Display this message and exit"
    echo "  -w            Use wallust instead of pywal"
    echo "  -p            Provide path to generated discord colors"
    echo
    echo "Examples:"
    echo "themecord       Run defaults."
    echo "themecord -w    Run using wallust specifically."
    echo
    echo "(DISCLAIMER)"
    echo "Running this without arguments, script assumes,"
    echo "that pywal is or wallust is installed."
    echo "In case both are installed, pywal is set to be deafult one."
}

while getopts ":hwp:" opt; do
    case ${opt} in
        h )
            show_help
            exit 0
            ;;
        w )
            generatedColors="wallust"
            ;;
        p )
            colorsPath="$OPTARG"
            ;;
        \? )
            echo "Invalid option: -$OPTARG" 1>&2
            echo
            show_help
            exit 1
            ;;
    esac
done

function print_err() {
    echo "[ERROR] $1"
    echo "Exitting..."
}

for client in "${supportedClients[@]}"; do
    client_path=~/.config/$client
    if test -d $(realpath "$client_path"); then
        echo "[SUCCESS] $client DETECTED (path: $client_path)"
        availableClients+=("$client")
        continue
    else
        echo "[FAILURE] $client not DETECTED (path: $client_path)"
        continue
    fi
done

if [ -z "$availableClients" ]; then
    print_err "No compatible clients detected! In order to use this script you have to use compatible discord clients! Check out github page for more info: https://github.com/danihek/Themecord"
    exit
fi


if [ "$colorsPath" == "" ]; then
    colorsPath="/home/$USER/.cache/$generatedColors/colors-discord.css"
fi

if [ ! -f "$colorsPath" ]; then
    print_err "Cannot access $colorsPath."
    exit
fi
echo "[INFO] colors-discord.css path: $colorsPath"

for client in "${availableClients[@]}"; do
    themecordPath="/home/$USER/.config/$client/themes/Themecord.css"
    echo :root { > $themecordPath
    cat $colorsPath | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done

    if [[ -v themecordFiller ]]; then # This is for script that nix combines
        printf '%s\n' "$themecordFiller" >> $themecordPath
    else
        themecordFillerPath=~/.config/$client/themes/ThemecordFiller.css.themecord
        if test -f $themecordFillerPath; then
            cat $themecordFillerPath >> $themecordPath
        else
            print_err "Cannot access $themecordFillerPath content."
        fi
    fi
done
