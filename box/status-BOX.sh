#!/bin/bash

# change .vagrant folder to here
# we don't our folder .vagrant
export VAGRANT_HOME=../box_workfolder

# Log Level vagrant
# export VAGRANT_LOG=warn

# change dot file
# export VAGRANT_DOTFILE_PATH=Vagrant




# box status
vagrant status

echo ""
echo "   -----------   "
echo ""

# check via vboxmanage
echo " Check Virtualbox via vboxmanager ... runnings vms"
echo " No output => no runnings vms"
echo " ============= runnings vms ========="
vboxmanage list runningvms
echo " =============  end output =========="