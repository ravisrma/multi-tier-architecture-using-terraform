#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

# Install MySQL server
sudo apt install mysql-server -y
sudo systemctl start mysql.service
sudo systemctl enable mysql.service

