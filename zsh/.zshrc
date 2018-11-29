source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

source ~/.zshenv

function gtree {
  git_ignore_files=("$(git config --get core.excludesfile)" .gitignore ~/.gitignore)
  ignore_pattern="$(grep -hvE '^$|^#' "${git_ignore_files[@]}" 2>/dev/null|sed 's:/$::'|tr '\n' '\|')"
  if git status &> /dev/null && [[ -n "${ignore_pattern}" ]]; then
    tree -I "${ignore_pattern}" "${@}"
  else 
    tree "${@}"
  fi
}

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

# eval `opam config env`

source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"
source "$HOME/.cargo/env"

PATH="/Users/shane.logsdon/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/shane.logsdon/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/shane.logsdon/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/shane.logsdon/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/shane.logsdon/perl5"; export PERL_MM_OPT;
