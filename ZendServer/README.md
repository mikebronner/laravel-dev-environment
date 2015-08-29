# Install ZendServer in Homestead

## Warning
During this process your web site configuration files will be wiped (anything under `/etc/nginx/sites-available` and `/etc/nginx/sites-enabled`) and rebuilt using `homestead provision`. Please take any necessary precautions to avoid dataloss. Your databases should not be affected. (If you didn't do any customization to your homestead setup, you shouldn't have to worry.)

## Install ZendServer
1. `homestead ssh`
2. `wget xxx | chmod +x install.sh | sudo ./install.sh`
3. `exit`
4. `homestead provision`
5. Open `http://homestead.app:10081` in your browser and complete the installation process.
6. `homestead ssh`
7. `wget xxx | chmod +x post-install-permissions.sh | sudo ./post-install-permissions.sh`
8. `exit`
