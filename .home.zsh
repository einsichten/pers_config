#!/usr/bin/zsh
# Should be sourced in ~/.zshrc after `source $ZSH/oh-my-zsh.sh`
# to override aliases and keybindings. Don't source this file in
# ~/.zprofile, because ~/.zprofile is sourced before ~/.zshrc.

bindkey '^_' backward-delete-word # ctrl-backspace

function f () {
  findResults=$(find -iname "$1")
  echo "$findResults" | nl
  findResults=$(echo "$findResults" | xargs realpath)
}

function fn () {
  filepath=$(echo "$findResults" | sed "$1q;d")
  echo $filepath
}

function fnd () {
  cygpath -aw $(dirname $filepath)
}

function svlog () {
  local dir=$(dirname "$1")
  local file=$(basename "$1")
  echo "Subversion log $dir/$file"
  (cd "$dir"; open TortoiseProc /command:log /path:"$file")
}

alias a='atom .'
alias e='explorer .'
alias h='history|tail -n 20'
alias l=ls

alias ag='alias|grep'
alias diff=colordiff
alias dirs='dirs -v'
alias gcam='git add . && git commit -m'
alias glog='git log --oneline'
alias grep='grep -iP'
alias gsta='git stash apply'
unalias gstaa
unalias gstc  # git stash clear too dangerous
alias gsts='git stash save'
alias gstll='git stash list --date=local'
alias gstls='git stash list --date=short'
alias hg='history|grep'
alias fcsp='find -name "*.csproj" 2>/dev/null'
alias fno='open $filepath'
alias flog='svlog $filepath'
alias la='ls -a'
alias open=cygstart
alias pi='ssh $pi'
alias sortclipboard='sort /dev/clipboard > /dev/clipboard'
alias sourcehome='source ~/.home.zsh'
alias treecs='tree --prune -P "*.cs|*.xaml|*.csproj"'
alias tree='tree -a -I "bin|Debug|Release|.git"'
alias upda='cp $HOME/pers_config/.h* ~; source ~/.home.zsh  # update alias'
alias vim=vi
alias wpwd='cygpath -w $(pwd) > /dev/clipboard && echo clipboard contains: $(cat /dev/clipboard)'

alias -g 2c='> /dev/clipboard'
alias -g ne='2>/dev/null'
alias -s pl=perl
alias -s sh=bash
alias -s zsh=zsh

today=$(date +%Y-%m-%d)
doc="$HOME/Dokumente"
c=/cygdrive/c
export gitignore_folder="$HOME/.gitignore-files"
local hostconfig="$HOME/.host.${HOSTNAME}.zsh"
if [[ -e $hostconfig ]] then
  source $hostconfig
fi
