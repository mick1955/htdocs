# Network problems could be detected by enabling packet logging at the guest side or at the host side, but using the built-in capability of VirtualBox to create pcap files might provide even more useful information because it contains a log of really all packets received and sent by guest.

# To enable network tracing do the following:

# VBoxManage modifyvm [your-vm] --nictrace[adapter-number] on --nictracefile[adapter-number] file.pcap
# VirtualBox -startvm [your-vm]
# For example

# VBoxManage modifyvm "ubuntu" --nictrace1 on --nictracefile1 file.pcap
# VirtualBox -startvm "ubuntu"
