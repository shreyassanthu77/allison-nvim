return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"json",
			"yaml",
			"zig",
			"python",
			"go",
		},
		auto_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
	build = ":TSUpdate",
	config = function(conf)
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup(conf.opts)
		end, 0)
	end,
}

