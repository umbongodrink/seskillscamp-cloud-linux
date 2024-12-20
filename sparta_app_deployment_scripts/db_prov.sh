#!/bin/bash

# update and upgrade the system, making sure the script is non-interactive for the user via a GUI
sudo apt update -y && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install gnupg and curl
sudo apt-get install gnupg curl


# import the public key. Ignore prompt to overwrite if already exists.
if [ ! -f /usr/share/keyrings/mongodb-server-7.0.gpg ]; then
   curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
      sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
      --dearmor
fi

# install the public key for mongodb 7.0, if it doesn't already exist
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# update the package list now that the mongodb repo has been added
sudo apt-get update

## install the mongodb, specifically version 7.0.6
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

# prevent certain upgrades of mongodb packages when running apt upgrade in the future
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-mongosh hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# start the mongodb service
sudo systemctl start mongod

# enable the mongodb service
sudo systemctl enable mongod

# backup the mongod.conf file
sudo cp /etc/mongod.conf /etc/mongod.conf.bak

# edit /etc/mongod.conf bindIp address (by default it's localhost, change to 0.0.0.0), 
# so that the mongodb server can be accessed from any IP address
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

# restart the mongodb service
sudo systemctl restart mongod

# get the IP address of the mongodb server and assign it to a variable like you do in python: ip_address = "
ip_address=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1)

# print the IP address of the mongodb server
echo "The internal private subnet IP address of the mongodb server is: $ip_address. Use this for your DB_HOST environment variable."