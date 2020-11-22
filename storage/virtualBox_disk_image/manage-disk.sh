#!/bin/bash

# Create a directory for provisioner discovering
# This directory is configured in hostDir field in provisioner configuration and can only be configured for one storage class
# If you want to configure more than one local storage class, create one directory for each storage class
# Local PVs sharing one disk filesystem will have same capacity and will have no capacity isolation. 
# If you want to separate a disk into multiple PVs with capacity isolation. 
# You can separate disk into multiple partitions first.


sudo mkfs.xfs /dev/sdb
DISK_UUID=$(blkid -s UUID -o value /dev/sdb) 
sudo mkdir /mnt/$DISK_UUID
sudo mount /dev/sdb /mnt/$DISK_UUID
echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/$DISK_UUID xfs defaults 0 0 | sudo tee -a /etc/fstab

for i in $(seq 1 3); do
  sudo mkdir -p /mnt/${DISK_UUID}/vol${i} /mnt/lpvs/${DISK_UUID}_vol${i}
  sudo mount --bind /mnt/${DISK_UUID}/vol${i} /mnt/lpvs/${DISK_UUID}_vol${i}
done

for i in $(seq 1 3); do
  echo /mnt/${DISK_UUID}/vol${i} /mnt/lpvs/${DISK_UUID}_vol${i} none bind 0 0 | sudo tee -a /etc/fstab
done


