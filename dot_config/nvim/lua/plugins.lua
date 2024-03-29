local function get_config(name)
	return string.format('require("config/%s")', name)
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
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("nvim-neotest/neotest-python")
	use("tyru/open-browser-github.vim")
	use("tyru/open-browser.vim")
	use("raimon49/requirements.txt.vim")
	use("vim-scripts/scrollfix")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "lukas-reineke/cmp-rg" } },
		},
		config = get_config("cmp"),
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
					python = {
						require("formatter.filetypes.python").black,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},
					json = {
						require("formatter.filetypes.json").prettier,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettier,
					},
					yaml = {
						require("formatter.filetypes.yaml").prettier,
					},
				},
			})
		end,
	})

	use("mfussenegger/nvim-lint")

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
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

	use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/nvim-treesitter-context")
	use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })

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

	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		defaults = {
			file_ignore_patterns = { "node_modules", "__pycache__" },
		},
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

require("nvim-tree").setup()
require("nvim_comment").setup()
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("bufferline").setup()
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
	show_trailing_blankline_indent = false,
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
})

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

require("lint").linters_by_ft = {
	python = { "flake8" },
}

require("telescope").load_extension("fzf")

require("lspconfig").pyright.setup({})
require("lspconfig").tsserver.setup({})

require("neotest").setup({
	adapters = {
		require("neotest-python")({
			args = { "--disable-warnings" },
		}),
	},
	discovery = { enabled = false },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "typescript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	yati = { enable = true },
})
