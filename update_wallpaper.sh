wal -o ~/dotfiles/scripts/discordColors.sh -i ~/wallpaper/

wallpaperfolder="/home/$USER/wallpaper"

# Check if wallpaper folder exist
if [ ! -d "$wallpaperfolder" ]; then
    echo "Error: wallpaper folder doues not exist."
    exit 1
fi

wallpapers_t=("$wallpaperfolder"/*.{jpg,jpeg,png,gif})

# Check if folder contains wallpapers
if [ ${#wallpapers_t[@]} -eq 0 ]; then
    echo "Error: folder does not contain any wallpaper"
    exit 1
fi

# Select random wallpaper
wallpaper="${wallpapers_t[RANDOM % ${#wallpapers_t[@]}]}"

notifyy="Selected wallpaper: $wallpaper"

# Uncomment if you want to be notified
#notify-send "$notifyy"

cp $wallpaper ~/.cache/current_wallpaper.jpg

newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

swww img $wallpaper \
    --transition-bezier 0.56,.32,0.5,.6 \
    --transition-fps=165 \
    --transition-type="any" \
    --transition-duration=1.5 \

