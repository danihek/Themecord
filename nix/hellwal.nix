{ pkgs, ... }:

let
  discord-colors = ''
      --background: #%% background.hex %%;
      --foreground: #%% foreground.hex %%;
      --cursor: #%% cursor.hex %%;
      --border: #%% border.hex %%;
      
      --color0: #%% color0.hex %%;
      --color1: #%% color1.hex %%;
      --color2: #%% color2.hex %%;
      --color3: #%% color3.hex %%;
      --color4: #%% color4.hex %%;
      --color5: #%% color5.hex %%;
      --color6: #%% color6.hex %%;
      --color7: #%% color7.hex %%;
      --color8: #%% color8.hex %%;
      --color9: #%% color9.hex %%;
      --color10: #%% color10.hex %%;
      --color11: #%% color11.hex %%;
      --color12: #%% color12.hex %%;
      --color13: #%% color13.hex %%;
      --color14: #%% color14.hex %%;
      --color15: #%% color15.hex %%;
  '';
in {
  home.file = {
    ".config/hellwal/templates/discord-colors.css".text = ''${discord-colors}'';
  };
}
