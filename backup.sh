#!/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M)
DATADIR=$HOME/.near
BACKUPDIR=$HOME/backups

mkdir -p $BACKUPDIR

sudo systemctl stop neard.service

wait

echo "NEAR node was stopped" | ts

if [ -d "$BACKUPDIR" ]; then
    echo "Backup started" | ts

    echo "drop old archives"
    rm $BACKUPDIR/*tar.gz

    echo "Saving archive started" | ts
    tar -czf $BACKUP/near_${DATE}.tar.gz --directory  $DATADIR data/

    echo "Backup completed" | ts
else
    echo $BACKUPDIR is not created. Check your permissions.
    exit 0
fi

sudo systemctl start neard.service

echo "NEAR node was started" | ts

