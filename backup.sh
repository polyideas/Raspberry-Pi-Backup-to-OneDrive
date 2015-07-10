#!/bin/bash
#Install onedrive-cli from here:
# https://github.com/mk-fg/python-onedrive

#Assemble the datestring for creating unique files
datestring=$(date +"%Y%m%d-%H%M")

#It's important to run the script as the user with the OneDrive stuff configured
#Since we're zipping folders owned by root, we sudo.
#If you don't backup root-owned folders, you can remove the sudo
sudo zip -r /home/jay/${datestring}-backup.zip /tools/ /var/www/ /usr/lib/cgi-bin/ /boot/config.txt

#hard coded paths make this happy as a cron job
/usr/local/bin/onedrive-cli -c /home/jay/.lcrc put /home/jay/${datestring}-backup.zip /backups/

#Remove the local backup copy
sudo rm /home/jay/${datestring}-backup.zip
