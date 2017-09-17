#! /bin/bash

SERVICE=httpd

# Arch system
if ! systemctl status $SERVICE | grep running
then
	systemctl start $SERVICE
	echo "$SERVICE has been started" 
else
	echo "$SERVICE service is running" 
fi
