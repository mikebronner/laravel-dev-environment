# Install Zend Z-Ray in Homestead
1. `cd ~/Developer/Homestead`
2. `vagrant ssh`
3. `wget https://raw.githubusercontent.com/GeneaLabs/laravel-dev-environment/master/Zend-Z-Ray/Homestead/zray-installer.sh && chmod +x zray-installer.sh && sudo ./zray-installer.sh`
4. `exit`
5. `nano ~/.homestead/Homestead.yaml` and set ports to `10081`
6. `vagrant halt && vagrant up --provision`
