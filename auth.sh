#!/bin/bash

# Minecraft Script to view all authentications to the server
# Github: https://github.com/Herman1994/Minecraft-Linux-Command-Service/

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source config.cfg

# How far back do you want to start? (In lines)
# A bigger number may cause your screen to flash.
lines=1500

# Show $lines number of recent authentications and show all new ones until CTRL+C is pressed.
tail -n $lines -F $minecraftLog | grep -E "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] [^/ ]"

# TODO Rewrite regex for new update
