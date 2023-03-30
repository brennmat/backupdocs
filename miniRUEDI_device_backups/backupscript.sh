#!/bin/bash

rdiff-backup --exclude-globbing-filelist .excludelist.txt ~/ miniruedi::/home/debian/device_backups/xxyyzzRUEDI
