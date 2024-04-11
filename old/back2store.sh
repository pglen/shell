#!/bin/bash

# Changed to backup the whole system Sat 02.May.2020

#shopt -s dotglob

rsync -au --exclude /proc/ --exclude /tmp/ --exclude /dev/ --exclude /boot/ --exclude /media/ \
--exclude /sys/ --exclude /storage/   --exclude /run/ --exclude /var/ --exclude /lost+found/ \
--exclude /swapfile --exclude /core \
--fake-super  /  /storage/backup/

#shopt -u dotglob



