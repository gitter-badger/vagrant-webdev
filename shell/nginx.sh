apt-get install -y nginx

# virtual hosts
cp /vagrant/vagrant-webdev/data/nginx/dev.conf /etc/nginx/sites-available/dev.conf
ln -s /etc/nginx/sites-available/dev.conf /etc/nginx/sites-enabled/dev.conf

sed -i 's/sendfile on/sendfile off/' /etc/nginx/nginx.conf

service nginx restart