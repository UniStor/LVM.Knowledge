# Get disk
lsblk
disk=vdb
vg=vgsys
lv=lvol0

pvcreate /dev/$disk

vgextend vgsys /dev/$disk
vgs

lvextend -l +100%FREE /dev/$vg/$lv
lvs

# Btrfs can resize Root in-place and live!
btrfs filesystem resize max /

sudo reboot # Maybe unnecessary

# Test()
df -h .
