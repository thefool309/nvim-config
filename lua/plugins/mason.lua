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
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
	},
    }
}
}
