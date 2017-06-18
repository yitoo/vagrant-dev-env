#!/usr/bin/env bash


# https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04

sudo apt-get update
sudo apt-get install -y nginx php-fpm php-mysql mysql-server php7.0-intl php7.0-xml php7.0-json

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
