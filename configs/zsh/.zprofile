#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi


#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $HOME/.pyenv/bin
  $GOPATH/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Node
export PATH="$HOME/.node/bin:$PATH"  
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"  

# GO
export GOPROJECT="$HOME/code/go/src/github.com"
export GOPATH="$HOME/code/go"
export PATH="/usr/lib/go-1.9/bin:$GOPATH/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# PHP
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Kubernetes
autoload -U colors; colors
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
