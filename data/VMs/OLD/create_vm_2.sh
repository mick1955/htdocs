
# create a directory for the virtual machine
# Usage:create_vm.sh [name of new machine]

sudo su
rm -rf /var/vbox
mkdir /var/vbox

# create a new virtual machine

VBoxManage createvm \
--name CentOS_7_2 \
--ostype RedHat_64 \
--register \
--basefolder /var/vbox

# modify the VM

VBoxManage modifyvm CentOS_7_2 \
--cpus 4 \
--memory 4096 \
--nic1 bridged \
--bridgeadapter1 en1 \
--boot1 dvd \
--vrde on \
--vrdeport 5001

# configure SATA controller

VBoxManage storagectl CentOS_7_2 --name "CentOS_7_2_SATA" --add sata

# create disk

VBoxManage createhd \
--filename /var/vbox/CentOS_7_2/CentOS_7_2.vdi \
--size 20480 \
--format VDI \
--variant Standard 

# attach storage device

VBoxManage storageattach CentOS_7_2 \
--storagectl CentOS_7_2_SATA \
--port 1 \
--type hdd \
--medium /var/vbox/CentOS_7_2/CentOS_7_2.vdi

# configure a drive for the for VM and specify the ISO file

VBoxManage storageattach CentOS_7_2 \
--storagectl CentOS_7_2_SATA \
--port 0 \
--type dvddrive \
--medium /Users/moyer/CentOS/CentOS-7-x86_64-DVD-2009.iso

# confirm settings for VM# confirm settings for VM

VBoxManage showvminfo CentOS_7_2 
Name:            CentOS_7_2
Groups:          /
Guest OS:        Red Hat (64-bit)
UUID:            bdceab21-504f-47c2-9107-17ec778dbcf3
Config file:     /var/vbox/CentOS_7_2/CentOS_7_2.vbox
Snapshot folder: /var/vbox/CentOS_7_2/Snapshots
Log folder:      /var/vbox/CentOS_7_2/Logs
Hardware UUID:   bdceab21-504f-47c2-9107-17ec778dbcf3
Memory size:     4096MB
Page Fusion:     off
VRAM size:       8MB
CPU exec cap:    100%
HPET:            off
Chipset:         piix3
Firmware:        BIOS
Number of CPUs:  4
PAE:             on
Long Mode:       on
CPUID Portability Level: 0
.....
...
.
# Start Virtual Machine.
VBoxManage startvm CentOS_7_2 --type headless 
Waiting for VM "CentOS_7_2" to power on...
VM "CentOS_7_2" has been successfully started.


VBoxManage list bridgedifs

Name:            en0: Wi-Fi (Wireless)
GUID:            00306e65-0000-4000-8000-a483e7bc9fbb
DHCP:            Disabled
IPAddress:       192.168.1.141
NetworkMask:     255.255.255.0
IPV6Address:     
IPV6NetworkMaskPrefixLength: 0
HardwareAddress: a4:83:e7:bc:9f:bb
MediumType:      Ethernet
Wireless:        Yes
Status:          Up
VBoxNetworkName: HostInterfaceNetworking-en0


moyer@mbpro1: ~$ ping 192.168.1.141
PING 192.168.1.141 (192.168.1.141): 56 data bytes
64 bytes from 192.168.1.141: icmp_seq=0 ttl=64 time=30.676 ms
64 bytes from 192.168.1.141: icmp_seq=1 ttl=64 time=53.977 ms




