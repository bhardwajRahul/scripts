#!/bin/bash

# Script to install packages

# Prompts
read -r -p "Install gnome desktop environment? [y/N] " response1
read -r -p "Install i3 windows manager? [y/N] " response2
read -r -p "Install blender? [y/N] " response3
read -r -p "Install gimp? [y/N] " response4
read -r -p "Install libreoffice? [y/N] " response5
read -r -p "Install vscode? [y/N] " response6
read -r -p "Install git? [y/N] " response7
read -r -p "Install putty? [y/N] " response8
read -r -p "Install Nvidia LTS driver? [y/N] " response9
read -r -p "Install dolphin file manager? [y/N] " response10
read -r -p "Install audacity? [y/N] " response11

# Install gnome desktop environment
if [[ "${response1}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed gnome
fi

# Install i3 windows manager
if [[ "${response2}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed i3-wm i3-bar i3-status dmenu
fi

# Install blender
if [[ "${response3}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed blender
fi

# Install gimp
if [[ "${response4}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed gimp
fi

# Install libreoffice
if [[ "${response5}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed libreoffice-fresh
fi

# Install vscode
if [[ "${response6}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed code
fi

# Install git
if [[ "${response7}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed git
fi

# Install putty
if [[ "${response8}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed putty
fi

# Install Nvidia LTS driver
if [[ "${response9}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed nvidia-lts
fi

# Install dolphin file manager
if [[ "${response10}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed dolphin
fi

# Install audacity
if [[ "${response11}" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        pacman -S --noconfirm --needed audacity
fi
