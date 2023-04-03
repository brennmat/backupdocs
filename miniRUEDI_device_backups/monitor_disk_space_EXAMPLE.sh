#!/bin/sh

# Monitor Linux disk space and send an email alert to $ADMIN

ALERT=15 # alert level (percentage of disk usage) 
ADMIN="matthias.brennwald@eawag.ch" # dev/sysadmin email ID
MOUNTPOINT=/dev/vda1 # mountpoint to check

DISKFULL=`df --output=pcent $MOUNTPOINT | tr -dc '0-9'` # percentage of disk usage

if [ $DISKFULL -ge $ALERT ]; then
  echo "$(hostname) as on $(date): $DISKFULL% of disk space used on $MOUNTPOINT" |
  mail -s "Alert: miniruedi server running low on disk space" "$ADMIN"
fi
