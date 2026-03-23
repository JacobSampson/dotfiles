eval "$(/opt/homebrew/bin/brew shellenv)"

fpath+=("$(brew --prefix)/share/zsh/site-functions")

export HOMEBREW_NO_AUTO_UPDATE=

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

# nvm
export NVM_DIR="$HOME/.nvm"
_nvm_lazy_load() {
  unset -f nvm node npm npx pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { _nvm_lazy_load; nvm "$@"; }
node() { _nvm_lazy_load; node "$@"; }
npm() { _nvm_lazy_load; npm "$@"; }
npx() { _nvm_lazy_load; npx "$@"; }
pnpm() { _nvm_lazy_load; pnpm "$@"; }

# NVM start
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && 
  . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && 
  . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# NVM end


export PATH="/Applications/CMake.app/Contents/bin":"$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
_pyenv_lazy_load() {
  unset -f pyenv
  eval "$(command pyenv init - --no-rehash zsh)"
  # Only load virtualenv-init if you actually use pyenv-virtualenv
  # eval "$(command pyenv virtualenv-init - zsh)"
}
pyenv() { _pyenv_lazy_load; pyenv "$@"; }

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # default theme with git info
plugins=(git kube-ps1)

source $ZSH/oh-my-zsh.sh

# Enable command substitution in prompts
setopt PROMPT_SUBST

# Git context
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"        # Bold red color, no "git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"         # Reset color
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗"    # Bold yellow dirty indicator
ZSH_THEME_GIT_PROMPT_CLEAN=""                          # No indicator when clean

# Add kube context to prompt
KUBE_PS1_ENABLED=on
KUBE_PS1_CTX_COLOR="blue"       # Blue for cluster name
KUBE_PS1_SYMBOL_ENABLE=false    # Hide the ⎈ symbol
KUBE_PS1_NS_ENABLE=false        # Hide the namespace
KUBE_PS1_SEPARATOR=''           # Remove the separator
KUBE_PS1_PREFIX='%B('           # Bold opening bracket
KUBE_PS1_SUFFIX=')%b '          # Close bold and bracket

PROMPT='$(kube_ps1)%{%F{cyan}%}%B%c%b%{%f%} $(git_prompt_info) '

[[ -f "$HOME/.apprentice/shell-init.sh" ]] && source "$HOME/.apprentice/shell-init.sh"

eval "$(direnv hook zsh)" 