#!/bin/bash
sudo dnf update -y

sudo dnf install vim gparted clapper kitty gcc gcc-c++ fastfetch -y

sudo dnf install dnf-plugins-core -y

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y

sudo dnf install brave-browser -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install google-chrome-stable_current_x86_64.rpm -y

flatpak install flathub com.obsproject.Studio md.obsidian.Obsidian com.github.IsmaelMartinez.teams_for_linux org.gimp.GIMP org.gnome.gitlab.YaLTeR.VideoTrimmer com.github.unrud.VideoDownloader org.pgadmin.pgadmin4 us.zoom.Zoom com.mattjakeman.ExtensionManager com.visualstudio.code org.telegram.desktop -y

bash scripts/vscode.sh

cat rm.txt >> ~/.bash_profile
cat "alias.txt" >> ~/.bashrc
source ~/.bashrc

read -p "Do you want to set a keyboard shortcut for switching desktops (y or n)? " flag

if [ "$flag" = "y" ]; then
	for i in {1..9}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Alt>$i']"; done
fi

read -p "Do you want to restart (y or n)? " flag

if [ "$flag" = "y" ]; then
	reboot
fi
