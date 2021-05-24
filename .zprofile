# pyenv config
# https://github.com/pyenv/pyenv/issues/1915
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
