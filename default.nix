{ pkgs, ... }:

let
  themecordFiller = (builtins.readFile ./css/ThemecordFiller.css.themecord);
  discordColorsContent = (builtins.readFile ./scripts/themecord.sh);
  cssPywalFile  = pkgs.writeTextFile {
    name = "colors-discord.css";
    destination = "${builtins.getEnv "HOME"}/.config/wal/templates/colors-discord.css";
    text = (builtins.readFile ./css/colors-discord.css);
  };
in
  pkgs.writeScriptBin "themecord" ''
    #!/usr/bin/env bash

    themecordFiller=$(cat << 'EOF'
    ${themecordFiller}
    EOF
    )

    ${discordColorsContent}
  ''

