#!/bin/sh

cat << EOF > config.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';
USE $DB_NAME;
FLUSH PRIVILEGES;
EOF

service mariadb start && sleep 2 && mysql -uroot -p$DB_ROOT_PWD< config.sql && mysqladmin -uroot -p$DB_ROOT_PWD shutdown && mysqld_safe

# service mariadb start

# if [ $? -ne 0 ]; then
# 	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# 	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
# 	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD';"
# 	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
# 	mysql -e "USE $DB_NAME;"
# 	mysql -e "FLUSH PRIVILEGES;"
# fi

# service mariadb stop

# exec mysqld_safe