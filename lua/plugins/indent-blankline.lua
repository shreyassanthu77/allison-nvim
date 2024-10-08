return {
	-- Source: https://github.com/lukas-reineke/indent-blankline.nvim?tab=readme-ov-file
	-- Potential desire to expand into rainbow delimiters for more obvious display of separation.
	-- https://gitlab.com/HiPhish/rainbow-delimiters.nvim
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			enabled = true,
			indent = {
				char = "┊",
			},
			scope = {
				-- TODO: This seems genuinely useful and that I'd like it but idk how it works yet.
				show_start = true,
				show_end = true,
			},
		})
	end,
}
