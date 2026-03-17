return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>GP", "<cmd>Octo pr list<cr>", desc = "Octo: PR list" },
		{ "<leader>Gp", "<cmd>Octo pr create<cr>", desc = "Octo: Create PR" },
		{ "<leader>Gv", "<cmd>Octo pr checks<cr>", desc = "Octo: PR checks" },
		{ "<leader>GR", "<cmd>Octo review start<cr>", desc = "Octo: Start review" },
		{ "<leader>Gr", "<cmd>Octo review resume<cr>", desc = "Octo: Resume review" },
	},
	opts = {}, -- default configuration
}
