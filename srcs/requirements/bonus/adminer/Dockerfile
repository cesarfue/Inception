FROM debian:buster

RUN apt-get update && apt-get install -y \
adminer

RUN a2enconf adminer.conf

RUN service apache2 reload 
