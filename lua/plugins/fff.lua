return {
	"dmtrKovalenko/fff.nvim",
	-- Easy rollback: set vim.g.fff_enabled = false (early in init) or flip this to false.
	enabled = vim.g.fff_enabled ~= false,
	-- Plugin initializes itself lazily; still set lazy=false so it can register commands/health easily.
	lazy = false,
	build = function()
		-- Downloads a prebuilt binary if available, otherwise builds using rustup/cargo automatically.
		require("fff.download").download_or_build_binary()
	end,
	keys = {
		-- Primary file finder
		{
			"<leader><space>",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files (fff)",
		},
	},
	-- Keep configuration minimal/stable; fff shows hidden files and respects .gitignore by default.
	opts = {
		frecency = {
			enabled = true,
		},
		git = {
			-- keep default visual signs; use text coloring only if desired
			status_text_color = false,
		},
		logging = {
			enabled = true,
		},
	},
	config = function(_, opts)
		-- Applies options via global setup used by the plugin.
		require("fff").setup(opts)
	end,
}
