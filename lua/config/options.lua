-- lua/config/options.lua
local opt = vim.opt

-- Line numbers
opt.number = true

-- Indentation
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 3

-- Cursor appearance
vim.opt.guicursor = "n-v-c:block,i:blinkon100-blinkoff100-blinkwait100"
