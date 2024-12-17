#!/bin/bash


# export the environment variable to stop requiring GUI user input, write it to the bashrc file
echo "export DEBIAN_FRONTEND=noninteractive" >> ~/.bashrc
echo "export NEEDRESTART_MODE=a" >> ~/.bashrc

# export the environment variable to add the DB_HOST environment variable, replace the IP address 
# with the IP address of the mongodb server
export DB_HOST=mongodb://10.0.3.4:27017/posts


# source the bashrc file
source ~/.bashrc

# update the system's package list
sudo apt update -y

# install needrestart if needed
sudo apt install needrestart

# add the configuration to needrestart.conf
sudo sed -i '/$nrconf{restart}/c\$nrconf{restart} = "a";' /etc/needrestart/needrestart.conf

# upgrade and take away message for needing restarts
sudo apt upgrade -y && sudo needrestart -r a

# install nginx
sudo apt-get install nginx -y && sudo needrestart -r a

# install NodeJS 20.0x
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh 

# add execute permission to the 
sudo chmod +x setup_nodejs.sh

# run the setup script
sudo ./setup_nodejs.sh 

# install nodejs
sudo apt-get install nodejs -y && sudo needrestart -r a

# download the code from github repo belonging to the user daraymonsta
# git clone https://github.com/daraymonsta/tech201-sparta-app repo

# navigate to the directory of the app
# cd repo/app

# download the code from github repo
wget -qO- https://github.com/umbongodrink/cloudfun1-sparta-app/archive/refs/heads/main.zip -O cloudfun1-sparta-app.zip

# install unzip
sudo apt install unzip -y

# unzip the file
unzip cloudfun1-sparta-app.zip

# navigate to the directory
cd cloudfun1-sparta-app-main

# unzip the sparta app zip file
unzip nodejs20-sparta-test-app.zip

# navigate to the directory
cd app

# install npm
sudo npm install

# install pm2
sudo npm install pm2 -g

# # start the app in the background
# node app.js & 

## OPTIONAL FOR REVERSE PROXY

# backup the default file
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# edit the default file
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default

# check the nginx configuration
sudo nginx -t

# restart the nginx service
sudo systemctl restart nginx

# enable the nginx service
sudo systemctl enable nginx

# check the status of the nginx service
sudo systemctl status nginx

# start the app using pm2
pm2 start app.js

# print the pid of the app
echo "The PID of the app is: $(pgrep node)"

# print the status of the app
echo "The status of the app is: $(pm2 status)"








