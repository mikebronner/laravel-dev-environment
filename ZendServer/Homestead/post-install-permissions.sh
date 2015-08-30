# have php-fpm run as vagrant user to enable access to the website files in the vagrant shared folder.
sed -i -e 's/^user[\s]*=.*/user = vagrant/' /usr/local/zend/etc/php-fpm.conf
sed -i -e 's/^listen.owner[\s]*=.*/listen.owner = vagrant/' /usr/local/zend/etc/php-fpm.conf
sed -i -e 's/^WEB_USER=.*/WEB_USER=vagrant/' /etc/zce.rc
sed -i -e 's/^zend.httpd_uid=.*/zend.httpd_uid=900/' /usr/local/zend/etc/conf.d/ZendGlobalDirectives.ini

# Set ZendServer permissions to allow php-fpm to run as vagrant user.
find /usr/local/zend -user www-data -exec chown vagrant {} \;
find /usr/local/zend -user nginx -exec chown vagrant {} \;
#chmod -R o+rw /usr/local/zend/tmp
#chmod -R o+rw /usr/local/zend/var/log
#chmod -R o+rw /usr/local/zend/var/codetracing

# Restart ZendServer to apply changes.
service zend-server restart
