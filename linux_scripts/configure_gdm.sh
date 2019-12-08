#!/bin/bash

# Script to configure gdm
# If using sudo to run the script, specify the user with the -u option.

# Get username
user_name=$(id -u -n)

# Enable gdm
systemctl enable gdm.service

# Enable tap to click
gdm gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Enable autologin
cat <<EOF > '/etc/gdm/custom.conf'
# Enable automatic login for user
[daemon]
AutomaticLogin=$user_name
AutomaticLoginEnable=True

EOF

# Setup default session
cat <<EOF > "/var/lib/AccountsService/users/$user_name"
[User]
Language=
Session=i3
XSession=i3

EOF
