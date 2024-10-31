#!/usr/bin/env bash

# So pick wallpaper (for example this one)
wallpaper=./test-wallpaper.jpg

# Use pywal
wal -i $wallpaper

# Use pywal
wallust run $wallpaper

# Generate Themecord.css from new color palette (pywal)
../scripts/themecord.sh

# Generate Themecord.css from new color palette (wallust)
#../scripts/themecord.sh -w

# Use wallpaper daemon of your choice and change wallpaper

  # WAYLAND 
    # swww img $wallpaper
    # swaybg -i $wallpaper
    # hyprpaper wallpaper $wallpaper
  
  # X
    # feh --bg-scale $wallpaper

# etc.
