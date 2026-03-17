return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional but improves UI; already likely present
	},
	keys = {
		{ "<leader>Go", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open (HEAD vs working tree)" },
		{ "<leader>Gb", "<cmd>DiffviewOpen origin/main<cr>", desc = "Diffview: Compare with origin/main" },
		{ "<leader>Gc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
		{ "<leader>Gf", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview: Toggle files panel" },
		{ "<leader>Gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File history (current file)" },
		{ "<leader>GH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Repo history" },
	},
	opts = {}, -- use defaults
}
