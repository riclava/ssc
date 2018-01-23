#!/bin/bash

set -e

# SERVER_IP
if [ -z $SERVER_IP ]; then
	echo "SERVER_IP not set"
	exit 1
fi
# SERVER_PORT
if [ -z $SERVER_PORT ]; then
	echo "SERVER_PORT not set"
	exit 1
fi

# SERVER_PASSWD
if [ -z $SERVER_PASSWD ]; then
	echo "SERVER_PASSWD not set"
	exit 1
fi

# SERVER_METHOD
if [ -z $SERVER_METHOD ]; then
	echo "SERVER_METHOD not set"
	exit 1
fi

# start
nohup sslocal -s $SERVER_IP -p $SERVER_PORT -k $SERVER_PASSWD -m $SERVER_METHOD >/dev/null 2>&1 &

/usr/sbin/privoxy --pidfile /run/privoxy.pid --user privoxy /etc/privoxy/config

# loop
while true; do
	sleep 60s
done
