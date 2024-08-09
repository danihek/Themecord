{ pkgs, ... }:

let
  themecordFiller = (builtins.readFile ./css/ThemecordFiller.css.themecord);
  discordColorsContent = (builtins.readFile ./scripts/discordColors.sh);

  writeThemeFile = pkgs.writeText "ThemecordFiller.css.themecord" themecordFiller;

  environment.sessionVariables = rec {
    THEMECORDFILLER = "${themecordFiller}";
  };
in
  pkgs.writeScriptBin "copythemecord" discordColorsContent
