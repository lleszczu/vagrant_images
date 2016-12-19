.PHONY: all clean

all: clean download privatekey cloudconfig build

download:
	wget https://stable.release.core-os.net/amd64-usr/1010.5.0/coreos_production_qemu_image.img.bz2 -O- | \
		bunzip2 -d > coreos_production_qemu_image.img

clean:
	rm -rf output-qemu
	rm configdrive.iso vagrant coreos_production_qemu_image.img || true

privatekey:
	wget https://github.com/mitchellh/vagrant/blob/master/keys/vagrant

cloudconfig:
	set -e ;\
	DIR=$$( mktemp -d) ;\
	mkdir -p $${DIR}/openstack/latest ;\
	cp user_data $${DIR}/openstack/latest/user_data ;\
	mkisofs -R -V config-2 -o configdrive.iso $${DIR} ;\
	rm -r $${DIR} ;\

build:
	packer build coreos.json
