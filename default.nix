{ pkgs, ... }:

let
  themecordFiller = (builtins.readFile ./css/ThemecordFiller.css.themecord);
  writeThemeFile = pkgs.writeText "ThemecordFiller.css.themecord" themecordFiller;
in
  pkgs.writeScriptBin "copythemecord" ''
    themecordPath="$HOME/.cache/wal/Themecord.css"
    vesktopPath="$HOME/.config/vesktop/themes/"
  
    echo :root { > $themecordPath
    cat $HOME/.cache/wal/colors-discord.css | while IFS= read -r line; do echo -e "\n\t"$line >> $themecordPath; done
    cat "${writeThemeFile}" >> $themecordPath
    mv $themecordPath $vesktopPath
  ''
