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
    # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
    zsh-autosuggestions
    # https://github.com/MichaelAquilina/zsh-you-should-use#installation
    you-should-use
    # syntax-highlight file contents (requires pygments)
    colorize
    colored-man-pages
    # Adds tab completion for the following tools
    pip
    git
    heroku
    python
    # Adds "brews" --> list / "bubo" --> update/show outdated (also bcubo)
    brew
    rust
    # https://github.com/zsh-users/zsh-syntax-highlighting
    # this needs to be the last plugin
    zsh-syntax-highlighting
    # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/asdf/asdf.plugin.zsh
    asdf
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

## Other settings

# Human readable $PATH
alias printpath='tr ":" "\n" <<< "$PATH"'

# excel cli
alias excel="open -a /Applications/Microsoft\ Excel.app"

# Add pipx installation dir to path
PATH="$HOME/.local/bin:$PATH"

# Configure zoxide: https://github.com/ajeetdsouza/zoxide
#   * (Optional): https://github.com/junegunn/fzf#installation
eval "$(zoxide init zsh)"

# Fix notes spotlight index
alias fixnotes="mdimport -i ~/Personal/notes/"

# Setup asdf-java auto setting $JAVA_HOME
source ~/.asdf/plugins/java/set-java-home.zsh

# Setup asdf-ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"

# Setup direnv
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
