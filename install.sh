#!/usr/bin/fish

# Install packages with paru
echo "Installing needed packages..."
paru -S --needed  fastfetch foot sway waybar swaylock swaync wofi yazi rose-pine-gtk-theme-full thunar

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
cp -rf ~/Sway-Dots/.config/* ~/.config/

# Completion message
echo "done."

# Prompt for restart
read -lP "Would you like to restart now? [y/N] " confirm
if string match -q --ignore-case "$confirm" "y"
    echo "Restarting system..."
    reboot
end
