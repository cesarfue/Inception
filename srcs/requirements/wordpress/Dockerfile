FROM debian:bullseye

RUN apt-get update \
&& apt-get install -y wget \ 
php7.4-fpm \
php7.4-mysql \
mariadb-client \
&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
&& chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

COPY ./tools/wordpress.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
