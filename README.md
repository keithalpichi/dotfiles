# dotfiles

A collection of my MacOS dotfiles and other tools stored in a git repo at `~/.dotconfig`.


## Tools

- [zsh](https://www.zsh.org/)- z shell
- [ohmyzsh](https://ohmyz.sh/)- z shell configuration manager
- [vim](https://www.vim.org/)- Terminal text editor
- [ghostty](https://ghostty.org/)- Terminal emulator
- [Hack](https://sourcefoundry.org/hack/)- OS font
- [VSCode](https://code.visualstudio.com/)- Source code editor
- [Homebrew](https://brew.sh/)- OS Package Manager
- [Docker](https://www.docker.com/)- Container management and orchestration platform

## Setup


```
git init --bare $HOME/.dotconfig
alias .conf='/usr/bin/git --git-dir=$HOME/.dotconfig/ --work-tree=$HOME'
.conf config --local status.showUntrackedFiles no
echo "alias .conf='/usr/bin/git --git-dir=$HOME/.dotconfig/ --work-tree=$HOME'" >> $HOME/.zshrc
```

A new bare git repo will live in `$HOME/.dotconfig` and a git alias `.conf` will point to it.

## Usage

Use git commands to add/update/remove files from the bare git repo but instead of using `git`, use `.conf`. So:

```
.conf add $FILE
.conf rm $FILE
.conf commit -m "Updated dotfiles"
.conf push
```
