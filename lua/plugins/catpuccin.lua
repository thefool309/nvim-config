return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- ensures it loads before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- sets mocha as the default flavour
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
}

