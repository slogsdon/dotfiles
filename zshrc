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

bindkey -e # force emacs bindings
export EDITOR='vim'
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias vi="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias ec="emacsclient -t"
alias ecg="emacsclient -c"

# Go
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"

# Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
if type rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ASPvNext
if which dnvm.sh > /dev/null; then source dnvm.sh; fi

# Racket
export PATH="$PATH:/Applications/Racket/bin"

# Mix local
export PATH="$PATH:$HOME/.mix"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"
autoload -U bashcompinit && bashcompinit
if which stack > /dev/null; then source <(stack --bash-completion-script `which stack`); fi
export PATH="$PATH:$HOME/.stack/programs/x86_64-linux/ghc-7.10.2/bin:$HOME/.local/bin"

# random tools
export PATH="$PATH:$HOME/bin"

# FSharp
export MONO_GAC_PREFIX="/usr/local"
