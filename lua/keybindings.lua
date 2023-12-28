vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
	noremap = true,
	silent = true,
}

local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- paste without copying in the visual mode
map("v", "p", '"_dP', opt)

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- write & quit
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- split
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt) -- close the current
map("n", "so", "<C-w>o", opt) -- close others
map("n", "<leader><Left>", "<C-w>h", opt)
map("n", "<leader><Down>", "<C-w>j", opt)
map("n", "<leader><Up>", "<C-w>k", opt)
map("n", "<leader><Right>", "<C-w>l", opt)
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "s=", "<C-w>=", opt)

-- Terminal ??
-- map("n", "st", ":sp | terminal<CR>", opt)
-- map("n", "stv", ":vsp | terminal<CR>", opt)

-- back to normal by ESC
-- map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)

-- plugin keybindings
local pluginKeys = {}

-- treesitter folder
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- nvim-tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- pluginKeys.nvimTreeList = {
--   -- https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/
--   { key = "s", action = "system_open" },
--   { key = ".", action = "toggle_dotfiles" },
--   { key = { "o", "<2-LeftMouse>" }, action = "edit" },
--   { key = "v", action = "vsplit" },
--   { key = "h", action = "split" },
--   { key = "i", action = "toggle_ignored" },
--   { key = "R", action = "refresh" },
--   { key = "a", action = "create" },
--   { key = "d", action = "remove" },
--   { key = "r", action = "rename" },
--   { key = "x", action = "cut" },
--   { key = "c", action = "copy" },
--   { key = "p", action = "paste" },
--   { key = "y", action = "copy_name" },
--   { key = "Y", action = "copy_path" },
--   { key = "gy", action = "copy_absolute_path" },
--   { key = { "]" }, action = "cd" },
--   { key = { "[" }, action = "dir_up" },
-- }

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

-- trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
	i = {
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<C-n>"] = "move_selection_next",
		["<C-p>"] = "move_selection_previous",
		["<C-c>"] = "close",
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- comment, see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	toggler = {
		line = "gcc", -- by line
		block = "gbc", -- by block
	},
	-- Visual mode
	opleader = {
		line = "gc",
		bock = "gb",
	},
}
-- ctrl + /
map("n", "<C-/>", "gcc", { noremap = false })
map("v", "<C-/>", "gcc", { noremap = false })

map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

-- lsp, lspsaga
-- https://stackoverflow.com/a/74584098
-- https://github.com/nvimdev/lspsaga.nvim
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gi", "<cmd>Lspsaga finder imp<CR>", opt)
map("n", "gr", "<cmd>Lspsaga finder ref<CR>", opt)
map("n", "re", "<cmd>Lspsaga rename<CR>", opt)
map("n", "ca", "<cmd>Lspsaga code_action<CR>", opt)
map("n", "ol", "<cmd>Lspsaga outline<CR>", opt)
map("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>", opt)
map("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>", opt)
map("i", "<enter>", "<C-R>=v:lua.enter_key()<CR>", opt)

-- jq
map("n", "jq", "<cmd>%!jq<CR>", opt)
-- map("v", "jq", "<cmd>%!jq<CR>", opt)

return pluginKeys
