#!/bin/bash
sudo dnf update -y

sudo dnf install vim gparted clapper kitty gcc gcc-c++ fastfetch -y

cp files/kitty.conf ~/.config/kitty/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp files/vimrc ~/.vimrc

sudo dnf install dnf-plugins-core -y

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y

sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap

sudo dnf install brave-browser -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install google-chrome-stable_current_x86_64.rpm -y

flatpak install flathub com.obsproject.Studio md.obsidian.Obsidian com.github.IsmaelMartinez.teams_for_linux org.gimp.GIMP org.gnome.gitlab.YaLTeR.VideoTrimmer com.github.unrud.VideoDownloader org.pgadmin.pgadmin4 us.zoom.Zoom com.mattjakeman.ExtensionManager com.visualstudio.code org.telegram.desktop -y

bash scripts/vscode.sh
bash scripts/oh-my-posh.sh

cat files/rm.txt >> ~/.bash_profile
cat files/"alias.txt" >> ~/.bashrc
cat files/config.jsonc ~/.config/fastfetch/config.jsonc
cat files/bashrc >> ~/.bashrc
source ~/.bashrc

read -p "Do you want watch anime (y or n)? " flag

if [ "$flag" = "y" ]; then
    sudo snap install anilibrix
fi

read -p "Do you want to set a keyboard shortcut for switching desktops (y or n)? " flag

if [ "$flag" = "y" ]; then
	for i in {1..9}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Alt>$i']"; done
fi

read -p "Do you want to restart (y or n)? " flag

if [ "$flag" = "y" ]; then
	reboot
fi
