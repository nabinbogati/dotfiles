#!/bin/bash

# sync remote drive to local filesystem

rclone sync google-drive-dev: ~/GoogleDrive 2>> rsync.log

if [$? -eq 0 ];then
    echo "Sync Successful"
else
    echo "Sync Failed. see logs for more details."
fi
