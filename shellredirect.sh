#!/bin/bash

# Author: Nathan Bloom (nxb4951@rit.edu)

while getopts u: flag  # this block handles command flags
do
	case ${flag} in
		u) username=${OPTARG};;
	esac
done

echo Users able to log in:
cat /etc/passwd | grep -v /usr/sbin/nologin | grep -v /bin/false
if [$username != ""]; then
	echo $username
	# TODO actually edit the /etc/passwd file and replace line with one ending in /bin/false
	usermod -L $username
	usermod -s /bin/false $username
fi
