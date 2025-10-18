#!/bin/bash

DB_USER="backup_user"
DB_PASS="P@ssw0rd123456"
DB_NAME="devopse_db"
BACKUP_DIR="/opt/mysql_backup"
DATE_FORMAT=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE_FORMAT}.sql"


REMOTE_USER="rusakov" # Пользователь на ВМ store
REMOTE_HOST="192.168.0.105" # IP-адрес ВМ store
REMOTE_DIR="/opt/store/mysql"

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

#Конфигурация rsync
rsync -avz -e ssh $BACKUP_DIR/ $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
