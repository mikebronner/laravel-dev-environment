#!/usr/bin/env sudo -i

# Let's backup our existing site configurations
#mkdir sites-available
#cp /etc/nginx/sites-available ./sites-available

# Uninstall NGINX and php5-fpm, as Zend Server will install the official NGINX package in place of the Ubuntu version.
apt-get purge -y nginx nginx-full nginx-common
apt-get purge -y php5-fpm php5-curl php5-gd php5-imagick php5-imap php5-mcrypt php5-mysqlnd php5-pgsql 

# Remove the Homestead-specific NGINX sources. These will be replaced by the official ones using the Zend Server installer.
add-apt-repository --yes --remove ppa:nginx/stable
rm -f /etc/apt/sources.list.d/nginx*
apt-get update -y

# Let's run the Zend Server installation!
wget http://downloads.zend.com/zendserver/8.5.0/ZendServer-8.5.0-RepositoryInstaller-linux.tar.gz -O - | tar -xzf - -C /tmp && /tmp/ZendServer-RepositoryInstaller-linux/install_zs.sh 5.6 nginx --automatic

# Answer 'Y' when asked to overwrite an nginx conf file.

# Let's redirect the default php5-fpm socket to Zend Server's php-fpm socket.
ln -s /usr/local/zend/tmp/php-fpm.sock /var/run/php5-fpm.sock;

# Add the following line to the bottom of the http block of /etc/nginx/nginx.conf
# `    include /etc/nginx/sites-enabled/*;`

#===========================
#Figure out how to run nginx/php-fpm as vagrant user.
# Step 1: Edit /usr/local/zend/etc/php-fpm.conf and change user / group in [www] section to:
#sed -ir -e 's/^(user|group) *=.*$/\1 = vagrant/' /usr/local/zend/etc/php-fpm.conf
sed -ir -e 's/^user *=.*$/user = vagrant/' /usr/local/zend/etc/php-fpm.conf
#user = vagrant
#group = vagrant

# Add pointer to ZendServer's php-fpm to allow homestead to run `service php5-fpm restart`, etc.
ln -s /usr/local/zend/bin/php-fpm.sh /etc/init.d/php5-fpm

ln -s /usr/local/zend/etc/php-fpm.conf /etc/php5/fpm/php-fpm.conf

service zend-server restart

# Run `homestead provision`.

