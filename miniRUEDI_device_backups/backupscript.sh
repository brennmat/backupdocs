#!/bin/bash

# get hostname:
DEVICENAME=`hostname`

# remove very old backups from server:
rdiff-backup --force --remove-older-than 45D miniruedi::/home/debian/device_backups/$DEVICENAME

# copy (new) files to backup server:
rdiff-backup --exclude-globbing-filelist .excludelist.txt ~/ miniruedi::/home/debian/device_backups/$DEVICENAME

# add time stamp to backup
BASENAME="${DEVICENAME}_last_backup_at_"
ssh miniruedi "rm device_backups/${BASENAME}*"
TIMESTAMP=`date --utc  +"%F_%T_UTC"`
ssh miniruedi "touch device_backups/${BASENAME}${TIMESTAMP}"
