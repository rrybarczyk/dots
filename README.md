# dots
All of my system configuration files. Managed by [dotbot](https://github.com/anishathalye/dotbot).

## Instructions
```
$ git clone git@github.com:rrybarczyk/dots.git .dots
$ cd .dots
$ git checkout <desired system branch>
$ . 0-provision-env.sh
$ . 1-provision-app.sh
$ just
```

## Branches
`master`        - Arch OS with Sway windows manager  
`i3-lxterminal` - Arch OS with i3 windows manager  
`wsl-ubuntu`    - Ubuntu on Windows Subsystem for Linux (WSL)  

## WSL Specific Notes
Checkout [this gist](https://gist.github.com/rrybarczyk/21cdd74b040ff5fb0fe79f3f8e049652) for some tips and tricks on getting WSL working seamlessly.
