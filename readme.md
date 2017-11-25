# Personal Configuration

My zsh, git, vi configuration, I don't wanna miss. Maybe you find something useful.

## How to use it

```sh
git clone git://github.com/einsichten/pers_config && cd pers_config
./install --diff
./install
```

The `install --diff` command tells you, which content will be changed by `install`.

The `install` command copies and overwrites custom commands and configuration files. If overwriting all your corresponding files is not an option, you can select which files to copy and which parts of the other files you want to integrate into your existing files. The files to be copied are listed in the first lines of `install`.

This repository is plug and play, but only for me. It is configured for my needs and the hosts I use. To make make it fit for you, you have to adapt it. Read the code. Take some of the ideas that went into it. Find something useful for your own configurations, commands and their deployment.

After changing and adding files I read them back into the repository with:

```sh
./install --reverse
```

Followed by a commit. Have fun!
