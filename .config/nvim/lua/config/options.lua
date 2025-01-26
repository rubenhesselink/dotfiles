-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "basedpyright"

vim.g.snacks_animate = false

vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_cmp = "blink"

local opt = vim.opt

opt.linebreak = false
