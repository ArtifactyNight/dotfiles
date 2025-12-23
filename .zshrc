# Homebrew setup
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Theme
zinit light spaceship-prompt/spaceship-prompt

# Zinit plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light paulirish/git-open

# Oh-My-Zsh snippets
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Completion setup
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History configuration
HISTSIZE=5000
HISTFILE=~/.cache/zsh/history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls='eza --icons --group-directories-first'
alias vim='nvim'
alias c='clear'
alias taze="nlx taze"
alias cleanup="npkill -d ~/Developer/ --delete-all"

# Shell integrations
# eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"

# Development tools setup
# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun configuration
export PATH="/Users/nightkungz/.bun/bin:$PATH"

# PNPM configuration
export PNPM_HOME="/Users/nightkungz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Additional PATH configurations
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[[ -s "/Users/nightkungz/.gvm/scripts/gvm" ]] && source "/Users/nightkungz/.gvm/scripts/gvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# bun completions
[ -s "/Users/night/.bun/_bun" ] && source "/Users/night/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Added by Antigravity
export PATH="/Users/night/.antigravity/antigravity/bin:$PATH"

# Added by Windsurf
export PATH="/Users/night/.codeium/windsurf/bin:$PATH"
export PATH="$PATH:/opt/homebrew/Caskroom/flutter/latest/flutter/bin"

# Added by Antigravity
export PATH="/Users/night/.antigravity/antigravity/bin:$PATH"
