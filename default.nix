{ pkgs, ... }:

let
  themecordFiller = (builtins.readFile ./css/ThemecordFiller.css.themecord);
  discordColorsContent = (builtins.readFile ./scripts/themecord.sh);
in
  pkgs.writeScriptBin "themecord" ''
    #!/usr/bin/env bash
    themecordFiller=$(cat << 'EOF'
    ${themecordFiller}
    EOF
    )
    # ${discordColorsContent}
    ''
