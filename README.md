# vagrant-packer-virtualbox-ansible-ubuntu-mini.iso

# Usage
- Install Packer, Vagrant and VirtualBox.


#Path of steps
- cd Download 
- wget https://releases.hashicorp.com/packer/1.0.2/packer_1.0.2_linux_amd64.zip
- unzip  packer_1.0.2_linux_amd64.zip
- mv packer ..
- chmpd +x packer

- Validate packer json file
    * ~/packer validate ubuntu-miniIso-packer.json


# CREDITS
- http://blog.ruilopes.com/from-iso-to-vagrant-box.html => Thx Rui Lopes <https://github.com/rgl>