#!/bin/sh

if [ ! -f ./wp-config.php ]; then
  wp core download --locale=en_GB --allow-root

  wp config create \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb \
    --path=/var/www/html/ \
    --allow-root

  wp core install \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_SUPERADMIN_USER \
    --admin_email=$WP_SUPERADMIN_EMAIL \
    --admin_password=$WP_SUPERADMIN_PASSWORD \
    --path=/var/www/html/ \
    --allow-root

  wp user create $WP_ADMIN_USER $WP_ADMIN_EMAIL \
    --user_pass=$WP_ADMIN_PASSWORD \
    --role=administrator \
    --path=/var/www/localhost/ \
    --allow-root

  wp config set WP_REDIS_HOST redis --allow-root
  wp config set WP_REDIS_PORT 6379 --raw --allow-root
  wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
  wp config set WP_REDIS_CLIENT phpredis --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root /var/www/html/
fi

exec "$@"
