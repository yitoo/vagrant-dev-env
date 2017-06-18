#!/usr/bin/env bash

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get install -y nginx php7.1 php7.1-fpm  php7.1-mysql php7.1-intl php7.1-xml zip php7.1-mbstring git

#configure php
sudo sed -i 's#;date.timezone =#date.timezone = "Europe/Paris"#' /etc/php/7.1/fpm/php.ini
sudo sed -i 's#;date.timezone =#date.timezone = "Europe/Paris"#' /etc/php/7.1/cli/php.ini

sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

# Install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install vendors
cd /var/www/website
composer install

#vhosts
sudo ln -s /var/www/website/app/config/nginx/vhost.conf /etc/nginx/sites-available/website.conf
sudo ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/website.conf

sudo ln -s /var/www/jobs/app/config/nginx/vhost.conf /etc/nginx/sites-available/jobs.conf
sudo ln -s /etc/nginx/sites-available/jobs.conf /etc/nginx/sites-enabled/jobs.conf

sudo service php7.1-fpm restart
sudo service nginx restart
