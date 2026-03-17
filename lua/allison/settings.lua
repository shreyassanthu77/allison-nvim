vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.wrapmargin = 25
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.backup = false
vim.opt.hidden = true    -- Allow switching from modified buffers (prevents E37)
vim.opt.confirm = true   -- Prompt on quit when unsaved changes exist

-- Cross-platform undo directory
local uv = vim.uv or vim.loop
local undodir = vim.fn.stdpath("state") .. "/undo"

-- Create directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	uv.fs_mkdir(undodir, 448)  -- 0700 permissions
end

vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true


-- Add Zine file type associations
vim.filetype.add({
	extension = {
		smd = 'supermd',
		shtml = 'superhtml',
		ziggy = 'ziggy',
		['ziggy-schema'] = 'ziggy_schema',
	},
})

-- Expandtab exceptions for languages that require tabs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make", "go" },
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
	group = vim.api.nvim_create_augroup("TabSettings", { clear = true }),
})
