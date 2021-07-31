#!/bin/bash
# https://softwaree.tistory.com/61

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update && sudo apt-get install jenkins

# 서비스 상태 확인
# sudo systemctl status jenkins
