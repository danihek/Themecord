{ pkgs, lib, ... }: 

{
  home.packages = [ pkgs.wallust ];

  home.file.".config/wallust/wallust.toml".text = ''
      [templates]
      themecord.template = "discord-colors.css"
      themecord.target = '~/.cache/wallust/discord-colors.css'
  '';

  home.file.".config/wallust/templates/discord-colors.css" .text = ''
    --color0:  {{ color0 }};
    --color1:  {{ color1 }};
    --color2:  {{ color2 }};
    --color3:  {{ color3 }};
    --color4:  {{ color4 }};
    --color5:  {{ color5 }};
    --color6:  {{ color6 }};
    --color7:  {{ color7 }};
    --color8:  {{ color8 }};
    --color9:  {{ color9 }};
    --color10: {{ color10 }};
    --color11: {{ color11 }};
    --color12: {{ color12 }};
    --color13: {{ color13 }};
    --color14: {{ color14 }};
    --color15: {{ color15 }};
  '';
}
