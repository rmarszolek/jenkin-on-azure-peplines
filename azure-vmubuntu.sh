#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo echo "Execute your super awesome commands here!" >> /tmp/test.txt
sudo apt install openjdk-8-jdk -y
sudo wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update && apt-get install jenkins -y
sudo apt install openjdk-8-jdk -y
sudo service jenkins restart
sudo apt update
sudo apt install git