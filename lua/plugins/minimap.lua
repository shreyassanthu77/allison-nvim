return {
	"gorbit99/codewindow.nvim",
	config = function()
		local codewindow = require('codewindow')
		codewindow.setup({
			auto_enable = true,
			minimap_width = 10,
			width_multiplier = 4,
		})
		codewindow.apply_default_keybinds()
	end,
}
