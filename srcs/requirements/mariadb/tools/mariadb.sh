#!/bin/sh

/etc/init.d/mysql start

mysql -uroot -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; \
  FLUSH PRIVILEGES;"

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
  GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
  FLUSH PRIVILEGES;"

/etc/init.d/mysql stop

exec "$@"
