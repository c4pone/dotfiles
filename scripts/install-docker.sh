#!/bin/sh
if ! hash docker 2>/dev/null; then
    sudo usermod -aG docker ${USER}
    sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo systemctl enable docker
fi
