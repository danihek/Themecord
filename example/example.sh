#!/usr/bin/env bash

# So pick wallpaper (for example this one)
wallpaper=./test-wallpaper.jpg

# Use pywal
wal -i $wallpaper

# Generate Themecord.css from new color palette
../scripts/discordColors.sh

# Use wallpaper daemon of your choice and change wallpaper

  # WAYLAND 
    # swww img $wallpaper
    # swaybg -i $wallpaper
    # hyprpaper wallpaper $wallpaper
  
  # X
    # feh --bg-scale $wallpaper

# etc.
