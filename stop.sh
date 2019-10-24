#!/bin/bash

# Minecraft Stop Script
# Github: https://github.com/Herman1994/Minecraft-Linux-Command-Service/

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source config.cfg

# Alert the players that the server is going to be shut down. We stuff the `stop` command into
# the screen session. \015 is the escape value for a return.
screen -p 0 -S minecraft -X eval "stuff \"say Server will be shutting down in 10 seconds.\"\015"

# Wait a moment and stop the server.
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
