# Install Zend Z-Ray in Homestead
1. `cd ~/Developer/Homestead`
2. `homestead ssh`
3. `wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/Zend-Z-Ray/Homestead/zray-installer.sh && chown +x zray-installer.sh && sudo ./zray-installer.sh`
4. `exit`
5. `homestead edit` and set ports to `10081`
6. `homestead halt && homestead up --provision`
