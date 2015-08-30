#!/bin/bash

apt-get update

echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
apt-get install -y  mysql-server

sed -i '/bind-address/d' /etc/mysql/my.cnf

mysql -uroot -proot --database mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'fom' IDENTIFIED BY 'fom' WITH GRANT OPTION;"

service mysql stop
service mysql start
