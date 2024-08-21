FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
  php \
	php-mysql \
	php-fpm \
  mariadb-client \
  && rm -rf /var/lib/apt/lists/*

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# RUN chown -R www-data:www-data /var/www/wordpress
#
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php
RUN chown -R www-data:www-data /run/php
COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
