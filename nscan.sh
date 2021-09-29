#! /bin/bash
sudo apt-get -y install nmap 
sudo rm ips.txt
sudo rm NetworkInitialOutput.txt
echo "10.10.1.10" > ips.txt
echo "10.10.1.20" >> ips.txt
echo "10.10.1.30" >> ips.txt
echo "10.10.1.40" >> ips.txt
echo "10.10.1.200" >> ips.txt
echo "10.10.1.202" >> ips.txt
echo "10.10.1.254" >> ips.txt
echo "10.10.1.230" >> ips.txt
echo "10.10.1.240" >> ips.txt
sudo nmap -sS -iL ips.txt -oN NetworkInitialOutput.txt
sudo chmod 444 NetworkInitialOutput.txt
sudo chmod 444 ips.txt

watch -n 60 sudo nmap -sS -iL ips.txt
