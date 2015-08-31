# Install Zend Z-Ray in Homestead
1. `homestead ssh`
2. `wget xxxx && sudo ./zray-installer.sh`
3. `exit`
4. `homestead edit` and set ports to `10081`
5. `homestead halt && homestead up --provision`
