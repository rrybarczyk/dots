monitor-orient:
    xrandr --output LVDS-1 --auto --rotate normal --output VGA-1 --auto --left-of LVDS-1

sound:
    alsamixer

mount-sdb1:
    sudo mount /dev/sdb1 /mnt/usbstick

umount-sdb1:
    sudo umount /dev/sdb1
