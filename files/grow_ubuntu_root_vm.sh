#!/bin/bash
#This script grows the root filesystem on Ubuntu virtual machines

DISK=$(lsscsi | grep -m 1 -i "Virtual disk" | awk '{print $7}')
growpart $DISK 3
pvresize $DISK"3"
lvresize -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
resize2fs /dev/ubuntu-vg/ubuntu-lv