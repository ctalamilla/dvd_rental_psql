#!/bin/bash
docker compose up -d &&
sleep 5 &&
docker exec -it pg_container bin/bash data/init_db_bash.sh