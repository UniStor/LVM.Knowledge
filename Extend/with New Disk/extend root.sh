# Get disk
lsblk
disk=vdb
# sudo vgs
vg=ubuntu-vg
# sudo lvs
lv=ubuntu-lv
# This has different '-' hyphens than above!
# Todo: need a get() Function
lvmPath=/dev/mapper/ubuntu--vg-ubuntu--lv

pvcreate /dev/$disk

vgextend $vg /dev/$disk

lvextend -l +100%FREE $lvmPath

# Btrfs can resize Root in-place and live!
btrfs filesystem resize max /

sudo reboot # Maybe unnecessary

test(){
  df -h .
  vgs
  lvs
}
