# Copy nginx configuration before deleting it.
cp -r /etc/nginx .

# Uninstall NGINX and php5-fpm, as Zend Server will install the official NGINX package in place of the Ubuntu version.
apt-get purge -y nginx nginx-full nginx-common php5-fpm php5-curl php5-gd php5-imagick php5-imap php5-mcrypt php5-mysqlnd php5-pgsql

# Remove the Homestead-specific NGINX sources. These will be replaced by the official ones using the Zend Server installer.
add-apt-repository --yes --remove ppa:nginx/stable
rm -f /etc/apt/sources.list.d/nginx*
apt-get update -y

# Let's run the Zend Server installation!
wget http://downloads.zend.com/zendserver/8.5.0/ZendServer-8.5.0-RepositoryInstaller-linux.tar.gz -O - | tar -xzf - -C /tmp && /tmp/ZendServer-RepositoryInstaller-linux/install_zs.sh 5.6 nginx --automatic

# Let's redirect the default php5-fpm socket to Zend Server's php-fpm socket.
ln -s /usr/local/zend/tmp/php-fpm.sock /var/run/php5-fpm.sock;

# Create startup script that will recreate the socket symlink on boot.
wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/ZendServer/Homestead/zend-php-fpm-sock-linker -O /etc/init.d/zend-php-fpm-sock-linker
chmod +x /etc/init.d/zend-php-fpm-sock-linker
ln /etc/init.d/zend-php-fpm-sock-linker /etc/rc2.d/S10zend-php-fpm-sock-linker

# Now let's recreate the sites folders so that Homestead can properly provision the sites.
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

# To have NGINX detect the Homestead sites in your shared folder, add the following line to the bottom of the 
# http block of /etc/nginx/nginx.conf
sed -i -e 's/^.*conf\.d\/\*\.conf\;/&\n    include \/etc\/nginx\/sites\-enabled\/\*\;/' /etc/nginx/nginx.conf

# Add pointer to ZendServer's php-fpm to allow homestead to run `service php5-fpm restart`. Also add the pointer for
# the conf file, which Homestead requires.
ln -s /usr/local/zend/bin/php-fpm.sh /etc/init.d/php5-fpm
ln -s /usr/local/zend/etc/php-fpm.conf /etc/php5/fpm/php-fpm.conf

# Relax nginx log permissions so ZendServer can read them.
chmod o+rw /var/log/nginx/access.log
chmod o+rw /var/log/nginx/error.log

# Add ZendServer maintenance log, just in case ZendServer doesn't create it.
touch /usr/local/zend/var/log/zs_maintenance.log
chmod og+rw /usr/local/zend/var/log/zs_maintenance.log

# Apple ZendServer folder permissions before running the ZendServer installation wizard.
wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/ZendServer/Homestead/post-install-permissions.sh && chmod +x post-install-permissions.sh && sudo ./post-install-permissions.sh

# Update nginx configuration based on original values.
sed -e "/^(\s*#ZEND.*(.*[\n])*.*ZEND.*})/w /etc/nginx/nginx.conf
/http\s{/,\$w ./nginx/nginx.conf" /etc/nginx/nginx.conf


# Restart ZendServer to apply the changes.
service zend-server restart
