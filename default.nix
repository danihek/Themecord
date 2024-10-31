{ pkgs, ... }:

let
  themecordFiller = builtins.readFile ./css/ThemecordFiller.css.themecord;
  discordColorsContent = builtins.readFile ./scripts/themecord.sh;

  pywalTemplate = pkgs.writeTextFile {
    name = "pywal-template";
    destination = "~/.config/wal/templates/colors-discord.css";
    text = builtins.readFile ./css/pywal/colors-discord.css;
  };

  wallustConfig = pkgs.writeTextFile {
    name = "wallust-config";
    destination = "~/.config/wallust/wallust.toml";
    text = builtins.readFile ./css/wallust/wallust.toml;
  };

  wallustTemplate = pkgs.writeTextFile {
    name = "wallust-template";
    destination = "~/.config/wallust/templates/colors-discord.css";
    text = builtins.readFile ./css/wallust/colors-discord.css;
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

