return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim"
    },
    opts = {
      handlers = {
        -- 1. Default handler for all other servers using lspconfig
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- 2. Custom modern handler for clangd bypassing lspconfig completely
        ["clangd"] = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp", "objc", "objcpp" },
            callback = function(args)
              -- Dynamically seek the root folder containing your build markers
              local root_dir = vim.fs.root(args.buf, { ".git", "CMakeLists.txt", ".clangd" })

              -- Launch using the built-in native Neovim LSP engine
              vim.lsp.start({
                name = "clangd",
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                root_dir = root_dir,
              }, { bufnr = args.buf })
            end,
          })
        end,
      },
    }
  }
}

