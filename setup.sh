#!/bin/sh

echo "Start copying dofiles to the current home directory..."
read -p "The process may override some of the files in your home directory, do you want to continue? [Yn] " yn
case $yn in
    [Yy]* ) break;;
    [Nn]* ) echo "Aborting installation"; exit;;
esac

echo "Cloning git-prompt script"
wget -O $HOME/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

echo "Copying .bashrc addons"
cp -f ./.bash_custom $HOME

cat >> $HOME/.bashrc << 'EOL'

if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi

EOL

echo "Copying git configuration"
cp -f ./.gitconfig $HOME

echo "Copying jshint configuration"
cp -f ./.jshintrc $HOME

echo "Copying Vim files..."
mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/syntax
cp -f ./.vimrc $HOME/
cp -f ./molokai/colors/molokai.vim $HOME/.vim/colors

echo "Cloning additional vim files"
wget -O $HOME/.vim/syntax/yaml.vim https://raw.githubusercontent.com/vim-scripts/yaml.vim/master/colors/yaml.vim

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "Setup complete!"
