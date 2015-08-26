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

# Let's redirect the default php5-fpm socket to Zend Server's php-fpm socket.
ln -s /usr/local/zend/tmp/php-fpm.sock /var/run/php5-fpm.sock;

exit;
