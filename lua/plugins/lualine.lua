return {{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
	    icons_enabled = false,
	    component_separators = { left = '', right = '' },
  	    section_separators = { left = '', right = '' },
	    theme = "auto"
    },
      sections = {
      -- Clean up the filetype section so it doesn't try to look up file icons
      lualine_c = { { 'filename', icon_only = false } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' }, 
    }
}
}
