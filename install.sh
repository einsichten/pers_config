#!/bin/bash
alias_etc=.home.zsh
commands=(eslint_init git_init)
command_dir=/usr/bin
dotfiles=($alias_etc .host.Triple10.zsh .host.DEAGM02828.zsh .gitconfig .gitignore-files .vimrc)
source_alias="source \$HOME/$alias_etc"

bold=$(tput bold)
normal=$(tput sgr0)

function main() {
case "$1" in
    --reverse)
        if local_changes; then
          echo "Stashing your local changes..."
          echo "'git stash list', 'git stash drop'"
          git stash save --all local_changes
        fi
        copyFiles --reverse  # Reading files to current directory
        ;;
    --diff)
        if local_changes; then
          git stash save --all local_changes >/dev/null
          stashed_changes=yes
        fi
        copyFiles --reverse >/dev/null 2>&1    # ignore non-existing files
        if ! local_changes
        then
          echo "No changes in distributed files"
          if [ "$stashed_changes" = "yes" ]; then
            git stash pop >/dev/null            # put local changes back
          fi
          exit 0
        fi
        git stash save --all distributed_files >/dev/null
        if [ "$stashed_changes" = "yes" ]
        then
          git stash pop stash@{1} >/dev/null    # put local changes back
        fi
        git diff stash                  # show diff distributed_files
        git stash drop >/dev/null       # reset git state to starting point
    ;;
    *)
        if [ -n "$1" ]; then
            echo "Unknown option"
            exit 1
        fi
        copyFiles
        ;;
esac
}

function local_changes() {
  if [ -n "$(git status --short)" ]
  then
    return 0; # true
  fi
  return 1;
}

function copyFiles()  {
if [ -z "$1" ]; then
    if ! grep -q "$source_alias" ~/.zshrc; then
      echo  "${bold}Adding $source_alias to ~/.zshrc${normal}"
      echo $source_alias >> ~/.zshrc
  fi
fi
dir=$(dirname $0)
echo "${bold}Copying personal configuration files${normal}"
for f in "${dotfiles[@]}"
do
    if [ "$1" == "--reverse" ]; then
        cp -vrT "$HOME/$f" "$dir/$f"
    else
        cp -vrT "$dir/$f" "$HOME/$f"  # -T is necessary for copying folders
    fi                                # i.e.: .gitignore-files/
done

echo
echo "${bold}Copying personal commands${normal}"
for f in "${commands[@]}"
do
    if [ "$1" == "--reverse" ]; then
        cp -pv "$command_dir/$f" "$dir/$f"
    else
        cp -pv "$dir/$f" "$command_dir/$f"
    fi
done
}

main "$@"
