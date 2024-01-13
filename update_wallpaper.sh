wal -o ~/dotfiles/scripts/copyDiscordColorScheme.sh -i ~/wallpaper/

source "$HOME/.cache/wal/colors.sh"

cp $wallpaper ~/.cache/current_wallpaper.jpg

newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

swww img $wallpaper \
    --transition-bezier 0.56,.32,0.5,.6 \
    --transition-fps=165 \
    --transition-type="any" \
    --transition-duration=1.5 \

