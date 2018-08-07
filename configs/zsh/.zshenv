#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [ -f $HOME/.secrets ]; then
  source "$HOME/.secrets"
fi

# Editors
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export TERM=screen-256color

alias pgadmin="$HOME/pgadmin4/bin/python $HOME/pgadmin4/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py"

# Kubernetes
autoload -U colors; colors
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
