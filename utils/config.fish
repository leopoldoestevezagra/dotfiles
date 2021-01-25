set fish_greeting ""

alias q="exit"
alias pro='cd ~/Documents/Projects'
alias clases='cd ~/Documents/Clases'
alias ginit='git init'
alias gstatus='git status'
alias glogg='git log --oneline --graph'
alias glog='git log'
alias gadd='git add .'
alias gcomm='git commit'
alias gpush='git push'
alias gstash='git stash'
alias v='nvim'
alias vf='vifm'
alias pdfo='evince '
alias vbash='nvim ~/.bashrc'
alias vvim='nvim ~/.vimrc'
alias clwar='clear'
alias clewr='clear'
alias ext='exit'
alias vifm='vifm . ~'

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo '[ N ] '
    case insert
      set_color --bold green
      echo '[ I ] '
    case replace_one
      set_color --bold green
      echo '[ R ] '
    case visual
      set_color --bold brmagenta
      echo '[ V ] '
    case '*'
      set_color --bold red
      echo '[ ? ] '
  end
  set_color normal
end
