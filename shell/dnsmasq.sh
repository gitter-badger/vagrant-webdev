apt-get install -y dnsmasq

echo "listen-address=127.0.0.1" >> /etc/dnsmasq.conf
echo "address=/.dev/127.0.0.1" >> /etc/dnsmasq.conf

service dnsmasq restart