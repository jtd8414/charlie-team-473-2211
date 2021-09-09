#!/bin/bash

apt-get update -y > /dev/null
apt-get upgrade -y > /dev/null
apt-get install -y coreutils

grep /bin/bash /etc/passwd | cut -d: -f1 | while read line
do
	echo $line >> history.txt
	if [ $line == "root" ]
	then
		echo "$line" >> user.txt
		echo "$line:student" >> userPassword.txt
	else
		echo "$line" user.txt
		echo "$line:$line!help123456789" >> userPassword.txt
		chmod 644 /home/$line
	fi
done
chpasswd < userPassword.txt
shred -f userPassword.txt

