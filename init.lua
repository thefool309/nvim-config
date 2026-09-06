-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
vim.opt.termguicolors = true


vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN]  = 'W',
      [vim.diagnostic.severity.HINT]  = 'H',
      [vim.diagnostic.severity.INFO]  = 'I',
    },
  },
})

vim.opt.tabstop = 4

vim.opt.shiftwidth = 4

vim.opt.expandtab = true

vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"


vim.cmd('packadd termdebug')

vim.cmd('cabbrev td Termdebug')

vim.keymap.set("n", "<leader>e", function()
  local api = require("nvim-tree.api")
  local view = require("nvim-tree.view")

  -- Check if the tree window is currently open and visible
  if view.is_visible() then
    -- If our cursor is already INSIDE the tree window, jump back to the previous code window
    if vim.api.nvim_get_current_win() == view.get_winnr() then
      vim.cmd("wincmd p")
    else
      -- If the tree is open but we are looking at code, jump focus into the tree
      api.tree.focus()
    end
  else
    -- If the tree isn't open at all, open it
    api.tree.open()
  end
end, { desc = "Smart toggle/focus file explorer" })

require("config.lazy")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

