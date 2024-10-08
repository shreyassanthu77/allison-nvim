return {
	"stevearc/conform.nvim",
	opts = {
		format_after_save = { lsp_fallback = true },
		formatters_by_ft = {
			json = { { "prettierd" } },
			lua = { "stylua" },
			python = { "black" },
		},
	},
	config = function(conf)
		require("conform").setup(conf.opts)

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
