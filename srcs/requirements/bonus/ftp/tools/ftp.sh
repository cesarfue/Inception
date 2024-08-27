#!/bin/bash

mkdir -p /var/www/html

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
echo "FTP configuration loaded"

exec "$@"
