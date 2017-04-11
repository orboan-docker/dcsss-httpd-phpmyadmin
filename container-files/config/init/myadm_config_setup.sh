#!/bin/bash

if [ -z "${MYSQL_HOST}" ]
then
echo "mysql host is default (mysql)"
else
sed -ri "s/mysql/${MYSQL_HOST}/g" /var/www/html/config.inc.php
fi



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

if [ -f "/etc/php.ini" ]; then
sed -i '/session.save_path\ =\ "\/tmp"/d' /etc/php.ini
sed -ri 's/\[Session\]/\[Session\]\nsession.save_path\ =\ "\/tmp"/g' /etc/php.ini
fi

