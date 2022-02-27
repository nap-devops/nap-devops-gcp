#!/bin/bash
  
PROJECT=$1
APP=$2

BASE_DIR=/apps
APP_DIR=${BASE_DIR}/${APP}
PACKAGE_BUCKET=${PROJECT}-${APP}
PACKAGE=gs://${PACKAGE_BUCKET}/${APP}.tar.gz
HASH_FILE=${APP_DIR}/hash.txt
ENTRY_SCRIPT=entry.bash

sudo mkdir -p ${APP_DIR}
cd ${APP_DIR}

# To recover from the GCE restart so call the 'entry.bash' at the beginning 
if [ -f "${ENTRY_SCRIPT}" ]; then
  ./${ENTRY_SCRIPT}
fi

# Create .env-custom file
sudo cat << EOF > "${APP_DIR}/.env-custom"
PROJECT=${PROJECT}
APP=${APP}
EOF

for (( ; ; ))
do

  NEW_HASH=$(gsutil hash -h ${PACKAGE})
  OLD_HASH=$(cat ${HASH_FILE})

  if [ "${NEW_HASH}" == "" ]; then
    echo "File [${PACKAGE}] not found!!!"
    sleep 2m
    continue
  fi

  if [ "${NEW_HASH}" == "${OLD_HASH}" ]; then
    echo "No new version updated"
    sleep 2m

    continue
  fi

  echo "New package version found, doloading it..."

  sudo gsutil cp ${PACKAGE} .
  sudo tar -xvf ${APP}.tar.gz
  sudo chmod 755 ${ENTRY_SCRIPT}

  sudo echo "${NEW_HASH}" > ${HASH_FILE}

  echo "Runing [${ENTRY_SCRIPT}]"
  ./${ENTRY_SCRIPT}

  sleep 2m
done
