local function vim_highlights(highlights)
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
			group_settings.fg or "none",
			group_settings.bg or "none",
			group_settings.sp or "none",
			group_settings.fmt or "none"))
	end
end

local function bg(color)
	return { bg = color }
end

local function fg(color)
	return { fg = color }
end


-- colors taken from the vscode gruvbox-material plugin
local colors = {
	-- Background colors
	bg_dim = "#141617",
	bg0 = "#1d2021",
	bg1 = "#282828",
	bg2 = "#282828",
	bg3 = "#3c3836",
	bg4 = "#3c3836",
	bg5 = "#504945",

	-- Statusline colors
	bg_statusline1 = "",
	bg_statusline2 = "#323021",
	bg_statusline3 = "#504945",

	-- Diff colors
	bg_diff_green = "#323610",
	bg_visual_green = "#333034",
	bg_diff_red = "#442020",
	bg_visual_red = "#c42020",
	bg_diff_blue = "",

	-- Other UI colors
	bg_visual_yellow = "#473c29",
	bg_current_word = "#323021",

	-- Foreground colors
	fgo = "#d4be98",
	fg1 = "#ddc7a1",
	red = "#ea6962",

	-- Accent colors
	orange = "#e7804e",
	yellow = "#d8a657",
	green = "#a9b665",
	aqua = "#896482",
	blue = "#7daea3",
	purple = "#d3869b",
	bg_red = "#ea6962",

	-- Other colors
	bg_green = "#a9b665",
	bg_yellow = "#d80657",
	greyo = "#7c6164",
	grey1 = "#928374",
	grey2 = "#89984",
	bg_visual_blue = "#2e3b3b",
}

-- If you want more highlight groups to change
-- run :h highlight-groups
local commonOverrides = {
	Normal = bg(colors.bg2)
}

-- If you want to find the right token to change,
-- put your cursor over the right token in a file with lsp running
-- and run :Inspect to get it's highlight group name
local lspOverrides = {
	["@string"] = fg(colors.yellow),
	["@lsp.type.type"] = fg(colors.red),
	["@lsp.type.string"] = fg(colors.yellow),
	["@lsp.type.enum"] = fg(colors.blue),
	["@lsp.type.struct"] = fg(colors.blue),
	["@lsp.type.property"] = fg(colors.fgo),
	["@lsp.type.namespace"] = fg(colors.green),
}

return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox-material]])
		vim_highlights(commonOverrides)
		vim_highlights(lspOverrides)
	end
}
