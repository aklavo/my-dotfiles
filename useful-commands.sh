# zsh pullin sources
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Terminal color theme = Screry
bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# Terminal font = MesloLGS NF