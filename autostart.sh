#!/bin/bash

# Initial update
sudo apt update ;
sudo apt upgrade;

# Initial required pkgs
sudo apt install vim;
sudo apt install git;

# Basic used folders
cd;
if [ -d "Projects" ]; then
    echo "Projects directory already exists , skiping step";
else
    mkdir Projects
fi


# Repositories to clone
cd Documents;
git clone https://github.com/LeopoldoEstevezAgra/dotfiles.git;

# Config files

cd;
if [ -f ".bashrc" ]; then
    rm .bashrc;
    cp Documents/dotfiles/.bashrc ~;
else
    cp Documents/dotfiles/.bashrc ~;
fi

if [ -f ".vimrc" ]; then
    rm .vimrc;
    cp Documents/dotfiles/.vimrc ~;
else
    cp Documents/dotfiles/.vimrc ~;
fi


wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb;
sudo dpkg -i fd-musl_7.3.0_amd64.deb;
sudo snap install --classic code;

