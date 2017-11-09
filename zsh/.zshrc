source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

source $HOME/.zshenv

# zsh settings
bindkey -v # force vi bindings
export KEYTIMEOUT=1
fpath=(/usr/local/share/zsh-completions $fpath)
setopt auto_cd

# theme settings
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_VI_MODE_SHOW=false

# aliases
alias vi="nvim"
alias vim="nvim"
alias tmux="TERM=screen-256color-bce tmux"
alias ec="emacsclient -t"
alias ecg="emacsclient -c"
alias :q="exit"
alias la="ls -la"

eval `opam config env`

source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"
