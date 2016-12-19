export EDITOR='vim'
export LANG=en_US.UTF-8
export LC_ALL="$LANG"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

# LaTeX
export PATH="$PATH:/usr/local/texlive/2015/bin/x86_64-darwin"

# Go
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

# Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Racket
export PATH="$PATH:/Applications/Racket/bin"

# Mix local
export PATH="$PATH:$HOME/.mix"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"

# random tools
export PATH="$PATH:$HOME/bin"

# .NET
export MONO_GAC_PREFIX="/usr/local"
export PATH="$PATH:/usr/local/share/dotnet"

# Rust
export PATH="$PATH:$HOME/.multirust/toolchains/stable/cargo/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH="/usr/local/src/rust/src"
export CARGO_HOME="$HOME/.cargo"

# Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"

# phpenv
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
