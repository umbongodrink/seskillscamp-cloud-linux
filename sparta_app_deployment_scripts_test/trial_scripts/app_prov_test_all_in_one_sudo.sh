#!/bin/bash


#### TEST SCRIPT ####

## THIS SCRIPT IS FOR PROVISIONING THE SPARTA APP

# DATE TESTED:
# TESTED BY:
# IMAGE:
# BEST PRACTICES:



# update the system's package list
sudo apt update -y

# # install needrestart if needed
# sudo apt install needrestart

# # add the configuration to needrestart.conf
# sudo sed -i '/$nrconf{restart}/c\$nrconf{restart} = "a";' /etc/needrestart/needrestart.conf

# upgrade and take away message for needing restarts
#sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y && sudo needrestart -r a
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# backup the default file
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# edit the default file (amended with the forward slash)
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000/;|' /etc/nginx/sites-available/default

# # check the nginx configuration
# sudo nginx -t

# restart the nginx service
sudo systemctl restart nginx

# enable the nginx service
sudo systemctl enable nginx


# install NodeJS 20.0x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
 


# making the script idempotent, check if this directory exists cloudfun1-sparta-app-code/app
# if [ -d "cloudfun1-sparta-app-code" ]; then
#     # remove the directory
#     sudo rm -rf cloudfun1-sparta-app-code
# fi



# download the code from my github repo
git clone https://github.com/umbongodrink/cloudfun1-sparta-app-code.git

# navigate to the directory
cd cloudfun1-sparta-app-code/app

# export the environment variable to add the DB_HOST environment variable, replace and update the IP address 
# with the IP address of the mongodb server. 
export DB_HOST=mongodb://10.0.3.4:27017/posts





# can be removed
# install npm
#sudo apt install npm

# use the newly installed npm to install the app
npm install

# install pm2
sudo npm install pm2 -g




# stop the app if the script has already been run already (if the script has already been run on the same VM)
pm2 kill

# reseed the database
# echo "Reseeding the database"
# node seeds/seed.js
# echo "Database reseeded"

# start the app using pm2
pm2 start app.js 

# print the pid of the app
echo "The PID of the app is: $(pgrep node)"

# print the status of the app
echo "The status of the app is: $(pm2 status)"
