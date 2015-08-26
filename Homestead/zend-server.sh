cd ~

sudo su

# Let's backup our existing site configurations
mkdir sites-available
cp /etc/nginx/sites-available ./sites-available

# Remove the Ubuntu-specific NGINX PPAs. These will be replaced by the official ones using the Zend Server installer.
rm /etc/apt/sources.list.d/nginx*

# Uninstall NGINX, as Zend Server will install the official NGINX package in place of the Ubuntu version.
apt-get remove -y nginx nginx-full nginx-common
apt-get autoremove -y
apt-get update -y

# Let's run the Zend Server installation!
wget http://downloads.zend.com/zendserver/8.5.0/ZendServer-8.5.0-RepositoryInstaller-linux.tar.gz -O - | tar -xzf - -C /tmp && /tmp/ZendServer-RepositoryInstaller-linux/install_zs.sh 5.6 nginx --automatic

# Answer 'Y' when asked to overwrite an nginx conf file.

# Let's redirect the default php5-fpm socket to Zend Server's php-fpm socket.
ln -s /usr/local/zend/tmp/php-fpm.sock /var/run/php5-fpm.sock;

# Add the following line to the bottom of the http block of /etc/nginx/nginx.conf
# `    include /etc/nginx/sites-enabled/*;`

service nginx restart

#===========================
#Figure out how to run nginx/php-fpm as vagrant user.

#===========================
# Figure out how to alias `service php5-fpm` to ZendServer's version thereof.
# Step 1: Replace default php5-fpm service with ZendServer's php-fpm service.
mv /etc/init.d/php5-fpm /etc/init.d/old-php5-fpm
ln -s /usr/local/zend/bin/php-fpm.sh php5-fpm

exit;
