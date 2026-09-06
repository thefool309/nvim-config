return {
    -- how to add nvim tree using lazy
    -- Their github says not to, but we've already committed to lazy on everything else
    -- and the damn thing won't work without using lazy. Works fine with lazy. 
    {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup()
    end,
    }
}
