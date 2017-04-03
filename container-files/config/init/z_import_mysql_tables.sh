#!/bin/bash

pwd=$MYSQL_ROOT_PASSWORD

host=$MYSQL_HOST

for i in {1..5}; do "mysql -h${host} -uroot -p${pwd} < /var/www/html/sql/create_tables.sql" && break || sleep 10; done
