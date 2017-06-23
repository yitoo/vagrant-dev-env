#!/usr/bin/env bash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install apt-transport-https
sudo add-apt-repository ppa:webupd8team/java
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

sudo apt-get update
sudo apt-get install -y nginx php-fpm php-mysql mysql-server php7.0-intl php7.0-xml php7.0-json php7.0-zip php7.0-curl oracle-java8-installer elasticsearch

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

#configure php
sudo sed -i 's#;date.timezone =#date.timezone = "Europe/Paris"#' /etc/php/7.0/fpm/php.ini
sudo sed -i 's#;date.timezone =#date.timezone = "Europe/Paris"#' /etc/php/7.0/cli/php.ini

sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

# Install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo service php7.0-fpm restart
sudo service nginx restart
