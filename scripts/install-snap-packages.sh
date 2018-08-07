#!/bin/sh
cat packages-snap.txt | while read line
do
    sudo snap install $line
done
