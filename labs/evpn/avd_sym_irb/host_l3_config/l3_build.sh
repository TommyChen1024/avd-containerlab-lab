#!/bin/bash


CMD1='cat /etc/hostname; \
sudo vconfig add team0 200; \
sudo ifconfig team0.200 10.200.200.11 netmask 255.255.255.0;\
sudo ip link set up team0.200; \
sudo ip route add 10.0.0.0/8 via 10.200.200.1 dev team0.200; \
sudo ifconfig team0.200; \
sudo route -n
'

CMD2='cat /etc/hostname; \
sudo vconfig add team0 100; \
sudo ifconfig team0.100 10.100.100.12 netmask 255.255.255.0; \
sudo ip link set up team0.100; \
sudo ip route add 10.0.0.0/8 via 10.100.100.1 dev team0.100; \
sudo ifconfig team0.100; \
sudo route -n'

CMD3='cat /etc/hostname; \
sudo vconfig add team0 200; \
sudo ifconfig team0.200 10.200.200.13 netmask 255.255.255.0; \
sudo ip link set up team0.200; \
sudo ip route add 10.0.0.0/8 via 10.200.200.1 dev team0.200; \
sudo ifconfig team0.200; \
sudo route -n
'

CMD4='cat /etc/hostname; \
sudo vconfig add team0 150; \
sudo ifconfig team0.150 10.100.150.14 netmask 255.255.255.0; \
sudo ip link set up team0.150; \
sudo ip route add 10.0.0.0/8 via 10.100.150.1 dev team0.150; \
sudo ifconfig team0.150; \
sudo route -n'

echo "[INFO] Configuring clab-avdirb-client1"
docker exec -it  clab-avdirb-client1 /bin/sh -c "$CMD1"

echo "[INFO] Configuring clab-avdirb-client2"
docker exec -it  clab-avdirb-client2 /bin/sh -c "$CMD2"

echo "[INFO] Configuring clab-avdirb-client3"
docker exec -it  clab-avdirb-client3 /bin/sh -c "$CMD3"

echo "[INFO] Configuring clab-avdirb-client4"
docker exec -it  clab-avdirb-client4 /bin/sh -c "$CMD4"

echo "[INFO] Completed"

echo "Use [ docker exec -it clab-avdirb-client<x> /bin/sh ] to login in host."