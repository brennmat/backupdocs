#!/bin/bash

# adjust only this (everything else should not need any modifications)
DEVICENAME="xyzRUEDI"

# copy (new) files to backup server:
rdiff-backup --exclude-globbing-filelist .excludelist.txt ~/ miniruedi::/home/debian/device_backups/$DEVICE_NAME

# add time stamp to backup
BASENAME="${DEVICENAME}_last_backup_at_"
ssh miniruedi "rm device_backups/${BASENAME}*"
TIMESTAMP=`date +"%F_%T"`
ssh miniruedi "touch device_backups/${BASENAME}${TIMESTAMP}"
