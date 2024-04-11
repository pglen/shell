lspci -nn | grep USB | cut -d '[' -f3 | cut -d ']' -f1 | sudo tee | xargs -I@ setpci -H1 -d @ d0.l=0
