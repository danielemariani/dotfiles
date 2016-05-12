# Dotfiles
A collection of personal dotfiles.

## Install
Simply run the following command to install the dotfiles in your $HOME directory **(be aware that it could override some of your current configuration files)**:

    sh -c "`curl -fsSL https://raw.githubusercontent.com/danielemariani/dotfiles/master/install.sh`"

If you prefer you can install the dotfiles cloning the repository and executing the setup script manually:

    git clone git@github.com:danielemariani/dotfiles.git
    cd dotfiles
    ./setup.sh

In both cases, source your .bashrc file after the setup to apply changes to the prompt:

    . ~/.bashrc
