#!/bin/bash

# backup local folders to remotedrive

rclone copy --update ~/GoogleDrive google-drive-dev: 2>> rbackup.log

if [ $? -eq 0 ];then
    echo "Backup Successful"
else
    echo "Backup Failed. see log for more details."
fi
