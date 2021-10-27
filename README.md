# dotfiles

![lint](https://github.com/adithyabsk/dotfiles/workflows/lint/badge.svg?branch=master)

## Install Oh My Zsh

<https://github.com/ohmyzsh/ohmyzsh>

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k

<https://github.com/romkatv/powerlevel10k>

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Configure iTerm2

* [Install this color profile](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20Higher%20Contrast.itermcolors)
* Add the ability to use option to move forward and backward in text
    * Preferences --> Profiles --> Keys --> Presets... --> Natural Text Editing

## Setting up a new machine

```shell
alias dotfile="GIT_DIR=$HOME/.dotfiles.git/ GIT_WORK_TREE=$HOME"
git clone --bare git@github.com:adithyabsk/dotfiles.git $HOME/.dotfiles.git
dotfile git remote add private [REDACTED]
dotfile git fetch private
dotfile git checkout private
dotfile git config --local status.showUntrackedFiles no
# dotfile pre-commit install  # once brew dependencies are installed
```

## Managing brew dependencies (kept private)

The first command dumps your brew installed files to a `Brewfile`. The second
command checks if you are in sync with a particular `Brewfile`. The third
command installs all dependencies in your `Brewfile` and also creates a
`Brewfile.lock.json`.

```shell
dotfile git checkout private
brew bundle dump --describe
brew bundle check --file=Brewfile
brew bundle install --force-bottle
```

### Workflow for updating Brewfile

```shell
dotfile git checkout private
rm Brewfile
brew bundle dump --describe
dotfile git diff Brewfile
brew bundle check --no-upgrade
```

### Workflow to update Brewfile.lock.json

Make sure that you are ready to upgrade certain packages. (This may take some
time)

This should generate an updated `Brewfile.lock.json`.

```shell
dotfile git checkout private
brew bundle check -v
brew bundle install --no-upgrade
# brew bundle install
```

## Managing all other files

```shell
dotfile git checkout master
# Now make the changes
```

Then, to keep the private repo in sync

```shell
dotfile git checkout private
dotfile git merge master
```

## Managed files list

To list all tracked files, run: `dotfile git ls-tree -r main --name-only`

Shell Configuration

* `.zshrc`
* `.zprofile`
* `.tmux.conf`
* `.p10k.zsh`

Git

* `.gitconfig`

Brew

* `Brewfile`
* `Brewfile.lock.json`

Vim

* `.vim/after/syntax/gitcommit.vim`
* `.vimrc`

Karbiner

* `.config/karabiner/karabiner.json`

## Acknowledgements

* [Setup Inspiration](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
* [Dotfile alias idea](https://github.com/pre-commit/pre-commit/issues/1657#issuecomment-715608016)
