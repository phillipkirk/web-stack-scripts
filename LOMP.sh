apt update && apt full-upgrade -y
apt install nano git unzip wget sudo curl -y
sudo wget -O - https://repo.litespeed.sh | sudo bash
sudo apt update -y
sudo apt-get install openlitespeed -y
sudo apt install mariadb-server -y
sudo apt-get install lsphp80 lsphp74-common lsphp74-curl lsphp74-mysql lsphp74-opcache lsphp74-imap lsphp74-opcache -y
sudo apt-get install lsphp80 lsphp80-common lsphp80-curl lsphp80-mysql lsphp80-opcache lsphp80-imap lsphp80-opcache -y
sudo apt-get install lsphp80 lsphp81-common lsphp81-curl lsphp81-mysql lsphp81-opcache lsphp81-imap lsphp81-opcache -y
sudo service lsws restart
sudo apt-get install certbot -y
sudo mkdir /usr/local/lsws/phpmyadmin
cd /usr/local/lsws/phpmyadmin
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

cat /usr/local/lsws/adminpasswd

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
  -nodes -keyout server.key -out server.crt -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:*.localhost,IP:127.0.0.1"
