# Configure Redis to allow connections from host machine
sudo sed -i '/^bind 127.0.0.1 ::1/a bind 192.168.10.10' /etc/redis/redis.conf

# Configure PostgreSql to allow connections from host machine
sudo bash -c "echo 'host    all             all             192.168.10.10/32        md5' >> /etc/postgresql/10/main/pg_hba.conf"

sudo service redis-server restart
sudo service postgres reload
