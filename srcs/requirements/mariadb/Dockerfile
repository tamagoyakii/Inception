FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install mariadb-server tini

# 외부 접속 허용
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# 스크립트
COPY ./tools/db_setup.sh /
RUN chmod +x ./db_setup.sh

ENTRYPOINT ["/usr/bin/tini", "--", "/db_setup.sh"]