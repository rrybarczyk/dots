# Put `man` output in file
`$ man <utility> | col -b > <utility>.txt`


# Access a USB
[USB Storage Devices](https://wiki.archlinux.org/index.php/USB_storage_devices)
```
$ lsblk -f
>>
    NAME   FSTYPE LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT
    sda
    ├─sda1 vfat         5701-34D4                             975.9M     5% /boot
    ├─sda2 swap         e6f965c7-ab29-4836-861d-a89e060c8af8                [SWAP]
    └─sda3 ext4         73afd2cc-4717-43c8-8157-1456e7656d3d  264.4G     4% /
    sdb
    └─sdb1 vfat         3364-3733
    sr0
```

The sdb is the USB, and it can also be found with
```
$ /dev/sdb*
>>
    /dev/sdb  /dev/sdb1
```

Make a directory to mount the USB in and mount it:
```
$ sudo mkdir /mnt/usbstick
$ sudo mount /dev/sdb1 /mnt/usbstick/
```

# Orient External Monitors
## Change External Monitor Orientation
Put main monitor (LVDS-1) on the right of the external monitor (VGA-1) connected via the VGA port.

```
$ xrandr --output LVDS-1 --auto --rotate normal --output VGA-1 --auto --left-of LVDS-1
```

## Watch Live Monitor Events
What events from things like connecting and disconnecting external monitor.
```
$ udevadm monitor
```
