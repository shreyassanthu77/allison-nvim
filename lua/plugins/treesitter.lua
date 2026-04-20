return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local function register_zine_parsers()
			local parsers = require("nvim-treesitter.parsers")

			parsers.ziggy = {
				tier = 2,
				install_info = {
					url = "https://github.com/kristoff-it/ziggy",
					location = "tree-sitter-ziggy",
					branch = "main",
					generate = false,
				},
				filetype = "ziggy",
			}

			parsers.ziggy_schema = {
				tier = 2,
				install_info = {
					url = "https://github.com/kristoff-it/ziggy",
					location = "tree-sitter-ziggy-schema",
					branch = "main",
					generate = false,
				},
				filetype = "ziggy-schema",
			}

			parsers.supermd = {
				tier = 2,
				install_info = {
					url = "https://github.com/kristoff-it/supermd",
					location = "tree-sitter/supermd",
					branch = "main",
					generate = false,
				},
				filetype = "supermd",
			}

			parsers.supermd_inline = {
				tier = 2,
				install_info = {
					url = "https://github.com/kristoff-it/supermd",
					location = "tree-sitter/supermd-inline",
					branch = "main",
					generate = false,
				},
				filetype = "supermd_inline",
			}

			parsers.superhtml = {
				tier = 2,
				install_info = {
					url = "https://github.com/kristoff-it/superhtml",
					location = "tree-sitter-superhtml",
					branch = "main",
					generate = false,
				},
				filetype = "superhtml",
			}

			-- Filetype != language name mapping (hyphenated ft)
			if vim.treesitter.language and vim.treesitter.language.register then
				pcall(vim.treesitter.language.register, "ziggy_schema", "ziggy-schema")
			end
		end

		-- Main-branch behavior: TSUpdate rebuilds internal parser tables.
		-- Re-apply custom parser registrations after updates.
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = register_zine_parsers,
		})

		-- Register once for the current session too.
		register_zine_parsers()

		-- Install parsers if the main branch API is available.
		-- This is wrapped defensively to handle the transition from master -> main.
		local ok, ts = pcall(require, "nvim-treesitter")
		if ok and ts.install then
			ts.install({
				-- Core languages
				"bash",
				"c",
				"cpp",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"mermaid",
				"python",
				"rust",
				"toml",
				"tsx",
				"typescript",
				"vimdoc",
				"yaml",
				"zig",

				-- Zine ecosystem
				"ziggy",
				"ziggy_schema",
				"supermd",
				"supermd_inline",
				"superhtml",
			})
		end

		-- Highlighting now uses Neovim's built-in treesitter runtime.
		-- We intentionally DO NOT enable treesitter indentation.
		local augroup = vim.api.nvim_create_augroup("allison_treesitter_start", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			callback = function(args)
				-- Start TS only when a parser exists; ignore errors for unsupported filetypes.
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
