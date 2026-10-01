export EDITOR='vim'
export LANG=en_US.UTF-8
export LC_ALL="$LANG"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

export OBSIDIAN_VAULT_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal"

# Go
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

# Mix local
export PATH="$PATH:$HOME/.mix"

# Erlang
export PATH="$PATH:$HOME/.cache/rebar3/bin"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"

# random tools
export PATH="$PATH:$HOME/bin"

# .NET
export PATH="$PATH:/usr/local/share/dotnet"

# Rust
export CARGO_HOME="$HOME/.cargo"
[ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"

# php
export PATH="$HOME/.composer/vendor/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# python
export PYTHONDONTWRITEBYTECODE=1

# android
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# Java (brew openjdk; stable across upgrades)
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"

# Machine-local secrets (API keys) — untracked, never commit
[ -f "$HOME/.zshenv.local" ] && . "$HOME/.zshenv.local"
