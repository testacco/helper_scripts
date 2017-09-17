#! /bin/bash

backup_db=$1
db_host="localhost"
db_port="3306"
db_user="user"
db_pass="111"
backup_dir=$(dirname $(readlink -f "$0"))
datetime=$(date +'%Y-%m-%dT%H:%M:%S')

find backup_dir -mtime +14 -print

mysqldump -u $db_user -h $db_host -P $db_port --password=$db_pass $backup_db | gzip > $backup_dir/$backup_db--$datetime.sql.gz
tar -zcvf backup_directory.tar.gz /var/www