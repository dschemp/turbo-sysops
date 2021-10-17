#!/bin/bash

OP=$1
DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DB_DUMP="db_dump.sql"

case $OP in
  "before_backup")
    cd $DIR && \
    echo "** Starting database ..." && \
    docker-compose up -d <DATABASE_CONTAINER> && \
    echo "** Creating DB dump ..." && \
    docker-compose exec -T <DATABASE_CONTAINER> bash -c "PGPASSWORD=<PASSWORD> pg_dump --username <USERNAME> <DATABSE>" | cat > $DB_DUMP && \
    echo "** Shutting down docker-compose stack ..." && \
    docker-compose down
    ;;

  "after_backup")
    cd $DIR && \
    echo "** Removing DB dump ..." && \
    rm $DB_DUMP && \
    echo "** Booting up docker-compose stack ..." && \
    docker-compose up -d
    ;;
esac
