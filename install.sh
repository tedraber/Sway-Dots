#!/usr/bin/fish

# Install packages with paru
echo "Installing needed packages..."
paru -S --needed --noconfirm  fastfetch grim slurp foot sway waybar swaylock swaync wofi yazi rose-pine-gtk-theme-full thunar grimshot nwg-look micro imv pipewire pipewire-pulse wireplumber tlpui
echo "do you 
git clone https://github.com/linuxnoob235/Sway-Dots/install.sh

#install extra packages
read -lP "Would you like to install extra packages (steam, vesktop, zen-browser + extra? [y/N] " confirm
if string match -q --ignore-case "$confirm" "y"
    echo "installing packages..."
    paru -S vesktop-bin steam adwsteamgtk zen-browser-bin protonup-qt btop
    
echo "Settings up Audio..."
systemctl --user enable pipewire pipewire-pulse wireplumber

# Configure GTK theme
echo "Setting Rose Pine GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-rose-pine-moon'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# Clone swaylock theme
echo "Copying swaylock theme..."
mkdir -p ~/.local/share/themes/rose-pine
git clone https://github.com/d218nis/rose-pine-swaylock.git ~/.local/share/themes/rose-pine/swaylock

# Clean existing configs
echo "Cleaning old configurations..."
rm -rf ~/.config/fastfetch ~/.config/fish ~/.config/foot ~/.config/sway ~/.config/swaync ~/.config/waybar ~/.config/wofi ~/.config/yazi 

# Move new configs
echo "Applying new configurations..."
cp -rv ~/Sway-Dots/.config/* ~/.config/
mkdir -p ~/Pictures/Screenshots
mv ~/Sway-Dots/bay.PNG ~/Pictures/Screenshots/
# Completion message
echo "done."

# Prompt for restart
read -lP "Would you like to restart now? [y/N] " confirm
if string match -q --ignore-case "$confirm" "y"
    echo "Restarting system..."
    reboot
end
