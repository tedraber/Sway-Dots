#!/usr/bin/fish
# Install packages with paru
echo "Installing needed packages..."
paru -Rns power-profiles-daemon
paru -S --needed --noconfirm fastfetch grim slurp foot sway waybar swaylock swaync wofi yazi thunar grimshot nwg-look micro imv pipewire pipewire-pulse wireplumber swww tlp tlpui xorg-xwayland ly

echo "Cloning repo..."
git clone https://github.com/linuxnoob235/Sway-Dots/

echo "changing greeter"
set dm (systemctl list-units --type=service --state=running | grep -Ei 'gdm|sddm|lightdm|ly|lxdm|xdm' | awk '{print $1}' | sed 's/.service//')

if test -n "$dm"
    echo "Detected Display Manager: $dm"

    if test "$dm" != "ly"
        echo "Switching to ly..."
        sudo systemctl disable $dm
        sudo systemctl enable ly
        sudo systemctl set-default graphical.target
        echo "Ly has been enabled. Please reboot."
    else
        echo "Ly is already set as the display manager."
    end
else
    echo "No display manager detected. Enabling ly..."
    sudo systemctl enable ly
    sudo systemctl set-default graphical.target
end

# Install extra packages (auto-install without prompt)
echo "Installing recommended extra files..."
paru -S --needed vesktop ##discord
paru -S --needed zen-browser ##web browser
paru -S --needed prismlauncher ##minecraft
paru -S --needed steam adwsteamgtk protonup-qt
paru -S --needed sober ##roblox
paru -S --noconfirm bibata-cursor-theme-bin

echo "Setting up Audio..."
systemctl --user enable pipewire pipewire-pulse wireplumber

# Configure GTK theme
echo "Setting Rose Pine GTK theme..."
paru -S --needed --noconfirm rose-pine-gtk-theme-full
gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-rose-pine-moon'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

# Clone swaylock theme
echo "Copying swaylock theme..."
git clone https://github.com/d2718nis/rose-pine-swaylock.git ~/.local/share/themes/rose-pine/swaylock
# Clean existing configs
echo "Cleaning old configurations..."
rm -rf ~/.config/fastfetch ~/.config/fish ~/.config/foot ~/.config/sway ~/.config/swaync ~/.config/waybar ~/.config/wofi ~/.config/yazi 

# Move new configs
echo "Applying new configurations..."
cp -rv ~/Sway-Dots/.config/* ~/.config/
mkdir -p ~/Pictures/Screenshots
mv ~/Sway-Dots/bay.JPG ~/Pictures/Screenshots/

# Completion message
echo "Done."
echo "You may want to restart your system."
