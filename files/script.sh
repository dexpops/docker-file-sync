#!/bin/bash


if [ -z $UTXO_MARKER ]
then
  UTXO_MARKER="/utxo/.finished_utxo"
fi

if [ -z $UTXO_SNAPSHOT_URL ]
then
  UTXO_SNAPSHOT_URL="http://utxosets.blob.core.windows.net/public/utxo-snapshot-bitcoin-mainnet-551636.tar"
fi

if [ -z $UTXO_SNAPSHOT_DIR ]
then
  UTXO_SNAPSHOT_DIR="/utxo"
  mkdir -p $UTXO_SNAPSHOT_DIR
fi

if [ -z $UTXO_SNAPSHOT_DIR ]
then
  UTXO_SNAPSHOT_DIR="/utxo"
fi

if [ -z $UTXO_DOWNLOAD_FILE ]
then
  UTXO_DOWNLOAD_FILE="utxo-snapshot.tar"
fi

if [ -z $UTXO_FISNIHED_MARKER ]
then
  UTXO_FISNIHED_MARKER=".finished_utxo"
fi

wget $UTXO_SNAPSHOT_URL -O "$UTXO_SNAPSHOT_DIR/$UTXO_DOWNLOAD_FILE"
touch "$UTXO_SNAPSHOT_DIR/$UTXO_FISNIHED_MARKER"

ls -lastr  /utxo