-- Compile plugins on edit
vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup end
]])

-- Disable list mode on some filetypes
vim.cmd([[
  augroup SelectiveListMode
    autocmd!
    autocmd FileType * set list
    autocmd FileType startup set nolist
  augroup end
]])

-- Quit nvim if only NvimTree buffer is open
vim.api.nvim_create_autocmd(
	"BufEnter",
	{ command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] }
)

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGrp,
})
vim.api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)
