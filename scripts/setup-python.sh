#!/bin/sh
if [ ! -d ~/.pyenv ]
then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    pyenv install 2.7.13

    pyenv activate neovim2
    pip install neovim
    echo "Neovim Python2: $(pyenv which python)"  # Note the path

    pyenv activate neovim3
    pip install neovim
    echo "Neovim Python3: $(pyenv which python)"  # Note the path

fi

pyenv global 2.7.13
pip install -r packages-python.txt
