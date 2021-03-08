#!/bin/bash

sudo mkdir /media/winbackup/
sudo chmod 777 /media/winbackup/
sudo echo "UUID=BA881ECA881E84D3  /media/winbackup     ntfs-3g    rw,nosuid,nodev,noatime,allow_other	0       1" >> /etc/fstab

