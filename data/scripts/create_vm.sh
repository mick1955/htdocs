#!/bin/bash

#VM_NAME=$1

VM_NAME="CentOS1"

ISO_FILE="/Users/moyer/VirtualMachines/CentOS-7-x86_64-DVD-2009.iso"

echo "Installing ${ISO_FILE}"

exit

rm -rf /tmp/vbox
mkdir /tmp/vbox

# create a new virtual machine

VBoxManage createvm \
--name Cent_OS \
--ostype RedHat_64 \
--register \
--basefolder /tmp/vbox

# modify the VM

echo "Select VM settings for ${NAME}"

VBoxManage modifyvm Cent_OS \
--cpus 4 \
--memory 4096 \
--nic1 bridged \
--bridgeadapter1 en1 \
--boot1 dvd \
--vrde on \
--vrdeport 5001

# configure SATA controller
echo "Configuring SATA controller ${NAME}

VBoxManage storagectl Cent_OS --name "Cent_OS_SATA" --add sata

# create disk
echo "Creating hard disk for ${NAME}"

VBoxManage createhd \
--filename /tmp/vbox/Cent_OS/Cent_OS.vdi \
--size 20480 \
--format VDI \
--variant Standard 

# attach storage device

VBoxManage storageattach Cent_OS \
--storagectl Cent_OS_SATA \
--port 1 \
--type hdd \
--medium /tmp/vbox/Cent_OS/Cent_OS.vdi

# configure a drive for the for VM and specify the ISO file

VBoxManage storageattach Cent_OS \
--storagectl Cent_OS_SATA \
--port 0 \
--type dvddrive \
--medium /Users/moyer/VirtualMachines/CentOS-7-x86_64-DVD-2009.iso

# confirm VM settings

VBoxManage showvminfo Cent_OS

echo "Starting Virtual Machine"
VBoxManage startvm Cent_OS --type headless 
echo "VM Cent_OS has been successfully started."

echo "Network info ..."
VBoxManage list bridgedifs
