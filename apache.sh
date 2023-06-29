#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start httpd
sudo systemctl enable httpd


