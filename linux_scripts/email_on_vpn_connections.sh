#!/bin/bash

# Copyright (c) Matthew David Miller. All rights reserved.
# Licensed under the MIT License.

# This script is used to email the admin when a VPN connection is established on the VPN server.

# Add to /etc/rc.local
# /bin/bash /usr/local/bin/email_on_vpn_connections.sh &

# Variables
# Script name
script_name='email_on_vpn_connections.sh'
# Log file location
log='/var/log/email_on_vpn_connections.sh.log'
# Words to search for in the log file.
search_for_these_words='Connection Initiated'
# File to search through.
file_to_search_for_words='/var/log/openvpn.log'
# Time to wait after sending an email in seconds.
time='720'
# Define path to commands.
PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"

# Check if script is already running.
function check_script() {
    if pidof -x "${script_name}" -o $$ >/dev/null; then
        echo "Process already running" >>"${log}"
        exit 1
    fi
}

# Searches newlines for a specified string in a file and emails admin if the string is found.
function check_connections() {
    while read -r "new_connection_established"; do
        if printf "%s" "${new_connection_established}" | grep -q "${search_for_these_words}"; then
            python3 "/usr/local/bin/email_on_vpn_connections.py"
            echo """${new_connection_established}""" >>"${log}"
            sleep "${time}"
        fi
    done < <(tail -f -c 0 "${file_to_search_for_words}") &
}

# Call functions
check_script
check_connections
