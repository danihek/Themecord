# Themecord
Discord theme that will always match your wallpaper!

<img src="https://github.com/danihek/Themecord/blob/main/assets/preview.gif" alt="drawing" style="width:1200px;"/>

## Why?
Because why not, I like pywal and I thought it's cool.

## What does it really change?
Like in title, overall discord theme, but Themecord also contains little animations on cursor hover

## Dependecies
- python-pywal
- Compatible discord client

## Supported Clients:
- Vencord
- Vesktop

## Pywal
Before you even start doing anything, remember to put ``./css/colors-discord.css`` to ``~/.config/wal/templates/`` folder

## Installation (Manual)
1. Install supported discord client
2. Copy ```colors-discord.css``` from ```./css``` folder to your ```~/.config/wal/templates/```
3. Copy ```Themecord.css``` and ```ThemecordFiller.css.themecord``` from ```./css``` folder to your ```~/.config/DISCORDCLIENT/themes/```
4. In your discord client, go to themes and select Themecord from available themes.
5. Now when will you change your wallpaper using pywal, run ```./scripts/themecord.sh``` and your discord theme will be applied.

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
(Example from my config)
![alt text](https://github.com/danihek/Themecord/blob/main/assets/nix5.png)
 
3. Rebuild your configuration and run ``themecord``

5. Go to discord client and turn on Themecord
   ![alt text](https://github.com/danihek/Themecord/blob/main/assets/nix3.png)

6. If you used pywal before, then theme should work out of the box
   ![alt text](https://github.com/danihek/Themecord/blob/main/assets/nix4.png)

4. Now you can use command ``themecord`` right after pywal,
and your discord client will update it's theme.

## Example usage
In folder ```./example``` you see example script which you can use as your template in your own script/config and edit to your needs. Enjoy theme'in!!

# Showcase
![alt text](./assets/swappy-20241011_013305.png)
![alt text](./assets/swappy-20241011_013320.png)
![alt text](./assets/swappy-20241011_013405.png)
![alt text](./assets/swappy-20241011_013421.png)
![alt text](./assets/swappy-20241011_013439.png)
![alt text](./assets/swappy-20241011_013456.png)
![alt text](./assets/swappy-20241011_013514.png)
