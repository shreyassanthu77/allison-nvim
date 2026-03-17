return {
	-- Seems like the best option for fuzzy finding. Can run :checkhealth telescope to see if it's healthy.
	-- TODO: Go through pickers and find what I actually want to use.
	-- Source: https://github.com/nvim-telescope/telescope.nvim
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope buffers<cr>", desc = "Find Open Files" },
		-- Remap Telescope find_files to a fallback binding (primary picker handled by fff.nvim)
		{ "<leader>fF", "<cmd>Telescope find_files<cr>", desc = "Find Files (Telescope fallback)" },
		{ "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Find in Files" },

		-- Git pickers
		{ "<leader>Gg", "<cmd>Telescope git_status<cr>", desc = "Git: Status (changed files)" },
		{ "<leader>GC", "<cmd>Telescope git_commits<cr>", desc = "Git: Commits" },
		{ "<leader>GB", "<cmd>Telescope git_bcommits<cr>", desc = "Git: Buffer commits" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			-- Use defaults.vimgrep_arguments (not additional_args) for Neovim 0.11 compatibility
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!.git/*",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})
		-- require("telescope").load_extension("ui-select")
	end,
}
