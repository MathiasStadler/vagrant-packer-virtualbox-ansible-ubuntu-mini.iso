#!/bin/bash



# change .vagrant folder to here
# we don't our folder .vagrant
export VAGRANT_HOME=../box_workfolder

# Log Level vagrant
# export VAGRANT_LOG=warn

# change dot file
# export VAGRANT_DOTFILE_PATH=Vagrant

# destroy deafult vm
vagrant  destroy -f  

# remove BOX
vagrant box remove -f ubuntu-main-box

# clean  box_workfolder
rm -fr ../mkdir_workfolder
mkdir -p ../box_workfolder



# remove old Vagrantfile
# -f ignore nonexistent files and arguments, never prompt
rm -f Vagrantfile  && \


# --force overwrite the old BOX
vagrant box add --force ubuntu-mini-box ubuntu-16.04-amd64-virtualbox.box  && \



# Attention created a new Vagrantfile
# But we want used our template :-)
# vagrant init --out /dev/null ubuntu-mini-box  && \

rm -f ../box_workfolder/boxes/ubuntu-mini-box/0/virtualbox/Vagrantfile && \

cp -f template_Vagrantfile_for_BOX ../box_workfolder/boxes/ubuntu-mini-box/0/virtualbox/Vagrantfile && \

vagrant up && \

vagrant status  
