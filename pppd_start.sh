sudo pppd nodetach noauth notty passive 192.168.2.201: < /tmp/pipe | nc6 -u -p 4000 73.27.99.174 4000 > /tmp/pipe
