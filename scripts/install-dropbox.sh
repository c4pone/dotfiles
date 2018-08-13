#!/bin/sh
if ! hash dropboxd 2>/dev/null; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi
