#!/bin/bash

#Execute after first instance restarted
#cloud-init run first

PROJECT=$(gcloud config get-value project | head -1)

BUCKET=$PROJECT-bootstrap
WORK_DIR=/apps
SCRIPT=bootstrap.bash

MOUNT_DIR=/apps
DEVICE=/dev/sdb
LOG_FILE=/tmp/startup.log

sudo mkdir -p $MOUNT_DIR
sudo chown devops:devops $MOUNT_DIR

sudo blkid $DEVICE
CODE=$?
DTM=$(date)

if [[ $CODE = "0" ]]
then
    echo "[$DTM] Do nothing - volume is already formatted" >> $LOG_FILE
else
    echo "[$DTM] Formatting disk $DEVICE" >> $LOG_FILE
    sudo mkfs --type ext4 $DEVICE >> $LOG_FILE
fi

sudo mount -t ext4 $DEVICE $MOUNT_DIR >> $LOG_FILE

# Bootstrap script here
sudo gsutil cp gs://$BUCKET/wp/$SCRIPT $WORK_DIR >> $LOG_FILE
cd $WORK_DIR
chmod 755 $SCRIPT
./$SCRIPT $PROJECT wp-aldamex >> $LOG_FILE
