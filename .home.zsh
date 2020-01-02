#!/usr/bin/zsh
# Should be sourced in ~/.zshrc after `source $ZSH/oh-my-zsh.sh`
# to override aliases and keybindings. Don't source this file in
# ~/.zprofile, which is sourced before ~/.zshrc.
bindkey '^_' backward-delete-word    # ctrl-backspace
bindkey '^h' backward-delete-word

function f () {
  findResults=$(find -iname "$1")
  echo "$findResults" | nl
  if [ -n "$findResults" ]; then
    findResults=$(echo "$findResults" \
            | sed 's/ /\\ /g' `# Escape blanks`\
            | xargs realpath) `# full path`
  else
    echo \""$1"\" not found.
  fi
}

function fn () {            # findresult the nth
  if [ -z "$1" ]; then
    pos=1                   # defaults to first
  else
    pos=$1
  fi
  filepath=$(echo "$findResults" | sed "${pos}q;d")
  echo $filepath
}

function fpd () { # filepath directory
  cygpath -aw $(dirname $filepath)
}

function fpo() { #filepath open
  local dir=$(dirname "$filepath")
  local file=$(basename "$filepath")
  (cd "$dir"; open "$file")
}

function svlog () {
  local dir=$(dirname "$1")
  local file=$(basename "$1")
  echo "Subversion log $dir/$file"
  (cd "$dir"; open TortoiseProc /command:log /path:"$file")
}

function a() {
  if [ -z "$1" ]
  then
    atom .
  else
    atom $(cygpath -aw "$1")  # absolute windows path
  fi
}

alias ag='alias|grep'
alias diff='colordiff'
alias dirs='dirs -v'
alias e='explorer .'
alias fcsp='find -name "*.csproj" 2>/dev/null'
alias gbm='git branch -m' # move=rename
alias gcam='git add --all && git commit -m'
alias gd='git diff --color=always'
alias ginit='cp ~/.gitignore-files/VisualStudio.gitignore .gitignore && git init && git add . && git commit -m initial' # git init
alias glog='git log --oneline'
alias gr='git reset'
alias grep='grep -iP --color=always'
alias gsta='git stash apply'
alias gstll='git stash list --date=local'
alias gstls='git stash list --date=short'
alias gsts='git stash save'
alias h='history|tail -n 20'
alias hg='history | perl -pe "s:^\s*\d+\s+(.+):\1:" | sort -u | command grep --color=always -iP'
alias hng='history | tac | sort -uk 2 | command grep --color=always -iP'
alias l=ls
alias la='ls -a'
alias open=cygstart
alias sortclipboard='sort /dev/clipboard > /dev/clipboard'
alias souh='source ~/.home.zsh &&'  # source home and command
alias tree='tree -C'
# alias tree='tree -a -I "bin|Debug|Release|.git"'
alias treecs='tree --prune -P "*.cs|*.xaml|*.csproj"'
alias upda='cp $HOME/pers_config/.h* ~; source ~/.home.zsh  # update alias'
alias vim=vi
alias wpwd='cygpath -w $(pwd) > /dev/clipboard && echo clipboard contains: $(cat /dev/clipboard)'

unalias gstaa 2>/dev/null # use 'gsta' instead
unalias gstc  2>/dev/null # git stash clear too dangerous

alias -g 2c='> /dev/clipboard'  # to clipboard
alias -g ne='2>/dev/null'       # no error
alias -s pl=perl
alias -s sh=bash
alias -s zsh=zsh

doc="$HOME/Dokumente"

export gitignore_folder="$HOME/.gitignore-files"
export LESS=Xr

local hostconfig="$HOME/.host.${HOSTNAME}.zsh"
if [[ -e $hostconfig ]] then
  source $hostconfig
fi


