#!/usr/bin/env sh

# pick some wallpaper (for example this one)
wallpaper=./test-wallpaper.jpg

# Use hellwal
hellwal -i $wallpaper
themecord -g # -g for hellwal - Generate Themecord.css from new color palette



# Use pywal
wal -i $wallpaper
themecord -p # -p for pywal - Generate Themecord.css from new color palette



# Use wallust
wallust run $wallpaper
themecord -w # -w for wallust - Generate Themecord.css from new color palette



# Use wallpaper daemon of your choice and change wallpaper

  # WAYLAND 
    # swww img $wallpaper
    # swaybg -i $wallpaper
    # hyprpaper wallpaper $wallpaper
  
  # X
    # feh --bg-scale $wallpaper

# next reload your bar, wm etc. etc.
