#!/usr/bin/env fish
# Install packages with paru
echo "Installing needed packages..."
paru -S --needed --noconfirm fastfetch grim slurp foot sway waybar swaylock swaync wofi yazi thunar grimshot nwg-look micro imv pipewire pipewire-pulse wireplumber tlpui xorg-xwayland oguri-git ly acpi

# Try to detect an active display manager by checking systemd services
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

# Install extra packages
while true
    read -lP "Do you want to install extra files (recommended)? (y/n): " answer
    set answer (string lower $answer)
    
    if test "$answer" = "y"
        echo "Installing files..."
        paru -S --needed --noconfirm --overwrite vesktop-bin zen-browser prismlauncher btop steam adwsteamgtk protonup-qt
        break
    else if test "$answer" = "n"
        echo "Skipping installation."
        break
    else
        echo "Invalid input. Please answer y or n."
    end
end

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
mkdir -p ~/.local/share/themes/rose-pine
git clone https://github.com/d218nis/rose-pine-swaylock.git /home/$USER/.local/share/themes/rose-pine/swaylock

# Clean existing configs
echo "Cleaning old configurations..."
rm -rf /home/$USER/.config/fastfetch /home/$USER/.config/fish /home/$USER/.config/foot /home/$USER/.config/sway /home/$USER/.config/swaync /home/$USER/.config/waybar /home/$USER/.config/wofi /home/$USER/.config/yazi 

# Move new configs
echo "Applying new configurations..."
cp -rv /home/$USER/Sway-Dots/.config/* /home/$USER/.config/
mkdir -p /home/$USER/Pictures/Screenshots
mv /home/$USER/Sway-Dots/bay.PNG /home/$USER/Pictures/Screenshots/
chmod +x /home/$USER/.config/waybar/scripts/battery_switch.sh

# Completion message
echo "Done."

# Prompt for restart
read -lP "Would you like to restart now? [y/N] " confirm
if string match -q --ignore-case "$confirm" "y"
    echo "Restarting system..."
    reboot
end
