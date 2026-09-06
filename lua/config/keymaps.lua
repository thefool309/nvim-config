vim.opt.tabstop = 4

vim.opt.shiftwidth = 4

vim.opt.expandtab = true

vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"


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

vim.keymap.set("n", "<C-l>", function()
    vim.cmd("wincmd l")
end, { desc = "Move to right window" })

vim.keymap.set("n", "<C-h>", function()
    vim.cmd("wincmd h")
end, { desc = "Move to left window" })

vim.keymap.set("n", "<C-j>", function()
    vim.cmd("wincmd j")
end, { desc = "Move to the window down"})


vim.keymap.set("n", "<C-k>", function()
    vim.cmd("wincmd k")
end, { desc = "Move to the window up"})

vim.keymap.set('t', '`', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
