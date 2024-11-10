# MyLinuxEnv
Starting from a fresh install of Ubuntu these are the necessary steps and commands to setup my development enviorment. 

### 1. Basic Installs
Everything is a file! Anytime I install something I'm merely copying files from a remote location onto my local machine via a command in my terminal. The first two software packages I'll need are `git` and `curl`. These packages include commands necessary for me to install additional packages later. The `-y` option automatically answer `yes`  upon the *Do you want to continue [y/N]?* confirmation dialog.
To install these packages run:  
```sh
sudo apt install -y git curl
```
To confirm the installation and see where the executable file is located run:
```sh
which git curl
```
To nuke everything you just did (ie. uninstall or remove all packages and configuration files) run:
```sh
sudo apt-get autopurge git curl
```

### 2. Install Brave Browser
Next we need a better browser than Firefox, I choose Brave. We are gonna put in the apt sources so we can get updates easily but mostly just to look cool. Run the following commands assuming step 1 is complete. 
```sh
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt -y install brave-browser
```
### 3. Get ZSH
Next lets install zsh or zshell, because it lets us install cool plugins and themes. 
```sh
sudo apt -y install zsh
```
Next we need to swith our shell from bash to our newly installed zsh by running the change shell command with `-s` and the name of our shell. 
```sh
chsh -s $(which zsh)
```
To see the shell change you need to log out and log back in.
 
### 3. Install 1Password
Add the key for the 1Password apt repository:
```
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
```
Add the 1Password apt repository:
```
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
```
Add the debsig-verify policy:
```
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
```
Install 1Password:
```
sudo apt update && sudo apt install 1password
```

### 4. Make ZSH Pretty
We're in a zsh shell now, but it's ugly. This first step to make it pretty is install `oh-my-zsh`, which is a framework for managing your Zsh configuration. It also comes with a bunch nice commands and aliases [OhMyZsh Cheatsheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet).
```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
Now lets get the cool fonts:
```sh
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mkdir -p $HOME/.local/share/fonts
mv Meslo* $HOME/.local/share/fonts
```
Open *Terminal* → *Preferences* and click on the selected profile under *Profiles*. Check Custom font under *Text Appearance* and select `MesloLGS NF Regular`.  
Now for the cool stuff, powerlevel10k (a theme for zsh):
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Now lets change the colors. This will run a terminal prompt, my Terminal color theme is Screry (234 as of the time I wrote this):
```sh
bash -c  "$(wget -qO- https://git.io/vQgMr)" 
```
Exit the terminal and open a new one to see the changes.   
Lastly set the terminal to open in center of screen.
```sh
gsettings set org.gnome.mutter center-new-windows true
```

### 4. Link .dotfiles from this repo
First we need to clone this repo onto our machine:
```sh
mkdir -p ~/workspace
git clone git@github.com:aklavo/my-dotfiles.git $HOME/workspace/my-dotfiles
```
Then we link the remote files to my local files using the ln command:
```sh
ln -s $HOME/workspace/my-dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/workspace/my-dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/workspace/my-dotfiles/.p10k.zsh $HOME/.p10k.zsh
```
Now moving forward changes to these config files in this repo will get push down to my machine once my local repo is synced to this remote repo. 

