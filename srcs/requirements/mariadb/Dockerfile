FROM debian:bullseye
# 성공!

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install mariadb-server procps
# 성공!

RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# 성공!

RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/db_setup.sh /
# 성공!

RUN chmod +x ./db_setup.sh
# -rw-r--r-- -> -rwxr-xr-x
# 성공!

EXPOSE 3306

ENTRYPOINT ["/db_setup.sh"]
# 성공!