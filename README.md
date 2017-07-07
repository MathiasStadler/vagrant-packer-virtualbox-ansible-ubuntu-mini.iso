# vagrant-packer-virtualbox-ansible-ubuntu-mini.iso


#ENV
- Lenovo m92p
- host os 16.04.02
- internet connect

# Usage
- Install Packer, Vagrant and VirtualBox.




# Path of steps
- cd Download 
- wget https://releases.hashicorp.com/packer/1.0.2/packer_1.0.2_linux_amd64.zip
- unzip  packer_1.0.2_linux_amd64.zip
- mv packer ..
- chmpd +x packer

- Validate packer json file
    * ~/packer validate ubuntu-miniIso-packer.json

- build Box by packer
    * ~/packer build ubuntu-miniIso-packer.json

# Test BOX generated from PACCKER
-  add BOX to Vagrant
    * vagrant box add ubuntu-mini-box ./ubuntu-16.04-amd64-virtualbox.box
- init BOX
    * vagrant init ubuntu-mini-box
    * create Vagrantfile => check and edit it 
            * i toke this sample

~~# -*- mode: ruby -*-
            # vi: set ft=ruby :
            Vagrant.configure(2) do |config|
                config.vm.box = "ubuntu-mini-box"
                config.vm.network "forwarded_port", guest: 80, host: 8081
                # since we haven't Guest additions, so this feature is not support
                config.vm.synced_folder ".", "/vagrant", disabled: true

                config.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--usb", "on"]
                vb.customize ["modifyvm", :id, "--usbehci", "off"]
            end
        end~~

- start BOX
    * vagrant up

- status of BOX
    * vagrant status

- connect BOX
    * vagrant ssh    


# Erros
 - Build 'ubuntu-16.04-amd64-libvirt' errored: Failed creating Qemu driver: exec: "qemu-system-x86_64": executable file not found in $PATH
    * missing qemu-kvm
    * sudo apt-get install qemu-kvm
- No base MAC address was specified. This is required for the NAT networking
    * I'm forget the MAC Addr in the Vargrantfile
        * config.vm.base_mac = "080027D14C66"


# CREDITS
- http://blog.ruilopes.com/from-iso-to-vagrant-box.html => Thx Rui Lopes <https://github.com/rgl>
- https://gist.github.com/cedricvidal/eab1578c30b30802eaca403a2dd596d5 => Thx Cedric Vidal for the sample
- https://debianforum.de/forum/viewtopic.php?f=12&t=128867 => Thx Torsten for the german keyboard settings in the preseed.txt file

# HINTS
- https://www.vagrantup.com/docs/other/environmental-variables.html => If you want a other .vagrant dir location
    * export VAGRANT_HOME=my/new/path/goes/here/  