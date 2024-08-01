FROM debian:buster

RUN apt update \
&& apt install -y nginx openssl \
&& mkdir -p /etc/nginx/ssl \
&& mkdir -p /var/run/nginx \
&& openssl req -x509 -nodes \
  -out /etc/nginx/ssl/bundle.crt \
  -keyout /etc/nginx/ssl/private.key \
  -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=login.42.fr/UID=login" \

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
