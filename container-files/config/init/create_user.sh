#!/bin/bash
user=www
# Creating the www user only if it does not exist
ret=false
getent passwd $user >/dev/null 2>&1 && ret=true

if $ret; then
echo "user already exists";
else

useradd $user -d /var/$user
# Setting password for the www user
echo "${user}:iaw" | chpasswd
# Add 'www' user to sudoers
echo "${user}  ALL=(ALL)  NOPASSWD: ALL" > /etc/sudoers.d/$user
echo "user created"
fi
#mkdir -p /var/$user/html
chown -R $user:$user /var/$user/html
chown -R $user:$user /var/lib/php/session
mysql -uroot -hmysql -piaw < /var/$user/html/sql/create_tables.sql
