#!/bin/bash

# Minecraft Restart Script
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

# Alert the players that the server is going to be shut down. We stuff the `stop` command into
# the screen session. \015 is the escape value for a return.
screen -p 0 -S svr1-main -X eval "stuff \"say Server bude za 1 minutu restartován!\"\015"

# Wait a moment and stop the server.
sleep 60
screen -p 0 -S svr1-main -X eval "stuff \"stop\"\015"

# Start the server
source mc-start.sh
