#!/bin/bash

if [ -z "${MYSQL_USER}" ]
then
echo "PMA user is default (pmauser)"
else
sed -ri "s/pmauser/${MYSQL_USER}/g" /var/www/html/config.inc.php
fi


if [ -z "${MYSQL_PASSWORD}" ]
then
echo "PMA MySql password is default (iaw)"
else
sed -ri "s/\['controlpass'\]\ =\ 'iaw'/\['controlpass'\]\ =\ '${MYSQL_PASSWORD}'/g" /var/www/html/config.inc.php
fi


if [ -z "${MYSQL_ROOT_PASSWORD}" ]
then
echo "root MySql password is default (iaw)"
else
sed -ri "s/\['password'\]\ =\ 'iaw'/\['password'\]\ =\ '${MYSQL_ROOT_PASSWORD}'/g" /var/www/html/config.inc.php
sed -ri "s/\['ProxyPass'\]\ =\ 'iaw'/\['ProxyPass'\]\ =\ '${MYSQL_ROOT_PASSWORD}'/g" /var/www/html/config.inc.php
fi


