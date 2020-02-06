#!/bin/bash

# Initial update
sudo apt update ;
sudo apt upgrade;

# Auto installers

##  Needed
sudo apt install snap;

## Editors
sudo apt install vim;
sudo apt install git;
sudo apt install tmux;
sudo apt install texlive;
sudo snap install --classic code;


## Utilities
sudo apt install chromium-browser;
sudo apt install wmctrl;

## Basic language support
sudo apt install build-essential;
sudo apt install default-jre;
sudo apt install python3;
sudo apt install php;

## Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -;
sudo apt install nodejs;

# Basic used folders
cd;
if [ -d "Projects" ]; then
    echo "Projects directory already exists , skiping step";
else
    mkdir Projects
fi

if [ -d "Scripts" ]; then
    echo "Scripts directory already exists , skiping step";
else
    mkdir scripts
fi


# Repositories to clone
cd Projects;
git clone https://github.com/LeopoldoEstevezAgra/dotfiles.git;

# Config files

cd;
if [ -f ".bashrc" ]; then
    rm .bashrc;
    cp Projects/dotfiles/.bashrc ~;
else
    cp Projects/dotfiles/.bashrc ~;
fi

if [ -f ".vimrc" ]; then
    rm .vimrc;
    cp Projects/dotfiles/.vimrc ~;
else
    cp Projects/dotfiles/.vimrc ~;
fi

if [ -f ".tmux.conf" ]; then
    rm .vimrc;
    cp Projects/dotfiles/.tmux.conf ~;
else
    cp Projects/dotfiles/.tmux.conf ~;
fi

cd ~/Scripts & rm *;
cp ~/Projects/dotfiles/scripts/* ~/Scripts;
cd ~/


