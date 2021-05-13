setup:
# generate default config files for customizing
	mkdir -p etc/cassandra-leader etc/cassandra-seed-1 etc/cassandra-seed-2 && \
	mkdir -p data/cassandra-leader data/cassandra-seed-1 data/cassandra-seed-2 && \
	docker image pull cassandra:latest && \
	docker run --rm -d --name tmp cassandra:latest && \
	docker cp tmp:/etc/cassandra temp_config && \
	docker stop tmp && \
	cp -r temp_config/* etc/cassandra-leader && \
	cp -r temp_config/* etc/cassandra-seed-1 && \
	cp -r temp_config/* etc/cassandra-seed-2 && \
	rm -rf temp_config

start-all:
	docker-compose up

start-seeds:
	docker-compose up cassandra-seed-1 cassandra-seed-2

stop-seeds:
	docker-compose rm -s -v cassandra-seed-1 cassandra-seed-2

stop-all:
	docker-compose down
