#!/bin/sh

mysql_safe &

/etc/init.d/mysql start

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

mysql -uroot -p$SQL_ROOT_PASSWORD $SQL_DATABASE </usr/local/bin/wordpress.sql

/etc/init.d/mysql stop

exec "$@"
