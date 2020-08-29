#!/bin/bash

# backup local folders to remotedrive
log_file="$(pwd)/rsync.log"

rclone -q copy --update ~/GoogleDrive google-drive-dev: 2>> "$log_file" && rclone -q sync google-drive-dev: ~/GoogleDrive 2>> "$log_file"

line="-----------------------------------------------------------------"

if [ $? -eq 0 ];then
    echo $line
    echo "Backup and Sync Successful"
    echo $line
else
    echo $line
    echo "Operation Failed. See $log_file for more details."
    echo $line
fi
