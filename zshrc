## Start zshuery
source $HOME/.dotfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_completion $HOME/.dotfiles/zshuery/completion/src
load_correction

prompts '%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

export EDITOR='vim'

chpwd() {
    update_terminal_cwd
}
## End zshuery

# Make sure powerline is enabled for ZSH
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export TERM="xterm-256color"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

alias vi="vim"
alias tmux="TERM=screen-256color-bce tmux"