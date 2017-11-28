#!/usr/bin/zsh
# Should be sourced in ~/.zshrc after `source $ZSH/oh-my-zsh.sh`
# to override aliases and keybindings. Don't source this file in
# ~/.zprofile, because ~/.zprofile is sourced before ~/.zshrc.

bindkey '^h' backward-delete-word

function f () { # Find, set 'serachterm',
                # number results
  searchterm="$1"
  find -iname $searchterm | nl
}

function fn () { # print nth find result from f()
  local filepath=$(find -iname $searchterm | sed "$1q;d")
  echo $filepath
}

function fno () { # open nth from find
  open $(fn $1)
}

function fnsvlog () { # Subversion log - usage:
                     # $ f "myfile*"
                     # 1 path1/myfile.cs
                     # 2 path2/myfile.xaml
                     # $ fsvlog 2
  svlog $(fn $1)
}

function svlog () {
  local dir=$(dirname "$1")
  local file=$(basename "$1")
  echo "Subversion log $dir/$file"
  (cd "$dir"; open TortoiseProc /command:log /path:"$file")
}

alias a='atom .'
alias e='explorer .'
alias h=history
alias l=ls

alias ag='alias|grep'
alias diff=colordiff
alias dirs='dirs -v'
alias gcam='git add . && git commit -m'
alias glog='git lg'
alias grep='grep -iP'
alias hg='history|grep'
alias fcsp='find -name "*.csproj" 2>/dev/null'
alias la='ls -a'
alias open=cygstart
alias pi='ssh $pi'
alias sh='source ~/.home'
alias tcs='tree --prune -P "*.cs|*.xaml|*.csproj"'
alias tree='tree -a -I "bin|Debug|Release|.git"'
alias upda='cp $HOME/pers_config/.h* ~; source ~/.home.zsh  # update alias'
alias wpwd='cygpath -w $(pwd) > /dev/clipboard && echo clipboard contains: $(cat /dev/clipboard)'

alias -g ne='2>/dev/null'
alias -s pl=perl
alias -s sh=bash
alias -s zsh=zsh

today=$(date +%Y-%m-%d)
doc="$HOME/Dokumente"
export gitignore_folder="$HOME/.gitignore-files"
local hostconfig=" .host.${HOSTNAME}.zsh"
if [[ -e $hostconfig ]] then
  source $hostconfig
fi
