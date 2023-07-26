#!/bin/sh

# mysql 데이터베이스가 처음 실행되는 경우에만 실행
if [ ! -d "/var/lib/mysql/wordpress" ]; then
	service mariadb start

	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"
	mysql -e "FLUSH PRIVILEGES;"

	# 설정 적용을 위해 서버 종료
	# root 사용자로 접속하여 스크립트가 종료되더라도 서버가 백그라운드로 실행되는 것을 방지
	mysqladmin -uroot -p$DB_ROOT_PWD shutdown
fi

# mysqld 서버를 포그라운드에서 실행 
exec mysqld_safe