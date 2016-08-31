#!/bin/bash
set -e

if [ "$IS_ISBAN" = "true" ]; then

    echo Configuring for Isban.

    export HTTP_PROXY=http://172.31.219.30:8080
    export HTTPS_PROXY=http://172.31.219.30:8080

    echo "Acquire::http::Proxy \"$HTTP_PROXY\";" > /etc/apt/apt.conf
else
    echo Configuring default.
fi

/usr/sbin/startup.sh

/usr/sbin/sshd

exec "$@"
