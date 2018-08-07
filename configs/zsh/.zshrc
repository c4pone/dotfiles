# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/flo/.sdkman"
[[ -s "/home/flo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/flo/.sdkman/bin/sdkman-init.sh"
