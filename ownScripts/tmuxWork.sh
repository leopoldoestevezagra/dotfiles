#!/bin/sh

session="main"

tmux start-server

tmux new-session -d -s $session -n vim

tmux send-keys "vim " C-m

tmux new-window -t $session:2 -n bash

tmux new-window -t $session:4 -n vifm
tmux send-keys "vifm . ~/" C-m

tmux select-window -t $session:1

tmux attach-session -t $session

