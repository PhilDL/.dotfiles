# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.iterm2_shell_integration.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias brew86="arch -x86_64 /usr/local/bin/brew $@"
alias leg="arch -x86_64 $@"

# pipx
export PATH="~/.local/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Created by `userpath` on 2021-12-29 18:00:02
export PATH="$PATH:/Users/philippelattention/.local/bin"

if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
    local brew_path="/usr/local/bin"
    local brew_opt_path="/usr/local/opt"
else
    local brew_path="/opt/homebrew/bin"
    local brew_opt_path="/opt/homebrew/opt"
fi

export PATH="${brew_path}:${PATH}"
alias pyenv86="arch -x86_64 pyenv"
alias cl="clear"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# pnpm
export PNPM_HOME="/Users/philippelattention/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# sst
export PATH=/Users/philippelattention/.sst/bin:$PATH
# sqlite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# postgresql
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="/opt/homebrew/Cellar/postgresql/14.1_1/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
# postgresql end

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
