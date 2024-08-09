# Themecord
Discord theme that will always match your wallpaper!

## Dependecies
- python-pywal
- Compatible discord client

## Supported Clients:
- Vencord
- Vesktop

## Installation (NixOS)
1. Add themecord to inputs(just like home-manager) in your config flake:
```
themecord = {
   url = "github:danihek/themecord";
   inputs.nixpkgs.follows = "nixpkgs";
 };
```

2. Add as a module:
```
({ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  themecord.packages.x86_64-linux.default
  ];
})
```
![alt](./assets/nix1.png)
3. Rebuild your configuration and run copythemecord
![alt](./assets/nix1.png)
![alt](./assets/nix2.png)
![alt](./assets/nix3.png)
![alt](./assets/nix4.png)

3. Now you can use command ```copythemecord``` right after pywal,
and your discord client will update it's theme.


## Installation (Manual)
1. Install supported discord client
2. Copy ```colors-discord.css``` from ```./css``` folder to your ```~/.config/wal/templates/```
3. Copy ```Themecord.css``` from ```./css``` folder to your ```~/.config/DISCORDCLIENT/themes/```
4. In your discord client, go to themes and select Themecord from available themes.
5. Now when will you change your wallpaper using pywal, run ```./scripts/discordColors.sh``` and your discord theme will be applied.

## Example usage
In folder ```./example``` you see example script which you can use as your template in your own script/config and edit to your needs. Enjoy!

# Showcase
![alt text](https://github.com/danihek/Themecord/blob/main/assets/2024-01-14-022114_hyprshot.png)
![alt text](https://github.com/danihek/Themecord/blob/main/assets/2024-01-14-022423_hyprshot.png)
![alt text](https://github.com/danihek/Themecord/blob/main/assets/2024-01-14-022241_hyprshot.png)
![alt text](https://github.com/danihek/Themecord/blob/main/assets/2024-01-14-022145_hyprshot.png)
