.PHONY: all

all:
	sudo virt-customize -a box.img --run adduser.sh
	tar cvzf ubuntu16.04.box ./metadata.json ./Vagrantfile ./box.img
	vagrant box add  ./ubuntu16.04.box  --name lukl/xenial64
