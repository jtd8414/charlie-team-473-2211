#!/bin/bash
if [[ $# -lt 2 ]] ; then
    echo 'insufficient arguments'
    echo 'usage: http_flag_checker.sh url flag'
    exit 1
fi

url=$1
flag=$2

while true
do
        content=$(wget $url -q -O -)
        if [[ "$content" =~ .*"$flag".* ]]; then
                echo "flag still appears to be present"
                sleep 30
        else
                echo "flag appears to be missing! plz fix"
                echo "flag value should be '$flag'"
                sleep 30
fi
done
