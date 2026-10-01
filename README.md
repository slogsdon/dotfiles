# .dotfiles

## Clone

```
cd ~
git clone git@github.com:slogsdon/dotfiles .dotfiles
```

## For new OS systems

```
cd ~/.dotfiles
bash scripts/setup-system.sh
```

## Create dotfile symlinks

```
cd ~
bash .dotfiles/scripts/install.sh
```

## Machine-local files (untracked)

- `~/.zshenv.local` — API keys and other secrets; sourced by `.zshenv`
- `~/.gitconfig.local` — machine-specific git config; included by `.gitconfig`
