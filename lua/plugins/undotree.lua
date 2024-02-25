return {
	-- Way to view undo tree, which is important if swap/backup files are turned off.
	-- TODO: Is this the approach I want to take for file saving? Do I need an autosave plugin to go alongside the undo file approach?
	-- Source: https://github.com/jiaoshijie/undotree?tab=readme-ov-file
	"jiaoshijie/undotree",
	config = function()
		local ut = require("undotree")
		ut.setup()

		vim.keymap.set("n", "<leader>u", ut.toggle, { desc = "Toggle undotree" })
	end,
}
