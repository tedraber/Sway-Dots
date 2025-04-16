# Sway-Dots
My new Sway dotfiles I put together
![image](https://github.com/user-attachments/assets/00d73f29-831e-4e76-ae51-07f7193f112a)
![image](https://github.com/user-attachments/assets/f6f81424-3e75-4e1d-ad4f-2e4d52899d1d)
![screenshot_2025-04-15_17-19-28](https://github.com/user-attachments/assets/fd8579b8-b6d9-46b3-a25c-d6d5d7920e78)
## How to install:
Install through curl
``` 
fish -c "curl -fsSL https://raw.githubusercontent.com/linuxnoob235/Sway-Dots/main/install.sh | fish"
```
OR Install through git
``` 
  git clone https://github.com/linuxnoob235/Sway-Dots.git & cd Sway-Dots 
  chmod +x install.sh && ./install.sh
```
### OR do it manually
```
git clone https://github.com/linuxnoob235/Sway-Dots.git
paru (or yay) -S --needed  fastfetch foot sway waybar swaylock wofi yazi rose-pine-gtk-theme-full thunar zen-browser grimshot nwg-look imv pipewire pipewire-pulse wireplumber

//Set up PieWire
systemctl --user enable pipewire pipewire-pulse wireplumber
//Set GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-rose-pine-moon'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

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
Lots of thanks to the RosePine theme, using the waybar, and swaync theme :)) **https://rosepinetheme.com/**

Thank you madic-creates for dotfiles to follow **https://github.com/madic-creates/Sway-DE.git** 

Thanks to mechakotik for the waybar config that I tweaked a little **https://github.com/mechakotik/dots/tree/b50571261322387530775854cf73db575585f277/.config/waybar**

Wallpaper from **https://github.com/rose-pine/wallpapers**
