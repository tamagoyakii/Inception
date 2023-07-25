FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install mariadb-server procps

# 외부 접속 허용
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# mariadb 프로세스에 데이터 디렉토리의 권한 부여
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/db_setup.sh /

RUN chmod +x ./db_setup.sh

EXPOSE 3306

ENTRYPOINT ["/db_setup.sh"]