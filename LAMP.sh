apt update && apt full-upgrade -y
apt install nano git unzip wget sudo curl -y
sudo apt-get install apache2 -y
sudo apt install mariadb-server -y
sudo apt-get install php php-mysql -y
sudo service apache2 restart
sudo apt-get install certbot -y
sudo mkdir /var/phpmyadmin
cd /var//phpmyadmin
sudo mkdir html && cd html
sudo wget -q https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
sudo unzip phpMyAdmin-latest-all-languages.zip
sudo rm phpMyAdmin-latest-all-languages.zip
sudo mv phpMyAdmin-*-all-languages phpmyadmin
sudo mv phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
sudo mv phpmyadmin/* .
sudo rm -rf phpmyadmin
sudo service mariadb restart
mysql_secure_installation
sudo apt install python3 python3-pip -y

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
  -nodes -keyout server.key -out server.crt -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:*.localhost,IP:127.0.0.1"
