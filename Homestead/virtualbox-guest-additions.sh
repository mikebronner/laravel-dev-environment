apt-get -y remove dkms build-essential linux-headers-*
rm -rf /opt/VBoxGuestAdditions-*
apt-get -y install dkms build-essential linux-headers-$(uname -r)
wget http://download.virtualbox.org/virtualbox/5.0.0/VBoxGuestAdditions_5.0.0.iso
mkdir /media/VBoxGuestAdditions 
mount -o loop,ro VBoxGuestAdditions_5.0.0.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
umount /media/VBoxGuestAdditions 
rm -rf /media/VBoxGuestAdditions 
rm VBoxGuestAdditions_*.iso
