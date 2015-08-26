cd ~

sudo su

# Let's backup our existing site configurations
mkdir sites-available
cp /etc/nginx/sites-available ./sites-available

# Remove the Ubuntu-specific NGINX PPAs. These will be replaced by the official ones using the Zend Server installer.
rm /etc/apt/sources.list.d/nginx*

# Uninstall NGINX, as Zend Server will install the official NGINX package in place of the Ubuntu version.
apt-get remove nginx nginx-full nginx-common

# Uninstall Zend Server if it was already installed.
# (This is currently disabled as this might not be a good idea for people who are upgrading.)
#aptitude purge '~nzend'

# Let's run the Zend Server installation!
wget http://downloads.zend.com/zendserver/8.5.0/ZendServer-8.5.0-RepositoryInstaller-linux.tar.gz -O - | tar -xzf - -C /tmp && /tmp/ZendServer-RepositoryInstaller-linux/install_zs.sh 5.6 nginx --automatic

# We need to re-install php5-fpm
apt-get install php5-fpm

# Set permissions for vagrant to access Zend Server
chown -R vagrant:vagrant /usr/local/zend/tmp

# rm /etc/nginx/sites-available/*
mv ./sites-available /etc/nginx/sites-available
