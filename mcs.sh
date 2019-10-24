#! /bin/bash

### BEGIN INIT INFO
# Github: https://github.com/Herman1994/Minecraft-Linux-Comand-Service
# Provides:          mcs
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Minecraft Comands Services
# Description:       Minecraft Comands for basic manipulation.
### END INIT INFO

case "$1" in
  start)
    echo "Startuji server..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./start.sh'
    ;;
  stop)
    echo "Zastavuji server..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./stop.sh'
    sleep 2
    ;;
  time)
    echo "Nastavuji čas na serveru..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./time.sh'
    ;;
  creative)
    echo "Nastavuji Creative na serveru..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./creative.sh'
    ;;
  backup)
    echo "Zalohuji server..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./backup.sh'
    ;;
  chat)
    echo "Vypisuji chat serveru..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./chat.sh'
    ;;
  restart)
    echo "Restartuji server..."
    sudo -u root bash -c 'cd /usr/share/minecraft-script/ && ./restart.sh'
    sleep 2
    ;;
  *)
    echo "Usage: mcs {start|stop|restart|backup|time|chat}"
    exit 1
    ;;
esac

exit 0
