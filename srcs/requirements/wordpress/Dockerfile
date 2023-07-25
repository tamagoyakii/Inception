FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install wget curl php7.4 php-cli php-fpm php-mysql mariadb-client && \
    rm -rf /var/lib/apt/lists/*
# 성공!

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x ./wp-cli.phar && \
		mv wp-cli.phar /usr/bin/wp && \
		wp cli update
# 성공!

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./tools/wordpress_setup.sh /
# 성공!

RUN chmod +x ./wordpress_setup.sh
# 성공!

WORKDIR /var/www/html
# 성공!

EXPOSE 9000

ENTRYPOINT ["/wordpress_setup.sh"]
# 성공!