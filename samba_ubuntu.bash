#!/bin/bash
# reference: https://linuxize.com/post/how-to-install-and-configure-samba-on-ubuntu-18-04/

sudo apt update

# Install the Samba package with the following command:
sudo apt install samba
sudo systemctl status smbd

# Configuring firewall:
sudo ufw allow 'Samba'
