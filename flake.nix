{
  description = "Themecord flake.nix";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/";
      home-manager.url = "github:nix-community/home-manager/";
    };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.themecord = (import ./default.nix {
      inherit pkgs;
      extraPackages = [
        pkgs.wallust
        pkgs.pywal
      ];
    });

    homeConfigurations = {
      username = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        configuration = { config, pkgs, lib, ... }: {

          home.file.".config/wal/templates/colors-discord.css" = ''
              --color0: {color0};
              --color1: {color1};
              --color2: {color2};
              --color3: {color3};
              --color4: {color4};
              --color5: {color5};
              --color6: {color6};
              --color7: {color7};
              --color8: {color8};
              --color9: {color9};
              --color10: {color10};
              --color11: {color11};
              --color12: {color12};
              --color13: {color13};
              --color14: {color14};
              --color15: {color15};
              '';

          home.file.".config/wallust/wallust.toml".text = ''
            [templates]
            themecord.template = "colors-discord.css"
            themecord.target = '~/.cache/wallust/colors-discord.css'
          '';

          home.file.".config/wallust/templates/colors-discord.css".text = ''
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
        };
      };
    };
  };
}

