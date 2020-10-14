#! /bin/bash

service nginx restart
chown -R mysql:mysql /var/lib/mysql
service mysql start && service php7.3-fpm start
/bin/bash
