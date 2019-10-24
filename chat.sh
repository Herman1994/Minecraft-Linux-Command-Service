#!/bin/bash

# Minecraft Script to view live chatlog of players
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

# How far back do you want to start? (In lines)
# A bigger number may cause your screen to flash.
lines=500

# Show recent chats and live ones until CTRL+C is pressed.
tail -n $lines -F $minecraftLog | grep "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] <[a-zA-Z0-9_]*> [^@].*"

