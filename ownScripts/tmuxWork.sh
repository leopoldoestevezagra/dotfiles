#!/bin/sh

session="main"

tmux start-server

tmux new-session -d -s $session -n vim

tmux send-keys "vim " C-m

tmux new-window -t $session:2 -n vifm
tmux send-keys "vifm . ~/" C-m

tmux new-window -t $session:3 -n bash

tmux select-window -t $session:1

tmux attach-session -t $session

