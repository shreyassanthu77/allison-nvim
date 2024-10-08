local function vim_highlights(highlights)
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
			group_settings.fg or "none",
			group_settings.bg or "none",
			group_settings.sp or "none",
			group_settings.fmt or "none"))
	end
end

-- local function bg(color)
-- 	return { bg = color }
-- end

local function fg(color)
	return { fg = color }
end

-- colors taken from the vscode gruvbox-material plugin
local colors = {

	bg0 = "#282828",
	bg1 = "#32302f",
	bg2 = "#32302f",
	bg3 = "#45403d",
	bg4 = "#45403d",
	bg5 = "#5a524c",
	bg_statusline1 = "#32302f",
	bg_statusline2 = "#3a3735",
	bg_statusline3 = "#504945",
	bg_diff_green = "#34381b",
	bg_visual_green = "#3b4439",
	bg_diff_red = "#402120",
	bg_visual_red = "#4c3432",
	bg_diff_blue = "#0e363e",
	bg_visual_blue = "#374141",
	bg_visual_yellow = "#4f422e",
	bg_current_word = "#3c3836",

	fg0 = "#d4be98",
	fg1 = "#ddc7a1",
	red = "#ea6962",
	orange = "#e78a4e",
	yellow = "#d8a657",
	green = "#a9b665",
	aqua = "#89b482",
	blue = "#7daea3",
	purple = "#d3869b",
	bg_red = "#ea6962",
	bg_green = "#a9b665",
	bg_yellow = "#d8a657",

	grey0 = "#7c6f64",
	grey1 = "#928374",
	grey2 = "#a89984",

}

-- If you want to find the right token to change,
-- put your cursor over the right token in a file with lsp running
-- and run :Inspect to get it's highlight group name
local lspOverrides = {
	["@string"] = fg(colors.yellow),
	["@lsp.type.string"] = fg(colors.yellow),
	["@lsp.type.enum"] = fg(colors.blue),
	["@lsp.type.struct"] = fg(colors.blue),
	["@lsp.type.property"] = fg(colors.fgo),
	["@lsp.type.namespace"] = fg(colors.aqua),
	["@lsp.type.type"] = fg(colors.blue),
	["@type"] = fg(colors.blue),
	["@variable.member"] = fg(colors.fg0),
	["@lsp.type.operator.zig"] = fg(colors.fg0),
	["@punctuation.bracket"] = fg(colors.red),
	["@function.builtin"] = fg(colors.green),
	["@keyword.import"] = fg(colors.green),
	["@type.qualifier"] = fg(colors.red),
	["@attribute.zig"] = fg(colors.red),
	["@type.builtin"] = fg(colors.blue),
	["@keyword.operator.zig"] = fg(colors.red),
}

return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox-material]])
		vim_highlights(lspOverrides)
	end
}
