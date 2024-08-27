#!/bin/bash

useradd -m ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWD}" | chpasswd

exec "$@"
