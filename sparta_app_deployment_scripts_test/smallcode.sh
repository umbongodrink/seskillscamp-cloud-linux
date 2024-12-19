#!/bin/bash

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
