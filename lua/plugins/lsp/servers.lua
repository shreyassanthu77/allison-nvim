local zls_path = vim.fs.normalize("~/.local/bin/zls")
return {
	gopls = {},
	rust_analyzer = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	zls = {
		cmd = { zls_path },
	},
}
