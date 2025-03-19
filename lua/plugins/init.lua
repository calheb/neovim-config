-- lua/plugins/init.lua
-- This file returns all plugin configs or imports them from other files
return {
  -- UI
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },
  
  -- Import other plugin modules
  { import = "plugins.markdown" },
  -- { import = "plugins.editor" },
  -- { import = "plugins.lsp" },
}
