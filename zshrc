## Start zshuery
source $HOME/.dotfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_completion $HOME/.dotfiles/zshuery/completion/src
load_correction

prompts '%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

export EDITOR='emacsclient -t'
bindkey -e # force emacs bindings

chpwd() {
    update_terminal_cwd
}
## End zshuery

# Make sure powerline is enabled for ZSH
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#export TERM="xterm-256color"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Go
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

# Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

alias vi="nvim"
alias vim="nvim"
alias tmux="TERM=screen-256color-bce tmux"
alias ec="emacsclient -t"
alias ecg="emacsclient -c"

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
eval "$( /app/halcyon/halcyon paths )"
#export PATH="$PATH:/app/halcyon:/app/bin:/app/cabal:/app/ghc"
autoload -U bashcompinit && bashcompinit
source <(stack --bash-completion-script `which stack`)

# Docker/boot2docker
if [[ -f `which boot2docker` ]]; then eval "$(boot2docker shellinit > /dev/null)"; fi

# random tools
export PATH="$PATH:$HOME/bin"

# FSharp
export MONO_GAC_PREFIX="/usr/local"
