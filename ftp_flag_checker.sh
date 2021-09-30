#!/bin/bash
# I have yet to test this, so apologies in advance if it doesn't work :< 
if [[ $# -lt 1 ]] ; then
    echo 'insufficient arguments'
    echo 'usage: ftp_flag_checker.sh host'
    exit 1
fi
host=$1 
flag_filename="memes"
flag_contents='a1ien_Emoj1#'

function checkfile()
{
   ftp $host <<-HERE
   ls $flag_filename
   bye
   HERE
}

function get()
{
   ftp $host <<-HERE
   get $flag_filename
   bye
   HERE
}


while true
do
        if checkfile $host | grep $flag_filename
        then
                echo "flag file exists, its contents are:"
                cat memes
                echo "expected value:"
                echo "$flag_contents"
                sleep 30
                rm memes

        else
                echo "flag file seems to be missing!"
                sleep 30
        fi
done
