.PHONY: all download

download:
	wget https://stable.release.core-os.net/amd64-usr/1010.5.0/coreos_production_qemu_image.img.bz2 -O - \
	   | bzip2 -d >	box.img

all:
	sudo virt-customize -a box.img --run adduser.sh
	tar cvzf coreos1010.5.box ./metadata.json ./Vagrantfile ./box.img
	vagrant box add  ./coreos1010.5.box  --name lukl/xenial64
