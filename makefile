all: build run

run:
	docker stop file_sync; \
	docker run --rm --name file_sync \
	-v /Users/kj/temp_data:/app \
	-e URL="http://utxosets.blob.core.windows.net/public/utxo-snapshot-bitcoin-mainnet-551636.tar" \
	-e FILENAME="utxo-snapshot-bitcoin.tar" \
	dexpops/docker-file-sync:latest

stop:
	docker stop file_sync

prune:
	docker stop file_sync
	docker rm file_sync

build:
	docker build -t dexpops/docker-file-sync:latest .
