# Install ZendServer in Homestead

## Warning
During this process your web site configuration files will be wiped (anything under `/etc/nginx/sites-available` and `/etc/nginx/sites-enabled`) and rebuilt using `homestead provision`. Please take any necessary precautions to avoid dataloss. Your databases should not be affected. (If you didn't do any customization to your homestead setup, you shouldn't have to worry.)

## Complete Guide
For a detailed walkthrough of the process, please see {Medium link}. For a quick implementation, see below.

## TLDR;
1. `homestead ssh`
2. `wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/ZendServer/Homestead/install-zend-server.sh && chmod +x install-zend-server.sh && sudo ./install-zend-server.sh`
3. `exit`
4. `homestead provision`
5. Open `http://homestead.app:10081` in your browser and complete the installation process. Once you have reached the ZendServer overview page, continue with the steps below.
6. `homestead ssh`
7. `wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/ZendServer/Homestead/post-install-permissions.sh && chmod +x post-install-permissions.sh && sudo ./post-install-permissions.sh`
8. `rm install-zend-server.sh`
9. `rm post-install-permissions.sh`
10. `exit`
