# ZSH config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source ~/.iterm2_shell_integration.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Binaries
export PATH="~/.local/bin:$PATH"
export PATH="$PATH:/Users/philippelattention/.local/bin"

# Homebrew
if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
    local brew_path="/usr/local/bin"
    local brew_opt_path="/usr/local/opt"
else
    local brew_path="/opt/homebrew/bin"
    local brew_opt_path="/opt/homebrew/opt"
fi

export PATH="${brew_path}:${PATH}"
alias brew86="arch -x86_64 /usr/local/bin/brew $@"
alias leg="arch -x86_64 $@"

# Misc aliases
alias cl="clear"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias vim="nvim"

# Python pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias pyenv86="arch -x86_64 pyenv"

# Node nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/philippelattention/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# sst
export PATH=/Users/philippelattention/.sst/bin:$PATH
# sqlite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# postgresql
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="/opt/homebrew/Cellar/postgresql/14.1_1/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# multi vim setup
alias nvim-kick="NVIM_APPNAME=kickstart-nvim nvim"

function nvims() {
  items=("default" "kickstart-nvim" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
