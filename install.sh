#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root, i.e. sudo $0"
    exit 1
fi

[ -d "/usr/local/bin" ] || mkdir /usr/local/bin

cp locationchanger /usr/local/bin
chown root:wheel /usr/local/bin/locationchanger
chmod 755 /usr/local/bin/locationchanger

cp ./LocationChanger.plist /Library/LaunchDaemons/
chmod 600 /Library/LaunchDaemons/LocationChanger.plist
launchctl unload /Library/LaunchDaemons/LocationChanger.plist
launchctl load /Library/LaunchDaemons/LocationChanger.plist
