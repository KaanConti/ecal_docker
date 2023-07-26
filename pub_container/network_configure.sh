#!/bin/bash

# Add multicast route for 239.0.0.0/28 to the network interface (replace eth0 with the appropriate interface name)
ip route add 239.0.0.0/28 dev eth0

# Enable IP forwarding at container startup (since /proc is read-only during runtime)
echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/ip_forward.conf

./hello_world_snd
