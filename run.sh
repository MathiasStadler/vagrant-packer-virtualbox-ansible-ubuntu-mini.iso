#!/bin/bash


function checkInstall {
#check install 
# vagrant
if ! [ -x "$(command -v vagrant)" ]; then
  echo 'Error: vagrant is not installed.' >&2
  exit 1
else 
echo "Vagrant is installed "
vagrant -v
fi

# vboxmanagr
if ! [ -x "$(command -v vboxmanage)" ]; then
  echo 'Error: Virtualbox (vboxmanage) is not installed.' >&2
  exit 1
else 
echo "Virtualbox (vboxmanage) is installed "
vboxmanage -v
fi
# packer
if ! [ -x "$(command -v $HOME/packer)" ]; then
  echo 'Error: packer is not installed.' >&2
  echo 'This sample expect the packer bin in YOUR $HOME folder =>'
  echo $HOME
  exit 1
else 
echo "packer is installed "
$HOME/packer -v
fi
}

# getopt from here
# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts ":hb:" opt; do
  case $opt in
    h)
      echo "Usage: "
      echo "run.sh -b <packerBuildSript.json>" >&2
      exit 0
      ;;
    b)
      echo "Build BOX "
      #echo "packer -b <packerBuildSript.json>" >&2
      echo "with packerBuildSript file: $OPTARG"
      checkInstall
      $HOME/packer inspect $OPTARG
        if [ $? -ne 0 ]; then
            #echo "BOX inspect failed"
            exit 1
        fi
      $HOME/packer build $OPTARG
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2

      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done








# build BOX via PACKER
# 