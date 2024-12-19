#!/bin/bash


#### TEST SCRIPT ####

## THIS SCRIPT IS FOR PROVISIONING THE SPARTA APP

# DATE TESTED:
# TESTED BY:
# IMAGE:
# BEST PRACTICES:



# update the system's package list
sudo apt update -y

# upgrade and take away message for needing restarts
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# edit the default file (amended with the forward slash)
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000/;|' /etc/nginx/sites-available/default

# restart the nginx service
sudo systemctl restart nginx

# enable the nginx service
sudo systemctl enable nginx



## RAMONS
# install NodeJS 20.0x
# curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs   ## THIS TAKES ME TO INTERACTIVE MODE, SO SOMETHING IS WRONG HERE

# split command
#curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs



# JACKS COMMANDS
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh
 
# run the setup file through bash
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh
 
# install nodejs
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y




# download the code from my github repo
git clone https://github.com/umbongodrink/cloudfun1-sparta-app-code.git

# navigate to the directory
cd cloudfun1-sparta-app-code/app

# export the environment variable to add the DB_HOST environment variable, replace and update the IP address 
# with the IP address of the mongodb server. 
export DB_HOST=mongodb://10.0.3.4:27017/posts

# use the newly installed npm to install the app
npm install

# install pm2
sudo npm install pm2 -g

# stop the app if the script has already been run already (if the script has already been run on the same VM)
pm2 kill

# start the app using pm2
pm2 start app.js 

# print the pid of the app
echo "The PID of the app is: $(pgrep node)"

# print the status of the app
echo "The status of the app is: $(pm2 status)"
