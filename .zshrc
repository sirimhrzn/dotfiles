export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud"

plugins=(git)
source $ZSH/oh-my-zsh.sh
alias zel="zellij -l /home/sirimhrzn/layout.kdl"
alias ls="eza"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"


