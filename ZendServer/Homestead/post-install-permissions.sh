# have php-fpm run as vagrant user to enable access to the website files in the vagrant shared folder.
sed -ir -e 's/^user *=.*/user = vagrant/' /usr/local/zend/etc/php-fpm.conf
sed -ir -e 's/^user *=.*/user = vagrant/' /usr/local/zend/etc/php-fpm.confr
sed -ir -e 's/^WEB_USER=.*/WEB_USER=vagrant/' /etc/zce.rc
sed -ir -e 's/^zend.httpd_uid=.*/zend.httpd_uid=900/' /usr/local/zend/etc/conf.d/ZendGlobalDirectives.ini

# Set ZendServer permissions to allow php-fpm to run as vagrant user.
chmod -R o+rw /usr/local/zend/tmp
chmod -R o+rw /usr/local/zend/var/log
chmod -R o+rw /usr/local/zend/var/codetracing

# Restart ZendServer to apply changes.
service zend-server restart
