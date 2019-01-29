#!/bin/bash

if [ -z $METHOD ]
then
  METHOD="wget"
fi

if [ $METHOD == "wget" ]
then

  if [ -z $WGET_URL ]
  then
    WGET_URL="http://utxosets.blob.core.windows.net/public/utxo-snapshot-bitcoin-mainnet-551636.tar"
  fi

  if [ -z $WGET_DIR ]
  then
    WGET_DIR="/utxo"
  fi

  if [ -z $WGET_FILE_NAME ]
  then
    WGET_FILE_NAME="utxo-snapshot.tar"
  fi

  if [ -z $WGET_FISNIHED_MARKER ]
  then
    WGET_FISNIHED_MARKER=".finished_utxo"
  fi

  mkdir -p $WGET_DIR

  # Check if marker exists
  if [ ! -f $WGET_DIR/$WGET_FISNIHED_MARKER ];
  then
    wget $WGET_URL -O "$WGET_DIR/$WGET_FILE_NAME"
    touch "$WGET_DIR/$WGET_FISNIHED_MARKER"
  fi

else

  echo "$METHOD is not supported"
  exit 1

fi

while true
do
  echo "Done syncing, created $WGET_DIR/$WGET_FISNIHED_MARKER"
  stat "$WGET_DIR/$WGET_FISNIHED_MARKER"
  sleep 10
done