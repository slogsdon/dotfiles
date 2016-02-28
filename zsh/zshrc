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

alias vi="nvim"
alias vim="nvim"
alias tmux="TERM=screen-256color-bce tmux"
alias ec="emacsclient -t"
alias ecg="emacsclient -c"
fpath=(/usr/local/share/zsh-completions $fpath)

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
if type rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ASPvNext
if which dnvm.sh > /dev/null; then source dnvm.sh; fi

# Haskell
autoload -U bashcompinit && bashcompinit
if which stack > /dev/null; then source <(stack --bash-completion-script `which stack`); fi
