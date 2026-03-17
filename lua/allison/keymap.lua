vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nmap(map, fn, desc)
	vim.keymap.set("n", map, fn, { desc = desc })
end

local function xmap(map, fn, desc)
	vim.keymap.set("x", map, fn, { desc = desc })
end

xmap("J", ":m '>+1<CR>gv=gv", "Move Selection down")
xmap("K", ":m '<-2<CR>gv=gv", "Move Selection up")

nmap("U", "<C-r>", "Redo")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
nmap("<leader>Y", [["+Y]], "Copy to clipboard until end of line")

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
nmap("<leader>P", [["+P]], "Paste from clipboard before cursor")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
})


nmap("<leader>g", "<Cmd>BufferPick<CR>", "Pick a buffer!")

nmap("<leader>z", function()
	local exe = vim.fn.expand("~/.local/bin/zig-nvim-plugin")
	if vim.fn.filereadable(exe) == 1 then
		vim.system({ exe })
		vim.notify("Running zig-nvim-plugin...", vim.log.levels.INFO)
	else
		vim.notify(
			"zig-nvim-plugin not found at: " .. exe,
			vim.log.levels.ERROR
		)
	end
end, "Run zig-nvim-plugin")

nmap("<C-t>", "<Cmd>enew<CR>", "new buffer tab")
nmap("<leader>n", "<Cmd>enew<CR>", "New empty buffer")
nmap("<C-q>", "<Cmd>BufferClose<CR>", "Close current buffer")

-- Copy current file path to clipboard
nmap("<leader>cp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied to clipboard: " .. path, vim.log.levels.INFO)
end, "Copy file path to clipboard")

-- Copy relative file path to clipboard (from initial Neovim startup directory)
nmap("<leader>cr", function()
	-- Validate buffer has a file
	if vim.api.nvim_buf_get_name(0) == "" then
		vim.notify("No file associated with current buffer", vim.log.levels.WARN)
		return
	end

	local base = vim.g.initial_working_directory or vim.fn.getcwd()
	local full = vim.fn.expand("%:p")

	-- Use vim.fs.relpath for correct relative path calculation
	local rel = vim.fs.relpath(full, base)

	if rel then
		vim.fn.setreg("+", rel)
		vim.notify("Copied relative path: " .. rel, vim.log.levels.INFO)
	else
		-- Fallback: file is outside base directory
		vim.fn.setreg("+", full)
		vim.notify("File outside startup dir, copied absolute: " .. full, vim.log.levels.WARN)
	end
end, "Copy relative file path to clipboard")
