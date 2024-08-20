#!/bin/sh

# if [ -f ./wp-config.php ]; then
#   echo "wordpress already downloaded"
# else
#
chmod +uw /var/www/html
rm -rf *

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

# fi

exec "$@"
