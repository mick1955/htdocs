

VM_NAME=$1

VOLUME="/Volumes/G-DRIVE Mini"
VM_DIR="${VOLUME}/${VM_NAME}"
ISO_FILE="${VOLUME}/${VM_NAME}/CentOS-7-x86_64-DVD-2009.iso"

echo "Installing ${VM_NAME} in ${VM_DIR}"

exit

echo "Creating a new VM: ${VM_NAME}"

rm -rf /tmp/vbox
mkdir /tmp/vbox

# create a new virtual machine

VBoxManage createvm \
--name ${VM_NAME} \
--ostype RedHat_64 \
--register \
--basefolder /tmp/vbox

# modify the VM

echo "Select VM settings for ${NAME}"

VBoxManage modifyvm ${VM_NAME} \
--cpus 4 \
--memory 4096 \
--nic1 bridged \
--bridgeadapter1 en1 \
--boot1 dvd \
--vrde on \
--vrdeport 5001

# configure SATA controller
echo "Configuring SATA controller ${NAME}

VBoxManage storagectl ${VM_NAME} --name "${VM_NAME}_SATA" --add sata

# create disk
echo "Creating hard disk for ${NAME}"

VBoxManage createhd \
--filename /tmp/vbox/${VM_NAME}/${VM_NAME}.vdi \
--size 20480 \
--format VDI \
--variant Standard 

# attach storage device

VBoxManage storageattach ${VM_NAME} \
--storagectl ${VM_NAME}_SATA \
--port 1 \
--type hdd \
--medium /tmp/vbox/${VM_NAME}/${VM_NAME}.vdi

# configure a drive for the for VM and specify the ISO file

VBoxManage storageattach ${VM_NAME} \
--storagectl ${VM_NAME}_SATA \
--port 0 \
--type dvddrive \
--medium /Users/moyer/CentOS/CentOS-7-x86_64-DVD-2009.iso

# confirm VM settings

VBoxManage showvminfo ${VM_NAME}

echo "Starting Virtual Machine"
VBoxManage startvm ${VM_NAME} --type headless 
echo "VM ${VM_NAME} has been successfully started."

echo "Network info ..."
VBoxManage list bridgedifs
