FROM debian:bullseye

RUN apt-get update \
&& apt-get install -y mariadb-server mariadb-client \
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
