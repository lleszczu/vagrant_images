.PHONY: all download

download:
	wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img -O box.img

all:
	sudo virt-customize -a box.img --run adduser.sh
	tar cvzf ubuntu16.04.box ./metadata.json ./Vagrantfile ./box.img
	vagrant box add  ./ubuntu16.04.box  --name lukl/xenial64
