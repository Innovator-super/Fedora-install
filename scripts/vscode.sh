#!/bin/bash
cp files/settings.json ~/.var/app/com.visualstudio.code/config/Code/User/
wget https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip -d JetBrainsMono-2.304
mv JetBrainsMono-2.304 ~/.local/share/fonts/
fc-cache -f -v
