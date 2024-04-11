#!/bin/bash
echo
echo "Shutting down, Ctrl-C to abort shutdown ..."
echo 
sleep 3
echo "Going down ..."
crypt.pl  ~/.pass | sudo -S halt



