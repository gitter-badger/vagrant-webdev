# mysql

echo "mysql-server mysql-server/root_password password $DB_PASS" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DB_PASS" | debconf-set-selections

apt-get install -y mysql-server

#phpMyAdmin

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections

apt-get install -y phpmyadmin

mkdir /vagrant/phpmyadmin.dev
ln -s /usr/share/phpmyadmin /vagrant/phpmyadmin.dev/public