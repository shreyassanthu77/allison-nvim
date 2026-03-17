-- Detect a ZML project root starting from a directory.
-- Returns the absolute path to the 'zml' root (if found), otherwise nil.
local function detect_zml_root_from_dir(dir)
	if not dir or dir == "" then
		return nil
	end

	local function basename(p)
		if not p or p == "" then
			return nil
		end
		local trimmed = p:gsub("[/\\]+$", "")
		return trimmed:match("([^/\\]+)$")
	end

	-- Direct checks for current dir
	if basename(dir) == "zml" then
		return dir
	end
	if basename(dir) == "examples" then
		local parent = vim.fs.dirname(dir)
		if parent and basename(parent) == "zml" then
			return parent
		end
	end

	-- Ascend parents
	for parent in vim.fs.parents(dir) do
		local b = basename(parent)
		if b == "zml" then
			return parent
		end
		if b == "examples" then
			local gp = vim.fs.dirname(parent)
			if gp and basename(gp) == "zml" then
				return gp
			end
		end
	end
	return nil
end

-- Backwards-compatible wrapper: detect ZML root from buffer's directory
local function detect_zml_root_for_buf(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if not bufname or bufname == "" then
		return nil
	end
	local dir = vim.fs.dirname(bufname)
	return detect_zml_root_from_dir(dir)
end

return {
	gopls = {},
	rust_analyzer = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	zls = {
		-- API compliant: use static cmd and override per root_dir via on_new_config
		cmd = { "zls" },
		on_new_config = function(new_config, new_root_dir)
			-- Determine if this root is inside a ZML project
			local zml_root = detect_zml_root_from_dir(new_root_dir or "")
			if zml_root then
				local wrapper = zml_root .. "/tools/zls.sh"
				if vim.fn.executable(wrapper) == 1 then
					new_config.cmd = { wrapper }
				else
					vim.notify(
						string.format(
							"[zls] ZML project detected at %s but wrapper missing or not executable: %s. Falling back to system 'zls'.",
							zml_root,
							wrapper
						),
						vim.log.levels.WARN
					)
					new_config.cmd = { "zls" }
				end
			else
				new_config.cmd = { "zls" }
			end
		end,
		settings = {
			zls = {
				enable_autofix = true,
			},
		},
	},
	biome = {},
	clangd = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
				venvPath = ".",
				pythonPath = ".venv/bin/python",
			},
		},
	},
	ts_ls = {},
}
