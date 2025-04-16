#!/bin/bash
# Install packages with paru
echo "Installing needed packages..."
paru -S --needed --noconfirm fastfetch grim slurp foot sway waybar swaylock swaync wofi yazi thunar grimshot nwg-look micro imv pipewire pipewire-pulse wireplumber tlpui xorg-xwayland fish ly 
echo "cloning repo..."
git clone https://github.com/linuxnoob235/Sway-Dots/install.sh

#install extra packages
while true; do
    read -p "Do you want to install extra files (recommended)? (y/n): " answer
    answer=${answer,,}  # lowercase the input

    if [[ "$answer" == "y" ]]; then
        echo "Installing files..."
        paru -S --needed --noconfirm --overwrite vesktop-bin zen-browser prismlauncher btop steam adwsteamgtk protonup-qt
        break
    elif [[ "$answer" == "n" ]]; then
        echo "Skipping installation."
        break
    else
        echo "Please answer y or n."
    fi
done

echo "Settings up Audio..."
systemctl --user enable pipewire pipewire-pulse wireplumber

# Configure GTK theme
echo "Setting Rose Pine GTK theme..."
paru -S --needed --noconfirm rose-pine-gtk-theme-full
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
