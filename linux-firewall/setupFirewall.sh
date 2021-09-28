#!/bin/bash

# Flush previous firewall rules
iptables -F

# Get which set of rules to use from user
echo "### Select ruleset ###"
echo "All rulesets allow ICMP and established connections, and default to drop"
echo
echo "0. Other/specimen-x(just base rules)"
echo "1. secret-fileshare: FTP"
echo "2. specimen T-5/6: HTTP, SSH"

read selection
if [ $selection == "0" ]; then
	ruleset=()
elif [ $selection == "1" ]; then
	ruleset=(21)
elif [ $selection == "2" ]; then
	ruleset=(22 80)
else
	echo "Invalid selection"
	exit
fi

# Apply ruleset

for port in "${ruleset[@]}"; do
	iptables -A INPUT -p tcp --dport $port -j ACCEPT
done

# Allow ping
iptables -A INPUT -p ICMP -j ACCEPT

# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Default to drop
iptables -A INPUT -p tcp -j DROP
iptables -A INPUT -p udp -j DROP

# Print iptables
iptables -L