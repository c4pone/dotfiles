#!/bin/sh
sudo apt update
sudo apt install -y `cat packages.txt`
sudo apt upgrade -y
