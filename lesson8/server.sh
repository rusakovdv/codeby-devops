apt-get update
apt-get install -y apache2
a2enmod ssl
a2enmod rewrite
mkdir -p /etc/apache2/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/apache.key \
    -out /etc/apache2/ssl/apache.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=MyOrg/CN=russite.com" \
    -addext "subjectAltName = DNS:russite.com,DNS:www.russite.com"
cat > /etc/apache2/sites-available/russite.com.conf <<EOF
<VirtualHost *:80>
    ServerName russite.com
    ServerAlias www.russite.com
    Redirect permanent / https://russite.com/
</VirtualHost>
EOF
cat > /etc/apache2/sites-available/russite.com-ssl.conf <<EOF
<VirtualHost *:443>
    ServerName russite.com
    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache.crt
    SSLCertificateKeyFile /etc/apache2/ssl/apache.key

    RewriteEngine On
    RewriteCond %{HTTP_HOST} ^www\.russite.com [NC]
    RewriteRule ^(.*)$ https://russite.com$1 [L,R=301]
</VirtualHost>
EOF
a2ensite russite.com.conf
a2ensite russite.com-ssl.conf
a2dissite 000-default.conf
systemctl restart apache2
cp /etc/apache2/ssl/apache.crt /vagrant/