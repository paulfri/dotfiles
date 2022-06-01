local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("terrortylor/nvim-comment")
	use("echasnovski/mini.nvim")
	use("petertriho/nvim-scrollbar")
	use("kevinhwang91/nvim-hlslens")
	use("famiu/bufdelete.nvim")
	use("navarasu/onedark.nvim")
	use("neovim/nvim-lspconfig")

	use("lukas-reineke/indent-blankline.nvim", {
		config = {
			require("indent_blankline").setup({
				buftype_exclude = {
					"terminal",
					"nofile",
					"NvimTree",
				},
				filetype_exclude = {
					"startup",
					"lspinfo",
					"packer",
					"checkhealth",
					"help",
					"man",
					"NvimTree",
					"",
				},
				char = "",
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				space_char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				show_trailing_blankline_indent = false,
			}),
		},
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
				},
			})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "right_align",
					delay = 0,
					ignore_whitespace = true,
				},
			})
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		options = {
			offsets = { { filetype = "NvimTree", text_align = "left" } },
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":tsupdate",
	})

	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				copy_sync = {
					enable = false,
				},
				navigation = {
					enable_default_keybindings = true,
				},
				resize = {
					enable_default_keybindings = true,
				},
			})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

require("nvim-tree").setup()
require("nvim_comment").setup()
require("mini.surround").setup()
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("bufferline").setup()
