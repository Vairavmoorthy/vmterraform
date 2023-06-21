#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start httpd
systemctl enable httpd


curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

