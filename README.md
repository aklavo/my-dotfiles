# MyLinuxEnv
Starting from a fresh install of Ubuntu these are the necessary steps and commands to setup my development enviorment. 

### Basic Installs
Everything is a file! Anytime I install something I'm merely copying files from a remote location onto my local machine via a command in my terminal. The first two software packages I'll need are `git` and `curl`. These packages include commands necessary for me to install additional packages later.  
To install these packages run:  
```
sudo apt install -y git curl
```
To confirm the installation and see where the executable file is located run:
```
which git curl
```
To nuke everything you just did (ie. uninstall or remove all packages and configuration files) run:
```
sudo apt-get autopurge git curl
```
