-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
local c = require("onedark/palette")

require("onedark").setup({
	highlights = {
		IndentBlanklineIndent1 = { bg = c.dark.bg1, gui = "nocombine" },
		IndentBlanklineIndent2 = { bg = c.dark.bg0, gui = "nocombine" },
		ColorColumn = { bg = c.dark.bg3, gui = "nocombine" },
	},
})

require("onedark").load()
