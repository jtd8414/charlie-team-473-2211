#!/bin/bash

wget https://github.com/facebook/watchman/releases/download/v2021.08.02.00/watchman-v2021.08.02.00-linux.zip
unzip watchman-*-linux.zip
sudo mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman
sudo cp watchman-v2021.08.02.00-linux/bin/* /usr/local/bin
sudo cp watchman-v2021.08.02.00-linux/lib/* /usr/local/lib
sudo chmod 755 /usr/local/bin/watchman
sudo chmod 2777 /usr/local/var/run/watchman
