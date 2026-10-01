export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "sindresorhus/pure", use:"pure.zsh", from:"github", as:"theme"
zplug "zsh-users/zsh-syntax-highlighting", from:"github", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

source ~/.zshenv

# zsh settings
export KEYTIMEOUT=1
fpath=(/usr/local/share/zsh-completions $fpath)
setopt auto_cd

# aliases
alias vi="nvim"
alias vim="nvim"
alias tmux="TERM=screen-256color-bce tmux"
alias la="ls -la"

# source "$HOME/.cargo/env"

# bun completions
[ -s "/Users/shane/.bun/_bun" ] && source "/Users/shane/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Windsurf
export PATH="/Users/shane/.codeium/windsurf/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/shane/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# added by mercury installer
export PATH="/Users/shane/.mercury/bin:$PATH"


# Durable Herdr session entry point, tracked with agent configuration.
[ -f "$HOME/Code/claude-code-config/snippets/herdr-shell.zsh" ] && source "$HOME/Code/claude-code-config/snippets/herdr-shell.zsh"

# Added by MTPLX.app — terminal command
export PATH="$HOME/.mtplx/bin:$PATH"
