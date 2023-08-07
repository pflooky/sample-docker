#!/usr/bin/env bash
set -Eeo pipefail

# start socket-only postgresql server for setting up or running scripts
# all arguments will be passed along as arguments to `postgres` (via pg_ctl)
docker_temp_server_start() {
	# internal start of server in order to allow setup using psql client
	# does not listen on external TCP/IP and waits until start finishes
	PGUSER="${PGUSER:-$POSTGRES_USER}" \
	pg_ctl -D "$PGDATA" -w start
}

# stop postgresql server after done setting up user and running scripts
docker_temp_server_stop() {
	PGUSER="${PGUSER:-postgres}" \
	pg_ctl -D "$PGDATA" -m fast -w stop
}

docker_temp_server_start
echo "Starting to restore data dump"
pg_restore -e -v -U postgres -d dvdrental /opt/app/data/dump
echo "Finished restoring data"
docker_temp_server_stop