return {
	-- Seems like the best option for fuzzy finding. Can run :checkhealth telescope to see if it's healthy.
	-- TODO: Go through pickers and find what I actually want to use.
	-- Source: https://github.com/nvim-telescope/telescope.nvim
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		-- telescope.load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.buffers, { desc = "Find Open Files" })
		vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<C-s>", builtin.live_grep, { desc = "Find in Files" })
	end,
}
