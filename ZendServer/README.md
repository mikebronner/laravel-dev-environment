# Install ZendServer in Homestead

## Warning
During this process your web site configuration files will be wiped (anything under `/etc/nginx/sites-available` and `/etc/nginx/sites-enabled`) and rebuilt using `homestead provision`. Please take any necessary precautions to avoid dataloss. Your databases should not be affected. (If you didn't do any customization to your homestead setup, you shouldn't have to worry.)

## Complete Guide
For a detailed walkthrough of the process, please see {Medium link}. For a quick implementation, see below.

## TLDR;
1. `homestead ssh`
2. `wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/ZendServer/Homestead/install-zend-server.sh && chmod +x install-zend-server.sh && sudo ./install-zend-server.sh`
3. `exit`
4. Open `http://homestead.app:10081` in your browser and complete the installation process. Select 'Development' as the server environment to enable all the features. Once you have reached the ZendServer overview page, continue with the steps below.
5. `homestead ssh`
6. `sudo ./post-install-permissions.sh`
7. `rm install-zend-server.sh`
8. `rm post-install-permissions.sh`
9. `exit`
10. Return to the ZendServer overview page in your browser. You should see a notification in the top right of the page, called "Mismatched extension directive". Click on the details button, then select the 'Apply' button (looks like an outbox).
