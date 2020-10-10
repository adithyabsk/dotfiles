# dotfiles
Setup steps: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html

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

Both the `Brewfile` and `Brewfile.lock.json` should be checked into version control.

```shell
brew bundle dump --describe
brew bundle check --file=Brewfile
brew bundle
```

## Managed files list
* `.zshrc`
* `.tmux.confg`
* `.gitconfig`
* `Brewfile`
* `Brewfile.lock.json`
