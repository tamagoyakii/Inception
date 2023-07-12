#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	echo "nginx_setup: setting up ssl...";
	openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout /etc/ssl/private/localhost.dev.key -out /etc/ssl/certs/localhost.dev.crt
	echo "nginx_setup: ssl setup complete";
fi

exec "$@"