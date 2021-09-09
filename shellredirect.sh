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
echo $username
start=$(cat /etc/passwd | grep $username:)
echo $start
