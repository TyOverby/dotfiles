cd ~

for file in ~/dotfiles/.{z.sh,bash_aliases,bash_cygwin,bash_prompt,bash_functions,bashrc,gitconfig};
do
  echo "linking $file  " `basename $file`
  ln -s "$file" `basename $file`
done
unset file

git clone git@github.com:TyOverby/Vim-Config.git ~/.vim
cd ~/.vim
sh install.sh
