!#/bin/bash

# stop requiring GUI user input
export DEBIAN_FRONTEND=noninteractive

# update
sudo apt update -y

# upgrade
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y && sudo needrestart -r a

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y 

# install NodeJS 20.0x
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh 

# add execute permission to the 
sudo chmod +x setup_nodejs.sh

sudo ./setup_nodejs.sh

sudo apt-get install nodejs -y

 