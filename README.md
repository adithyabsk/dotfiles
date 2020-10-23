# dotfiles (and new machine installer)
Setup steps: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html

## Install Oh My Zsh
https://github.com/ohmyzsh/ohmyzsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k
https://github.com/romkatv/powerlevel10k

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Seting up a new machine
```shell
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles.git" >> .gitignore
git clone --bare https://www.github.com/username/repo.git $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## Managing brew dependencies
The first command dumps your brew installed files to a `Brewfile`. The second command checks if you are in sync with a
particular `Brewfile`. The third command installs all dependencies in your `Brewfile` and also creates a
`Brewfile.lock.json`.

```shell
brew bundle dump --describe
brew bundle check --file=Brewfile
brew bundle install --force-bottle
```

### Workflow for updating Brewfile
```shell
brew bundle dump --describe --file=temp
smerge mergetool Brewfile temp
rm temp
brew bundle check --no-upgrade
```

### Workflow to update Brewfile.lock.json
Make sure that you are ready to upgrade certain packages. (This may take some time)

This should generate an updated `Brewfile.lock.json`.

```shell
brew bundle check -v
brew bundle install
```

TODO: Pending this issue, look making sure that pinned installations are tracked by Brew.https://github.com/Homebrew/homebrew-bundle/issues/802

## Managed files list
Shell Configuration
* `.zshrc`
* `.tmux.conf`
* `.p10k.zsh`

Git
* `.gitconfig`

Brew
* `Brewfile`
* `Brewfile.lock.json`
