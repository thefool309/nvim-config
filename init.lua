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

vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>", { desc = "Open folder explorer" })

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

