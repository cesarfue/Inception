#!/bin/sh
sleep 5

wp core download --locale=en_GB --allow-root
wp config create --allow-root \
  --dbname=$SQL_DATABASE \
  --dbuser=$SQL_USER \
  --dbpass=$SQL_PASSWORD \
  --dbhost=mariadb

exec "$@"
