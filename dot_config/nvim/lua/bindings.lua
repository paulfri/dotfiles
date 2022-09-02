local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", "::NvimTreeFindFile<CR>", opts)

-- Paste over text without yank
keymap("v", "p", '"_dP', opts)
keymap("v", "p", '"_dP', opts)

-- yank CR with newline, too old to relearn this
-- https://github.com/neovim/neovim/pull/13268
keymap("n", "Y", "Y", opts)

-- Clear search highlight
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)
keymap("n", "<leader><leader>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "\\", ":Telescope live_grep<CR>", opts)

-- buffers
keymap("n", "<C-w>", ":Bdelete<CR>", opts)
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- git
keymap("n", "<C-g>", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- search
keymap("n", "n", "nzz", opts)

-- trouble
keymap("n", "<C-y>", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- diagnostics
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

-- lsp
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
