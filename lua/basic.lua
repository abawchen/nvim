vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.colorcolumn = "120"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.cmdheight = 2
vim.o.autoread = true
vim.bo.autoread = true
vim.wo.wrap = false
vim.o.whichwrap = "<,>,[,]"
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 500
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.completeopt = "menu,menuone"
-- style
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 是否显示不可见字符
vim.o.list = false
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.listchars = "space:·,tab:··"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
vim.o.pumheight = 10
vim.o.showtabline = 2
vim.o.showmode = false
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- https://www.reddit.com/r/neovim/comments/chlmfk/highlight_trailing_whitespaces_in_neovim/
-- vim.o.list=true
-- vim.o.listchars="eol:↵,trail:.,tab:  ,nbsp:␣"

-- https://stackoverflow.com/a/4617156
-- https://www.reddit.com/r/neovim/comments/me35u9/lua_config_to_set_highlight/gsd5x20/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])

-- golang
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "gopls"
vim.g.go_gopls_gofumpt = 1
-- vim.g.go_fmt_command = "golines"
-- vim.g.go_fmt_options = {
-- 	golines = "-m 120",
-- }
