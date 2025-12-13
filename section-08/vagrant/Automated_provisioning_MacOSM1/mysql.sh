#!/bin/bash
DB_PASSWORD='admin123'
sudo -i

dnf update -y
dnf install epel-release -y
dnf install git mariadb-server -y

systemctl start mariadb
systemctl enable mariadb

cd /tmp/
git clone -b main https://github.com/hkhcoder/vprofile-project.git

mysqladmin -u root password "$DB_PASSWORD"
mysql -u root -p"$DB_PASSWORD" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"$DB_PASSWORD" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"$DB_PASSWORD" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"$DB_PASSWORD" -e "FLUSH PRIVILEGES"
mysql -u root -p"$DB_PASSWORD" -e "CREATE DATABASE accounts"
mysql -u root -p"$DB_PASSWORD" -e "GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'localhost' IDENTIFIED BY 'admin123'"
mysql -u root -p"$DB_PASSWORD" -e "GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%' IDENTIFIED BY 'admin123'"
mysql -u root -p"$DB_PASSWORD" accounts < /tmp/vprofile-project/src/main/resources/db_backup.sql
mysql -u root -p"$DB_PASSWORD" -e "FLUSH PRIVILEGES"

systemctl restart mariadb

systemctl start firewalld
systemctl enable firewalld
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
systemctl restart mariadb