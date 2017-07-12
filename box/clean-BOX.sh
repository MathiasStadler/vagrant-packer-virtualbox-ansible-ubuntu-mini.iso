#!/bin/bash


function destroyBOX(){

echo "... run destroy BOX"

# change .vagrant folder to here
# we don't our folder .vagrant
export VAGRANT_HOME=../box_workfolder

# Log Level vagrant
# export VAGRANT_LOG=warn

# change dot file
# export VAGRANT_DOTFILE_PATH=Vagrant

# destroy vm
vagrant destroy -f 

# list box
vagrant box list 

# destroy box
vagrant  box  remove -f  ubuntu-mini-box 


# clean  box_workfolder
rm -fr ../mkdir_workfolder
mkdir -p ../box_workfolder

}

echo "Do you want realy delete the BOX image? "
select yn in "Yes" "No"; do
    case $yn in
        Yes ) destroyBOX; break;;
        No ) echo " ..abort "; exit;;
    esac
done

