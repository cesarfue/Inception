#!/bin/sh

while [ ! -f ./wp-config.php ]; do
  sleep 1
done

wp config create --allow-root \
  --dbname=$SQL_DATABASE \
  --dbuser=$SQL_USER \
  --dbpass=$SQL_PASSWORD \
  --dbhost=mariadb:3306 --path='/var/www/wordpress'

fi

exec "$@"
