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

unset image_files_path

unset name

while getopts "hb:f:" opt; do
  case $opt in
    h)
      echo "Usage: "
      echo "run.sh -b <packerBuildSript.json>" >&2
      exit 0
      ;;
    b)      
      echo " ... check install "
      if [ -z "$image_files_path" ]
      then
        echo "please set -f image_files_path"
        exit 0 
      fi
      checkInstall
      if [ $? -ne 0 ]; then
            exit 1
      fi
      echo "with packerBuildSript file: $OPTARG"
      echo " ... validate  $OPTARG"
      echo " ... command => $HOME/packer validate -var image_files_path=$image_files_path $OPTARG"
      $HOME/packer validate -var image_files_path=$image_files_path $OPTARG
      if [ $? -ne 0 ]; then
            exit 1
      fi
      echo " ... build packer.json "
      echo " ... command => $HOME/packer build -var image_files_path=$image_files_path $OPTARG"
      $HOME/packer build -var image_files_path=$image_files_path $OPTARG
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2

      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    f)
      echo "image_files_path  $OPTARG " >&2
      image_files_path=$OPTARG
      ;;
  esac
done
shift $(( OPTIND - 1 ))

if [ -z "$name" ]
then
   echo "please run -h for help"
   exit 0 
fi