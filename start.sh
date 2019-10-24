#!/bin/bash

# Minecraft Startup Script
# Github: https://github.com/Herman1994/Minecraft-Linux-Command-Service/

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source config.cfg

# Move into the minecraft directory.
cd $minecraftDir

# Start the game in a GNU screen. It will detatch automatically.
screen -dmS minecraft java -Xms1G -Xmx2G -jar $minecraftJar nogui
