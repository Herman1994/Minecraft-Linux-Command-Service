#!/bin/bash

# Minecraft Backup Script
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

# We need to first put the server in readonly mode to reduce the chance of backing up half of a chunk.
screen -p 0 -S svr1-main -X eval "stuff \"save-off\"\015"
screen -p 0 -S svr1-main -X eval "stuff \"save-all\"\015"

# Wait a few seconds to make sure that Minecraft has finished backing up.
sleep 5

# Create a copy for the most recent server image directory (its a convenient way to recover
# a single players' data or chunks without unzipping the whole archive). If you don't need a
# directory with the most recent image, you may comment this section out.
rm -rvf $backupDest/$serverNick-most-recent
mkdir $backupDest/$serverNick-most-recent
cp -Rv $minecraftDir/* $backupDest/$serverNick-most-recent

# Create an archived copy in .tar.gz format.
rm -rvf $backupDest/$serverNick-$backupStamp.tar.gz
tar -cvzf $backupDest/$serverNick-$backupStamp.tar.gz $minecraftDir/*

# Don't forget to take the server out of readonly mode.
screen -p 0 -S svr1-main -X eval "stuff \"save-on\"\015"

# Wait a second for the gnu-screen to allow another stuffing and optionally alert users that the backup has been completed.
sleep 1
screen -p 0 -S svr1-main -X eval "stuff \"say Server byl uspěšně zálohován!\"\015"

# (Optionally) Remove all old (older than 7 days) backups to cut down on disk utilization.
find $backupDest* -mtime +7 -exec rm {} -fv \;


