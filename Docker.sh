#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt  install docker-compose

sudo usermod -aG sudo ubuntu

sudo usermod -aG docker ubuntu
