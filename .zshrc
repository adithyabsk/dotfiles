# .zshrc

## Oh-My-Zsh configurations

# Powerlevel10k https://github.com/romkatv/powerlevel10k
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
# https://github.com/ohmyzsh/ohmyzsh
export ZSH="/Users/adithyabalaji/.oh-my-zsh"

# Set oh my zshell theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(
    # syntax-highlight file contents (requires pygments)
    colorize
    colored-man-pages
    # Adds tab completion for the following tools
    pip
    git
    gatsby
    heroku
    pyenv
    python
    golang
    django
    yarn
    # Adds "brews" --> list / "bubo" --> update/show outdated (also bcubo)
    brew
    rust
)

# Setup Oh-My-Zshell
source $ZSH/oh-my-zsh.sh

# Powerlevel10k config
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Aliases specific commands

# https://formulae.brew.sh/formula/terminal-notifier
# Usage: [CMD] & notify-done
alias notify-done='terminal-notifier -title "Terminal" -message "Done with task!"'

# Configure dotfile management using git
# https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
# Usage:
#   dotfile git status
#   dotfile pre-commit run -a
alias dotfile="GIT_DIR=$HOME/.dotfiles.git/ GIT_WORK_TREE=$HOME"

## Language management (switch between language versions)

# pyenv (https://formulae.brew.sh/formula/pyenv)
# https://github.com/pyenv/pyenv
# For some reason these lines result in duplicated shim path in $PATH
# likely because of brew
# eval "$(pyenv virtualenv-init -)"
# eval "$(pyenv init -)"

# rbenv and ruby (https://formulae.brew.sh/formula/rbenv)
# https://github.com/rbenv/rbenv
eval "$(rbenv init -)"
# Sets ruby to error on warnings
# Only turn this on when you are actively using ruby
# this can cause issues with system scripts that use ruby
# export RUBYOPT="-W:no-deprecated -W:no-experimental"

# Setup nodenv (https://formulae.brew.sh/formula/nodenv)
# https://github.com/nodenv/nodenv
eval "$(nodenv init -)"

# jenv (https://formulae.brew.sh/formula/jenv)
# https://github.com/jenv/jenv
eval "$(jenv init -)"

## Other settings

# requests issue for now with python
# https://stackoverflow.com/a/52230415/3262054
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Set up rust
export PATH="$HOME/.cargo/bin:$PATH"

# Human readable $PATH
alias printpath='tr ":" "\n" <<< "$PATH"'
