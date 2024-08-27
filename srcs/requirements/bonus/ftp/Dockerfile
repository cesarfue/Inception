FROM debian:buster

RUN apt-get update && apt-get install -y \
vsftpd

COPY vsftpd.conf /etc/vsftpd.conf
COPY ./tools/ftp.sh /usr/local/bin/ftp.sh

ENTRYPOINT ["/usr/local/bin/ftp.sh"]

CMD ["vsftpd"]
