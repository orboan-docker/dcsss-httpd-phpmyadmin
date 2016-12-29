FROM orboan/dcsss-httpd-php
MAINTAINER Oriol Boix Anfosso <dev@orboan.com>

RUN yum -y install mysql
RUN \ 
cd /var/www/html && \
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.5.2/phpMyAdmin-4.6.5.2-all-languages.zip && \
unzip phpMyAdmin-4.6.5.2-all-languages.zip && \
mv phpMyAdmin-4.6.5.2-all-languages/* ./ && \
rm -rf /var/www/html/phpMyAdmin-4.6.5.2-all-languages 
RUN chown -R apache:apache /var/www/html && \
chmod -R 755 /var/www/html

# - Clean YUM caches to minimise Docker image size...
RUN \
  yum clean all && rm -rf /tmp/yum*

# default
ENV MYSQL_HOST=mysql
ENV MYSQL_DATABASE=myadm
ENV MYSQL_USER=myadm_user
ENV MYSQL_PASSWORD=iaw

ADD container-files /
