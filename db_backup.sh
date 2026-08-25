#!/bin/bash

set -e

BACKUP_DIR="/opt/backup"
PROJECT_DIR="/opt/my_service"
BACKUP_FILE="dump_$(date +%Y-%m-%d_%H-%M-%S).sql"

mkdir -p "$BACKUP_DIR"

source "$PROJECT_DIR/.env"

docker run \
    --rm \
    --entrypoint "" \
    --network backend \
    -v "$BACKUP_DIR:/backup" \
    schnitzler/mysqldump \
    mysqldump --opt \
        -h db \
        -u "$MYSQL_USER" \
        -p"$MYSQL_PASSWORD" \
        "--result-file=/backup/$BACKUP_FILE" \
        "$MYSQL_DATABASE"