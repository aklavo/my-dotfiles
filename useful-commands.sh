# install zsh
sudo apt install zsh

# switch shell to zsh
chsh -s $(which zsh)

# Log out and back in

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# zsh pullin sources
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# p10k themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# link files to cloned repo files
ln -s workspace/MyLinuxEnv/.zshrc .zshrc
ln -s workspace/MyLinuxEnv/.p10k.zsh .p10k.zsh

# reload configurations
exec zsh

# Terminal color theme = Screry (206)
bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# Terminal font = MesloLGS NF (set in terminal preferences)
sudo bash -c "$(curl -LSs https://github.com/dfmgr/installer/raw/main/install.sh)"
sudo fontmgr install MesloLGSNF

# Set terminal to open in center of screen
gsettings set org.gnome.mutter center-new-windows true
# gsettings set org.gnome.mutter center-new-windows false # back to default
