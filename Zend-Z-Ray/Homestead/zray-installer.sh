# Download and install Zend Z-Ray:
wget http://downloads.zend.com/zray/1208/zray-php5.6-Ubuntu-14.04-x86_64.tar.gz && tar xvfz zray-php5.6-Ubuntu-14.04-x86_64.tar.gz -C /opt

# Add zray.conf
wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/Zend-Z-Ray/Homestead/zray.conf -O /etc/nginx/conf.d/zray.conf

# Create symlinks to load Z-Ray configurations in php-fpm and php-cli:
ln -sf /opt/zray/zray.ini /etc/php/7.0/cli/conf.d/zray.ini 
ln -sf /opt/zray/zray.ini /etc/php5/7.0/fpm/conf.d/zray.ini

# Set file and folder permissions:
chown -R vagrant:vagrant /opt/zray

# Restart nginx and php-fpm:
service php7.0-fpm restart
service nginx restart
