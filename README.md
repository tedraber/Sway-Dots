# Sway-Dots
My new Sway dotfiles I put together
![433667228-94001e28-70f9-430f-a5de-1d1d037c29f1](https://github.com/user-attachments/assets/f787d6b4-8a87-4a71-acb7-9b33b2b86867)
![433668248-ec613360-a99b-41f9-9ca6-6364483ef4f5](https://github.com/user-attachments/assets/9ff6cd50-535a-4b4b-a577-e126be977bd6)
![screenshot_2025-04-15_17-19-28](https://github.com/user-attachments/assets/fd8579b8-b6d9-46b3-a25c-d6d5d7920e78)
## How to install:
```
  git clone https://github.com/linuxnoob235/Sway-Dots.git & cd Sway-Dots 
  chmod +x install.sh && ./install.sh
```
### OR do it manually
```
git clone https://github.com/linuxnoob235/Sway-Dots.git
paru (or yay) -S --needed  fastfetch foot sway waybar swaylock wofi yazi rose-pine-gtk-theme-full thunar zen-browser

//Set GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-rose-pine-moon'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

//Install swaylock
git clone https://github.com/d218nis/rose-pine-swaylock.git ~/.local/share/themes/rose-pine/swaylock

//Remove existing config
rm -rf ~/.config/fastfetch ~/.config/fish ~/.config/foot ~/.config/sway ~/.config/swaync ~/.config/waybar ~/.config/wofi ~/.config/yazi

//Copy files from Sway-Dots to .config
cp -rf ~/Sway-Dots/.config/* ~/.config/

Then reboot your system
```
you may have to then get a Rose Pine theme for KDE if you use and QT applications
## **Credits**
Lots of thanks to the RosePine theme, using the waybar, and swaync theme :)) **https://rosepinetheme.com/**

Thank you madic-creates for dotfiles to follow **https://github.com/madic-creates/Sway-DE.git** 

Thanks to mechakotik for the waybar config that I tweaked a little **https://github.com/mechakotik/dots/tree/b50571261322387530775854cf73db575585f277/.config/waybar**

Wallpaper from **https://github.com/rose-pine/wallpapers**
