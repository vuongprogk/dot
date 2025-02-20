-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h18"
  vim.g.neovide_scale_factor = 0.9
  vim.g.neovide_detach_on_quit = "always_quit"
end
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

local opt = vim.opt
vim.g.autoformat = false

-- better coop with fzf-lua
vim.env.FZF_DEFAULT_OPTS = ""
vim.g.ai_cmp = false
vim.g.lazyvim_blink_main = not jit.os:find("Windows")

vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"

-- make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end
vim.g.transparent = true
