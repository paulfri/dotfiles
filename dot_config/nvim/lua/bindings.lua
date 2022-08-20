local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

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
