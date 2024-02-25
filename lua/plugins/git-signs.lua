return {
	-- Seems pretty good out of the box. Supports integratino with folke/trouble.nvim which seems very interesting.
	-- Source: https://github.com/lewis6991/gitsigns.nvim
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()
	end
}
