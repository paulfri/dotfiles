vim.cmd("set inccommand=split")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set noswapfile")

vim.g.mapleader = " "

vim.opt.list = true
vim.opt.listchars = { space = "⋅", tab = "  " }
-- vim.opt.listchars:append("eol:¬")

vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 0
vim.opt.history = 500
vim.opt.fileencoding = "utf-8"
vim.opt.conceallevel = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 5
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.wo.colorcolumn = "80,100,120"
vim.opt.wildmode = "full"
vim.opt.lazyredraw = true
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.wildignorecase = true
vim.opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
