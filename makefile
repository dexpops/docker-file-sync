all: build run

run:
	docker stop utxo_sync
	docker run --rm -it --name utxo_sync \
	-v utxo_sync-volume:/utxo \
	-e UTXO_FISNIHED_MARKER=.finshed_test_marker \
	dexpops/docker-utxo-sync:latest

stop:
	docker stop utxo_sync

prune:
	docker stop utxo_sync
	docker rm utxo_sync
	docker volume rm utxo_sync-volume

build:
	docker build -t dexpops/docker-utxo-sync:latest .
