## Start zshuery
source $HOME/.dotfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_completion $HOME/.dotfiles/zshuery/completion/src
load_correction

prompts '%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

chpwd() {
    update_terminal_cwd
}
## End zshuery

bindkey -v # force vi bindings

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

export EDITOR='vim'
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias vi="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias ec="emacsclient -t"
alias ecg="emacsclient -c"

# Go
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

# Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ASPvNext
if which dnvm.sh > /dev/null; then source dnvm.sh; fi

# Racket
export PATH="$PATH:/Applications/Racket/bin"

# Mix local
export PATH="$PATH:$HOME/.mix"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"
autoload -U bashcompinit && bashcompinit
source <(stack --bash-completion-script `which stack`)

# random tools
export PATH="$PATH:$HOME/bin"

# FSharp
export MONO_GAC_PREFIX="/usr/local"
