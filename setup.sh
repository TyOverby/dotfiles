cd ~
ln -s dotfiles/.bashrc .bashrc 
ln -s dotfiles/.gitconfig .gitconfig

git clone git@github.com:TyOverby/Vim-Config.git ~/.vim
cd ~/.vim
sh install.sh
