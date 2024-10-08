return {
	-- Seems good with all the current settings. It seems to be one of the faster status line options.
	-- Source: https://github.com/nvim-lualine/lualine.nvim
	-- It did mention speed tests for startup time and used this plugin to do so: https://github.com/dstein64/vim-startuptime
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "gruvbox-material",
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
	},
}
