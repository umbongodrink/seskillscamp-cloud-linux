#!/bin/bash

# export the environment variable to add the DB_HOST environment variable, replace and update the IP address 
# with the IP address of the mongodb server. 
export DB_HOST=mongodb://10.0.3.5:27017/posts

# change directory to the app directory
cd cloudfun1-sparta-app-code/app

# reseed the database
node seeds/seed.js

# stop the app if the script has already been run already (if the script has already been run on the same VM)
pm2 kill

# start the app using pm2
pm2 start app.js 

# print the pid of the app
echo "The PID of the app is: $(pgrep node)"

# print the status of the app
echo "The status of the app is: $(pm2 status)"



