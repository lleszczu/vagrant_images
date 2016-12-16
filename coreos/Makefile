.PHONY: all cloudconfig privatekey

privatekey:
	wget https://github.com/mitchellh/vagrant/blob/master/keys/vagrant
cloudconfig:
	set -e ;\
	DIR=$$( mktemp -d) ;\
	mkdir -p $${DIR}/openstack/latest ;\
	cp user_data $${DIR}/openstack/latest/user_data ;\
	mkisofs -R -V config-2 -o configdrive.iso $${DIR} ;\
	#rm -r $${DIR} ;\

all:
	sudo virt-customize -a box.img --run adduser.sh
	tar cvzf coreos1010.5.box ./metadata.json ./Vagrantfile ./box.img
	vagrant box add  ./coreos1010.5.box  --name lukl/xenial64
