#!/bin/bash

if [ -z $URL ]
then
  echo "Error, no URL supplied"
  exit 1
fi

if [ -z $FILENAME ]
then
  echo "Error, no FILENAME supplied"
  exit 1
fi

if [ -z $DOWNLOAD_DIR ]
then
  DOWNLOAD_DIR="/app"
fi

echo "Making dir $DOWNLOAD_DIR"
mkdir -p $DOWNLOAD_DIR

TEMP_FILENAME_SUFFIX="_temp_downloading"
TEMP_FILENAME="$FILENAME$TEMP_FILENAME_SUFFIX"

# Check if marker exists
if [ ! -f $DOWNLOAD_DIR/$FILENAME ];
then
  wget $URL -O $DOWNLOAD_DIR/$TEMP_FILENAME
  mv $DOWNLOAD_DIR/$TEMP_FILENAME $DOWNLOAD_DIR/$FILENAME
fi

echo "$(date): Done syncing, created $DOWNLOAD_DIR/$FILENAME"
exit 0