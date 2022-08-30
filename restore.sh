#!/bin/bash

DATADIR=$HOME/.near
BACKUPFILE=$HOME/backups/near_*.tar.gz


sudo systemctl stop neard.service

wait

echo "NEAR node was stopped" | ts

cd $DATADIR
rm -Rf data

echo "Drop data dir" | ts

tar -xzf $BACKUPFILE
echo "Import backup" | ts


sudo systemctl start neard.service

echo "NEAR node was started" | ts

