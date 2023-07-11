FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
    apt-get -y install wget curl php7.4 php-cli php-fpm php-mysql mariadb-client sendmail && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x ./wp-cli.phar && \
		mv wp-cli.phar /usr/bin/wp && \
		wp cli update

# COPY ./conf/www.conf /tools/www.conf
# COPY ./conf/php-fpm.conf /tools/php-fpm.conf

COPY ./tools/wordpress_setup.sh /

RUN chmod +x ./wordpress_setup.sh

WORKDIR /var/www/html

ENTRYPOINT ["/wordpress_setup.sh"]