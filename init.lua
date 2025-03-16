-- Enable line numbers in Neovim
vim.wo.number = true  -- Show line numbers on the left

-- Set indentation behavior
vim.cmd("set expandtab")     -- Use spaces instead of tabs
vim.cmd("set tabstop=2")      -- A tab is 2 spaces wide
vim.cmd("set softtabstop=2")  -- Spaces inserted when pressing Tab are 2
vim.cmd("set shiftwidth=3")   -- Indentation level is 3 spaces

-- Set cursor appearance
vim.cmd([[set guicursor=n-v-c:block,i:blinkon100-blinkoff100-blinkwait100]])  
-- Use block cursor in normal, visual, and command mode
-- Blink cursor in insert mode

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"  -- Lazy.nvim repo URL
  
  -- Clone the lazy.nvim repository if it's missing
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  -- If cloning fails, show an error message and exit Neovim
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },  -- Show error in red
      { out, "WarningMsg" },  -- Show Git error message in yellow
      { "\nPress any key to exit..." },  -- Prompt before exiting
    }, true, {})
    
    vim.fn.getchar()  -- Wait for a key press
    os.exit(1)  -- Exit Neovim
  end
end

-- Add lazy.nvim to Neovim's runtime path
vim.opt.rtp:prepend(lazypath)

-- Set leader keys (commented out, uncomment if needed)
vim.g.mapleader = " "  -- Set Space as the leader key
vim.g.maplocalleader = "\\"  -- Set Backslash as the local leader key

-- Load and configure lazy.nvim
require("lazy").setup({
  spec = {
  -- { import = "plugins" },  -- Import plugins from the 'plugins' directory
     {"ellisonleao/gruvbox.nvim", name = "gruvbox" }, -- Add color scheme plugin
  },
  install = { colorscheme = { "gruvbox" } },  -- Set colorscheme for plugin installation
  checker = { enabled = true },  -- Enable automatic plugin update checks
})

-- Apply the colorscheme after Lazy.nvim loads
vim.cmd("colorscheme gruvbox")

