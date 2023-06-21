#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start httpd
systemctl enable httpd


