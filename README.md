# vagrant-packer-virtualbox-ansible-ubuntu-mini.iso


# ENV
- Lenovo m92p
- host os 16.04.02
- internet connection

# Usage
- Install Packer, Vagrant and VirtualBox.

- clone git repo
```git clone https://github.com/MathiasStadler/vagrant-packer-virtualbox-ansible-ubuntu-mini.iso.git```

- change to workdir
    * ``` cd vagrant-packer-virtualbox-ansible-ubuntu-mini.iso ```

- build image with packer for virtualbox
    *```run.sh -b ubuntu-miniIso-packer```
    * the BOX image found you in the subfolder box
        * manual
            * I'm install my packer in the home folder
            * ```~/packer build ubuntu-miniIso-packer.json```

- Run your BOX

    - change to folder box
        * ```cd box ```

    - init new BOX
        * ```sh +x ./init-BOX.sh```

    - run the BOX
        * ``` sh +x ./run-BOX.sh```

    - connect to BOX
        * auto login via vagrant
        * change to root shell  sudo -i  
            * ``` vagrant ssh```

    - stop the BOX
        * ``` sh +x ./stop-BOX.sh```

    - clean the BOX
        * ``` sh +x ./clean-BOX.sh```        





# Install Packer local
- Change to the homoefolder
    - ```cd```
    - I'm now in the my homefolder
- Change to Downlaod folder    
    - ``cd Download`` 
- Download packer 
    - ```wget https://releases.hashicorp.com/packer/1.0.2/packer_1.0.2_linux_amd64.zip```
        - If wget not installed , install with 
            - ``` sudo apt-get install wget```
- Unzip packer in the download folder
    - ```unzip  packer_1.0.2_linux_amd64.zip```

- Move packer ( Only one file ) to the homefolder
    - ```mv packer ..```
- Change to the homefolder
    - ```cd```
- Make packer executable
    - ```chmod +x packer```
- Check packer is running
    - ```~/packer```

# Test BOX generated from PACKER
-  add BOX to Vagrant
    * vagrant box add ubuntu-mini-box ./ubuntu-16.04-amd64-virtualbox.box
- init BOX
    * vagrant init ubuntu-mini-box
    * create Vagrantfile => check and edit it 
    * i used this sample

```         # -*- mode: ruby -*-
            # vi: set ft=ruby :
            Vagrant.configure(2) do |config|
                config.vm.box = "ubuntu-mini-box"
                config.vm.network "forwarded_port", guest: 80, host: 8081
                # since we haven't Guest additions, so this feature is not support
                config.vm.synced_folder ".", "/vagrant", disabled: true
                config.vm.base_mac = "080027D14C66"

                config.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--usb", "on"]
                vb.customize ["modifyvm", :id, "--usbehci", "off"]
                end
            end
```

- start BOX
    * vagrant up

- status of BOX
    * vagrant status

- connect BOX
    * vagrant ssh    


# ERRORS
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

- colour in bash srcipt  from here
    * https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
    * => Thx Greg and Tobi