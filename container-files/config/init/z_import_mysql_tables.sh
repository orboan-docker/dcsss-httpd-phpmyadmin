#!/bin/bash

pwd=$PASSWORD

mysql -hmysql -p${pwd} < /var/www/html/sql/create_tables.sql

