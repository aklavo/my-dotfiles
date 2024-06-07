# MyLinuxEnv
Starting from a fresh install of Ubuntu these are the necessary steps and commands to setup my development enviorment. 

### 1. Basic Installs
Everything is a file! Anytime I install something I'm merely copying files from a remote location onto my local machine via a command in my terminal. The first two software packages I'll need are `git` and `curl`. These packages include commands necessary for me to install additional packages later. The `-y` option automatically answer `yes`  upon the *Do you want to continue [y/N]?* confirmation dialog.
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

### 2. Install Brave Browser
Next we need a better browser than Firefox, I choose Brave. We are gonna put in the apt sources so we can get updates easily but mostly just to look cool. Run the following commands assuming step 1 is complete. 
```
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt -y install brave-browser
```
### 3. Get ZSH
Next lets install zsh or zshell, because it lets us install cool plugins and themes. 
```
sudo apt -y install zsh
```
Next we need to swith our shell from bash to our newly installed zsh by running the change shell command with `-s` and the name of our shell. 
```
chsh -s $(which zsh)
```
To see the shell change you need to log out and log back in. 
