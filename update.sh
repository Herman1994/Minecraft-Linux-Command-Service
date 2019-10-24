#!/bin/bash

# Minecraft Update Script
# Github: https://github.com/Herman1994/Minecraft-Linux-Command-Service/

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source config.cfg

#TODO - Only backup if $updateUrl != ""

# Backup the server
source backup.sh

# Stop the server
source stop.sh

# Delete the old jar file, download the new one.
rm -vf $minecraftDir/$minecraftJar
wget --output-document=$minecraftDir/$minecraftJar $updateUrl

# Start the server
source start.sh
