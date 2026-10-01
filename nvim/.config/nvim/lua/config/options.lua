vim.cmd([[set expandtab]])
vim.cmd([[set tabstop=2]])
vim.cmd([[set softtabstop=2]])
vim.cmd([[set shiftwidth=2]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[set hlsearch]])
vim.cmd([[set cursorline]])

vim.g.mapleader = " "

vim.keymap.set('n', 'j', 'gj', {})
vim.keymap.set('n', 'k', 'gk', {})

vim.keymap.set('i', 'jk', '<esc>', {})

