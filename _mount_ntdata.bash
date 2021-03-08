#!/bin/bash
sudo mkdir /media/ntdata/
sudo chmod 777 /media/ntdata/
sudo echo "UUID=0586998D1A860B43  /media/ntdata     ntfs-3g    rw,nosuid,nodev,noatime,allow_other	0       1" >> /etc/fstab


