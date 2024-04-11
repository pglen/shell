#!/bin/bash
if [ ! -d ~/src/lost+found ]; then
    sudo  -A  mount /dev/sdb1 /home/peterglen/src
fi

#sudo -A  mount -t vboxsf peterglen ~/peterglen
#sudo -A  mount -t vboxsf ubuntu ~/ubuntu
