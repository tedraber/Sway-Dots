# Sway-Dots
basically the same as the original, but with a gruvbox theme
### do it manually
```
git clone https://github.com/linuxnoob235/Sway-Dots.git
paru -Rns power-profiles-daemon --needed
paru -S --needed fastfetch grim slurp foot sway waybar swaylock swaync wofi yazi thunar grimshot nwg-look micro imv pipewire pipewire-pulse wireplumber swww tlp tlpui xorg-xwayland ly --needed

//Set up PieWire
systemctl --user enable pipewire pipewire-pulse wireplumber
//Set GTK theme
install gruvbox GTK themes

//Install swaylock
git clone https://github.com/d218nis/rose-pine-swaylock.git ~/.local/share/themes/rose-pine/swaylock

//Remove existing config
rm -rf ~/.config/fastfetch ~/.config/fish ~/.config/foot ~/.config/sway ~/.config/swaync ~/.config/waybar ~/.config/wofi ~/.config/yazi

//Copy config files
cp -rf ~/Sway-Dots/.config/* ~/.config/
mkdir ~/Pictures/Wallpapers/  ## if neccessary
cp -f ~/Sway-Dots/Wallpapers/* ~/Pictures/Wallpapers/ 
Then reboot your system
```
you may have to then get a Rose Pine theme for KDE if you use and QT applications
## **Credits**
Thank you madic-creates for dotfiles to follow **https://github.com/madic-creates/Sway-DE.git** 

Thanks to mechakotik for the waybar config that I tweaked a little **https://github.com/mechakotik/dots/tree/b50571261322387530775854cf73db575585f277/.config/waybar**
