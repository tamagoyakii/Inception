FROM debian:bullseye
# 성공!

RUN apt-get -y update && \
		apt-get -y upgrade && \
		apt-get -y install nginx openssl
# 성공!

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/nginx_setup.sh /var/www/html
# 성공!

RUN chmod +x /var/www/html/nginx_setup.sh && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
# -rw-r--r-- -> -rwxr-xr-x
# 성공!

ENTRYPOINT [ "/var/www/html/nginx_setup.sh" ]

CMD ["nginx", "-g", "daemon off;"]