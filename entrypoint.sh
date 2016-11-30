#!/bin/bash

set -e

if [ "$IS_ISBAN" = "true" ]; then

    echo Configuring for Isban.

    export http_proxy=http://172.31.219.30:8080
    export HTTP_PROXY=$http_proxy
    export https_proxy=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export no_proxy=localhost,127.0.0.1,192.168.99.1,192.168.99.100
    export NO_PROXY=$no_proxy

    echo "Acquire::http::Proxy \"$http_proxy\";" > /etc/apt/apt.conf
else
    echo Configuring default.
fi

/usr/sbin/startup.sh

/usr/sbin/sshd

rm /docker-entrypoint-initdb.d/init_europe.sql 2> /dev/null || :

exec "$@"
