#!/bin/bash

# dart
sudo apt update -y
sudo apt install -y curl
sudo bash -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo bash -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt-get update -y
sudo apt-get install -y dart

# flutter
curl -o ~/linspace/opensource/flutter_linux_v1.9.1+hotfix.2-stable.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.2-stable.tar.xz
tar xf ~/linspace/opensource/flutter_linux_v1.9.1+hotfix.2-stable.tar.xz -C ~/linspace/opensource/

cat dart_ubuntu_profile.txt >> ~/.bashrc

/usr/lib/dart/bin/pub global activate aqueduct

