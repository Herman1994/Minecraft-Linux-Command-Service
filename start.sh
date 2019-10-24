#!/bin/bash

# Minecraft Startup Script
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

# Move into the minecraft directory.
cd $minecraftDir

# Start the game in a GNU screen. It will detatch automatically.
screen -dmS svr1-main java -Xms16G -Xmx16G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar $minecraftJar nogui
