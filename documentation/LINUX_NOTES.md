# LINUX NOTES

## General Background

Linux is a clone of Unix used for mainframes in the 1970s. It is often referred to as "Unix-Like".

Linux:
- kernel
- libraries and utilities (hence plug-and-play)

## Linux Commands

`cat <filename>`   -   output contents of a file

`cat /etc/shells`   -   tells you what shells are available on your system

`ps -p $$`  -   tells you what shell you are using

`ps -p` -   tells you what process is...

`ls`    -   lists the files in your current directory

`curl <URL> --output <filename>`  -   download something (a tool for data transfer) NOTE: you can do more with curl, e.g. interact with APIs etc

`wget URL`  -   similar to curl but simpler
OR
`wget <URL> -O <filename_you_want_to_give>`    -   downloads the file as the filename you want

`uname -a` - tells you about your machine 

`clear` -   clears the screen

`whoami`    -   tells you about who you are logged in as

`history`   -   gives you the last 500 commands

`!<number>`   -   runs the command in your history

`history -c`    -   clears your history: useful for clearning confidential commands from your history, e.g. if you've inputted the path to a private key etc

`ls -a` -   shows you everything in a directory including hidden files and directories

`ls -l` -   shows you the long format of the listings in a directory

`ls -la`    -   shows you the long format of the hidden files in a directory

`file <filename>`   -   tells you what type of file something is. NOTE: works even if the file extension does not match the actual type of file.

`cp <source_file> <destination_file>`   -   copies a file

`rm <filename>` -   delete a file

`mkdir <name>`  -   make a directory with the name you specified

`rm -r` -   delete a directory with everything inside it (recursively)

`mkdir "<name with spaces>"`    -   wrap your name of your directory in quotes to allow spaces

`touch <filename>`  -   create a file with the name you want

`nano <filename>`   -   edit the file

`head -2 <filename>`    -   show us the first 2 lines of the file

`tail -2 <filename>`    -   show us the last 2 recent lines of a file, useful for a log files, error logs. 

`nl <filename>` -   show us the file with number lines

`cat <filename> | grep <string>`    -   redirect the output of cat and search it for the string

`sudo`  -   put in front of a command to use admin privileges

`sudo apt update`   -   update the packages installed against the lastest version in the repository

`sudo apt upgrade -y`   -   upgrade the software on the system (without asking you if you want to do it). NOTE: *be careful of doing this in a production environment*.

`sudo su`   -   become root (su = switch user, nothing/blank = root)

`exit`  -   stop being the root user

`#!/bin/bash`   -   use at start of a shell script to tell it what shell to run the script. It's called a 'shebang'

`systemctl restart <servicename>`   -   restart a daemon

`chmod +x <file.sh>`    -   add the execute permission to a shell script

`systemctl enable <system>` = enable a daemon service




**ENVIRONMENT VARIALBLES - "EN VARS"**


`printenv`  -   show environment variables

**ENVIRONMENT VARIABLE**  -   variables with large scope beyond the program that created it, so the value can be used by Python, BASH, Java etc...

`export MYNAME=kip` -   insert the variable MYNAME with the value of "kip" into envrionment variables
==> So, use `export`

`printenv <environment_variable>` - show the environtment variable, e.g. `printenv MYNAME` 
NOTE: this does not persist across terminal sessions with just `export` - if you log out and log back in it doesn't persist

`.bashrc`   -   configurations for your bash shell ==> put environment variables in here to make them persistent
(add `export MYNAME=kip_is_persistent` to the bottom of .bashrc)

`source .bashrc`    -   reloads the environment variables, so you can access the new environment variables



## MANAGING PROCESSES

`ps`    -   by default just shows user processes

`tty`   -   current terminal session (you may have multiple of these running)

`ps --help simple`  -   gets you simple help with the ps command

`ps -A` -   gets all processes
OR
`ps aux`    -   gets all processes with *much more information*  

`top`, `m`  -   filter by memory

`top`, `N`   -   process ID

`top P` -   show CPU usage


`<command> &`   -   run the command in the background

`jobs -l`   -   show you user running processes (note the -l flag means 'long', and shows you the PID of the process)


### Stopping a process

#### HANGUP: 
`kill -1 <PID>`    -   does a hangup command, most graceful/gentle way of ending a program 

`kill -15 <PID>`    -   more forceful end command of ending a running program

`kill -9 <PID>` -   brute force end command of a ending a running program, not graceful ==> NOTE: this is how *ZOMBIE* processes happen











