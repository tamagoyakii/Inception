#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
	service mariadb start

	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin -uroot -p$DB_ROOT_PWD shutdown
fi

exec mysqld_safe