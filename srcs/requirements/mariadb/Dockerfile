FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
ARG SQL_DATABASE=;
ARG SQL_USER=;
ARG SQL_PASSWORD=;
ARG SQL_ROOT_PASSWORD=;
EXPOSE 3306

RUN apt-get update \
&& apt-get install -y mariadb-server \
mariadb-client \
&& mkdir -p /var/run/mysql \
&& chown -R mysql:mysql /var/run/mysql
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh
# RUN chmod +x /usr/local/bin/mariadb.sh
#
# ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

RUN service mysql start \
&& mysql -u root -e "CREATE DATABASE ${SQL_DATABASE};" && \
mysql -u root -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && \
mysql -u root -e "GRANT ALL PRIVILEGES ON ${SQL_NAME}.* TO '${SQL_USER}'@'%';" && \
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

RUN service mysql stop;

CMD ["mysqld", "--bind-address=0.0.0.0"]
