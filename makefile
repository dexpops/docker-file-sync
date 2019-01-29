all: build run

run:
	docker stop file_sync
	docker run --rm -it --name file_sync \
	-v file_sync-volume:/utxo \
	-e WGET_FISNIHED_MARKER=".finshed_test_marker" \
	-e WGET_URL="http://utxosets.blob.core.windows.net/public/utxo-snapshot-bitcoin-mainnet-551636.tar" \
	dexpops/docker-file-sync:latest

stop:
	docker stop file_sync

prune:
	docker stop file_sync
	docker rm file_sync
	docker volume rm file_sync-volume

build:
	docker build -t dexpops/docker-file-sync:latest .
