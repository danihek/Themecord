# Themecord

Discord theme that will always match your wallpaper!

<img src="https://github.com/user-attachments/assets/801f0a38-953b-4214-9220-eaba9865218e" alt="drawing" style="width:1200px;"/>

<details>
  <summary>Click to expand star history</summary>
    <p align="right">
      <img
        alt="Star History Chart"
        src="https://api.star-history.com/svg?repos=danihek/themecord&type=Date&theme=dark"
      >
    </p>
</details>

## Why?
Because why not, I like having same theme on everything I thought it's cool.

## Dependecies
- Compatible discord client
- One of color palettes generators:
    - [hellwal](https://github.com/danihek/hellwal)
    - [python-pywal](https://github.com/dylanaraps/pywal)
    - [wallust](https://codeberg.org/onemoresuza/wallust)

## Supported Clients:
- Vencord
- Vesktop

## Installation

### AUR
``yay -S themecord``

### Manual

1. Install supported discord client
2. Download themecord from [release](https://github.com/danihek/Themecord/releases) page
3. Look into **# Generating colorscheme** Section
4. In your discord client, go to themes and select Themecord from available themes.
5. Now after you run hellwal, pywal or wallust  run ``./themecord`` and your discord theme will be applied.

You can put it in ``/usr/local/bin/`` for ease of use

### NixOS
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

4. Go to discord client and select Themecord from available themes

![alt text](https://github.com/danihek/Themecord/blob/main/assets/nix3.png)

6. Now after you run hellwal, pywal or wallust  run ``./themecord`` and your discord theme will be applied.
and your discord client will update it's theme.

## Nix
In folder ``./nix`` you can see example how I added to my flake hellwal, wallust and pywal templates.

---

## Generating colorscheme
Before you even start doing **ANYTHING**, you have to choose if you wanna use pywal or wallust

### In case of hellwal you have to copy css file:
``./css/hellwal/discord-colors.css`` to ``~/.config/hellwal/templates/`` folder

### in case of pywal:
``./css/pywal/discord-colors.css`` to ``~/.config/wal/templates/`` folder

### and in case of wallust:
``./css/wallust/discord-colors.css`` to ``~/.config/wallust/templates/`` folder

also add to ``~/.config/wallust/wallust.toml`` required config:

```
[templates]
themecord.template = "discord-colors.css"
themecord.target = '~/.cache/wallust/discord-colors.css'
```

## Example usage

In folder ``./example`` you see example script which you can use as your template in your own script/config for changing wallpapers and edit to your needs.

## Light mode

You can use `-l` flag to use light mode like this (**hellwal** as backend ):

```sh
themecord -l
```

# Enjoy theme'in!!

## Showcase

![swappy-20250406_214827](https://github.com/user-attachments/assets/662eda4c-d5ce-456b-b11a-e51187e90ae4)
![swappy-20250406_214848](https://github.com/user-attachments/assets/b43d464a-e6da-4e75-a84c-7752a2253ca2)
![swappy-20250406_214847](https://github.com/user-attachments/assets/e108c98b-425d-4156-ad34-1dbbc0fd0b42)
![swappy-20250406_214846](https://github.com/user-attachments/assets/61056857-9a64-486f-96cf-7c42f2e859a3)
![swappy-20250406_214844](https://github.com/user-attachments/assets/51217cff-e79e-464b-8808-da255bf79938)
![swappy-20250406_214842](https://github.com/user-attachments/assets/d5af1fa9-8764-4e5c-a428-39a223702af0)
![swappy-20250406_214838](https://github.com/user-attachments/assets/4b9b0173-fbec-4f0c-a337-949e48aaf6bd)
![swappy-20250406_214837](https://github.com/user-attachments/assets/b9eed68c-6819-4b75-a851-c772f0b0ddb3)
![swappy-20250406_214836](https://github.com/user-attachments/assets/4c03edce-7831-4ac2-8e6d-fedaab0ca7e7)
![swappy-20250406_214835](https://github.com/user-attachments/assets/56976557-91ea-4e4f-8648-05347bd59522)
![swappy-20250406_214834](https://github.com/user-attachments/assets/304bb494-dfd8-493a-a761-85e395e11d79)
![swappy-20250406_214832](https://github.com/user-attachments/assets/7ea64335-3550-41eb-b194-6472947ae206)
![swappy-20250406_214830](https://github.com/user-attachments/assets/c026e974-448d-4261-b14f-f64c747905ef)

## Special thanks

- [dylanaraps](https://github.com/dylanaraps) for creating pywal and inspiration for other programmers
- [refact0r](https://github.com/refact0r) for fixing miserable discord update and providing pretty and well-built discord theme
