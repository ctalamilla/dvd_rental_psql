#!/bin/bash
#echo 'prueba'
psql postgres -f /docker-entrypoint-initdb.d/restore.sql