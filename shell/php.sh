apt-get install -y php5-fpm php5-cli php5-curl php5-xdebug php5-memcached php5-mongo php5-mcrypt

sed -i 's/display_errors = .*/display_errors = On/' /etc/php5/fpm/php.ini
sed -i 's/display_errors = .*/display_errors = On/' /etc/php5/cli/php.ini
sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php5/fpm/php.ini
sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php5/cli/php.ini

service php5-fpm restart