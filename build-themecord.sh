#!/usr/bin/env bash

set -xe

TARGET=themecord

echo "#!/usr/bin/env sh" > themecord
echo -e "\n#This is generated by themecord builder!" >> themecord

# first filler
echo "themecordFiller=\$(cat << 'EOF'" >> themecord
cat ./css/ThemecordFiller.css >> themecord
echo -e "EOF\n)\n" >> themecord

# dark theme variable
echo "dark_theme=\$(cat << 'EOF'" >> themecord
cat ./css/dark_theme.css >> themecord
echo -e "EOF\n)\n" >> themecord

# light theme variable
echo "light_theme=\$(cat << 'EOF'" >> themecord
cat ./css/light_theme.css >> themecord
echo -e "EOF\n)\n" >> themecord

# filler after root { css section
echo "themecordFiller2=\$(cat << 'EOF'" >> themecord
cat ./css/ThemecordFiller2nd.css >> themecord
echo -e "EOF\n)\n" >> themecord

echo "themecordBase=\$(cat << 'EOF'" >> themecord
cat ./css/Themecord.css >> themecord
echo -e "EOF\n)\n" >> themecord

cat ./scripts/themecord.sh >> themecord

chmod +x themecord
