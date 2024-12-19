#!/bin/bash

# change directory to the app directory
cd cloudfun1-sparta-app-code/app

# stop the app if the script has already been run already (if the script has already been run on the same VM)
pm2 kill

# start the app using pm2
pm2 start app.js 

# print the pid of the app
echo "The PID of the app is: $(pgrep node)"

# print the status of the app
echo "The status of the app is: $(pm2 status)"




