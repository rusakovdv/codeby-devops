echo "192.168.56.12 russite.com www.russite.com" >> /etc/hosts
cp /vagrant/apache.crt /usr/local/share/ca-certificates/
update-ca-certificates