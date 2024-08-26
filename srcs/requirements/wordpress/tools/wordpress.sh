#!/bin/sh
if [ -f ./wp-config.php ]; then
  echo "wordpress already downloaded"
else

  wp core download --locale=en_GB --allow-root
  wp config create --allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb

  wp config set WP_REDIS_HOST redis --allow-root
  wp config set WP_REDIS_PORT 6379 --raw --allow-root
  wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
  wp config set WP_REDIS_CLIENT phpredis --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp plugin update --all --allow-root
  wp redis enable --allow-root

fi

exec "$@"
