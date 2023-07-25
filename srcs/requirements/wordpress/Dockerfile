FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install wget curl php7.4 php-cli php-fpm php-mysql mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# wordpress CLI(Command Line Interface) 설치 및 업데이트
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x ./wp-cli.phar && \
		mv wp-cli.phar /usr/bin/wp && \
		wp cli update

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./tools/wordpress_setup.sh /

RUN chmod +x ./wordpress_setup.sh

# volume을 사용하는 경로. nginx에서 index.php를 찾을 수 있도록 함
WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/wordpress_setup.sh"]