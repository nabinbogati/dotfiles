#!/bin/bash

# sync remote drive to local filesystem
log_file="$(pwd)/rsync.log"

rclone -q sync google-drive-dev: ~/GoogleDrive 2>> "$log_file"

line="------------------------------------------------------"

if [ $? -eq 0 ];then
    echo $line
    echo "Sync Successful"
    echo $line
else
    echo $line
    echo "Sync Failed. See $log_file for more details."
    echo $line
fi

