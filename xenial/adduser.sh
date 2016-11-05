#!/bin/bash
set -x
mkdir -p /etc/cloud/cloud.cfg.d/
echo "datasource_list: [ None ]" | tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
dpkg-reconfigure -f noninteractive cloud-init
useradd -m -d /home/vagrant -s /bin/bash vagrant
su -c "mkdir -p /home/vagrant/.ssh/authorized_keys.d" vagrant
# vagrant public key, from https://github.com/mitchellh/vagrant/blob/master/keys/vagrant.pub
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" | tee /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant
chmod 600 /home/vagrant/.ssh/authorized_keys
bash -c "echo vagrant:vagrant | chpasswd"
mkdir -p /etc/sudoers.d/
echo "vagrant ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/vagrant
