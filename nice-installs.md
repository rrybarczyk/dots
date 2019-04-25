# Install Docker
[Instructions found here](https://linuxhint.com/arch-linux-docker-tutorial/)
[Arch Docker Instructions](https://wiki.archlinux.org/index.php/Docker)

## Enable Loop Module
```
$ lsmod | grep loop
> loop                   32768  0
```

If nothing was returned:
```
$ sudo tee /etc/modules-load.d/loop.conf <<< "loop"
$ sudo modprobe loop
```
## Install Docker

```
$ sudo pacman -S docker
```

## Start and Enable Daemon

```
$ sudo systemctl start docker.service
$ sudo systemctl enable docker.service
```

Verify:
```
$ sudo docker info
```

```
$ sudo usermod -aG docker $USER
```

## File Locations
Docker config stored at `$USER/.docker/config.json`.  
Docker stores images by default in `/var/lib/docker`.  
Docker daemon config is in `/etc/systemd/system/docker.service.d/docker-storage.conf`.
