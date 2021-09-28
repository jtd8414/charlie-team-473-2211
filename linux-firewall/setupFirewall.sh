#!/bin/bash

# Flush previous firewall rules
iptables -F

# Get which set of rules to use from user

# Apply ruleset


# Allow ping
iptables -A INPUT -p ICMP -j ACCEPT

# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Default to drop
iptables -A INPUT -p tcp -j DROP
iptables -A INPUT -p udp -j DROP