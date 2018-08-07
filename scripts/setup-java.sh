#!/bin/sh
if [ ! -d ~/.sdkman ];
then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 10.0.2-oracle  
fi
