#!/bin/bash

# colour in bash from here
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Thx Greg and Tobi


#TODOD return value always 0 

BLUE='\033[1;34m'
NC='\033[0m' # No Color
GREEN='\033[1;32m'

cleanup() {
    #first argument is the return value 
    printf "${GREEN}***************\n"
    printf "${BLUE}>>> Forget you run init-BOX.sh ??\n"
    printf "${GREEN}***************${NC}:-)\n"
    exit $1
}

# change .vagrant folder to here
# we don't our folder .vagrant
export VAGRANT_HOME=../box_workfolder

# Log Level vagrant
# export VAGRANT_LOG=warn

# change dot file
# export VAGRANT_DOTFILE_PATH=Vagrant

# bring BOX up
vagrant up && \
rc=$?; if [[ $rc != 0 ]]; then cleanup $rc; fi && \

# status of BOX
vagrant status   




#TODO old trap cleanup INT TERM EXIT

# TODO old trap cleanup ERR